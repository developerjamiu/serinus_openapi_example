# StackTrack API

A developer portfolio API built with [Serinus](https://serinus.app) framework, featuring OpenAPI integration and SQLite database support. This application demonstrates a clean architecture pattern with controllers, services, DTOs, and database layers.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [API Documentation](#api-documentation)
- [Database Schema](#database-schema)
- [Development](#development)
- [Deployment](#deployment)
- [Resources](#resources)

## 🎯 Overview

StackTrack API is a RESTful API for managing developer portfolios, allowing you to track skills and projects. The application is built using Serinus 2.0, a modern Dart web framework, and follows best practices for API development with OpenAPI specification support.

## ✨ Features

- **RESTful API** - Full CRUD operations for Skills and Projects
- **OpenAPI Integration** - Automatic OpenAPI 3.0 specification generation
- **Type-Safe Database** - SQLite database with Drift ORM
- **Request Validation** - Schema-based validation using Acanthis
- **Dependency Injection** - Built-in DI container from Serinus
- **Static File Serving** - Serve static files from the `public` directory
- **Clean Architecture** - Separation of concerns with controllers, services, and DTOs

## 🛠 Tech Stack

- **Framework**: [Serinus](https://serinus.app) ^2.0.1
- **OpenAPI**: [serinus_openapi](https://pub.dev/packages/serinus_openapi) ^1.0.11
- **Database**: [Drift](https://drift.simonbinder.eu/) ^2.29.0 (SQLite)
- **Validation**: [Acanthis](https://pub.dev/packages/acanthis) ^1.4.6
- **Language**: Dart 3.9.0+

## 📁 Project Structure

```
lib/
├── app_module.dart              # Main application module with DI configuration
├── serinus_openapi_example.dart # Application entry point
├── model_provider.dart          # JSON serialization/deserialization provider
├── controllers/                 # HTTP request handlers
│   ├── projects_controller.dart
│   └── skills_controller.dart
├── services/                    # Business logic layer
│   ├── database_service.dart
│   ├── projects_service.dart
│   └── skills_service.dart
├── dtos/                        # Data Transfer Objects
│   ├── create_project_dto.dart
│   ├── create_skill_dto.dart
│   ├── project_response.dart
│   ├── skill_response.dart
│   ├── update_project_dto.dart
│   └── update_skill_dto.dart
└── database/                    # Database configuration
    ├── database.dart
    ├── database.g.dart          # Generated Drift code
    └── tables.dart              # Database table definitions

public/
└── openapi.yaml                 # Generated OpenAPI specification
```

## 🚀 Getting Started

### Prerequisites

- [Dart SDK](https://dart.dev/get-dart) version 3.9.0 or higher
- Dart CLI tools

### Installation

1. **Clone the repository** (if applicable) or navigate to the project directory

2. **Install dependencies**

```bash
dart pub get
```

3. **Generate database code** (if needed)

```bash
dart run build_runner build
```

4. **Run the application**

```bash
serinus run
```

The application will start on `http://localhost:8080` by default. You can change the port by setting the `PORT` environment variable.

### Environment Variables

- `PORT` - Server port (default: 8080)
- `GLOBE` - Set to `1` to disable OpenAPI analysis (useful for production)

## 📚 API Documentation

Complete API documentation is available at:

**https://skill-vault.globeapp.dev/openapi**

The OpenAPI specification provides detailed information about all available endpoints, request/response schemas, and validation rules.

## 🗄 Database Schema

The application uses SQLite with Drift ORM. The database file is stored as `smug-kinase.db` in the project root.

### Skills Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | INTEGER | PRIMARY KEY, AUTO_INCREMENT |
| name | TEXT | NOT NULL, Length: 1-50 |
| yearsOfExperience | INTEGER | NOT NULL |
| category | TEXT | NOT NULL |

### Projects Table

| Column | Type | Constraints |
|--------|------|-------------|
| id | INTEGER | PRIMARY KEY, AUTO_INCREMENT |
| title | TEXT | NOT NULL, Length: 1-100 |
| description | TEXT | NOT NULL |
| url | TEXT | NOT NULL |

## 💻 Development

### Code Generation

When you modify database tables, regenerate the code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Adding New Endpoints

1. **Create DTOs** in `lib/dtos/` for request/response models
2. **Add service methods** in `lib/services/` for business logic
3. **Create controller** in `lib/controllers/` to handle HTTP requests
4. **Register controller** in `lib/app_module.dart`
5. **Update model provider** in `lib/model_provider.dart` if needed
6. **Update OpenAPI spec** in `public/openapi.yaml` (or let it auto-generate)

### Project Architecture

The application follows a layered architecture:

1. **Controllers** - Handle HTTP requests and responses
2. **Services** - Contain business logic and database operations
3. **DTOs** - Define data structures for API communication
4. **Database** - Data persistence layer using Drift

### Dependency Injection

Services are registered in `AppModule` using Serinus's dependency injection:

- `DatabaseService` - Singleton database connection
- `ProjectsService` - Composed with `DatabaseService` dependency
- `SkillsService` - Composed with `DatabaseService` dependency

## 🚢 Deployment

### Deploy to Globe

This application is configured for deployment on [Globe](https://globeapp.dev). To deploy:

```bash
globe deploy
```

The application will be available at your Globe deployment URL (e.g., `skill-vault.globeapp.dev`).

### Production Notes

- The `GLOBE=1` environment variable is automatically set by Globe to disable OpenAPI analysis
- Database persistence is handled automatically by Globe
- HTTPS is enabled by default on Globe deployments

## 📖 Resources

- [Serinus Documentation](https://serinus.app/introduction.html) - Learn more about the Serinus framework
- [Serinus Discord Server](https://discord.gg/zydgnJ3ksJ) - Get help and support from the community
- [Drift Documentation](https://drift.simonbinder.eu/) - Database ORM documentation
- [Dart Documentation](https://dart.dev/) - Dart language reference

## 🤝 Support

Serinus is an MIT licensed open-source project. If you want to support the project, read more [here](https://serinus.app/support.html).

## 📝 License

This project is open source and available under the MIT License.
