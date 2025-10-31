import 'package:flutter/material.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) =>
      '${leadingHashSign ? '#' : ''}'
      '${(a * 255).round().toRadixString(16).padLeft(2, '0')}'
      '${(r * 255).round().toRadixString(16).padLeft(2, '0')}'
      '${(g * 255).round().toRadixString(16).padLeft(2, '0')}'
      '${(b * 255).round().toRadixString(16).padLeft(2, '0')}';
}

extension ColorDarkMode on Color {
  /// Converts a light-mode color to a dark-mode equivalent,
  /// preserving hue and saturation but darkening it so that
  /// white text contrasts well.
  Color toDarkMode() {
    final hsl = HSLColor.fromColor(this);
    // We keep hue and saturation, but adjust lightness.
    // Light colors become darker, medium colors are fine-tuned.
    double newLightness = hsl.lightness;
    if (newLightness > 0.7) {
      newLightness = 0.3; // very light colors → darkened significantly
    } else if (newLightness > 0.5) {
      newLightness = 0.25;
    } else if (newLightness > 0.3) {
      newLightness = 0.2;
    } else {
      newLightness = 0.15; // already dark — keep it fairly dark
    }
    return hsl.withLightness(newLightness.clamp(0.0, 1.0)).toColor();
  }
}
