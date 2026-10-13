import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  final VoidCallback onPressed;
  const ScanButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: onPressed,
      icon: const Icon(Icons.qr_code_scanner),
      label: const Text('Scan'),
    );
  }
}
