class AiAnalysis {
  final String summary;
  final bool isSafe;
  final double riskScore; // 0.0 (safe) - 1.0 (dangerous)
  final List<String> warnings;

  const AiAnalysis({
    required this.summary,
    required this.isSafe,
    required this.riskScore,
    this.warnings = const [],
  });

  Map<String, dynamic> toJson() => {
        'summary': summary,
        'isSafe': isSafe,
        'riskScore': riskScore,
        'warnings': warnings,
      };

  factory AiAnalysis.fromJson(Map<String, dynamic> json) => AiAnalysis(
        summary: json['summary'] as String? ?? '',
        isSafe: json['isSafe'] as bool? ?? true,
        riskScore: (json['riskScore'] as num?)?.toDouble() ?? 0.0,
        warnings: List<String>.from(json['warnings'] ?? const []),
      );
}
