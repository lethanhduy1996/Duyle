# 1996 iOS App

SwiftUI prototype inspired by the supplied 1996 concept. It contains Home, Store, Installed, Files and Settings tabs.

## Build on macOS
1. Install Xcode 16+.
2. Install XcodeGen (`brew install xcodegen`) or create an iOS App project and add the files in `1996/`.
3. In this folder run `xcodegen generate`.
4. Open `1996.xcodeproj`.
5. Select the 1996 target > Signing & Capabilities > choose your Apple Development Team and change the Bundle Identifier if needed.
6. Run on your iPhone, or Archive > Distribute App to export an IPA according to your signing method.

## Notes
- The file importer uses Apple's document picker and only accesses files the user selects.
- Package/install functions shown in the UI are placeholders unless implemented through Apple-supported app capabilities.
- iOS does not allow a normal sandboxed app to modify other apps or unrestricted system files.
