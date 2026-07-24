# Weather App 🌤️

A modern, responsive Flutter application that provides real-time weather information. Built with
clean architecture principles, the app delivers a seamless user experience with offline support and
intuitive design.

## 📋 Table of Contents

- [Features](#features)
- [Project Architecture](#project-architecture)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Running the App](#running-the-app)
- [API Integration](#api-integration)
- [Dependencies](#dependencies)
- [Architecture Overview](#architecture-overview)
- [Core Components](#core-components)
- [Contributing](#contributing)
- [License](#license)

---

## ✨ Features

- **City Search**: Search for weather information by city name
- **Real-time Weather Data**: Display current temperature, conditions, and weather icons
- **Offline Support**: Automatic caching of the latest weather data using local storage
- **Modern UI/UX**:
    - Dark theme with elegant gradient backgrounds
    - Smooth animations and transitions
    - Responsive design for all device sizes
- **Internationalization**: Arabic font support (IBM Plex Sans Arabic)
- **Error Handling**: Graceful fallback to cached data on network failures
- **State Management**: Provider pattern for efficient state management

---

## Project Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
┌─────────────────────────────────────────────────────────┐
│         Presentation Layer (UI & State)                  │
│  - Screens, Widgets, Providers (UI Logic & State)       │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│         Domain Layer (Business Logic)                    │
│  - Repository Interface, Use Cases, Entities            │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│         Data Layer (Data Access)                         │
│  - Repository Implementation                             │
│  - Remote Data Source (WeatherAPI)                       │
│  - Local Data Source (SharedPreferences)                 │
│  - Models (API & Cache Serialization)                   │
└─────────────────────────────────────────────────────────┘
                          ↓
┌─────────────────────────────────────────────────────────┐
│         Core Layer (Infrastructure)                      │
│  - Network (API Client, Interceptors, Endpoints)        │
│  - Caching (CacheHelper)                                │
│  - Dependency Injection (Service Locator)               │
│  - Themes, Constants, Services, Widgets                │
└─────────────────────────────────────────────────────────┘
```

---

## Technical Decisions

- Used Provider for lightweight state management.
- Followed a simplified Clean Architecture structure.
- Implemented a repository pattern to separate data sources from the presentation layer.
- Cached the last successful weather response for offline support.
- Returned cached data only for network-related failures, while preserving API errors such as
  invalid city names.
- Used reusable widgets and centralized theming to keep the UI consistent.

## Tech Stack

| Category                 | Technology                 |
|--------------------------|----------------------------|
| **Framework**            | Flutter 3.11.5+            |
| **Language**             | Dart 3.11.5+               |
| **State Management**     | Provider 6.1.5             |
| **Dependency Injection** | GetIt 9.2.1                |
| **HTTP Client**          | Dio 5.10.0                 |
| **Local Storage**        | SharedPreferences 2.5.5    |
| **Image Loading**        | cached_network_image 3.4.1 |
| **UI Framework**         | Material Design            |

---

## Project Structure

```
weather_app/
├── lib/
│   ├── main.dart                          # App entry point
│   ├── app.dart                           # Root widget & routing setup
│   │
│   ├── core/                              # Infrastructure layer
│   │   ├── di/                            # Dependency Injection
│   │   │   ├── locator.dart               # Service locator setup
│   │   │   └── locator_service.dart       # Service locator instance
│   │   ├── network/                       # Networking
│   │   │   ├── api_client.dart            # HTTP client
│   │   │   ├── api_interceptors.dart      # Request/response interceptors
│   │   │   ├── api_result.dart            # Result wrapper (Success/Failure)
│   │   │   ├── api_response.dart          # API response model
│   │   │   ├── end_points.dart            # API endpoints & base URL
│   │   │   └── pretty_dio_logger.dart     # Request/response logging
│   │   ├── cache/                         # Local storage
│   │   │   └── cache_helper.dart          # SharedPreferences wrapper
│   │   ├── themes/                        # UI theming
│   │   │   ├── colors.dart                # Color palette
│   │   │   ├── gradients.dart             # Gradient definitions
│   │   │   ├── shadows.dart               # Shadow definitions
│   │   │   ├── text_styles.dart           # Typography
│   │   │   └── theme.dart                 # Theme configuration
│   │   ├── constants/                     # App constants
│   │   │   ├── app_constant.dart          # App-wide constants
│   │   │   └── enums.dart                 # Enumerations
│   │   ├── error/                         # Error handling
│   │   │   ├── exceptions.dart            # Custom exceptions
│   │   │   └── validation.dart            # Input validation
│   │   ├── services/                      # Core services
│   │   │   └── navigation_service.dart    # Navigation management
│   │   ├── widgets/                       # Reusable widgets
│   │   │   ├── gradient_background.dart   # Gradient background widget
│   │   │   ├── animated_switcher_wrapper.dart
│   │   │   ├── animated_fade_scale_wrapper.dart
│   │   │   ├── app_logo.dart              # App logo widget
│   │   │   └── ...
│   │   ├── routes.dart                    # Route definitions
│   │
│   ├── features/                          # Feature modules
│   │   └── weather/                       # Weather feature
│   │       ├── data/                      # Data layer
│   │       │   ├── datasources/
│   │       │   │   ├── weather_remote_data_source.dart  # API calls
│   │       │   │   └── weather_local_data_source.dart   # Local caching
│   │       │   ├── repositories/
│   │       │   │   ├── weather_repository.dart          # Repository interface
│   │       │   │   └── weather_repository_impl.dart     # Repository implementation
│   │       │   └── models/
│   │       │       └── weather_model.dart               # Data model
│   │       └── presentation/              # Presentation layer
│   │           ├── screens/
│   │           │   ├── splash_screen.dart # Splash screen
│   │           │   └── home_screen.dart   # Main weather screen
│   │           ├── providers/
│   │           │   └── weather_provider.dart           # State management
│   │           └── widgets/
│   │               ├── weather_card.dart                # Weather display card
│   │               ├── weather_error.dart               # Error display
│   │               ├── weather_placeholder.dart         # Loading placeholder
│   │               ├── weather_search_field.dart        # Search input
│   │               └── ...
│   │
│   ├── assets/                            # Static assets
│   │   ├── images/                        # Image resources
│   │   └── fonts/                         # Custom fonts
│   │
│   ├── test/                              # Unit & widget tests
│
├── android/                               # Android native code
├── ios/                                   # iOS native code
├── pubspec.yaml                           # Flutter configuration
└── README.md                              # This file
```

---

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- **Flutter SDK** (3.11.5 or later)
    - Download from [flutter.dev](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (3.11.5 or later) - comes with Flutter
- **Android Studio** or **Xcode** (for device/emulator setup)
- **Git** (for version control)

Verify installation:

```bash
flutter --version
dart --version
```

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Mohamed-Ayman-Dev/weather_app.git
   cd weather_app
   ```

2. **Get Dependencies**
   ```bash
   flutter pub get
   ```

3. **Create Build Files** (if needed)
   ```bash
   flutter pub run build_runner build
   ```

### Running the App

**On Android Emulator:**

```bash
flutter run
```

**On Physical Android Device:**

```bash
# Connect your device via USB, then:
flutter run
```

**On iOS Simulator:**

```bash
flutter run
```

**On Physical iOS Device:**

```bash
flutter run -d <device_id>
```

**Release Build:**

```bash
flutter run --release
```

---

## 🌐 API Integration

### Weather API

This app uses **WeatherAPI.com** for real-time weather data.

**Base URL:** `https://api.weatherapi.com/v1`

**Endpoint:** `/current.json`

**Query Parameters:**

- `key`: API key (free tier available)
- `q`: City name or coordinates

**Example Request:**

```
GET https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=Cairo
```

**Response Structure:**

```json
{
  "location": {
    "name": "Cairo",
    "country": "Egypt",
    ...
  },
  "current": {
    "temp_c": 32.5,
    "condition": {
      "text": "Sunny",
      "icon": "//cdn.weatherapi.com/...",
      "code": 1000
    },
    ...
  }
}
```

### API Configuration

The API endpoint and key are configured in:

```dart
// lib/core/network/end_points.dart
static const String baseUrl = "https://api.weatherapi.com/v1";
static const String apiKey = 'YOUR_API_KEY'; // Replace with your key
```

⚠️ **Security Note:** In production, store API keys securely using environment variables or a
backend proxy.

---

## 📦 Dependencies

### Core Dependencies

| Package                | Version | Purpose                      |
|------------------------|---------|------------------------------|
| `provider`             | 6.1.5   | State management             |
| `get_it`               | 9.2.1   | Service locator for DI       |
| `dio`                  | 5.10.0  | HTTP client                  |
| `shared_preferences`   | 2.5.5   | Local data persistence       |
| `cached_network_image` | 3.4.1   | Image caching & optimization |
| `cupertino_icons`      | 1.0.9   | iOS-style icons              |

### Dev Dependencies

| Package         | Version | Purpose                  |
|-----------------|---------|--------------------------|
| `flutter_test`  | -       | Widget testing framework |
| `flutter_lints` | 6.0.0   | Code quality linting     |

To update dependencies:

```bash
flutter pub upgrade
```

---

## 🏛️ Architecture Overview

### Data Flow

```
User Input (Search City)
           ↓
    WeatherProvider
           ↓
    WeatherRepository
           ↓
    ┌──────────────────────┐
    ↓                      ↓
RemoteDataSource    LocalDataSource
(WeatherAPI)        (SharedPreferences)
           ↓                ↓
        ApiClient      CacheHelper
           ↓                ↓
    ┌──────────────────────┐
           ↓
     WeatherModel
           ↓
    UI Update (Rebuild)
```

### Key Design Patterns

1. **Repository Pattern**
    - Abstraction layer between data sources and business logic
    - Easy to mock for testing
    - `WeatherRepository` + `WeatherRepositoryImpl`

2. **Dependency Injection (DI)**
    - Service Locator pattern using `GetIt`
    - Centralized dependency registration in `locator.dart`
    - Improves testability and maintainability

3. **Provider Pattern**
    - State management with `ChangeNotifier`
    - Automatic UI updates on state changes
    - `WeatherProvider` manages weather state

4. **Result Wrapper Pattern**
    - Encapsulates success/failure states
    - `ApiResult<T>` with `.when()` for safe handling

---

## 🎯 Core Components

### 1. **WeatherProvider** (State Management)

- Manages weather data state
- Handles city search requests
- Notifies listeners on state changes
- Error handling and loading states

### 2. **WeatherRepository** (Data Access)

- Abstract interface for data operations
- Implementation handles remote & local data source coordination
- Caching logic with network fallback

### 3. **API Client** (Networking)

- Centralized HTTP client with Dio
- Request/response interceptors
- Pretty logging for debugging

### 4. **Cache Helper** (Local Storage)

- SharedPreferences wrapper
- Simple key-value storage interface
- Transparent caching for offline support

### 5. **Navigation Service** (Routing)

- Centralized navigation management
- Route registration and transitions
- Supports named routes

---

## 🎨 UI/UX Highlights

- **Gradient Backgrounds**: Smooth, modern gradient designs
- **Animated Transitions**: Splash screen to home with fade transition
- **Responsive Layout**: Adapts to all screen sizes
- **Dark Theme**: Eye-friendly dark color scheme
- **Weather Icons**: Real images from WeatherAPI
- **Smooth Interactions**: Loading indicators and error states

---

## 🧪 Testing

Run tests with:

```bash
flutter test
```

View coverage:

```bash
flutter test --coverage
```

---

## 📋 Code Quality

Run linting:

```bash
flutter analyze
```

Format code:

```bash
dart format lib/
```

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

Please ensure code quality:

- Run `flutter analyze` before committing
- Write meaningful commit messages
- Update documentation as needed

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

## 👨‍💻 Author

**Mohamed Ayman**

- GitHub: [@Mohamed-Ayman-Dev](https://github.com/Mohamed-Ayman-Dev)

---

## 📞 Support

For issues, questions, or suggestions, please:

- Open an [Issue](https://github.com/Mohamed-Ayman-Dev/weather_app/issues) on GitHub
- Contact the author directly

---

## 🔗 Useful Links

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)
- [WeatherAPI Documentation](https://www.weatherapi.com/docs/)
- [Provider Package](https://pub.dev/packages/provider)
- [GetIt Package](https://pub.dev/packages/get_it)
- [Dio Package](https://pub.dev/packages/dio)

---

**Last Updated:** July 24, 2026  
**Version:** 1.0.0
