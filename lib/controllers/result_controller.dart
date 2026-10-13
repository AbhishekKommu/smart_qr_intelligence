import 'package:flutter/foundation.dart';
import '../models/ai_analysis.dart';
import '../models/scan_history_item.dart';
import '../models/scan_result.dart';
import '../services/ai_service.dart';
import '../services/history_service.dart';

class ResultController extends ChangeNotifier {
  final AiService _ai;
  final HistoryService _history;
  ResultController({AiService? ai, HistoryService? history})
      : _ai = ai ?? AiService(),
        _history = history ?? HistoryService();

  AiAnalysis? analysis;
  String? error;
  bool loading = false;

  Future<void> analyze(ScanResult scan) async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      analysis = await _ai.analyze(scan);
    } catch (e) {
      error = e.toString();
    }
    await _history.add(ScanHistoryItem(
      id: scan.scannedAt.microsecondsSinceEpoch.toString(),
      scan: scan,
      analysis: analysis,
    ));
    loading = false;
    notifyListeners();
  }
}
