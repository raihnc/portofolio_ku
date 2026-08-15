# 🚀 Deployment Guide

Panduan lengkap untuk deploy portfolio ke berbagai platform.

## 📱 Android Deployment

### Build APK (Debug)
```bash
flutter build apk --debug
```

### Build APK (Release)
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Build App Bundle (untuk Play Store)
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### Upload ke Google Drive

1. **Build APK**
   ```bash
   flutter build apk --release
   ```

2. **Upload ke Google Drive**
   - Buka Google Drive
   - Upload file `app-release.apk`
   - Klik kanan > Share
   - Set "Anyone with the link can view"
   - Copy link

3. **Update di code**
   ```dart
   demoUrl: 'https://drive.google.com/file/d/YOUR_FILE_ID/view'
   ```

### Tips:
- Gunakan nama file yang deskriptif: `portfolio-ecommerce-v1.0.apk`
- Tambahkan README di folder Drive dengan instruksi install
- Update link setiap ada versi baru

## 🌐 Web Deployment

### Build Web
```bash
flutter build web --release
```
Output: `build/web/`

### 1. Firebase Hosting

#### Setup
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Init Firebase
firebase init hosting
```

#### Configuration
Pilih options:
- What do you want to use as your public directory? **build/web**
- Configure as a single-page app? **Yes**
- Set up automatic builds with GitHub? **No** (or Yes if you want)

#### Deploy
```bash
# Build
flutter build web --release

# Deploy
firebase deploy --only hosting
```

#### Custom Domain
```bash
firebase hosting:channel:deploy live
```

### 2. Netlify

#### Via Drag & Drop
1. Buka [Netlify](https://netlify.com)
2. Drag folder `build/web` ke Netlify
3. Done!

#### Via CLI
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Login
netlify login

# Deploy
netlify deploy --dir=build/web --prod
```

#### Custom Domain
1. Buka site settings di Netlify
2. Domain management > Add custom domain
3. Follow DNS instructions

### 3. Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Login
vercel login

# Deploy
cd build/web
vercel --prod
```

### 4. GitHub Pages

#### Setup
1. Buat repository baru di GitHub
2. Push code Anda

#### GitHub Actions (Automatic)
Buat file `.github/workflows/deploy.yml`:

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.10.7'
      
      - name: Install dependencies
        run: flutter pub get
      
      - name: Build web
        run: flutter build web --release --base-href "/your-repo-name/"
      
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

#### Manual Deploy
```bash
# Build dengan base-href
flutter build web --release --base-href "/your-repo-name/"

# Install gh-pages
npm install -g gh-pages

# Deploy
gh-pages -d build/web
```

### 5. Cloudflare Pages

1. Buka [Cloudflare Pages](https://pages.cloudflare.com)
2. Connect GitHub repository
3. Build settings:
   - Build command: `flutter build web`
   - Build output directory: `build/web`
4. Deploy

## 🍎 iOS Deployment (Requires macOS)

### Build iOS
```bash
flutter build ios --release
```

### Submit ke App Store
1. Buka Xcode project di `ios/Runner.xcworkspace`
2. Product > Archive
3. Distribute App
4. Follow wizard untuk submit ke App Store

## 🖥️ Desktop Deployment

### Windows
```bash
flutter build windows --release
```
Output: `build/windows/runner/Release/`

### macOS
```bash
flutter build macos --release
```
Output: `build/macos/Build/Products/Release/`

### Linux
```bash
flutter build linux --release
```
Output: `build/linux/x64/release/bundle/`

## 📊 Performance Optimization

### Web Performance

#### Enable WASM (Experimental)
```bash
flutter build web --wasm
```

#### Optimize Images
```bash
# Install image optimizer
npm install -g imagemin-cli

# Optimize all images
imagemin assets/images/*.png --out-dir=assets/images/optimized
```

#### Enable Caching
Add to `web/index.html`:
```html
<meta http-equiv="Cache-Control" content="max-age=31536000">
```

### Android Performance

#### Enable Obfuscation
```bash
flutter build apk --release --obfuscate --split-debug-info=build/debug-info
```

#### Reduce APK Size
```bash
flutter build apk --release --target-platform android-arm64
```

#### Enable R8 (Already enabled by default)
Check `android/gradle.properties`:
```properties
android.enableR8=true
```

## 🔒 Security Checklist

### Before Production Deploy

- [ ] Remove debug prints
- [ ] Update API keys (move to env)
- [ ] Enable ProGuard/R8 (Android)
- [ ] Enable code obfuscation
- [ ] Check for exposed secrets in Git history
- [ ] Update package names
- [ ] Enable HTTPS only
- [ ] Add proper error handling
- [ ] Test on various devices
- [ ] Check permissions

### Environment Variables

Create `.env` file:
```
API_KEY=your_api_key
BASE_URL=https://your-api.com
```

Add to `.gitignore`:
```
.env
```

Use in code:
```dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

await dotenv.load();
final apiKey = dotenv.env['API_KEY'];
```

## 📈 Analytics & Monitoring

### Firebase Analytics

```bash
flutter pub add firebase_analytics
```

```dart
import 'package:firebase_analytics/firebase_analytics.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
analytics.logEvent(name: 'project_viewed');
```

### Sentry (Error Tracking)

```bash
flutter pub add sentry_flutter
```

```dart
import 'package:sentry_flutter/sentry_flutter.dart';

await SentryFlutter.init(
  (options) => options.dsn = 'YOUR_DSN',
  appRunner: () => runApp(MyApp()),
);
```

## 🧪 Pre-Deployment Testing

### Test Checklist

```bash
# Analyze code
flutter analyze

# Run tests
flutter test

# Check formatting
flutter format --set-exit-if-changed .

# Build and test
flutter build web --release
flutter build apk --release
```

### Device Testing

- [ ] Android Phone (480px - 720px)
- [ ] Android Tablet (768px - 1024px)
- [ ] iPhone (375px - 414px)
- [ ] iPad (768px - 1024px)
- [ ] Desktop (1280px - 1920px)

### Browser Testing

- [ ] Chrome
- [ ] Firefox
- [ ] Safari
- [ ] Edge

## 📝 Version Management

### Update Version

Edit `pubspec.yaml`:
```yaml
version: 1.0.0+1
#        |     |
#      version build number
```

### Git Tagging
```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

## 🔄 CI/CD Pipeline

### GitHub Actions Example

`.github/workflows/ci.yml`:
```yaml
name: CI

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter analyze
      - run: flutter test
      
  build-web:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter pub get
      - run: flutter build web --release
      - uses: actions/upload-artifact@v3
        with:
          name: web-build
          path: build/web/
```

## 🌍 Custom Domain Setup

### DNS Configuration

#### Netlify
```
A Record: @  ->  104.198.14.52
CNAME: www  ->  your-site.netlify.app
```

#### Firebase Hosting
```
A Record: @  ->  151.101.1.195
A Record: @  ->  151.101.65.195
```

#### Cloudflare Pages
Cloudflare handles this automatically

## 📞 Support & Troubleshooting

### Common Issues

**Issue: White screen on web**
```bash
flutter clean
flutter pub get
flutter build web --release
```

**Issue: APK too large**
```bash
# Split by ABI
flutter build apk --split-per-abi
```

**Issue: Slow web performance**
- Enable caching
- Optimize images
- Use WASM build
- Enable compression on server

## 📚 Resources

- [Flutter Web Deployment](https://docs.flutter.dev/deployment/web)
- [Firebase Hosting Docs](https://firebase.google.com/docs/hosting)
- [Netlify Docs](https://docs.netlify.com/)
- [GitHub Pages Guide](https://pages.github.com/)
- [Android App Bundle](https://developer.android.com/guide/app-bundle)

---

**Ready to Deploy! 🚀**
