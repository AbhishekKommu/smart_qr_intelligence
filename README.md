# Smart QR Intelligence

A Flutter app that scans QR codes, classifies the content, and uses an AI service to summarize it and flag potential risks. Scan history is stored locally.

## Getting Started

1. Generate the platform folders (first time only):
   ```bash
   flutter create . --platforms=android,ios,web
   ```
2. Edit `.env` with your AI provider details.
3. Install and run:
   ```bash
   flutter pub get
   flutter run
   ```
4. Run tests:
   ```bash
   flutter test
   ```

## Structure

- `lib/app` - app widget and routes
- `lib/core` - constants, enums, errors
- `lib/models` - data models
- `lib/screens` - UI screens
- `lib/services` - scanning, parsing, storage, history, AI
- `lib/controllers` - state controllers
- `lib/widgets` - reusable widgets
- `lib/utils` - theme, validators, formatters, extensions

## Notes

- Camera permission is required (add the Android/iOS permission entries after `flutter create`; see the `mobile_scanner` docs).
- Adapt `lib/services/ai_service.dart` to your AI provider's request/response format.
