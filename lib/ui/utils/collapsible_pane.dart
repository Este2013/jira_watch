import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Tracks whether a [CollapsibleSidePane]'s left pane is expanded.
///
/// A resize across the narrow/wide breakpoint is not the same thing as the
/// user asking for the pane to open or close, so this remembers the user's
/// actual intent separately from [state] (which is just "is it visible right
/// now"):
///
/// - Starting wide: expanded, per [state]'s default.
/// - Narrowing: [state] collapses (the drawer starts closed), but the intent
///   from before the narrowing is kept.
/// - Widening again: if the drawer happens to already be open at that
///   moment, it stays open (and that becomes the new intent). Otherwise the
///   kept intent is restored — including on the very first time the app
///   happens to start narrow and then widens, since the initial intent is
///   "expanded".
class CollapsibleSidePaneController extends ChangeNotifier {
  CollapsibleSidePaneController({bool state = true}) : _state = state, _wideIntent = state;

  bool _state;
  bool get state => _state;

  /// The expand state to restore the next time the pane widens, assuming the
  /// drawer is not already open at that moment. Kept in sync with [_state]
  /// by [_setState] itself, for as long as the last known layout is wide —
  /// covering both a direct [expand]/[collapse] call and the "narrow -> wide"
  /// restoration in [reportLayoutMode] with the same logic.
  bool _wideIntent;

  /// Whether the last layout report was narrow — null before the first one.
  bool? _isNarrow;

  void expand() => _setState(true);

  void collapse() => _setState(false);

  void toggle({bool? newState}) => _setState(newState ?? !_state);

  void _setState(bool value) {
    final changed = _state != value;
    _state = value;
    // Synced unconditionally while wide, not just when value actually
    // changes: a no-op call (e.g. reportLayoutMode confirming the already-
    // current state right after widening) still needs to leave the intent
    // matching reality, or a later narrow/wide cycle could restore a stale
    // value instead of what was actually last true while wide.
    if (_isNarrow == false) _wideIntent = value;
    if (changed) notifyListeners();
  }

  /// Called by [CollapsibleSidePane] on every layout pass with the current
  /// narrow/wide verdict, so this controller — not the pane — owns deciding
  /// what happens across a breakpoint crossing.
  void reportLayoutMode(bool isNarrow) {
    final previouslyNarrow = _isNarrow;
    _isNarrow = isNarrow;

    if (previouslyNarrow == null) {
      // First layout ever: start expanded when wide, drawer closed when
      // narrow. _wideIntent already defaults to the constructor's state, so
      // narrowing first and widening later still restores it correctly.
      _setState(!isNarrow);
      return;
    }

    if (isNarrow) {
      // Wide -> narrow: drawer starts closed. _wideIntent is deliberately
      // left untouched, so it still remembers what it was.
      if (!previouslyNarrow) _setState(false);
      return;
    }

    if (previouslyNarrow) {
      // Narrow -> wide: if the drawer happened to already be open at this
      // exact moment, keep it open. Otherwise restore the kept intent.
      // _setState syncs _wideIntent to match once _state actually changes.
      _setState(_state ? true : _wideIntent);
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
    this.fabIcon = Symbols.menu,
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

  /// Whether the pane was narrow the last time this built — null before the
  /// first frame. Used only to decide whether this frame's width change is a
  /// breakpoint crossing (snap straight to the target, no slide) or a
  /// same-mode toggle (animate the slide) — a real narrow/wide/[bool]
  /// comparison, unlike the raw-width comparison this replaced, which
  /// compared a `double?` against a `bool` and so was always unequal after
  /// the first frame, animating a full slide on every single rebuild.
  bool? _lastIsNarrow;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? CollapsibleSidePaneController();
    // A Focus/CallbackShortcuts-based binding for Ctrl+B turned out to
    // depend on *something* inside this subtree always holding keyboard
    // focus — key events dispatch from the current primary focus up through
    // its ancestors, and clicking genuinely non-focusable space (empty
    // background, a bare Text widget) leaves nothing in this subtree in that
    // chain at all, so the shortcut silently stopped reaching this widget
    // the moment focus landed anywhere like that. A raw handler sidesteps
    // the focus tree entirely — it fires on every key event regardless of
    // what, if anything, currently has focus.
    HardwareKeyboard.instance.addHandler(_handleKey);
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_handleKey);
    super.dispose();
  }

  bool _handleKey(KeyEvent event) {
    if (event is! KeyDownEvent) return false;
    if (event.logicalKey != LogicalKeyboardKey.keyB || !HardwareKeyboard.instance.isControlPressed) return false;
    controller.toggle();
    return true;
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
    animation: controller,
    builder: (context, _) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final bool isNarrow = constraints.maxWidth < widget.breakpoint;
          final bool crossedBreakpoint = _lastIsNarrow != null && _lastIsNarrow != isNarrow;
          _lastIsNarrow = isNarrow;

          // Deferred: reportLayoutMode can change controller.state, which
          // this AnimatedBuilder listens to — doing that synchronously
          // inside this very build would try to rebuild while building.
          WidgetsBinding.instance.addPostFrameCallback((_) => controller.reportLayoutMode(isNarrow));

          final double targetWidth = controller.state ? widget.leftWidth : 0;
          // A breakpoint crossing snaps straight to the target width
          // instead of sliding through it — the slide is for a deliberate
          // toggle within the same mode, not for a resize.
          final double startWidth = crossedBreakpoint ? targetWidth : (controller.state ? 0 : widget.leftWidth);

          var tweenAnimationBuilder = TweenAnimationBuilder<double>(
            key: Key('animatedPanel'),
            tween: Tween<double>(begin: startWidth, end: targetWidth),
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
