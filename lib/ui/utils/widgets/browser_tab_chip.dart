import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

/// One browser-style tab: an icon, an optional label, an active highlight,
/// and — when [onClose] is given — a close button that only shows on hover
/// or while active, plus a middle-click and right-click to go with it.
///
/// Shared by every tab strip in the app (the updates view's project tabs, the
/// work item tabs) rather than each rolling its own, so they all look and
/// behave like the same kind of thing.
class BrowserTabChip extends StatefulWidget {
  const BrowserTabChip({
    super.key,
    required this.tooltip,
    required this.leading,
    required this.isActive,
    required this.onTap,
    this.label,
    this.tooltipFuture,
    this.onClose,
    this.closeTooltip = 'Close',
    this.onSecondaryTapDown,
  });

  /// What the tab reads; a tab with none is its icon alone, which is how a
  /// strip's fixed "home"-style tab stays out of the way of the rest.
  final String? label;
  final String tooltip;

  /// A nicer tooltip once it resolves (e.g. a project's full name);
  /// [tooltip] stands in until then, and if it resolves to nothing.
  final Future<String?>? tooltipFuture;
  final Widget leading;
  final bool isActive;
  final VoidCallback onTap;

  /// Closes the tab, if it can be closed at all — null makes this tab
  /// permanent (no close button, no middle-click-to-close).
  final VoidCallback? onClose;
  final String closeTooltip;

  /// Right-click, for a tab with its own context menu.
  final void Function(TapDownDetails details)? onSecondaryTapDown;

  @override
  State<BrowserTabChip> createState() => _BrowserTabChipState();
}

class _BrowserTabChipState extends State<BrowserTabChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // The close button only shows where it is being aimed at, so a strip of
    // tabs is not a row of crosses.
    final showClose = widget.onClose != null && (widget.isActive || _hovered);

    final content = ConstrainedBox(
      // A tab with a label takes a settled width, so its close button lands in
      // the same place on every tab rather than trailing whatever the label
      // happens to be.
      constraints: widget.label == null ? const BoxConstraints() : const BoxConstraints(minWidth: 120, maxWidth: 160),
      child: Padding(
        padding: EdgeInsets.only(left: 12, right: widget.onClose == null ? 12 : 4),
        child: Row(
          children: [
            widget.leading,
            if (widget.label case final label?) ...[
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: widget.isActive ? FontWeight.w600 : null),
                ),
              ),
            ],
            // Held open whether or not the button is showing, so a tab does not
            // resize under the pointer as it arrives.
            if (widget.onClose != null)
              SizedBox(
                width: 24,
                child: showClose
                    ? IconButton(
                        icon: const Icon(Symbols.close),
                        iconSize: 16,
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
                        tooltip: widget.closeTooltip,
                        onPressed: widget.onClose,
                      )
                    : null,
              ),
          ],
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Listener(
          onPointerDown: (event) {
            if (event.buttons == kMiddleMouseButton) widget.onClose?.call();
          },
          child: Material(
            color: widget.isActive ? scheme.surfaceContainerHighest : Colors.transparent,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            child: InkWell(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
              onTap: widget.onTap,
              onSecondaryTapDown: widget.onSecondaryTapDown,
              child: widget.tooltipFuture == null
                  ? Tooltip(message: widget.tooltip, waitDuration: const Duration(milliseconds: 600), child: content)
                  : FutureBuilder<String?>(
                      future: widget.tooltipFuture,
                      builder: (context, snapshot) => Tooltip(
                        message: snapshot.data ?? widget.tooltip,
                        waitDuration: const Duration(milliseconds: 600),
                        child: content,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
