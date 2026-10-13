import 'package:flutter/material.dart';
import '../app/routes.dart';
import '../controllers/history_controller.dart';
import '../core/constants/app_strings.dart';
import '../widgets/history/history_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _controller = HistoryController();

  @override
  void initState() {
    super.initState();
    _controller.load();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.history),
        actions: [
          IconButton(icon: const Icon(Icons.delete_outline), onPressed: _controller.clear),
        ],
      ),
      body: ListenableBuilder(
        listenable: _controller,
        builder: (context, _) {
          if (_controller.items.isEmpty) {
            return const Center(child: Text(AppStrings.noHistory));
          }
          return ListView.builder(
            itemCount: _controller.items.length,
            itemBuilder: (_, i) {
              final item = _controller.items[i];
              return HistoryTile(
                item: item,
                onTap: () =>
                    Navigator.pushNamed(context, AppRoutes.result, arguments: item.scan),
              );
            },
          );
        },
      ),
    );
  }
}
