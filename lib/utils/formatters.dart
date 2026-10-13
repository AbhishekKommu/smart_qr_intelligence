class Formatters {
  static String dateTime(DateTime d) =>
      '${d.year}-${_p(d.month)}-${_p(d.day)} ${_p(d.hour)}:${_p(d.minute)}';

  static String truncate(String s, [int max = 60]) =>
      s.length <= max ? s : '${s.substring(0, max)}...';

  static String _p(int n) => n.toString().padLeft(2, '0');
}
