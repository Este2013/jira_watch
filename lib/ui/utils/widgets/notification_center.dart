import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/notification_center_model.dart';
import 'package:material_symbols_icons/symbols.dart';

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

class _NotificationBellButtonState extends State<NotificationBellButton> with SingleTickerProviderStateMixin {
  final _link = LayerLink();
  OverlayEntry? _flyoutEntry;
  OverlayEntry? _bubbleEntry;
  Timer? _bubbleTimer;

  late final AnimationController _wiggleCtrl;

  @override
  void initState() {
    super.initState();
    _wiggleCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
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
    _wiggleCtrl.dispose();
    super.dispose();
  }

  void _onArrival() {
    if (mounted) _wiggleCtrl.forward(from: 0);
  }

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
    final entry = OverlayEntry(builder: (context) => _NotificationOverlayBarrier(link: _link, onClose: _closeFlyout, child: const _NotificationFlyout()));
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
      builder: (context) => _NotificationOverlayBarrier(link: _link, onClose: _closeBubble, child: _LoudNotificationBubble(notification: notification)),
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

  /// A quick back-and-forth wiggle rather than a full spin, damped so it
  /// settles back to rest instead of stopping abruptly.
  double _wiggleAngle(double t) => t <= 0 || t >= 1 ? 0 : math.sin(t * math.pi * 4) * (1 - t) * 0.3;

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

      return CompositedTransformTarget(
        link: _link,
        child: AnimatedBuilder(
          animation: _wiggleCtrl,
          builder: (context, child) => Transform.rotate(angle: _wiggleAngle(_wiggleCtrl.value), child: child),
          child: IconButton(
            tooltip: 'Notifications',
            onPressed: _toggleFlyout,
            icon: Badge.count(count: model.unreadCount, isLabelVisible: model.unreadCount > 0, child: const Icon(Symbols.notifications)),
          ),
        ),
      );
    },
  );
}

/// The transparent full-screen tap target behind a flyout or bubble, plus the
/// [CompositedTransformFollower] that pins [child] next to the bell — shared
/// since both overlays close the same way: click elsewhere, or Escape.
class _NotificationOverlayBarrier extends StatelessWidget {
  const _NotificationOverlayBarrier({required this.link, required this.onClose, required this.child});

  final LayerLink link;
  final VoidCallback onClose;
  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Positioned.fill(child: GestureDetector(behavior: HitTestBehavior.opaque, onTap: onClose)),
      CompositedTransformFollower(
        link: link,
        showWhenUnlinked: false,
        targetAnchor: Alignment.topRight,
        followerAnchor: Alignment.topLeft,
        offset: const Offset(8, -8),
        child: Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event is KeyDownEvent && event.logicalKey == LogicalKeyboardKey.escape) {
              onClose();
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          // Absorbs its own taps so clicking inside the flyout or bubble does
          // not fall through to the full-screen barrier behind it.
          child: GestureDetector(onTap: () {}, child: child),
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
      constraints: const BoxConstraints(maxWidth: 380, maxHeight: 480),
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
                  if (notification.subtitle != null)
                    Text(notification.subtitle!, style: Theme.of(context).textTheme.bodySmall!.copyWith(color: hint)),
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
      builder: (context, _) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.only(top: 16), child: CustomPaint(size: const Size(8, 14), painter: _BubbleTailPainter(color: color))),
          Material(
            elevation: 8,
            color: color,
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.antiAlias,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 320),
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
        ],
      ),
    );
  }
}

/// A small leftward-pointing triangle, matching the bubble's fill color, so
/// the bubble reads as anchored to the bell rather than floating nearby.
class _BubbleTailPainter extends CustomPainter {
  const _BubbleTailPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height / 2)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _BubbleTailPainter oldDelegate) => oldDelegate.color != color;
}
