import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants/api_keys.dart';
import '../core/constants/app_constants.dart';
import '../core/errors/app_exception.dart';
import '../models/ai_analysis.dart';
import '../models/scan_result.dart';

/// Sends scanned content to an LLM API for a safety/summary analysis.
/// Adjust the request/response shape to match your chosen provider.
class AiService {
  Future<AiAnalysis> analyze(ScanResult scan) async {
    if (ApiKeys.aiApiKey.isEmpty || ApiKeys.aiApiUrl.isEmpty) {
      throw const AppException('AI API is not configured. Check your .env file.');
    }
    final prompt = 'Analyze this QR code content (type: ${scan.type.name}). '
        'Reply ONLY with JSON: {"summary": string, "isSafe": bool, '
        '"riskScore": number 0-1, "warnings": [string]}.\n\n${scan.rawValue}';
    try {
      final response = await http
          .post(
            Uri.parse(ApiKeys.aiApiUrl),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ${ApiKeys.aiApiKey}',
            },
            body: jsonEncode({
              'model': ApiKeys.aiModel,
              'messages': [
                {'role': 'user', 'content': prompt}
              ],
            }),
          )
          .timeout(AppConstants.aiTimeout);
      if (response.statusCode != 200) {
        throw AppException('AI request failed (${response.statusCode})');
      }
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      // TODO: map to your provider's response format.
      final text = (body['content']?[0]?['text'] ?? '{}') as String;
      return AiAnalysis.fromJson(jsonDecode(text) as Map<String, dynamic>);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException('Could not analyze scan', e);
    }
  }
}
