import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CollapsibleSidePaneController extends ChangeNotifier {
  CollapsibleSidePaneController({state = true}) {
    _state = state;
  }

  late bool _state;
  bool get state => _state;

  void expand() {
    if (_state == true) return;
    _state = true;
    notifyListeners();
  }

  void collapse() {
    if (_state == false) return;
    _state = false;
    notifyListeners();
  }

  void toggle({bool? newState}) {
    if (newState == null) {
      if (_state) {
        collapse();
      } else {
        expand();
      }
      return;
    }
    if (newState) {
      expand();
    } else {
      collapse();
    }
  }
}

class CollapsibleSidePane extends StatefulWidget {
  const CollapsibleSidePane({
    super.key,
    required this.left,
    required this.right,
    this.controller,
    this.leftWidth = 320,
    this.breakpoint = 900,
    this.animationDuration = const Duration(milliseconds: 250),
    this.animationCurve = Curves.easeInOut,
    this.fabIcon = Icons.menu,
    this.fabTooltip = 'Open panel',
  });

  final Widget left;
  final Widget right;

  final double leftWidth;
  final double breakpoint;

  final Duration animationDuration;
  final Curve animationCurve;

  final IconData fabIcon;
  final String fabTooltip;

  final CollapsibleSidePaneController? controller;

  @override
  State<CollapsibleSidePane> createState() => _CollapsibleSidePaneState();
}

class _CollapsibleSidePaneState extends State<CollapsibleSidePane> {
  late CollapsibleSidePaneController controller;

  double? previousFrameWidth;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? CollapsibleSidePaneController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final bool isNarrow = constraints.maxWidth < widget.breakpoint;
            ServicesBinding.instance.addPostFrameCallback((_) {
              if (previousFrameWidth == null) {
                controller.toggle(newState: !isNarrow);
                setState(() {
                  previousFrameWidth = constraints.maxWidth;
                });
              }
            });
            final double targetWidth = controller.state ? widget.leftWidth : 0;
            // If the state of isNarrow did not change, then apply startWidth, cause change was manually requested
            // Otherwise, set it to targetWidth to avoid a unrequested transition
            final double startWidth = (previousFrameWidth ?? constraints.maxWidth > widget.breakpoint) != (constraints.maxWidth > widget.breakpoint) ? (controller.state ? 0 : widget.leftWidth) : targetWidth;

            var tweenAnimationBuilder = TweenAnimationBuilder<double>(
              key: Key('animatedPanel'),
              tween: Tween<double>(
                begin: startWidth,
                end: targetWidth,
              ),
              duration: widget.animationDuration,
              curve: widget.animationCurve,
              builder: (context, w, _) {
                // Only show the heavy/overflow-prone widget when the pane is essentially open.
                final bool showLeft = w > widget.leftWidth * 0.98;

                return Row(
                  mainAxisSize: .min,
                  children: [
                    SizedBox(
                      width: w,
                      child: ClipRect(
                        child: showLeft ? widget.left : const SizedBox.shrink(),
                      ),
                    ),
                    if (w > 8) const VerticalDivider(width: 1),
                  ],
                );
              },
            );

            if (isNarrow) {
              return Stack(
                children: [
                  Positioned.fill(child: widget.right),
                  if (controller.state)
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          controller.collapse();
                        },
                        child: Container(color: Colors.black.withAlpha(100)),
                      ),
                    ),
                  Positioned.fill(
                    left: 0,
                    child: Align(
                      alignment: .centerLeft,
                      child: Material(child: tweenAnimationBuilder),
                    ),
                  ),
                ],
              );
            }
            return Row(
              children: [
                tweenAnimationBuilder,
                Expanded(child: widget.right),
              ],
            );
          },
        );
      },
    );
  }
}
