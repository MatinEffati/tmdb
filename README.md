# TMDB Flutter App

A Flutter application that uses **The Movie Database (TMDB) API** to display movie lists, search movies, show movie details, and manage favorites. The app follows **Clean Architecture** principles to ensure scalability, maintainability, and testability.

---

## Architecture

This project is structured based on **Clean Architecture**:

- **Presentation Layer**: Handles UI and user interaction. Uses **Bloc** for reactive state management.
- **Domain Layer**: Contains the core business logic and abstractions. Independent of external packages.
- **Data Layer**: Manages data sources such as **TMDB API** via **Dio** and local storage via **Hive**.

---

## Technical Decisions

- **Bloc / flutter_bloc**: For predictable and testable state management. Bloc is widely recommended for large-scale apps.
- **Dio**: A powerful HTTP client with interceptors and easy error handling.
- **Pretty Dio Logger**: For clear logging of network requests during development.
- **GetIt**: For dependency injection and better management of service objects.
- **Hive & hive_flutter**: Lightweight, fast local database for caching and storing favorites.
- **Equatable**: Simplifies comparison of objects in Bloc states/events.
- **Cached Network Image & Shimmer**: Improves UX by caching images and showing placeholders while loading.
- **Lottie & flutter_svg**: For better animations and SVG rendering.

---

## Features

- Movie list (popular movies)
- Movie search
- Movie details
- Favorites list with local storage

---

## How to Run

> ⚠️ Note: Running Flutter projects in Iran is challenging due to restrictions. You might face difficulties with SDK downloads and dependency management.

1. Install **Android Studio** and **Flutter SDK**.
2. Set up an **Android Emulator**.
3. Open the project in Android Studio.
4. Run `flutter pub get` to install dependencies.
5. Generate Hive adapters:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
6. Start the emulator.
7. Click the Run button in Android Studio while the emulator is running.


## Notes

- The project uses Clean Architecture to separate concerns and improve testability.

- All network requests go through Dio, and responses are cached locally using Hive.

- Bloc provides reactive state management for smooth UI updates.

- Running the project in Iran may require extra steps due to restrictions on package downloads and emulator setup.
