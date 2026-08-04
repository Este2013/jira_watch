/// Byte sizes for display.
///
/// Two shapes because two contexts want different things: a progress readout
/// benefits from a decimal so it visibly moves, while a dense list reads better
/// without one.

/// `1.5 MB` — for progress and single-file sizes, where movement matters.
String formatBytes(int? value) {
  if (value == null) return '';
  if (value < 1024) return '$value B';
  if (value < 1024 * 1024) return '${(value / 1024).toStringAsFixed(1)} KB';
  if (value < 1024 * 1024 * 1024) return '${(value / (1024 * 1024)).toStringAsFixed(1)} MB';
  return '${(value / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
}

/// `2 MB` — for list rows, where a column of decimals is noise.
String formatBytesCompact(int? value) {
  if (value == null) return '';
  if (value < 1024) return '$value B';
  if (value < 1024 * 1024) return '${(value / 1024).toStringAsFixed(0)} KB';
  if (value < 1024 * 1024 * 1024) return '${(value / (1024 * 1024)).toStringAsFixed(1)} MB';
  return '${(value / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
}
