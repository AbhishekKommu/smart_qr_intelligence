import '../core/enums/scan_type.dart';

class ScanResult {
  final String rawValue;
  final ScanType type;
  final DateTime scannedAt;

  const ScanResult({
    required this.rawValue,
    required this.type,
    required this.scannedAt,
  });

  Map<String, dynamic> toJson() => {
        'rawValue': rawValue,
        'type': type.name,
        'scannedAt': scannedAt.toIso8601String(),
      };

  factory ScanResult.fromJson(Map<String, dynamic> json) => ScanResult(
        rawValue: json['rawValue'] as String,
        type: ScanType.values.byName(json['type'] as String),
        scannedAt: DateTime.parse(json['scannedAt'] as String),
      );
}
