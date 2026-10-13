import 'package:flutter/material.dart';
import '../controllers/result_controller.dart';
import '../core/constants/app_strings.dart';
import '../models/scan_result.dart';
import '../widgets/common/loading_indicator.dart';
import '../widgets/result/ai_analysis_card.dart';
import '../widgets/result/result_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _controller = ResultController();
  ScanResult? _scan;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_scan == null) {
      _scan = ModalRoute.of(context)!.settings.arguments as ScanResult;
      _controller.analyze(_scan!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.scanResult)),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) => ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (_scan != null) ResultCard(scan: _scan!),
            if (_controller.loading) const SizedBox(height: 120, child: LoadingIndicator()),
            if (_controller.analysis != null)
              AiAnalysisCard(analysis: _controller.analysis!),
            if (_controller.error != null) Text(_controller.error!),
          ],
        ),
      ),
    );
  }
}
