import 'package:flutter/material.dart';
import '../../models/ai_analysis.dart';

class AiAnalysisCard extends StatelessWidget {
  final AiAnalysis analysis;
  const AiAnalysisCard({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(analysis.isSafe ? Icons.verified : Icons.warning_amber,
                  color: analysis.isSafe ? Colors.green : Colors.orange),
              const SizedBox(width: 8),
              Text(analysis.isSafe ? 'Looks safe' : 'Potential risk',
                  style: Theme.of(context).textTheme.titleMedium),
            ]),
            const SizedBox(height: 8),
            Text(analysis.summary),
            for (final w in analysis.warnings) Text('• $w'),
          ],
        ),
      ),
    );
  }
}
