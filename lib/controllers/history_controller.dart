import 'package:flutter/foundation.dart';
import '../models/scan_history_item.dart';
import '../services/history_service.dart';

class HistoryController extends ChangeNotifier {
  final HistoryService _service;
  HistoryController({HistoryService? service}) : _service = service ?? HistoryService();

  List<ScanHistoryItem> items = [];

  Future<void> load() async {
    items = await _service.load();
    notifyListeners();
  }

  Future<void> clear() async {
    await _service.clear();
    items = [];
    notifyListeners();
  }
}
