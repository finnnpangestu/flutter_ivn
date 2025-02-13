# Flutter IVN

A Flutter project showcasing modern development practices using Clean Architecture principles. This project is built with Flutter 3.29.x and utilizes the latest packages to ensure scalability, maintainability, and testability.

## Features

- Implements Clean Architecture for better separation of concerns
- State management using flutter_bloc
- Dependency injection with injectable and get_it
- Network handling with Dio
- Custom and dynamic UI with Google Fonts and Flutter Spinkit
- Optimized image handling using CachedNetworkImage
- Pull-to-refresh functionality
- Extensive test coverage with mocktail, bloc_test, and mockito

## Project Structure

The project adheres to Clean Architecture principles, organized into clearly defined layers:

### Main Folder Structure

```plaintext
lib/
├── app/
│   ├── core/                # Core functionalities and utilities
│   │   ├── bloc/            # Global BLoC components
│   │   ├── error/           # Error handling utilities
│   │   ├── network/         # Network-related utilities
│   │   └── utils/           # General utility functions
│   ├── features/            # Application features, modularized by domain
│   │   ├── auth/            # Authentication feature
│   │   │   ├── data/        # Data sources and models
│   │   │   ├── domain/      # Business logic and use cases
│   │   │   └── presentation/ # UI components and widgets
│   │   ├── cart/            # Cart management feature
│   │   │   ├── data/
│   │   │   ├── domain/
│   │   │   └── presentation/
│   │   ├── dashboard/       # Dashboard feature
│   │   ├── main/            # Main app logic and initialization
│   │   └── product/         # Product management feature
│   │       ├── data/
│   │       ├── domain/
│   │       └── presentation/
│   ├── global/              # Global/shared resources
│   │   ├── model/           # Shared models
│   │   ├── state/           # Global states
│   │   └── widget/          # Shared widgets
│   └── router/              # App routing
│       ├── app_router.dart  # Router configuration
│       └── app_router.g.dart # Generated router file
├── injection_container.dart # Dependency injection setup
├── main.dart                # Entry point of the application

test/
├── features/
│   ├── auth/                # Tests for Authentication feature
│   │   ├── client/          # Client-related tests
│   │   └── controller/      # Controller-related tests
│   ├── product/             # Tests for Product feature
│       ├── client/          # Client-related tests
│       └── controller/      # Controller-related tests
```

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/finnnpangestu/flutter_ivn.git
   cd flutter_ivn
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Generate necessary files (e.g., for auto_route and freezed):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. Run the app:
   ```bash
   flutter run
   ```

## Dependencies

Below is a list of key dependencies used in this project:

- **State Management:** flutter_bloc
- **Dependency Injection:** get_it, injectable
- **Networking:** dio, http
- **UI Components:** google_fonts, flutter_spinkit, shimmer
- **Testing:** mocktail, bloc_test
- **Others:** auto_route, shared_preferences, cached_network_image

## Running Tests

1. Run all tests:
   ```bash
   flutter test
   ```

2. Test coverage includes:
   - Widget tests
   - Bloc and state management tests
   - API client tests


