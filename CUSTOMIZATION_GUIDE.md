# Panduan Kustomisasi Portfolio

## 📝 Mengubah Informasi Personal

### 1. Data Pribadi & About Me

Edit file: `lib/app/data/repositories/portfolio_repository.dart`

```dart
Map<String, String> getAboutMe() {
  return {
    'name': 'Nama Lengkap Anda',
    'title': 'Android Developer | Mobile Engineer',
    'description': 'Deskripsi singkat tentang Anda...',
    'image': 'assets/images/profile.png',
  };
}
```

### 2. Informasi Kontak

```dart
Map<String, String> getContactInfo() {
  return {
    'email': 'email@domain.com',
    'phone': '+62 812 3456 7890',
    'linkedin': 'https://linkedin.com/in/username',
    'github': 'https://github.com/username',
  };
}
```

## 🎨 Mengubah Tema Warna

Edit file: `lib/app/core/theme/app_theme.dart`

```dart
static const Color primary = Color(0xFF000000);      // Warna utama
static const Color secondary = Color(0xFFFFFF00);    // Warna sekunder
static const Color accent = Color(0xFFFF00FF);       // Warna aksen
static const Color background = Color(0xFFFAFAFA);   // Background
```

### Contoh Kombinasi Warna Neobrutalism:

**Classic:**
- Primary: `#000000` (Hitam)
- Secondary: `#FFFF00` (Kuning)
- Accent: `#FF00FF` (Magenta)

**Retro:**
- Primary: `#000000` (Hitam)
- Secondary: `#00FF00` (Hijau Neon)
- Accent: `#FF6B6B` (Merah Muda)

**Modern:**
- Primary: `#1A1A1A` (Dark Gray)
- Secondary: `#FFD93D` (Golden Yellow)
- Accent: `#6BCB77` (Mint Green)

## 📂 Menambah Project

Edit file: `lib/app/data/repositories/portfolio_repository.dart`

```dart
List<ProjectModel> getProjects() {
  return [
    ProjectModel(
      id: '1',
      name: 'Nama Project',
      description: 'Deskripsi lengkap project Anda. Jelaskan fitur utama dan keunggulannya.',
      imageUrl: 'assets/images/project1.png',
      techStack: ['Flutter', 'Firebase', 'GetX', 'REST API'],
      demoUrl: 'https://drive.google.com/file/d/YOUR_FILE_ID',
      codeUrl: 'https://github.com/username/repo-name',
      category: 'Mobile Development',
    ),
    // Tambahkan project lainnya...
  ];
}
```

### Upload APK/AAB ke Google Drive:
1. Upload file APK/AAB ke Google Drive
2. Klik kanan > Get Link
3. Set permission ke "Anyone with the link"
4. Copy link dan paste ke `demoUrl`

## 🎓 Mengubah Pendidikan

```dart
List<EducationModel> getEducation() {
  return [
    EducationModel(
      degree: 'S1 Teknik Informatika',
      institution: 'Nama Universitas',
      period: '2019 - 2023',
      description: 'Deskripsi singkat tentang pendidikan',
    ),
    // Tambahkan pendidikan lainnya...
  ];
}
```

## 🔧 Mengubah Tech Stack

```dart
List<TechStackModel> getTechStack() {
  return [
    // Frontend
    TechStackModel(name: 'Flutter', category: 'Frontend', icon: '📱'),
    TechStackModel(name: 'React Native', category: 'Frontend', icon: '⚛️'),
    
    // Backend
    TechStackModel(name: 'Node.js', category: 'Backend', icon: '🟢'),
    TechStackModel(name: 'Laravel', category: 'Backend', icon: '🔴'),
    
    // Tools
    TechStackModel(name: 'Git', category: 'Tools', icon: '📦'),
    TechStackModel(name: 'Docker', category: 'Tools', icon: '🐳'),
  ];
}
```

### Icon Emoji yang Bisa Digunakan:
- 📱 Mobile
- 🎯 Dart
- ⚛️ React
- 🔥 Firebase
- 🟢 Node.js
- 🍃 MongoDB
- 💾 Database
- 🎨 Design
- 📦 Package
- 🐳 Docker
- ☁️ Cloud

## 🖼️ Menambah Gambar

1. Tambahkan gambar ke folder `assets/images/`
2. Pastikan sudah terdaftar di `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/images/
```

3. Gunakan di code:
```dart
imageUrl: 'assets/images/nama_file.png'
```

## 📏 Mengubah Spacing & Border

Edit file: `lib/app/core/values/app_values.dart`

```dart
class AppValues {
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double borderWidth = 3.0;      // Ketebalan border
  static const double shadowOffset = 4.0;     // Offset shadow
  static const double borderRadius = 0.0;     // Radius (0 = kotak)
}
```

## 📱 Mengubah Responsive Breakpoints

```dart
class AppValues {
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
  static const double desktopBreakpoint = 1440;
}
```

## 🔤 Mengubah Font

1. Tambahkan font ke `assets/fonts/`
2. Update `pubspec.yaml`:

```yaml
fonts:
  - family: NamaFont
    fonts:
      - asset: assets/fonts/NamaFont-Regular.ttf
        weight: 400
      - asset: assets/fonts/NamaFont-Bold.ttf
        weight: 700
```

3. Update `app_theme.dart`:
```dart
fontFamily: 'NamaFont',
```

## 🌐 Menambah Section Baru

1. Buat file section baru: `lib/app/modules/home/views/sections/new_section.dart`

```dart
import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';

class NewSection extends StatelessWidget {
  final HomeController controller;

  const NewSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Text('Your content here'),
    );
  }
}
```

2. Tambahkan key di `home_controller.dart`:
```dart
final GlobalKey newSectionKey = GlobalKey();
```

3. Tambahkan di `home_view.dart`:
```dart
NewSection(key: controller.newSectionKey, controller: controller),
```

4. Tambahkan menu di `custom_app_bar.dart`:
```dart
_menuButton('New Section', controller.newSectionKey),
```

## 🚀 Tips Optimasi

1. **Compress gambar** sebelum menambahkan ke assets
2. **Gunakan SVG** untuk icon jika memungkinkan
3. **Lazy load** untuk list panjang
4. **Test responsive** di berbagai ukuran layar

## 📦 Build untuk Production

```bash
# Web
flutter build web --release

# Android
flutter build apk --release
flutter build appbundle --release

# iOS (Mac only)
flutter build ios --release
```

## ❓ Troubleshooting

### Gambar tidak muncul
- Cek path di `assets/images/`
- Pastikan terdaftar di `pubspec.yaml`
- Run `flutter clean` dan `flutter pub get`

### Link tidak bisa dibuka
- Cek URL sudah benar
- Pastikan package `url_launcher` sudah installed
- Untuk Android, tambahkan permission di `AndroidManifest.xml`

### Layout pecah di mobile
- Cek responsive breakpoints
- Gunakan `LayoutBuilder` atau `MediaQuery`
- Test di berbagai ukuran layar
