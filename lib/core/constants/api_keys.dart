import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Keys are loaded from the .env file (never commit real keys).
class ApiKeys {
  static String get aiApiKey => dotenv.env['AI_API_KEY'] ?? '';
  static String get aiApiUrl => dotenv.env['AI_API_URL'] ?? '';
  static String get aiModel => dotenv.env['AI_MODEL'] ?? '';
}
