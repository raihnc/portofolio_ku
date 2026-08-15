# iOS Setup

## Status Project

- Bundle ID: `com.portofolio.raihnc.id`
- Display name: `Portofolio Ku`
- Minimum iOS: `13.0`
- Version: `0.1.0+1`
- Native permission aktif: tidak ada kamera, lokasi, mikrofon, foto, atau kontak.
- URL scheme untuk `url_launcher`: `https`, `http`, `mailto`, `tel`.
- App Store encryption flag: `ITSAppUsesNonExemptEncryption=false`.

## Requirement Lokal

Flutter Doctor saat setup ini masih menunjukkan:

- Xcode belum lengkap.
- CocoaPods belum terpasang.

Install dan aktifkan:

```sh
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
sudo gem install cocoapods
```

Setelah itu jalankan:

```sh
flutter pub get
cd ios
pod install
cd ..
flutter build ios --config-only --no-codesign
```

## Run iOS

Simulator:

```sh
open -a Simulator
flutter run -d ios
```

Device fisik butuh signing team di Xcode:

```sh
open ios/Runner.xcworkspace
```

Pilih `Runner` target, tab `Signing & Capabilities`, lalu pilih Apple Developer Team.
