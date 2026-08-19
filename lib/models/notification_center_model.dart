import 'package:flutter/material.dart';

/// One button a notification offers — e.g. "Show in folder", "Open update".
class AppNotificationAction {
  const AppNotificationAction({required this.label, this.icon, required this.onPressed});

  final String label;
  final IconData? icon;
  final VoidCallback onPressed;
}

/// One entry in the notification center.
///
/// A [ChangeNotifier] rather than an immutable value: a download's progress or
/// a background check's outcome needs to update the same entry in place —
/// changing [title] or [subtitle], or replacing [actions] once a task finishes
/// — without the notification jumping position or losing its read state.
///
/// Deliberately not persisted to disk: [leading] and [actions] close over
/// in-memory objects (a running download task, a dialog builder) that would
/// not survive a restart anyway, so this list's lifetime is just "the app is
/// running".
class AppNotification extends ChangeNotifier {
  AppNotification({
    required this.id,
    required String title,
    String? subtitle,
    Widget? leading,
    List<AppNotificationAction> actions = const [],
    this.loud = false,
    this.onTap,
  }) : _title = title,
       _subtitle = subtitle,
       _leading = leading,
       _actions = actions,
       createdAt = DateTime.now();

  /// Identifies this notification across edits — [NotificationCenterModel.add]
  /// replaces any existing entry with the same id rather than piling up a
  /// duplicate, which is what lets a producer re-post "today's update check"
  /// or "this download's progress" as the same notification over and over.
  final String id;

  final DateTime createdAt;

  /// Forces a bubble to appear pointing at the bell the moment this arrives,
  /// rather than waiting for the reader to open the notification center
  /// themselves. Reserved for something the user is actively waiting on, like
  /// a download they just started.
  final bool loud;

  /// What tapping the notification's body does — opening the update dialog,
  /// revealing a finished download, and so on. Null for a notification whose
  /// only affordances are its [actions].
  final VoidCallback? onTap;

  String _title;
  String get title => _title;
  set title(String value) {
    if (_title == value) return;
    _title = value;
    notifyListeners();
  }

  String? _subtitle;
  String? get subtitle => _subtitle;
  set subtitle(String? value) {
    if (_subtitle == value) return;
    _subtitle = value;
    notifyListeners();
  }

  Widget? _leading;
  Widget? get leading => _leading;
  set leading(Widget? value) {
    _leading = value;
    notifyListeners();
  }

  List<AppNotificationAction> _actions;
  List<AppNotificationAction> get actions => _actions;
  set actions(List<AppNotificationAction> value) {
    _actions = value;
    notifyListeners();
  }

  bool _read = false;
  bool get read => _read;
  set read(bool value) {
    if (_read == value) return;
    _read = value;
    notifyListeners();
  }
}

/// Holds every notification currently showing in the notification center.
///
/// A single [ChangeNotifier] that forwards every child [AppNotification]'s own
/// changes as its own — so the bell badge, the flyout list, and a single row's
/// progress text can all listen to just this one object and stay in sync,
/// rather than a widget having to also listen to whichever items it happens
/// to be showing.
class NotificationCenterModel extends ChangeNotifier {
  static final NotificationCenterModel _instance = NotificationCenterModel._internal();

  factory NotificationCenterModel() => _instance;

  NotificationCenterModel._internal();

  final List<AppNotification> _items = [];

  /// Newest first — what both the flyout and the arrival bubble want.
  List<AppNotification> get items => List.unmodifiable(_items.reversed);

  bool get isEmpty => _items.isEmpty;

  int get unreadCount => _items.where((n) => !n.read).length;

  /// Bumped once per call to [add] that is a genuinely new notification —
  /// never for an edit to an existing one — so the bell only plays its
  /// arrival animation for something new landing, not for a progress update
  /// ticking by.
  final ValueNotifier<int> arrivalTick = ValueNotifier(0);

  /// The most recently arrived loud notification, for the bell to show a
  /// bubble over. Consumed back to null once shown, so it does not replay the
  /// next time something else changes.
  final ValueNotifier<AppNotification?> loudArrival = ValueNotifier(null);

  AppNotification? byId(String id) {
    for (final n in _items) {
      if (n.id == id) return n;
    }
    return null;
  }

  /// Adds [notification], replacing any existing one with the same id. Lets a
  /// producer call this again for what is conceptually the same notification
  /// (this download's progress, today's update check) without piling up
  /// duplicates or losing its place in the list.
  void add(AppNotification notification) {
    final existing = byId(notification.id);
    if (existing != null) _detach(existing);

    _items.add(notification);
    notification.addListener(notifyListeners);
    notifyListeners();

    arrivalTick.value++;
    if (notification.loud) loudArrival.value = notification;
  }

  void remove(String id) {
    final existing = byId(id);
    if (existing == null) return;
    _detach(existing);
    notifyListeners();
  }

  void _detach(AppNotification notification) {
    notification.removeListener(notifyListeners);
    _items.remove(notification);
  }

  void markAllRead() {
    for (final n in _items) {
      n.read = true;
    }
  }

  void clear() {
    for (final n in List.of(_items)) {
      _detach(n);
    }
    notifyListeners();
  }
}
