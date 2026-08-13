import 'package:flutter/material.dart';

/// Shows [snackBar] and guarantees it disappears after [duration], regardless
/// of the OS's accessibility settings.
///
/// A SnackBar normally hides itself via its own internal timer — but Flutter
/// skips that timer entirely whenever `MediaQuery.accessibleNavigationOf` is
/// true, on purpose: a screen reader user should not have a notification
/// vanish mid-read. That flag can end up set for reasons that have nothing to
/// do with an actual screen reader being used, which is why a SnackBar could
/// sit there until an action inside it happened to be clicked — the action's
/// own default behaviour dismisses it, which was the only reason it ever went
/// away.
///
/// Scheduling the dismissal here, in application code, sidesteps that check.
/// It closes the specific instance `ScaffoldMessengerState.showSnackBar`
/// returned rather than "whatever is currently showing", so a second,
/// unrelated SnackBar shown in the meantime is not touched.
///
/// Also this app's route to *confining* a SnackBar to one part of the screen:
/// `ScaffoldMessenger.of(context)` resolves to the nearest ancestor
/// `ScaffoldMessenger`, so a view wrapped in its own (see `home.dart`'s
/// `_pageBodies`) gets SnackBars sized to that view rather than the whole
/// window. A SnackBar raised from inside a dialog is the one case this cannot
/// help with: a dialog's route is a sibling of the page's own subtree, not a
/// descendant of it, so it can only ever reach the app's outermost
/// ScaffoldMessenger — which is fine, since a dialog already covers much of
/// the screen itself.
void showAppSnackBar(
  BuildContext context,
  SnackBar snackBar, {
  Duration duration = const Duration(seconds: 4),
}) {
  final controller = ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Future.delayed(duration, controller.close);
}
