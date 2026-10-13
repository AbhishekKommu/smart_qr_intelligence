class Validators {
  static bool isUrl(String v) {
    final uri = Uri.tryParse(v.trim());
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https') && uri.host.isNotEmpty;
  }

  static bool isEmail(String v) =>
      RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$').hasMatch(v.trim());

  static bool isPhone(String v) => RegExp(r'^\+?[0-9\s-]{7,15}$').hasMatch(v.trim());
}
