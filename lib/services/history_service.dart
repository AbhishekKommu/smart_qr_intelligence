import 'dart:convert';
import '../core/constants/app_constants.dart';
import '../models/scan_history_item.dart';
import 'storage_service.dart';

class HistoryService {
  final StorageService _storage;
  HistoryService({StorageService? storage}) : _storage = storage ?? StorageService();

  Future<List<ScanHistoryItem>> load() async {
    final raw = await _storage.getString(AppConstants.historyStorageKey);
    if (raw == null) return [];
    final list = jsonDecode(raw) as List;
    return list
        .map((e) => ScanHistoryItem.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> add(ScanHistoryItem item) async {
    final items = await load();
    items.insert(0, item);
    if (items.length > AppConstants.maxHistoryItems) {
      items.removeRange(AppConstants.maxHistoryItems, items.length);
    }
    await _save(items);
  }

  Future<void> clear() => _storage.remove(AppConstants.historyStorageKey);

  Future<void> _save(List<ScanHistoryItem> items) => _storage.setString(
        AppConstants.historyStorageKey,
        jsonEncode(items.map((e) => e.toJson()).toList()),
      );
}
