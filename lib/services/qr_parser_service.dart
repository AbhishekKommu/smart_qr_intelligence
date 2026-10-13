import '../core/enums/scan_type.dart';

class QrParserService {
  ScanType detectType(String value) {
    final v = value.trim().toLowerCase();
    if (v.startsWith('http://') || v.startsWith('https://')) return ScanType.url;
    if (v.startsWith('mailto:')) return ScanType.email;
    if (v.startsWith('tel:')) return ScanType.phone;
    if (v.startsWith('smsto:') || v.startsWith('sms:')) return ScanType.sms;
    if (v.startsWith('wifi:')) return ScanType.wifi;
    if (v.startsWith('begin:vcard')) return ScanType.contact;
    if (v.startsWith('geo:')) return ScanType.geo;
    return v.isEmpty ? ScanType.unknown : ScanType.text;
  }
}
