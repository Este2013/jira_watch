import 'package:flutter/material.dart';

class MorphingFilledTonalButton extends StatelessWidget {
  const MorphingFilledTonalButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    required this.showAsFilled,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.padding,
    this.borderRadius,
  });

  final VoidCallback? onPressed;
  final Widget label;
  final Widget? icon;
  final bool showAsFilled;

  /// Animation tuning
  final Duration duration;
  final Curve curve;

  /// Optional tweaks
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    // Define the two endpoint styles (Filled vs Tonal).
    final filled = FilledButton.styleFrom(
      backgroundColor: scheme.primary,
      foregroundColor: scheme.onPrimary,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
    );

    final tonal = FilledButton.styleFrom(
      backgroundColor: scheme.secondaryContainer,
      foregroundColor: scheme.onSecondaryContainer,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
      ),
    );

    // t=0 => filled, t=1 => tonal
    final targetT = showAsFilled ? 0.0 : 1.0;

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(end: targetT),
      duration: duration,
      curve: curve,
      builder: (context, t, _) {
        final style = ButtonStyle.lerp(filled, tonal, t);

        // Keep icon layout consistent with Material defaults.
        if (icon != null) {
          return FilledButton.icon(
            onPressed: onPressed,
            style: style,
            icon: icon!,
            label: label,
          );
        }

        return FilledButton(
          onPressed: onPressed,
          style: style,
          child: label,
        );
      },
    );
  }
}
