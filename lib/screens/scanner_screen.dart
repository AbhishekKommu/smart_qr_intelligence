import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../app/routes.dart';
import '../controllers/scanner_controller.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final _controller = ScannerController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final result = _controller.lastResult;
      if (result != null && mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.result, arguments: result);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan QR')),
      body: MobileScanner(
        onDetect: (capture) {
          final value = capture.barcodes.firstOrNull?.rawValue;
          if (value != null) _controller.onDetect(value);
        },
      ),
    );
  }
}
