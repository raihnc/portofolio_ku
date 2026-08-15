# Portfolio Android Developer - Neobrutalism Theme

Portfolio website untuk Android Developer dengan tema neobrutalism, dibangun menggunakan Flutter dan GetX Architecture.

## ✨ Fitur

- 🎨 **Tema Neobrutalism**: Design yang bold dengan border tebal dan shadow
- 🎬 **Smooth Animations**: Entrance animations, hover effects, dan interactive feedback
- 📱 **Fully Responsive**: Mendukung mobile, tablet, dan desktop
- 🏗️ **GetX Architecture**: State management yang efisien dan terstruktur
- 📄 **Multi Section**: About, Projects, Education, Tech Stack, Certificates, Contact
- 🔗 **External Links**: Link ke GitHub dan Google Drive untuk demo APK/AAB
- 🎯 **Navigation**: Smooth scrolling ke setiap section
- 📊 **Project Detail**: Halaman detail untuk setiap project
- 🖱️ **Interactive Hover Effects**: Card animations dan micro-interactions (desktop/tablet)

## 🎬 Animasi & Interaksi

### Entrance Animations
- Navbar slide down dari atas
- Sections fade in dengan slide effect
- Stagger animations untuk list items (cards, badges, menu)
- Smooth transitions dengan timing yang optimal

### Hover Effects (Desktop/Tablet)
- Project cards bergerak naik 8px saat hover
- Tech badges membesar 5% saat hover
- Certificate cards dengan hover animation
- Button scale effect (1.02x)
- Shadow enhancement saat hover

### Press Effects
- Button press feedback dengan shadow transition
- Visual feedback untuk semua interactive elements
- Smooth modal animations

### Micro-interactions
- Shimmer effect pada profile image
- Scale animations untuk badges
- Smooth page transitions
- Interactive feedback di semua clickable elements

**📖 Lihat dokumentasi lengkap di `ANIMATIONS_GUIDE.md`**

## 📁 Struktur Folder

```
lib/
├── main.dart                          # Entry point aplikasi
├── app/
    ├── core/                          # Core utilities
    │   ├── theme/
    │   │   └── app_theme.dart         # Theme & color palette
    │   ├── values/
    │   │   └── app_values.dart        # Constants & breakpoints
    │   └── utils/
    │       └── responsive_helper.dart # Responsive utilities
    ├── data/
    │   ├── models/                    # Data models
    │   │   ├── project_model.dart
    │   │   ├── education_model.dart
    │   │   ├── tech_stack_model.dart
    │   │   └── certificate_model.dart
    │   └── repositories/              # Data repositories
    │       └── portfolio_repository.dart
    ├── routes/
    │   ├── app_pages.dart             # Route configuration
    │   └── app_routes.dart            # Route definitions
    └── modules/
        ├── home/                      # Home module
        │   ├── bindings/
        │   │   └── home_binding.dart
        │   ├── controllers/
        │   │   └── home_controller.dart
        │   └── views/
        │       ├── home_view.dart
        │       ├── widgets/           # Reusable widgets (with animations)
        │       │   ├── custom_app_bar.dart
        │       │   ├── neo_brutalism_button.dart
        │       │   └── neo_brutalism_card.dart
        │       └── sections/          # Section widgets (with animations)
        │           ├── about_section.dart
        │           ├── projects_section.dart
        │           ├── education_section.dart
        │           ├── tech_stack_section.dart
        │           ├── certificate_section.dart
        │           └── contact_section.dart
        └── project_detail/            # Project detail module
            ├── bindings/
            │   └── project_detail_binding.dart
            ├── controllers/
            │   └── project_detail_controller.dart
            └── views/
                └── project_detail_view.dart
```

## 🚀 Cara Menggunakan

1. **Clone repository**
   ```bash
   git clone <your-repo-url>
   cd portofolio_ku
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Konfigurasi Data**
   Edit file `lib/app/data/repositories/portfolio_repository.dart` untuk mengubah:
   - Informasi personal (nama, email, phone)
   - List project dengan link demo & GitHub
   - Pendidikan
   - Tech stack
   - Sertifikat
   - Social media links

4. **Update Assets**
   - Ganti foto profil di `assets/images/profile.jpeg`
   - Tambahkan screenshot project di folder `assets/images/`
   - Tambahkan sertifikat PDF di `assets/certificates/`

5. **Run aplikasi**
   ```bash
   flutter run -d chrome  # Untuk web (recommended untuk test animasi)
   flutter run            # Untuk mobile
   ```

## 🎨 Kustomisasi Tema

Edit file `lib/app/core/theme/app_theme.dart` untuk mengubah color palette:

```dart
static const Color primary = Color(0xFF000000);      // Hitam
static const Color secondary = Color(0xFFFFFF00);    // Kuning
static const Color accent = Color(0xFFFF00FF);       // Magenta
static const Color background = Color(0xFFFAFAFA);   // Abu-abu terang
```

## 🎬 Kustomisasi Animasi

Edit durasi dan delay di file section masing-masing:

```dart
// Ubah durasi
.fadeIn(duration: 600.ms)  // Default
.fadeIn(duration: 300.ms)  // Lebih cepat
.fadeIn(duration: 900.ms)  // Lebih lambat

// Ubah delay
.fadeIn(duration: 600.ms, delay: 200.ms)
```

**Lihat `ANIMATIONS_GUIDE.md` untuk panduan lengkap kustomisasi animasi**

## 📱 Responsive Breakpoints

- **Mobile**: < 600px
- **Tablet**: 600px - 1024px
- **Desktop**: > 1024px

## 🔧 Tech Stack

- **Frontend**: Flutter, Dart
- **State Management**: GetX
- **Architecture**: GetX Pattern (MVC)
- **Animations**: flutter_animate
- **URL Launcher**: untuk membuka link eksternal
- **Google Fonts**: Poppins typography
- **Web Support**: dart:html untuk PDF viewer

## 📝 Cara Menambah Project Baru

Edit `lib/app/data/repositories/portfolio_repository.dart`:

```dart
ProjectModel(
  id: '4',
  name: 'Nama Project',
  description: 'Deskripsi project...',
  imageUrl: 'assets/images/your_image.png',
  techStack: ['Flutter', 'Firebase'],
  demoUrl: 'https://drive.google.com/your-link',
  codeUrl: 'https://github.com/username/repo',
  category: 'Mobile Development',
)
```

## 📚 Dokumentasi

- **README.md** - Overview dan quick start
- **QUICK_START.md** - Panduan setup 5 menit
- **ARCHITECTURE.md** - Dokumentasi arsitektur GetX
- **PROJECT_STRUCTURE.md** - Detail struktur folder
- **CUSTOMIZATION_GUIDE.md** - Panduan kustomisasi
- **ANIMATIONS_GUIDE.md** - Panduan lengkap animasi ✨ NEW
- **CHANGELOG.md** - Log perubahan ✨ NEW
- **ANIMATION_SUMMARY.md** - Ringkasan animasi ✨ NEW
- **DEPLOYMENT.md** - Panduan deployment

## 🌐 Deploy

### Web
```bash
flutter build web --release
```

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS (Mac only)
```bash
flutter build ios --release
```

## 🎯 Testing Animasi

```bash
# Test di Chrome (recommended)
flutter run -d chrome

# Test hover effects:
# - Hover di project cards
# - Hover di tech badges
# - Hover di certificate cards
# - Click buttons untuk press effect

# Test di mobile
flutter run -d <your-device>
```

## ⚡ Performance

- 60fps smooth animations
- Hardware-accelerated
- Optimized timing (300-600ms)
- Responsive hover effects hanya di desktop/tablet
- Efficient stagger animations

## 📊 Animation Stats

- **Total animations**: 40+
- **Animated sections**: 7
- **Interactive components**: 10+
- **Hover effects**: 6 types
- **Average duration**: 450ms
- **Performance**: 60fps smooth

## 🎨 Features Highlight

✨ **Navigation Bar**
- Slide down animation saat page load
- Stagger menu items
- Smooth scroll ke section

✨ **About Section**
- Fade in + slide animation
- Profile image dengan shimmer effect
- Text stagger animation

✨ **Projects Section**
- Grid dengan stagger animation
- Hover effect (card naik 8px)
- Smooth navigation ke detail

✨ **Tech Stack Section**
- Category-based animation
- Badge scale animation
- Interactive hover (scale 1.05x)

✨ **Certificates Section**
- Grid stagger animation
- PDF viewer modal (web)
- Interactive hover effects

✨ **Project Detail**
- Full page animation
- Tech badge with hover
- Smooth transitions

## 💡 Tips

- Test di desktop browser untuk full experience dengan hover effects
- Mobile mendapat smooth entrance animations
- Gunakan Chrome DevTools untuk test responsive
- Baca `ANIMATIONS_GUIDE.md` untuk kustomisasi lanjutan

## 📄 License

MIT License - feel free to use this template for your own portfolio!

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## 🎉 Credits

Portfolio template dengan neobrutalism design dan smooth animations.
Built with Flutter, GetX, dan flutter_animate.

---

**Happy Coding! 🚀✨**
