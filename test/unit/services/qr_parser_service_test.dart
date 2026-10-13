import 'package:flutter_test/flutter_test.dart';
import 'package:smart_qr_intelligence/core/enums/scan_type.dart';
import 'package:smart_qr_intelligence/services/qr_parser_service.dart';

void main() {
  final parser = QrParserService();

  test('detects url', () => expect(parser.detectType('https://example.com'), ScanType.url));
  test('detects email', () => expect(parser.detectType('mailto:a@b.com'), ScanType.email));
  test('detects text', () => expect(parser.detectType('hello'), ScanType.text));
}
