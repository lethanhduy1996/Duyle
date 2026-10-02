#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
MODE="${1:-unsigned}"
case "$MODE" in
  unsigned|signed) ;;
  *) echo "Usage: bash export_ipa.sh [unsigned|signed]" >&2; exit 2 ;;
esac
if [[ "$(uname -s)" != Darwin ]]; then
  echo "Requires macOS with Xcode and the iOS SDK." >&2
  exit 1
fi
command -v xcodebuild >/dev/null || { echo "Install Xcode first." >&2; exit 1; }
command -v xcodegen >/dev/null || { echo "Install XcodeGen: brew install xcodegen" >&2; exit 1; }
if [[ "$MODE" == signed && -z "${DEVELOPMENT_TEAM:-}" ]]; then
  echo "Set DEVELOPMENT_TEAM to your Apple Developer Team ID." >&2
  exit 1
fi
xcodegen generate
mkdir -p build
ARCHIVE="$PWD/build/1996-${MODE}.xcarchive"
ARGS=(-project 1996.xcodeproj -scheme 1996 -configuration Release
      -destination 'generic/platform=iOS' -archivePath "$ARCHIVE")
if [[ "$MODE" == unsigned ]]; then
  xcodebuild "${ARGS[@]}" CODE_SIGNING_ALLOWED=NO CODE_SIGNING_REQUIRED=NO archive
  APP="$ARCHIVE/Products/Applications/1996.app"
  [[ -d "$APP" && -f "$APP/1996" ]] || { echo "Built app missing." >&2; exit 1; }
  STAGE="$(mktemp -d "$PWD/build/ipa-stage.XXXXXX")"
  trap 'rm -rf "$STAGE"' EXIT
  mkdir -p "$STAGE/Payload"
  ditto "$APP" "$STAGE/Payload/1996.app"
  ditto -c -k --keepParent "$STAGE/Payload" "$PWD/build/1996-unsigned.ipa"
  echo "Created: $PWD/build/1996-unsigned.ipa (requires signing before installation)"
else
  xcodebuild "${ARGS[@]}" DEVELOPMENT_TEAM="$DEVELOPMENT_TEAM" \
    CODE_SIGN_STYLE=Automatic -allowProvisioningUpdates archive
  EXPORT_OPTIONS="$PWD/build/ExportOptions.plist"
  rm -f "$EXPORT_OPTIONS"
  /usr/bin/plutil -create xml1 "$EXPORT_OPTIONS"
  /usr/bin/plutil -insert method -string debugging "$EXPORT_OPTIONS"
  /usr/bin/plutil -insert signingStyle -string automatic "$EXPORT_OPTIONS"
  /usr/bin/plutil -insert teamID -string "$DEVELOPMENT_TEAM" "$EXPORT_OPTIONS"
  xcodebuild -exportArchive -archivePath "$ARCHIVE" \
    -exportPath "$PWD/build/export" -exportOptionsPlist "$EXPORT_OPTIONS" \
    -allowProvisioningUpdates
  echo "Exported signed IPA to: $PWD/build/export"
fi
