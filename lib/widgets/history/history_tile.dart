import 'package:flutter/material.dart';
import '../../models/scan_history_item.dart';
import '../../utils/formatters.dart';

class HistoryTile extends StatelessWidget {
  final ScanHistoryItem item;
  final VoidCallback? onTap;
  const HistoryTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.history),
      title: Text(Formatters.truncate(item.scan.rawValue)),
      subtitle: Text(Formatters.dateTime(item.scan.scannedAt)),
      onTap: onTap,
    );
  }
}
