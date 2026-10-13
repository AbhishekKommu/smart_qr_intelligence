import 'scan_result.dart';
import 'ai_analysis.dart';

class ScanHistoryItem {
  final String id;
  final ScanResult scan;
  final AiAnalysis? analysis;

  const ScanHistoryItem({required this.id, required this.scan, this.analysis});

  Map<String, dynamic> toJson() => {
        'id': id,
        'scan': scan.toJson(),
        'analysis': analysis?.toJson(),
      };

  factory ScanHistoryItem.fromJson(Map<String, dynamic> json) => ScanHistoryItem(
        id: json['id'] as String,
        scan: ScanResult.fromJson(json['scan'] as Map<String, dynamic>),
        analysis: json['analysis'] == null
            ? null
            : AiAnalysis.fromJson(json['analysis'] as Map<String, dynamic>),
      );
}
