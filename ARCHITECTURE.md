# Architecture Documentation

## 🏗️ GetX Architecture Pattern

Project ini menggunakan **GetX Pattern** dengan struktur MVC (Model-View-Controller).

```
┌─────────────────────────────────────────────────────────────┐
│                        PRESENTATION                          │
│  ┌────────────────────────────────────────────────────┐    │
│  │                   Views (UI)                        │    │
│  │  - home_view.dart                                   │    │
│  │  - project_detail_view.dart                         │    │
│  │  - sections/ (about, projects, education, etc)      │    │
│  │  - widgets/ (neo_brutalism_card, button, etc)       │    │
│  └────────────────────────────────────────────────────┘    │
│                          ↕️                                  │
│  ┌────────────────────────────────────────────────────┐    │
│  │                Controllers                          │    │
│  │  - home_controller.dart                             │    │
│  │  - project_detail_controller.dart                   │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                          ↕️
┌─────────────────────────────────────────────────────────────┐
│                          DATA                                │
│  ┌────────────────────────────────────────────────────┐    │
│  │                   Repositories                      │    │
│  │  - portfolio_repository.dart                        │    │
│  └────────────────────────────────────────────────────┘    │
│                          ↕️                                  │
│  ┌────────────────────────────────────────────────────┐    │
│  │                     Models                          │    │
│  │  - project_model.dart                               │    │
│  │  - education_model.dart                             │    │
│  │  - tech_stack_model.dart                            │    │
│  └────────────────────────────────────────────────────┘    │
└─────────────────────────────────────────────────────────────┘
                          ↕️
┌─────────────────────────────────────────────────────────────┐
│                         CORE                                 │
│  - theme/ (colors, text styles)                             │
│  - values/ (constants, breakpoints)                         │
│  - utils/ (helpers)                                         │
└─────────────────────────────────────────────────────────────┘
```

## 📁 Folder Structure Explanation

### `/lib/app/core/`
Berisi semua utility, theme, dan konstanta yang digunakan di seluruh aplikasi.

- **theme/**: Color palette, text styles, theme configuration
- **values/**: Constants seperti padding, border width, breakpoints
- **utils/**: Helper classes seperti responsive helper

### `/lib/app/data/`
Layer data yang menangani model dan repository.

- **models/**: Data models (ProjectModel, EducationModel, dll)
- **repositories/**: Business logic untuk fetch/manage data

### `/lib/app/modules/`
Setiap modul adalah fitur independent dengan MVC structure.

```
module_name/
├── bindings/          # Dependency injection
├── controllers/       # Business logic & state management
└── views/            # UI components
    ├── module_view.dart
    ├── widgets/      # Module-specific widgets
    └── sections/     # Section components
```

### `/lib/app/routes/`
Konfigurasi routing menggunakan GetX.

- **app_pages.dart**: Mendefinisikan semua pages dan bindings
- **app_routes.dart**: Named routes constants

## 🔄 Data Flow

```
User Interaction
      ↓
   View (UI)
      ↓
  Controller (Business Logic)
      ↓
  Repository (Data Source)
      ↓
   Model (Data Structure)
      ↓
  Controller (Process Data)
      ↓
   View (Update UI)
```

## 🎯 Key Principles

### 1. Separation of Concerns
- **View**: Hanya menangani UI, tidak ada business logic
- **Controller**: Business logic, state management
- **Repository**: Data management
- **Model**: Data structure

### 2. Dependency Injection
Menggunakan **Bindings** untuk inject dependencies:

```dart
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
```

### 3. Reactive State Management
GetX menyediakan reactive programming:

```dart
// Dalam Controller
final count = 0.obs;

// Dalam View
Obx(() => Text('${controller.count}'))
```

### 4. Routing
Named routes dengan type-safe navigation:

```dart
// Navigasi
Get.toNamed(Routes.PROJECT_DETAIL, arguments: project);

// Get arguments
final project = Get.arguments as ProjectModel;
```

## 🎨 Design Pattern

### Neobrutalism Components

**NeoBrutalismCard**
```dart
NeoBrutalismCard(
  backgroundColor: AppTheme.secondary,
  child: YourContent(),
)
```

Features:
- Border hitam tebal
- Shadow offset
- Background color customizable
- Tap functionality optional

**NeoBrutalismButton**
```dart
NeoBrutalismButton(
  text: 'Click Me',
  icon: Icons.add,
  onPressed: () {},
  backgroundColor: AppTheme.secondary,
)
```

Features:
- Consistent styling
- Icon support
- Shadow effect
- Customizable colors

## 📱 Responsive Design Strategy

### Breakpoints
- Mobile: < 600px
- Tablet: 600px - 1024px
- Desktop: > 1024px

### Implementation
```dart
final size = MediaQuery.of(context).size;
final isMobile = size.width < AppValues.mobileBreakpoint;

return isMobile 
  ? MobileLayout() 
  : DesktopLayout();
```

### Grid System
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
    crossAxisSpacing: 24,
    mainAxisSpacing: 24,
  ),
)
```

## 🔌 External Integrations

### URL Launcher
Untuk membuka link eksternal (GitHub, Drive, LinkedIn):

```dart
Future<void> _launchUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
```

## 🚀 Performance Optimization

1. **Lazy Loading**: Controllers only loaded when needed
2. **Const Widgets**: Menggunakan `const` untuk widget yang tidak berubah
3. **Proper Disposal**: Clean up controllers di `onClose()`
4. **Asset Optimization**: Compress images sebelum digunakan

## 📊 State Management Flow

```
User Taps Button
      ↓
onPressed() di View
      ↓
controller.method()
      ↓
Update State (if using .obs)
      ↓
UI Automatically Updates (Obx widget)
```

## 🧪 Testing Strategy

### Unit Test
Test controllers dan business logic:
```dart
test('should load projects', () {
  final controller = HomeController();
  expect(controller.projects.length, 3);
});
```

### Widget Test
Test UI components:
```dart
testWidgets('should display project name', (tester) async {
  await tester.pumpWidget(ProjectCard(project: mockProject));
  expect(find.text('E-Commerce App'), findsOneWidget);
});
```

## 📚 Best Practices

1. **Single Responsibility**: Setiap class punya satu tanggung jawab
2. **DRY (Don't Repeat Yourself)**: Reusable components di `/widgets/`
3. **Meaningful Names**: Nama variable dan function yang jelas
4. **Comments**: Comment untuk logic yang kompleks
5. **Consistent Styling**: Gunakan theme dari `app_theme.dart`

## 🔮 Future Enhancements

- [ ] Add animations dengan flutter_animate
- [ ] Implement dark mode
- [ ] Add blog section
- [ ] Integrate with CMS (Contentful/Strapi)
- [ ] Add analytics
- [ ] Implement PWA features
- [ ] Add unit tests
- [ ] Add widget tests
