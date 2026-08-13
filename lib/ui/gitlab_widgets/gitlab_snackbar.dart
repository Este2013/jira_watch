import 'package:flutter/material.dart';

/// Shows [snackBar] and guarantees it disappears after [duration], regardless
/// of the OS's accessibility settings.
///
/// A SnackBar normally hides itself via its own internal timer — but Flutter
/// skips that timer entirely whenever `MediaQuery.accessibleNavigationOf` is
/// true, on purpose: a screen reader user should not have a notification
/// vanish mid-read. That flag can end up set for reasons that have nothing to
/// do with an actual screen reader being used, which is why the GitLab
/// download SnackBar sat there indefinitely until "Show in folder" was
/// clicked — that action's own default behaviour dismisses it, which was the
/// only reason it ever went away.
///
/// Scheduling the dismissal here, in application code, sidesteps that check.
/// It closes the specific instance `ScaffoldMessengerState.showSnackBar`
/// returned rather than "whatever is currently showing", so a second,
/// unrelated SnackBar shown in the meantime is not touched by a leftover timer.
void showGitLabSnackBar(
  BuildContext context,
  SnackBar snackBar, {
  Duration duration = const Duration(seconds: 4),
}) {
  final controller = ScaffoldMessenger.of(context).showSnackBar(snackBar);
  Future.delayed(duration, controller.close);
}
