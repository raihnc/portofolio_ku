# 🚀 Quick Start Guide

Panduan cepat untuk setup dan kustomisasi portfolio Anda.

## ⚡ Setup dalam 5 Menit

### 1️⃣ Install Dependencies
```bash
flutter pub get
```

### 2️⃣ Update Informasi Pribadi
Edit file: `lib/app/data/repositories/portfolio_repository.dart`

```dart
// Line 57: Ganti dengan info Anda
Map<String, String> getAboutMe() {
  return {
    'name': 'NAMA ANDA',                    // ← Ganti ini
    'title': 'Android Developer',           // ← Dan ini
    'description': 'Deskripsi Anda...',     // ← Dan ini
    'image': 'assets/images/profile.png',
  };
}

// Line 65: Update kontak
Map<String, String> getContactInfo() {
  return {
    'email': 'email@anda.com',              // ← Ganti
    'phone': '+62 812 xxxx xxxx',           // ← Ganti
    'linkedin': 'https://linkedin.com/in/username',  // ← Ganti
    'github': 'https://github.com/username',         // ← Ganti
  };
}
```

### 3️⃣ Ganti Foto Profil
```bash
# Hapus foto lama dan tambahkan foto baru
rm assets/images/profile.png
cp /path/to/your/photo.png assets/images/profile.png
```

### 4️⃣ Jalankan Aplikasi
```bash
# Untuk Web
flutter run -d chrome

# Untuk Mobile
flutter run
```

## 📝 Update Project (Detail)

### Upload APK ke Google Drive
1. Build APK Anda:
   ```bash
   flutter build apk --release
   ```
2. Upload file di `build/app/outputs/flutter-apk/app-release.apk` ke Google Drive
3. Klik kanan > Share > Copy Link
4. Paste link ke `demoUrl`

### Update Project di Code
Edit file: `lib/app/data/repositories/portfolio_repository.dart` (Line 7-41)

```dart
ProjectModel(
  id: '1',
  name: 'E-Commerce App',                   // Nama project
  description: 'Deskripsi lengkap...',      // Deskripsi
  imageUrl: 'assets/images/profile.png',    // Screenshot
  techStack: ['Flutter', 'Firebase'],       // Tech yang dipakai
  demoUrl: 'https://drive.google.com/...',  // Link APK
  codeUrl: 'https://github.com/...',        // Link GitHub
  category: 'Mobile Development',
),
```

### Tambah Screenshot Project
1. Tambahkan file ke `assets/images/project1.png`
2. Update `imageUrl: 'assets/images/project1.png'`

## 🎨 Ganti Warna (Opsional)

Edit file: `lib/app/core/theme/app_theme.dart` (Line 4-10)

```dart
static const Color primary = Color(0xFF000000);     // Hitam
static const Color secondary = Color(0xFFFFFF00);   // Kuning
static const Color accent = Color(0xFFFF00FF);      // Magenta
```

### Rekomendasi Warna Neobrutalism:
```dart
// Neon Vibe
primary: Color(0xFF000000)
secondary: Color(0xFF00FF00)
accent: Color(0xFFFF1493)

// Retro
primary: Color(0xFF1A1A1A)
secondary: Color(0xFFFFD93D)
accent: Color(0xFF6BCB77)

// Cyberpunk
primary: Color(0xFF0A0E27)
secondary: Color(0xFF00D9FF)
accent: Color(0xFFFF0080)
```

## 🔧 Update Tech Stack

Edit file: `lib/app/data/repositories/portfolio_repository.dart` (Line 50-55)

```dart
List<TechStackModel> getTechStack() {
  return [
    // Frontend
    TechStackModel(name: 'Flutter', category: 'Frontend', icon: '📱'),
    TechStackModel(name: 'Kotlin', category: 'Frontend', icon: '🤖'),
    
    // Backend
    TechStackModel(name: 'Firebase', category: 'Backend', icon: '🔥'),
    TechStackModel(name: 'Node.js', category: 'Backend', icon: '🟢'),
    
    // Tools
    TechStackModel(name: 'Git', category: 'Tools', icon: '📦'),
    TechStackModel(name: 'Figma', category: 'Tools', icon: '🎨'),
  ];
}
```

## 🎓 Update Pendidikan

Edit file: `lib/app/data/repositories/portfolio_repository.dart` (Line 45)

```dart
EducationModel(
  degree: 'S1 Teknik Informatika',
  institution: 'Universitas Indonesia',
  period: '2019 - 2023',
  description: 'Fokus pada mobile development',
),
```

## 🌐 Build untuk Production

### Web
```bash
flutter build web --release
```
Output: `build/web/`

Deploy ke:
- Firebase Hosting
- Netlify
- Vercel
- GitHub Pages

### Android
```bash
# APK
flutter build apk --release

# AAB (untuk Play Store)
flutter build appbundle --release
```

Output:
- APK: `build/app/outputs/flutter-apk/app-release.apk`
- AAB: `build/app/outputs/bundle/release/app-release.aab`

## ✅ Checklist Sebelum Deploy

- [ ] Ganti nama di `getAboutMe()`
- [ ] Update email & phone di `getContactInfo()`
- [ ] Ganti foto profil di `assets/images/profile.png`
- [ ] Update semua project dengan link Google Drive & GitHub
- [ ] Tambahkan screenshot project
- [ ] Update pendidikan
- [ ] Update tech stack sesuai skill Anda
- [ ] Update link LinkedIn & GitHub
- [ ] Test responsive di mobile, tablet, desktop
- [ ] Build dan test APK/Web

## 🐛 Common Issues

### Issue: Gambar tidak muncul
```bash
flutter clean
flutter pub get
flutter run
```

### Issue: Link tidak bisa dibuka
Tambahkan di `android/app/src/main/AndroidManifest.xml`:
```xml
<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
```

### Issue: Font tidak berubah
```bash
flutter clean
flutter pub get
flutter run
```

## 📱 Test Responsive

### Browser DevTools
1. Buka aplikasi di browser
2. Press F12
3. Click device toolbar (Ctrl+Shift+M)
4. Test di:
   - iPhone SE (375px)
   - iPad (768px)
   - Desktop (1440px)

### Android Studio
1. Run di berbagai emulator
2. Test:
   - Phone (Pixel 5)
   - Tablet (Pixel Tablet)
   - Foldable

## 🎯 Next Steps

1. ✅ Setup & kustomisasi dasar
2. 📸 Tambahkan screenshot project berkualitas
3. 📝 Tulis deskripsi project yang menarik
4. 🔗 Upload APK ke Google Drive
5. 🚀 Deploy ke web
6. 📢 Share portfolio Anda!

## 💡 Tips

- Gunakan screenshot project yang HD
- Tulis deskripsi yang menjelaskan problem & solution
- Tunjukkan impact dari project Anda (users, downloads, dll)
- Update tech stack sesuai skill terbaru
- Tambahkan link ke Google Play Store jika ada
- Pastikan APK bisa di-download & install

## 📚 Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [GetX Documentation](https://pub.dev/packages/get)
- [Neobrutalism Design](https://hype4.academy/articles/design/neobrutalism-design)
- [Color Palette Generator](https://coolors.co/)

## 🆘 Need Help?

- Baca `CUSTOMIZATION_GUIDE.md` untuk panduan detail
- Baca `ARCHITECTURE.md` untuk memahami struktur
- Check `README.md` untuk overview project

---

**Happy Coding! 🚀**
