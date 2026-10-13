import 'package:flutter_test/flutter_test.dart';
import 'package:smart_qr_intelligence/core/enums/scan_type.dart';
import 'package:smart_qr_intelligence/models/scan_result.dart';

void main() {
  test('ScanResult JSON round trip', () {
    final r = ScanResult(rawValue: 'x', type: ScanType.text, scannedAt: DateTime(2026, 1, 1));
    final back = ScanResult.fromJson(r.toJson());
    expect(back.rawValue, 'x');
    expect(back.type, ScanType.text);
  });
}
