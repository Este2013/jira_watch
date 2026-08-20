import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/notification_center_model.dart';
import 'package:lottie/lottie.dart';

/// The bell shown in the navigation rail, above the settings button.
///
/// Hidden entirely while [NotificationCenterModel] is empty — an unread badge
/// on an empty bell would just be a bug, but an all-read bell staying visible
/// is deliberate: the reader may still want to reopen something they already
/// saw, like a finished download's actions.
class NotificationBellButton extends StatefulWidget {
  const NotificationBellButton({super.key});

  @override
  State<NotificationBellButton> createState() => _NotificationBellButtonState();
}

class _NotificationBellButtonState extends State<NotificationBellButton> {
  final _link = LayerLink();
  final _bellKey = GlobalKey<_BellIconState>();
  OverlayEntry? _flyoutEntry;
  OverlayEntry? _bubbleEntry;
  Timer? _bubbleTimer;

  @override
  void initState() {
    super.initState();
    NotificationCenterModel().arrivalTick.addListener(_onArrival);
    NotificationCenterModel().loudArrival.addListener(_onLoudArrival);
  }

  @override
  void dispose() {
    NotificationCenterModel().arrivalTick.removeListener(_onArrival);
    NotificationCenterModel().loudArrival.removeListener(_onLoudArrival);
    _bubbleTimer?.cancel();
    _closeFlyout();
    _closeBubble();
    super.dispose();
  }

  void _onArrival() => _bellKey.currentState?.ring();

  void _onLoudArrival() {
    final notification = NotificationCenterModel().loudArrival.value;
    if (notification == null || !mounted) return;
    // Consumed immediately so a later, unrelated rebuild never replays it.
    NotificationCenterModel().loudArrival.value = null;
    _showBubble(notification);
  }

  void _toggleFlyout() {
    if (_flyoutEntry != null) {
      _closeFlyout();
      return;
    }
    _closeBubble();
    final entry = OverlayEntry(
      builder: (context) => _NotificationOverlayBarrier(link: _link, onClose: _closeFlyout, child: const _NotificationFlyout()),
    );
    _flyoutEntry = entry;
    Overlay.of(context).insert(entry);
  }

  void _closeFlyout() {
    _flyoutEntry?.remove();
    _flyoutEntry = null;
  }

  void _showBubble(AppNotification notification) {
    _closeBubble();
    final entry = OverlayEntry(
      builder: (context) => _NotificationOverlayBarrier(
        link: _link,
        onClose: _closeBubble,
        child: _LoudNotificationBubble(notification: notification),
      ),
    );
    _bubbleEntry = entry;
    Overlay.of(context).insert(entry);
    // A loud notification is meant to catch the eye, not linger — the flyout
    // is still there afterwards for anyone who wants to act on it later.
    _bubbleTimer = Timer(const Duration(seconds: 8), _closeBubble);
  }

  void _closeBubble() {
    _bubbleTimer?.cancel();
    _bubbleTimer = null;
    _bubbleEntry?.remove();
    _bubbleEntry = null;
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: NotificationCenterModel(),
    builder: (context, _) {
      final model = NotificationCenterModel();
      if (model.isEmpty) {
        // Nothing left to show — close whatever overlay was open on it too,
        // rather than leaving a flyout pointing at empty air.
        if (_flyoutEntry != null || _bubbleEntry != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _closeFlyout();
            _closeBubble();
          });
        }
        return const SizedBox.shrink();
      }

      final railTheme = Theme.of(context).navigationRailTheme;
      // Matches whatever the rest of the rail's icons are colored — the same
      // muted tone as the settings gear below it, not whatever the ambient
      // IconTheme happens to resolve to outside the rail's own destinations.
      final bellColor = railTheme.unselectedIconTheme?.color ?? Theme.of(context).colorScheme.onSurfaceVariant;

      return CompositedTransformTarget(
        link: _link,
        child: IconButton(
          tooltip: 'Notifications',
          onPressed: () {
            _bellKey.currentState?.ring();
            _toggleFlyout();
          },
          icon: Badge.count(
            count: model.unreadCount,
            isLabelVisible: model.unreadCount > 0,
            offset: const Offset(8, -4),
            child: BellIcon(key: _bellKey, color: bellColor),
          ),
        ),
      );
    },
  );
}

/// The bell glyph, driven directly through Lottie.
///
/// Its own copy of the animation lives at assets/icons/bell.json rather than
/// borrowing the animated_icon package's bundled one — that package is no
/// longer a dependency at all, since this was the only thing using it and
/// [Lottie.asset] alone can play the file just as well. Owning the file also
/// means it can be hand-edited (to add real stroke art for an outline, for
/// one) without waiting on an upstream release: the original has no stroke
/// content at all, only two filled shapes, so there is currently no line art
/// to fall back on once the fill is removed — only empty space.
class BellIcon extends StatefulWidget {
  const BellIcon({super.key, required this.color});

  final Color color;

  @override
  State<BellIcon> createState() => _BellIconState();
}

class _BellIconState extends State<BellIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Plays one ring from the start, restarting it if it is already ringing.
  void ring() => _controller.forward(from: 0);

  @override
  Widget build(BuildContext context) => Lottie.asset(
    'assets/icons/bell-outlined-balanced.json',
    controller: _controller,
    // The real duration, from the asset itself — nothing here has to guess
    // at how long a ring takes.
    onLoaded: (composition) => _controller.duration = composition.duration,
    height: 24,
    width: 24,
    addRepaintBoundary: true,
    // Two recursive wildcards rather than one: color only recolors fill
    // content, strokeColor only recolors stroke content, and an outlined
    // hand-edit of this asset can carry either or both (bell-outlined-balanced.json
    // currently has one leftover fill alongside its three strokes). Covering
    // both regardless of how the asset's groups end up named, or how many of
    // them there are, means a future hand-edit does not need this code
    // touched too. Safe since every fill/stroke here is fully opaque already;
    // only the hue changes, not the coverage a matte layer might depend on.
    delegates: LottieDelegates(
      values: [
        ValueDelegate.color(const ['**'], value: widget.color),
        ValueDelegate.strokeColor(const ['**'], value: widget.color),
      ],
    ),
  );
}

/// The transparent full-screen tap target behind a flyout or bubble, plus the
/// [CompositedTransformFollower] that pins [child] next to the bell — shared
/// since both overlays close the same way: click elsewhere, or Escape.
class _NotificationOverlayBarrier extends StatefulWidget {
  const _NotificationOverlayBarrier({required this.link, required this.onClose, required this.child});

  final LayerLink link;
  final VoidCallback onClose;
  final Widget child;

  @override
  State<_NotificationOverlayBarrier> createState() => _NotificationOverlayBarrierState();
}

class _NotificationOverlayBarrierState extends State<_NotificationOverlayBarrier> {
  final _focusNode = FocusNode(debugLabel: 'NotificationOverlay');

  @override
  void initState() {
    super.initState();
    // `autofocus` only claims focus when nothing in scope already has it —
    // and the bell button just got tapped to open this, so it already does.
    // Escape went nowhere as a result. Requesting explicitly always moves
    // focus here regardless of what held it a moment ago.
    WidgetsBinding.instance.addPostFrameCallback((_) => _focusNode.requestFocus());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(
        child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: widget.onClose),
      ),
      CompositedTransformFollower(
        link: widget.link,
        showWhenUnlinked: false,
        // The bell sits near the bottom of the navigation rail, above
        // settings — anchoring the follower's bottom-left corner to the
        // bell's top-right one grows it upward from there instead of
        // downward, which is what a flyout of any real length needs to avoid
        // running off the bottom of the window.
        targetAnchor: Alignment.topRight,
        followerAnchor: Alignment.bottomLeft,
        offset: const Offset(8, -8),
        child: Focus(
          focusNode: _focusNode,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
              widget.onClose();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          // Absorbs its own taps so clicking inside the flyout or bubble does
          // not fall through to the full-screen barrier behind it.
          child: GestureDetector(onTap: () {}, child: widget.child),
        ),
      ),
    ],
  );
}

/// The list of every current notification, flown out beside the bell.
class _NotificationFlyout extends StatelessWidget {
  const _NotificationFlyout();

  @override
  Widget build(BuildContext context) => Material(
    elevation: 8,
    borderRadius: BorderRadius.circular(12),
    clipBehavior: Clip.antiAlias,
    child: ConstrainedBox(
      // Capped by the window's own height too: growing upward from the bell
      // avoids running off the bottom, but a short window (or a long enough
      // notification list) could still push the top off-screen without this.
      constraints: BoxConstraints(maxWidth: 380, maxHeight: math.min(480, MediaQuery.sizeOf(context).height - 48)),
      child: ListenableBuilder(
        listenable: NotificationCenterModel(),
        builder: (context, _) {
          final items = NotificationCenterModel().items;
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 8, 4),
                child: Row(
                  children: [
                    Expanded(child: Text('Notifications', style: Theme.of(context).textTheme.titleMedium)),
                    TextButton(
                      onPressed: items.any((n) => !n.read) ? NotificationCenterModel().markAllRead : null,
                      child: const Text('Mark all read'),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Flexible(
                child: items.isEmpty
                    ? const Padding(padding: EdgeInsets.all(24), child: Text('No notifications.'))
                    : ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: items.length,
                        separatorBuilder: (context, i) => const Divider(height: 1),
                        itemBuilder: (context, i) => _NotificationTile(notification: items[i]),
                      ),
              ),
            ],
          );
        },
      ),
    ),
  );
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    return InkWell(
      onTap: () {
        notification.read = true;
        notification.onTap?.call();
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            if (notification.leading != null) notification.leading!,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text(notification.title, style: TextStyle(fontWeight: notification.read ? FontWeight.normal : FontWeight.w600)),
                  if (notification.subtitle != null) Text(notification.subtitle!, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: hint)),
                  if (notification.actions.isNotEmpty) _ActionsRow(actions: notification.actions),
                ],
              ),
            ),
            if (!notification.read)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, shape: BoxShape.circle),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ActionsRow extends StatelessWidget {
  const _ActionsRow({required this.actions});

  final List<AppNotificationAction> actions;

  @override
  Widget build(BuildContext context) => Wrap(
    spacing: 4,
    children: [
      for (final action in actions)
        TextButton.icon(
          onPressed: action.onPressed,
          icon: action.icon == null ? const SizedBox.shrink() : Icon(action.icon, size: 16),
          label: Text(action.label),
          style: TextButton.styleFrom(visualDensity: VisualDensity.compact, padding: const EdgeInsets.symmetric(horizontal: 8)),
        ),
    ],
  );
}

/// A transient callout for a [AppNotification.loud] notification, pointing at
/// the bell with a small tail so it reads as coming from there even though it
/// is really just another overlay entry.
class _LoudNotificationBubble extends StatelessWidget {
  const _LoudNotificationBubble({required this.notification});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.surfaceContainerHigh;

    return ListenableBuilder(
      listenable: notification,
      // Aligned to the row's bottom, not its top: the bubble grows upward
      // from the bell (see the follower anchors in _NotificationOverlayBarrier),
      // so the bell itself sits just below the bubble's bottom edge, which is
      // where the tail needs to be to still look like it is pointing at it.
      builder: (context, _) => Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            elevation: 8,
            color: color,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              // Nothing clips overlay content to the window automatically —
              // without a height cap here, a bubble growing upward from an
              // anchor already low in a short window has nothing stopping it
              // from extending past the top edge instead of just scrolling.
              constraints: BoxConstraints(maxWidth: 320, maxHeight: math.min(400, MediaQuery.sizeOf(context).height - 48)),
              child: SingleChildScrollView(
                child: InkWell(
                  onTap: () {
                    notification.read = true;
                    notification.onTap?.call();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        if (notification.leading != null) notification.leading!,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 4,
                            children: [
                              Text(notification.title, style: const TextStyle(fontWeight: FontWeight.w600)),
                              if (notification.subtitle != null) Text(notification.subtitle!, style: Theme.of(context).textTheme.bodySmall),
                              if (notification.actions.isNotEmpty) _ActionsRow(actions: notification.actions),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
