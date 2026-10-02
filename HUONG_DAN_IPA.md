# Tạo IPA cho 1996

Gói này chứa mã nguồn và cấu hình build, chưa chứa IPA đã biên dịch.
Môi trường chuẩn bị gói là Linux, không có Xcode/iOS SDK. Script và
workflow chưa được kiểm chứng bằng một lần build trên macOS.

## Dùng GitHub Actions (không cần máy Mac cá nhân)

1. Tạo repository GitHub và đưa **nội dung bên trong thư mục 1996App**
   vào thư mục gốc của repository, gồm cả `.github/workflows/build-ipa.yml`.
2. Mở **Actions → Build unsigned IPA → Run workflow**.
3. Khi build thành công, tải artifact **1996-unsigned-ipa**, giải nén để
   lấy **1996-unsigned.ipa**.
4. IPA chưa ký cần được ký bằng công cụ như AltStore hoặc Sideloadly
   trước khi cài lên thiết bị. App yêu cầu iOS 17 trở lên.

## Dùng máy Mac

Cài Xcode 16 trở lên và iOS SDK, mở Xcode để hoàn tất thiết lập ban đầu.
Cài XcodeGen rồi chạy trong thư mục 1996App:

```bash
brew install xcodegen
bash export_ipa.sh unsigned
```

Kết quả: `build/1996-unsigned.ipa`.

Nếu đã cấu hình tài khoản Apple Developer và thiết bị/provisioning trong Xcode:

```bash
DEVELOPMENT_TEAM=YOUR_TEAM_ID bash export_ipa.sh signed
```

Kết quả ký dành cho phát triển nằm trong `build/export/`. Cách này cần
chứng chỉ và provisioning phù hợp trên máy Mac; workflow GitHub chỉ tạo
IPA chưa ký.

Mã gốc là giao diện prototype. Các chức năng cài package/tweak và quản lý
ứng dụng khác chưa được triển khai; build IPA không bổ sung các chức năng đó.
