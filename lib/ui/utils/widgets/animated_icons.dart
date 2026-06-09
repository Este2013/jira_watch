import 'package:flutter/material.dart';

class IconFilledOnSelection extends StatelessWidget {
  const IconFilledOnSelection(this.icon, {super.key, required this.isSelected});

  final bool isSelected;
  final Widget icon;

  @override
  Widget build(BuildContext context) => TweenAnimationBuilder<double>(
    tween: Tween(begin: isSelected ? 0 : 1, end: isSelected ? 1 : 0),
    duration: Durations.medium1,
    builder: (context, fill, child) => IconTheme(
      data: IconTheme.of(context).copyWith(fill: fill),
      child: icon,
    ),
  );
}
