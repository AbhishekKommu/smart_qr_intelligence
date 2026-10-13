import 'package:flutter/material.dart';
import '../utils/app_theme.dart';
import '../core/constants/app_strings.dart';
import 'routes.dart';

class SmartQrApp extends StatelessWidget {
  const SmartQrApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
