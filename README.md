# Weather App

A Flutter application that fetches and displays real-time weather information for any city using
WeatherAPI.

The project was built as a technical assessment with a focus on clean architecture, modular design,
state management, error handling, and offline caching.

<p align="center">
  <img src="assets/readme/demo.gif" width="320"/>
</p>

---

## Features

- Search weather by city name.
- Display:
    - City name
    - Country
    - Current temperature
    - Weather condition.
    - Weather condition icon.
- Loading indicator while fetching data.
- Error handling for:
    - Invalid city names.
    - Network failures.
- Offline support using the last successful cached result.
- Responsive layout.
- Smooth UI animations.

---

## Screenshots

| Home                        | Weather                        | Error                        |
|-----------------------------|--------------------------------|------------------------------|
| ![](assets/readme/home.png) | ![](assets/readme/weather.png) | ![](assets/readme/error.png) |

---

## Technical Decisions

- Followed a simplified Clean Architecture approach.
- Used **Provider** for lightweight state management.
- Applied the **Repository Pattern** to isolate the presentation layer from data sources.
- Used **GetIt** for dependency injection.
- Cached the last successful weather response using **SharedPreferences**.
- Returned cached data only for network-related failures while preserving API errors such as invalid
  city names.
- Centralized colors, typography, and reusable widgets to keep the UI consistent.

---

## Project Structure

```text
lib
├── core
│   ├── cache
│   ├── constants
│   ├── di
│   ├── error
│   ├── network
│   ├── routes
│   ├── services
│   ├── theme
│   └── widgets
│
├── features
│   └── weather
│       ├── data
│       │   ├── datasources
│       │   ├── models
│       │   └── repositories
│       │
│       └── presentation
│           ├── providers
│           ├── screens
│           └── widgets
│
├── app.dart
└── main.dart
```

---

## Tech Stack

- Flutter
- Provider
- GetIt
- Dio
- SharedPreferences
- CachedNetworkImage

---

## API

This project uses **WeatherAPI** to retrieve current weather information.

**Endpoint**

```http
GET /v1/current.json
```

**Required Query Parameters**

| Parameter | Description |
|-----------|-------------|
| key       | API Key     |
| q         | City name   |

---

## Getting Started

Clone the repository:

```bash
git clone https://github.com/Mohamed-Ayman-Dev/weather_app.git
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

---

## Notes

This project was developed as a technical assessment.

For simplicity, the API key is included in the project. In production environments, API keys should
be managed securely through a backend service or another protected solution.

---

## Author

Mohamed Ayman

GitHub: https://github.com/Mohamed-Ayman-Dev