import 'package:flutter/foundation.dart';
import '../models/scan_result.dart';
import '../services/scanner_service.dart';

class ScannerController extends ChangeNotifier {
  final ScannerService _service;
  ScannerController({ScannerService? service}) : _service = service ?? ScannerService();

  ScanResult? lastResult;
  bool _handled = false;

  void onDetect(String rawValue) {
    if (_handled) return;
    _handled = true;
    lastResult = _service.buildResult(rawValue);
    notifyListeners();
  }

  void reset() {
    _handled = false;
    lastResult = null;
    notifyListeners();
  }
}
