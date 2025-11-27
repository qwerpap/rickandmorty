# Rick and Morty

Flutter приложение для просмотра списка персонажей из сериала "Rick and Morty" с использованием Rick and Morty API.

## Описание проекта

Приложение реализует функционал просмотра персонажей с возможностью:
- Просмотра списка персонажей с пагинацией
- Просмотра детальной информации о персонаже
- Добавления персонажей в избранное
- Сортировки избранных персонажей
- Переключения между светлой и темной темой
- Сохранения данных в локальной базе данных

Проект построен на принципах Clean Architecture с разделением на слои: data, domain, presentation.

## Версии

- **Flutter**: 3.35.6
- **Dart**: 3.9.2
- **SDK**: ^3.7.2

## Зависимости

### Основные зависимости:
- `flutter_bloc: ^9.1.1` - управление состоянием
- `go_router: ^15.1.2` - навигация
- `dio: ^5.8.0+1` - HTTP клиент
- `drift: ^2.26.1` - локальная база данных
- `get_it: ^9.1.1` - dependency injection
- `equatable: ^2.0.7` - сравнение объектов
- `shared_preferences: ^2.5.3` - локальное хранилище
- `path_provider: ^2.1.5` - пути к файлам
- `flutter_svg: ^2.1.0` - работа с SVG
- `liquid_glass_renderer: ^0.2.0-dev.4` - эффекты стекла для UI

### Dev зависимости:
- `flutter_lints: ^5.0.0` - линтер
- `drift_dev: ^2.26.1` - генерация кода для Drift
- `build_runner: ^2.4.15` - генератор кода

## Инструкция по сборке и запуску

### Предварительные требования

1. Установите Flutter SDK версии 3.35.6 или выше
2. Убедитесь, что у вас установлены:
   - Android Studio / Xcode (для мобильной разработки)
   - VS Code или Android Studio с Flutter плагином

### Установка зависимостей

```bash
flutter pub get
```

### Генерация кода

Для генерации кода базы данных Drift выполните:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Запуск приложения

#### Для Android:
```bash
flutter run
```

#### Для iOS:
```bash
flutter run
```

#### Для веб:
```bash
flutter run -d chrome
```

### Сборка релизной версии

#### Android APK:
```bash
flutter build apk --release
```

#### Android App Bundle:
```bash
flutter build appbundle --release
```

#### iOS:
```bash
flutter build ios --release
```

## Структура проекта

```
lib/
├── core/                    # Общая функциональность
│   ├── bloc/               # Регистрация блоков
│   ├── di/                 # Dependency injection
│   ├── navigation/         # Навигация
│   └── theme/              # Темизация
├── features/               # Функциональные модули
│   ├── main_screen/        # Главный экран со списком персонажей
│   ├── hero_details_screen/# Экран деталей персонажа
│   ├── favorite_screen/    # Экран избранного
│   └── profile_screen/     # Экран профиля
└── main.dart              # Точка входа
```

## API

Приложение использует [Rick and Morty API](https://rickandmortyapi.com/) для получения данных о персонажах.
