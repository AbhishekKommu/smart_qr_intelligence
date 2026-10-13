import 'package:flutter/material.dart';
import '../../models/scan_result.dart';

class ResultCard extends StatelessWidget {
  final ScanResult scan;
  const ResultCard({super.key, required this.scan});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.qr_code_2),
        title: Text(scan.type.name.toUpperCase()),
        subtitle: SelectableText(scan.rawValue),
      ),
    );
  }
}
