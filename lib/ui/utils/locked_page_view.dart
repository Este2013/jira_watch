import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NoWheelScrollBehavior extends MaterialScrollBehavior {
  const NoWheelScrollBehavior();

  // Don’t allow mouse/trackpad to act as drag devices here.
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.stylus,
  };

  // Belt-and-suspenders: also return NeverScrollable for any Scrollable inside.
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const NeverScrollableScrollPhysics();
}

class LockedPageView extends StatelessWidget {
  const LockedPageView({super.key, required this.controller, required this.children});
  final PageController controller;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => ScrollConfiguration(
    behavior: const NoWheelScrollBehavior(),
    child: Listener(
      // This prevents wheel and shift+wheel from being applied.
      behavior: HitTestBehavior.opaque,
      onPointerSignal: (event) {
        if (event is PointerScrollEvent) {
          // Do nothing -> absorb the signal so PageView doesn’t scroll.
        }
      },
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(), // blocks drags
        children: children,
      ),
    ),
  );
}
