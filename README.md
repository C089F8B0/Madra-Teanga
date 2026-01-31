# Madra Teanga (Pre-Development)

> [!WARNING]
> **Pre-Development Status**: This project is currently being set up.
> **English Reference**: This branch serves as the English reference implementation to provide bilingual support for the repository.

**Madra Teanga** is the open-source successor to [sionnach.app](https://sionnach.app).
Visit the official site: [madrateanga.com](https://madrateanga.com/)

## Architecture

This project uses **Draíocht**, a new Clojure-Dart based DSL for Flutter, allowing mobile app development in the Irish language.

## Getting Started

See [Documentation](documentation/setup.md) for detailed setup instructions.

### Quick Start
1.  Install [Clojure](https://clojure.org/guides/install_clojure) and [Flutter](https://docs.flutter.dev/get-started/install).
2.  `flutter pub get`
3.  `clj -M:cljd flutter run`

## Lesson Creation

This repository contains the source code for **Madra Teanga**, an open-source Irish language learning application.
It demonstrates the use of **Draíocht** for building cross-platform apps in Irish.

You can modify the lessons by editing `assets/deck.json` and adding audio files.
See the [Lesson Creation Guide](documentation/lesson_creation.md) for details.

## Documentation
- [Architecture (Re-Dash)](documentation/redash_architecture.md)
- [Audio System](documentation/audio_system.md)
- [Lesson Creation Guide](documentation/lesson_creation.md)
