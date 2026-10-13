import '../models/scan_result.dart';
import 'qr_parser_service.dart';

class ScannerService {
  final QrParserService _parser;
  ScannerService({QrParserService? parser}) : _parser = parser ?? QrParserService();

  ScanResult buildResult(String rawValue) => ScanResult(
        rawValue: rawValue,
        type: _parser.detectType(rawValue),
        scannedAt: DateTime.now(),
      );
}
