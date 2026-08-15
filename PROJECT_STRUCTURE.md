# 📁 Project Structure

Visualisasi lengkap struktur folder project portfolio.

```
portofolio_ku/
│
├── 📄 README.md                          # Overview & features
├── 📄 QUICK_START.md                     # Panduan quick setup
├── 📄 CUSTOMIZATION_GUIDE.md             # Panduan kustomisasi detail
├── 📄 ARCHITECTURE.md                    # Dokumentasi arsitektur
├── 📄 DEPLOYMENT.md                      # Panduan deployment
├── 📄 PROJECT_STRUCTURE.md               # File ini
│
├── 📄 pubspec.yaml                       # Dependencies & assets
├── 📄 analysis_options.yaml              # Linter configuration
│
├── 📁 assets/                            # Asset files
│   ├── 📁 fonts/                         # Custom fonts (Poppins)
│   │   ├── Poppins-Regular.ttf
│   │   ├── Poppins-Medium.ttf
│   │   ├── Poppins-SemiBold.ttf
│   │   ├── Poppins-Bold.ttf
│   │   └── Poppins-ExtraBoldItalic.ttf
│   │
│   └── 📁 images/                        # Images & screenshots
│       └── profile.png                   # Foto profil
│
├── 📁 lib/                               # Source code
│   ├── 📄 main.dart                      # Entry point
│   │
│   └── 📁 app/
│       │
│       ├── 📁 core/                      # Core utilities & config
│       │   │
│       │   ├── 📁 theme/
│       │   │   └── 📄 app_theme.dart     # Theme, colors, text styles
│       │   │
│       │   ├── 📁 values/
│       │   │   └── 📄 app_values.dart    # Constants & breakpoints
│       │   │
│       │   └── 📁 utils/
│       │       └── 📄 responsive_helper.dart  # Responsive helpers
│       │
│       ├── 📁 data/                      # Data layer
│       │   │
│       │   ├── 📁 models/                # Data models
│       │   │   ├── 📄 project_model.dart
│       │   │   ├── 📄 education_model.dart
│       │   │   └── 📄 tech_stack_model.dart
│       │   │
│       │   └── 📁 repositories/          # Data repositories
│       │       └── 📄 portfolio_repository.dart
│       │
│       ├── 📁 routes/                    # Navigation
│       │   ├── 📄 app_pages.dart         # Route configuration
│       │   └── 📄 app_routes.dart        # Route definitions
│       │
│       └── 📁 modules/                   # Feature modules
│           │
│           ├── 📁 home/                  # Home module
│           │   │
│           │   ├── 📁 bindings/
│           │   │   └── 📄 home_binding.dart
│           │   │
│           │   ├── 📁 controllers/
│           │   │   └── 📄 home_controller.dart
│           │   │
│           │   └── 📁 views/
│           │       │
│           │       ├── 📄 home_view.dart      # Main home view
│           │       │
│           │       ├── 📁 widgets/            # Reusable widgets
│           │       │   ├── 📄 custom_app_bar.dart
│           │       │   ├── 📄 neo_brutalism_button.dart
│           │       │   └── 📄 neo_brutalism_card.dart
│           │       │
│           │       └── 📁 sections/           # Page sections
│           │           ├── 📄 about_section.dart
│           │           ├── 📄 projects_section.dart
│           │           ├── 📄 education_section.dart
│           │           ├── 📄 tech_stack_section.dart
│           │           └── 📄 contact_section.dart
│           │
│           └── 📁 project_detail/        # Project detail module
│               │
│               ├── 📁 bindings/
│               │   └── 📄 project_detail_binding.dart
│               │
│               ├── 📁 controllers/
│               │   └── 📄 project_detail_controller.dart
│               │
│               └── 📁 views/
│                   └── 📄 project_detail_view.dart
│
├── 📁 web/                               # Web specific files
│   ├── index.html
│   ├── manifest.json
│   └── 📁 icons/
│
├── 📁 android/                           # Android specific files
│   ├── app/
│   │   ├── build.gradle.kts
│   │   └── src/main/AndroidManifest.xml
│   └── gradle/
│
├── 📁 ios/                               # iOS specific files
│   └── Runner/
│
├── 📁 macos/                            # macOS specific files
│   └── Runner/
│
├── 📁 windows/                          # Windows specific files
│   └── runner/
│
└── 📁 linux/                            # Linux specific files
    └── runner/
```

## 🎯 Key Files Explanation

### Configuration Files

| File | Purpose |
|------|---------|
| `pubspec.yaml` | Dependencies, assets, fonts configuration |
| `analysis_options.yaml` | Linter & analyzer rules |
| `.gitignore` | Files to exclude from Git |

### Core Files (lib/app/core/)

| File | Purpose | Edit for |
|------|---------|----------|
| `app_theme.dart` | Colors, text styles | Change color palette |
| `app_values.dart` | Constants, breakpoints | Adjust spacing, borders |
| `responsive_helper.dart` | Responsive utilities | Custom breakpoint logic |

### Data Layer (lib/app/data/)

| File | Purpose | Edit for |
|------|---------|----------|
| `project_model.dart` | Project data structure | Add project fields |
| `education_model.dart` | Education data structure | Add education fields |
| `tech_stack_model.dart` | Tech stack structure | Add tech fields |
| `portfolio_repository.dart` | Data source | Update personal data |

### Routes (lib/app/routes/)

| File | Purpose | Edit for |
|------|---------|----------|
| `app_pages.dart` | Route configuration | Add new pages |
| `app_routes.dart` | Route constants | Add route names |

### Home Module (lib/app/modules/home/)

#### Controllers
- `home_controller.dart` - State & business logic

#### Views
- `home_view.dart` - Main layout

#### Widgets (Reusable)
- `custom_app_bar.dart` - Navigation bar
- `neo_brutalism_button.dart` - Button component
- `neo_brutalism_card.dart` - Card component

#### Sections
- `about_section.dart` - About me section
- `projects_section.dart` - Projects grid
- `education_section.dart` - Education timeline
- `tech_stack_section.dart` - Tech stack grid
- `contact_section.dart` - Contact info & social

### Project Detail Module

- `project_detail_controller.dart` - Detail page logic
- `project_detail_view.dart` - Detail page UI

## 📊 File Size Distribution

```
Total Files: ~30 Dart files
Average Size: 100-300 lines per file

Largest Files:
├── portfolio_repository.dart      ~100 lines
├── home_controller.dart           ~60 lines
├── projects_section.dart          ~120 lines
├── tech_stack_section.dart        ~110 lines
└── project_detail_view.dart       ~170 lines

Smallest Files:
├── Models (~20 lines each)
├── Bindings (~10 lines each)
└── App routes (~15 lines)
```

## 🔄 Data Flow

```
User Action
    ↓
View (UI Component)
    ↓
Controller (Business Logic)
    ↓
Repository (Data Source)
    ↓
Model (Data Structure)
    ↓
Controller (Process & Update State)
    ↓
View (Re-render with new data)
```

## 📝 Naming Conventions

### Files
- `snake_case.dart` untuk semua file
- Suffix dengan type: `_view.dart`, `_controller.dart`, `_model.dart`

### Classes
- `PascalCase` untuk class names
- Example: `HomeController`, `ProjectModel`

### Variables & Functions
- `camelCase` untuk variables & functions
- Example: `getUserInfo()`, `projectList`

### Constants
- `SCREAMING_SNAKE_CASE` untuk constants (Route names)
- Example: `PROJECT_DETAIL`, `HOME`

## 🎨 Component Hierarchy

```
HomeView
├── CustomAppBar
│   └── NeoBrutalismButton (menu items)
│
└── SingleChildScrollView
    ├── AboutSection
    │   └── NeoBrutalismCard
    │       ├── Image (profile)
    │       └── Text (info)
    │
    ├── ProjectsSection
    │   └── GridView
    │       └── NeoBrutalismCard (×3)
    │           ├── Image (screenshot)
    │           ├── Text (info)
    │           └── Chips (tech stack)
    │
    ├── EducationSection
    │   └── NeoBrutalismCard (×1)
    │       └── Text (degree, institution)
    │
    ├── TechStackSection
    │   └── NeoBrutalismCard (×3 categories)
    │       └── GridView (tech items)
    │
    └── ContactSection
        └── NeoBrutalismCard
            ├── Contact info
            └── NeoBrutalismButton (social links)
```

## 🔧 Module Template

Untuk menambah module baru, ikuti struktur ini:

```
new_module/
├── bindings/
│   └── new_module_binding.dart
├── controllers/
│   └── new_module_controller.dart
└── views/
    ├── new_module_view.dart
    └── widgets/
        └── custom_widget.dart
```

## 📱 Platform Specific Files

### Android
```
android/
├── app/
│   ├── build.gradle.kts           # Dependencies
│   └── src/main/
│       ├── AndroidManifest.xml    # Permissions
│       └── kotlin/                # Native code
```

### Web
```
web/
├── index.html                     # Entry point
├── manifest.json                  # PWA config
└── icons/                         # App icons
```

### iOS
```
ios/
├── Runner/
│   ├── Info.plist                # App config
│   └── Assets.xcassets/          # Icons & images
```

## 💡 Best Practices

1. **One responsibility per file**
   - Setiap file punya satu purpose yang jelas

2. **Keep files small**
   - Max 200-300 lines per file
   - Split jika terlalu besar

3. **Proper naming**
   - Nama file menggambarkan isinya
   - Consistent naming convention

4. **Organize by feature**
   - Group by module, bukan by type
   - Easier to maintain & scale

5. **Reusable components**
   - Extract common widgets
   - DRY (Don't Repeat Yourself)

## 🔍 Finding Files Quick Reference

| Need to update | Go to |
|----------------|-------|
| Colors | `lib/app/core/theme/app_theme.dart` |
| Personal info | `lib/app/data/repositories/portfolio_repository.dart` |
| Projects | `lib/app/data/repositories/portfolio_repository.dart` |
| Add new page | `lib/app/routes/app_pages.dart` |
| Responsive breakpoints | `lib/app/core/values/app_values.dart` |
| Button style | `lib/app/modules/home/views/widgets/neo_brutalism_button.dart` |
| Card style | `lib/app/modules/home/views/widgets/neo_brutalism_card.dart` |

---

**Navigate with confidence! 🗺️**
