import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../core/constants/app_strings.dart';
import '../widgets/common/scan_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.history),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, AppRoutes.settings),
          ),
        ],
      ),
      body: const Center(child: Text('Scan a QR code to get started')),
      floatingActionButton:
          ScanButton(onPressed: () => Navigator.pushNamed(context, AppRoutes.scanner)),
    );
  }
}
