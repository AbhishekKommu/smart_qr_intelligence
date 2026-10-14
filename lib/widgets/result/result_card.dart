import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/enums/scan_type.dart';
import '../../models/scan_result.dart';

class ResultCard extends StatelessWidget {
  final ScanResult scan;
  const ResultCard({super.key, required this.scan});

  /// Returns a launchable Uri if the scanned value is a link, email or phone.
  Uri? _toUri() {
    final v = scan.rawValue.trim();
    if (v.isEmpty) return null;

    switch (scan.type) {
      case ScanType.url:
      case ScanType.email:
      case ScanType.phone:
      case ScanType.sms:
      case ScanType.geo:
        return Uri.tryParse(v);
      default:
        // Handles "www.google.com" or "google.com" scanned as plain text
        final looksLikeDomain =
            RegExp(r'^(www\.)?[a-z0-9-]+(\.[a-z0-9-]+)+(/\S*)?$', caseSensitive: false)
                .hasMatch(v);
        return looksLikeDomain ? Uri.tryParse('https://$v') : null;
    }
  }

  void _toast(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(msg)));
  }

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: scan.rawValue));
    if (context.mounted) _toast(context, 'Copied to clipboard');
  }

  Future<void> _open(BuildContext context, Uri uri) async {
    try {
      final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (!ok && context.mounted) _toast(context, 'Could not open link');
    } catch (_) {
      if (context.mounted) _toast(context, 'Could not open link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final uri = _toUri();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.qr_code_2),
              const SizedBox(width: 8),
              Text(scan.type.name.toUpperCase(),
                  style: Theme.of(context).textTheme.titleMedium),
            ]),
            const SizedBox(height: 12),
            InkWell(
              onTap: uri == null ? null : () => _open(context, uri),
              child: Text(
                scan.rawValue,
                style: TextStyle(
                  color: uri == null ? null : Theme.of(context).colorScheme.primary,
                  decoration: uri == null ? null : TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(spacing: 8, children: [
              if (uri != null)
                FilledButton.icon(
                  onPressed: () => _open(context, uri),
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('Open'),
                ),
              OutlinedButton.icon(
                onPressed: () => _copy(context),
                icon: const Icon(Icons.copy),
                label: const Text('Copy'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}