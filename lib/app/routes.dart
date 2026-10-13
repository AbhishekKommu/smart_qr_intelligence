import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/scanner_screen.dart';
import '../screens/result_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings_screen.dart';

class AppRoutes {
  static const home = '/';
  static const scanner = '/scanner';
  static const result = '/result';
  static const history = '/history';
  static const settings = '/settings';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    scanner: (_) => const ScannerScreen(),
    result: (_) => const ResultScreen(),
    history: (_) => const HistoryScreen(),
    settings: (_) => const SettingsScreen(),
  };
}
