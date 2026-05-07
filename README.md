# MeadowKart

A Flutter e-commerce application that displays products from the [Fake Store API](https://fakestoreapi.com), with cart management, favourites, product search, and checkout functionality. Built with clean architecture principles.

---

## Features

- **Splash Screen** — Animated splash with gradient background and auto-navigation
- **Product Listing** — Fetches and displays products from a remote API
- **Product Search** — Search products by title or category
- **Product Details** — View detailed product information with Hero animation transitions
- **Favourites** — Toggle favourite products, persisted locally via Hive
- **Shopping Cart** — Add, remove, increase/decrease quantities, persisted locally via Hive
- **Checkout** — Order summary view with cart details
- **Error Handling** — Centralized error handling with user-friendly messages for all HTTP status codes

---

## Architecture

The project follows **Clean Architecture** with clear separation of concerns across three layers:

```
lib/
├── main.dart                         # App entry point, Hive initialization
├── features/
│   ├── app.dart                      # MaterialApp with Riverpod + ScreenUtil
│   ├── splash/                       # Splash screen feature
│   ├── products/                     # Products feature
│   │   ├── data/
│   │   │   ├── datasource/
│   │   │   │   ├── product_remote_data_source/   # API calls (Dio)
│   │   │   │   └── product_local_data_source/     # Hive favourites storage
│   │   │   ├── model/
│   │   │   │   ├── product_model/                 # API response model (Freezed)
│   │   │   │   └── product_favourite_model/       # Hive favourite model
│   │   │   └── repository/
│   │   │       └── products_repository_impl.dart  # Repository implementation
│   │   ├── domain/
│   │   │   ├── entity/
│   │   │   │   └── product_entity.dart            # Domain entity (Freezed + Hive)
│   │   │   ├── repository/
│   │   │   │   └── products_repository.dart       # Repository contract
│   │   │   └── usecase/
│   │   │       └── fetch_products_usecase.dart    # Use case for fetching products
│   │   └── presentation/
│   │       ├── provider/
│   │       │   ├── fetch_products_provider.dart   # Async products state
│   │       │   ├── search_products_provider.dart  # Search filtering
│   │       │   └── favourite_provider.dart        # Favourites state (Hive)
│   │       ├── prodcuts_view.dart                 # Products listing screen
│   │       └── widget/
│   │           └── product_card.dart              # Product card widget
│   ├── product_details/              # Product details feature
│   │   └── presentation/
│   │       └── products_details_view.dart
│   ├── carts/                        # Cart feature
│   │   ├── data/
│   │   │   ├── model/cart_model/
│   │   │   │   └── cart_item_model.dart           # Cart item model (Freezed + Hive)
│   │   │   └── datasource/cart_local_datasource/  # Hive cart storage
│   │   └── presentation/
│   │       ├── provider/
│   │       │   └── cart_provider.dart             # Cart state management
│   │       ├── carts_view.dart                    # Cart screen
│   │       └── widget/
│   │           └── cart_item.dart                 # Cart item widget
│   └── checkout/                     # Checkout feature
│       └── presentation/
│           └── checkout_view.dart
└── core/
    ├── endpoints/
    │   └── api_endpoints.dart                     # API base URL & routes
    ├── network/
    │   ├── dio_client.dart                        # Dio instance with interceptors
    │   └── api_client.dart                        # GET/POST wrapper
    ├── failuer/
    │   ├── error_response/
    │   │   └── error_response.dart                # Error model (Freezed)
    │   └── failuer_handler/
    │       └── failuer_handler.dart               # Centralized error handler
    └── router/
        └── router_manager.dart                    # GoRouter configuration
```

### Layer Responsibilities

| Layer | Responsibility |
|---|---|
| **Presentation** | UI widgets + Riverpod providers (state management) |
| **Domain** | Entities, repository contracts, use cases |
| **Data** | Data sources (remote/local), models, repository implementations |

---

## Routing

Uses `go_router` with nested routes:

```
/ (Splash)
├── /productsView (Products List)
│   └── productDetailsPath (Product Details)
└── /cartPath (Cart)
    └── checkoutPath (Checkout)
```

---

## Tech Stack

| Category | Package |
|---|---|
| **State Management** | `flutter_riverpod` |
| **Navigation** | `go_router` |
| **Networking** | `dio` + `awesome_dio_interceptor` |
| **Local Storage** | `hive` + `hive_flutter` + `hive_generator` |
| **Code Generation** | `freezed` + `json_serializable` + `build_runner` |
| **Dependency Injection** | `get_it` + `injectable` |
| **Functional Programming** | `dartz` (Either for error handling) |
| **Responsive UI** | `flutter_screenutil` |
| **Notifications** | `toastification` |
| **Loading Animations** | `loading_animation_widget` |
| **Launcher Icons** | `flutter_launcher_icons` |

---

## Getting Started

### Prerequisites

- Flutter SDK `>=3.10.7`
- Dart SDK `>=3.10.7`

### Installation

```bash
# Clone the repository
git clone <repo-url>
cd meadowkart_task

# Install dependencies
flutter pub get

# Generate code (Freezed, Hive adapters, JSON serializers)
dart run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

### Build

```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

---

## API

The app uses the [Fake Store API](https://fakestoreapi.com):

| Endpoint | Method | Description |
|---|---|---|
| `/products` | GET | Fetch all products |

---

## Local Storage (Hive)

| Box Name | Type ID | Model | Purpose |
|---|---|---|---|
| `favourites` | 1 | `ProductFavouriteModel` | Persisted favourite product IDs |
| `carts` | 2 | `CartItemModel` | Persisted cart items with quantity |

Hive adapters are registered at startup in `main.dart`.

---

## Error Handling

All API errors flow through a centralized handler in `core/failuer/failuer_handler/failuer_handler.dart`:

- **DioException types** — connection timeout, send timeout, receive timeout, connection error, bad response, cancelled, unknown
- **HTTP status codes** — 400, 401, 403, 404, 408, 500, 502, 503 with user-friendly messages
- **SocketException** — no internet connection fallback

All repository methods return `Either<ErrorResponse, T>` using `dartz` for type-safe error handling.

---

## Code Generation

This project relies on code generation. Re-run after modifying models:

```bash
# One-time build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (auto-rebuild on changes)
dart run build_runner watch --delete-conflicting-outputs
```

Generated files use `.freezed.dart` and `.g.dart` extensions.

---

## Project Configuration

| File | Purpose |
|---|---|
| `pubspec.yaml` | Dependencies, assets, launcher icon config |
| `analysis_options.yaml` | Lint rules (`flutter_lints`) |
| `assets/launcher_icon.png` | App launcher icon source |

---

## Folder Structure Convention

Each feature follows the same structure:

```
feature_name/
├── data/
│   ├── datasource/     # Remote & local data sources
│   ├── model/          # Data models with serialization
│   └── repository/     # Repository implementations
├── domain/
│   ├── entity/         # Domain entities
│   ├── repository/     # Abstract repository contracts
│   └── usecase/        # Business logic use cases
└── presentation/
    ├── provider/       # Riverpod providers/notifiers
    ├── widget/         # Reusable UI widgets
    └── view.dart       # Screen widget
```

Shared utilities live under `core/` (networking, routing, error handling, endpoints).
