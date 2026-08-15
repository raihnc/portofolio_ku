# 🎬 Panduan Animasi Portfolio

Dokumentasi lengkap untuk animasi yang telah ditambahkan ke portfolio menggunakan `flutter_animate`.

## ✨ Animasi yang Diterapkan

### 1. **About Section**
- **Fade In + Slide**: Seluruh card muncul dengan fade in dan slide dari bawah
- **Image Animation**: Foto profil dengan scale animation dan shimmer effect
- **Text Stagger**: Setiap teks (label, nama, title, deskripsi) muncul secara berurutan dengan slide dari kiri

**Timing:**
- Card: 600ms
- Image: 600ms (delay 200ms) + shimmer 1000ms
- Text: 400ms dengan delay bertahap (300ms, 400ms, 500ms, 600ms)

### 2. **Projects Section**
- **Title Animation**: Fade in + slide dari kiri
- **Project Cards**: Setiap card muncul dengan fade in dan slide dari bawah secara bertahap
- **Hover Effect**: Card bergerak naik sedikit saat di-hover (desktop/tablet)

**Timing:**
- Title: 600ms
- Cards: 600ms dengan delay bertahap (100ms per card)
- Hover: 200ms

### 3. **Tech Stack Section**
- **Section Animation**: Setiap kategori (Frontend, Backend, Tools) muncul secara bertahap
- **Tech Items**: Fade in + scale animation untuk setiap tech badge
- **Hover Effect**: Tech badge membesar saat di-hover

**Timing:**
- Section: 600ms dengan delay (150ms per section)
- Tech items: 400ms dengan delay bertahap (50ms per item)
- Hover: 200ms scale to 1.05

### 4. **Education Section**
- **Card Animation**: Fade in + slide dari bawah
- **Content Stagger**: Degree, institution, period, description muncul secara berurutan

**Timing:**
- Card: 600ms dengan delay (150ms per card)
- Content: 400ms dengan delay bertahap (200ms increment)

### 5. **Certificate Section**
- **Grid Animation**: Setiap sertifikat muncul dengan fade in dan slide
- **Hover Effect**: Card bergerak naik saat di-hover
- **Modal Animation**: Dialog muncul dengan fade in + scale

**Timing:**
- Cards: 600ms dengan delay (100ms per card)
- Hover: 200ms move up 8px
- Modal: 300ms

### 6. **Contact Section**
- **Section Animation**: Card muncul dengan fade in + slide
- **Contact Items**: Email dan phone muncul secara berurutan
- **Social Button**: Scale animation pada button

**Timing:**
- Section: 600ms (delay 200ms)
- Contact items: 400ms dengan delay bertahap
- Social button: 400ms (delay 600ms)

### 7. **Custom App Bar**
- **App Bar**: Fade in + slide dari atas
- **Logo**: Fade in + slide dari kiri
- **Menu Items**: Setiap menu muncul secara berurutan dari atas

**Timing:**
- App bar: 400ms
- Logo: 400ms (delay 200ms)
- Menu items: 300ms dengan delay bertahap (50ms per item)

### 8. **Buttons**
- **Hover Effect**: Scale 1.02 saat di-hover
- **Press Effect**: Transform ke posisi shadow saat ditekan

**Timing:**
- Hover: 150ms
- Press: 150ms

### 9. **Cards**
- **Hover Effect**: Bergerak naik 2px dan shadow membesar (jika clickable)

**Timing:**
- 200ms

### 10. **Project Detail Page**
- **App Bar**: Slide dari atas
- **Image**: Fade in + scale
- **Content**: Fade in + slide secara bertahap
- **Tech Badges**: Fade in + scale dengan stagger
- **Hover Effect**: Tech badge membesar dan shadow bertambah

**Timing:**
- App bar: 400ms
- Image: 600ms (delay 200ms)
- Content: 400ms dengan delay bertahap
- Tech badges: 300ms dengan delay (50ms per badge)

## 🎨 Jenis Animasi yang Digunakan

### 1. **Fade In**
```dart
.animate()
.fadeIn(duration: 600.ms)
```
Elemen muncul dari transparan ke opaque.

### 2. **Slide**
```dart
.animate()
.slideY(begin: 0.3, end: 0, duration: 600.ms)
```
Elemen bergerak dari posisi offset ke posisi normal.

### 3. **Scale**
```dart
.animate()
.scale(begin: Offset(0.8, 0.8), end: Offset(1, 1))
```
Elemen membesar dari ukuran kecil ke ukuran normal.

### 4. **Shimmer**
```dart
.animate()
.shimmer(duration: 1000.ms, color: Colors.white.withOpacity(0.3))
```
Efek kilau/highlight yang bergerak.

### 5. **Move**
```dart
.animate()
.moveY(begin: 0, end: -8, duration: 200.ms)
```
Elemen bergerak pada axis Y atau X.

### 6. **Stagger Animation**
```dart
.animate()
.fadeIn(duration: 400.ms, delay: (100 * index).ms)
```
Animasi berurutan dengan delay bertahap.

## 🎯 Hover Effects

### Desktop/Tablet Only
Hover effects hanya aktif di platform yang support mouse (desktop/tablet):

```dart
MouseRegion(
  onEnter: (_) => setState(() => _isHovered = true),
  onExit: (_) => setState(() => _isHovered = false),
  child: Widget()
    .animate(target: _isHovered ? 1 : 0)
    .scale(begin: Offset(1, 1), end: Offset(1.05, 1.05))
)
```

### Komponen dengan Hover:
- Project cards
- Tech stack badges
- Certificate cards
- Tech badges di detail page
- Buttons (subtle scale)

## 🔧 Kustomisasi Animasi

### Mengubah Durasi
```dart
// Cepat
.fadeIn(duration: 300.ms)

// Normal
.fadeIn(duration: 600.ms)

// Lambat
.fadeIn(duration: 1000.ms)
```

### Mengubah Delay
```dart
// Tanpa delay
.fadeIn(duration: 600.ms)

// Dengan delay
.fadeIn(duration: 600.ms, delay: 200.ms)

// Delay bertahap (untuk stagger)
.fadeIn(duration: 600.ms, delay: (100 * index).ms)
```

### Mengubah Curve
```dart
// Ease out (default)
.slideY(begin: 0.2, end: 0, curve: Curves.easeOut)

// Ease in out
.slideY(begin: 0.2, end: 0, curve: Curves.easeInOut)

// Bounce
.slideY(begin: 0.2, end: 0, curve: Curves.bounceOut)

// Elastic
.slideY(begin: 0.2, end: 0, curve: Curves.elasticOut)
```

## 🎭 Menambah Animasi Baru

### Contoh: Animasi Fade + Rotate
```dart
Text('Hello')
  .animate()
  .fadeIn(duration: 600.ms)
  .rotate(begin: 0, end: 0.1, duration: 600.ms)
```

### Contoh: Animasi Sekuensial
```dart
Widget()
  .animate()
  .fadeIn(duration: 300.ms)
  .then() // Tunggu animasi sebelumnya selesai
  .slideX(begin: -0.2, end: 0, duration: 300.ms)
```

### Contoh: Loop Animation
```dart
Widget()
  .animate(onComplete: (controller) => controller.repeat())
  .shimmer(duration: 2000.ms)
```

## 🚀 Performance Tips

1. **Gunakan Const Constructor**: Gunakan `const` untuk widget yang tidak berubah
2. **Hindari Animasi Berlebihan**: Terlalu banyak animasi bisa membuat aplikasi lag
3. **Optimal Delay**: Delay 50-100ms per item untuk stagger animation
4. **Duration Sweet Spot**: 300-600ms untuk animasi yang smooth
5. **Hover di Web/Desktop Only**: Hover effect hanya untuk platform yang support mouse

## 🔄 Menon-aktifkan Animasi

### Untuk Section Tertentu
Hapus atau comment out `.animate()` chain:

```dart
// Dengan animasi
Widget().animate().fadeIn()

// Tanpa animasi
Widget()
```

### Untuk Semua Animasi
Set `Animate.defaultDuration = Duration.zero` di `main.dart`:

```dart
void main() {
  Animate.defaultDuration = Duration.zero;
  runApp(MyApp());
}
```

## 📊 Ringkasan Timing

| Element | Duration | Delay | Effect |
|---------|----------|-------|--------|
| App Bar | 400ms | 0ms | Slide down |
| Hero Section | 600ms | 0ms | Fade + Slide |
| Section Title | 600ms | 0ms | Fade + Slide X |
| Cards | 600ms | 100ms/item | Fade + Slide Y |
| Text Stagger | 400ms | 100-200ms/item | Fade + Slide |
| Buttons | 150ms | - | Scale on hover |
| Tech Badges | 300-400ms | 50ms/item | Fade + Scale |

## 🎨 Animasi Kurva yang Digunakan

- **easeOut**: Animasi melambat di akhir (default untuk fade/slide)
- **easeInOut**: Animasi melambat di awal dan akhir
- **bounceOut**: Animasi dengan efek bouncing
- **elasticOut**: Animasi dengan efek elastic

## 📱 Responsive Animation

Animasi tetap sama di semua breakpoint, namun:
- Hover effect hanya aktif di desktop/tablet
- Layout berubah tapi timing animasi konsisten
- Mobile mendapat smooth scroll experience

## 🎯 Best Practices

1. ✅ Gunakan delay bertahap untuk list/grid items
2. ✅ Kombinasi fade + slide untuk entrance
3. ✅ Hover effect subtle (scale 1.02-1.05)
4. ✅ Duration 300-600ms untuk smooth animation
5. ✅ Gunakan `then()` untuk sequential animation
6. ❌ Jangan animasi terlalu banyak element sekaligus
7. ❌ Jangan gunakan duration > 1000ms (terlalu lambat)
8. ❌ Jangan stack terlalu banyak effect dalam satu chain

---

**Selamat bereksperimen dengan animasi! 🎨**
