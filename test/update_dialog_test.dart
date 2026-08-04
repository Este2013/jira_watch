import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/updates_dao.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/ui/updates_dialog.dart';
import 'package:loggy/loggy.dart';

NewUpdateData update({String? sha256 = 'abc', String? changelog = '✨ Features:\n ᛫ Something new'}) => NewUpdateData(
  version: '1.8.0',
  metadata: {
    if (changelog != null) 'changelog': changelog,
    'x64': 'v1.8.0/Binaries (x64).zip',
    if (sha256 != null) 'x64Sha256': sha256,
    'x64Size': 48974388,
  },
);

const installable = UpdatePreflight(blockers: []);
const blocked = UpdatePreflight(
  blockers: [UpdateBlocker('not-writable', 'Jira Watcher is installed somewhere this account cannot modify.')],
);
const wrongPlatform = UpdatePreflight(blockers: [UpdateBlocker.unsupportedPlatform]);

Future<void> pumpDialog(
  WidgetTester tester, {
  NewUpdateData? data,
  UpdatePreflight? preflight = installable,
  bool isBeta = false,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: NewUpdateAvailableDialog(
          update: isBeta
              ? NewUpdateData(version: '1.8.0.1', metadata: const {'x64': 'a'}, isBeta: true)
              : (data ?? update()),
          currentVersion: '1.7.0',
          preflightOverride: preflight,
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

/// Whether a button with this label is present and tappable.
///
/// Found by predicate rather than `find.byType`, which matches the exact runtime
/// type and so never matches TextButton or FilledButton through their shared base.
bool isEnabled(WidgetTester tester, String label) {
  final button = tester.widget<ButtonStyleButton>(
    find
        .ancestor(
          of: find.text(label),
          matching: find.byWidgetPredicate((widget) => widget is ButtonStyleButton),
        )
        .first,
  );
  return button.onPressed != null;
}

String visibleText(WidgetTester tester) => tester.widgetList<Text>(find.byType(Text)).map((t) => t.data ?? '').join('\n');

void main() {
  // The controller logs, and loggy throws when it was never initialised — which
  // would surface here as the dialog appearing to stall.
  setUpAll(() => Loggy.initLoggy(logPrinter: const DefaultPrinter()));

  group('presentation', () {
    testWidgets('shows the version, the current version and the changelog', (tester) async {
      await pumpDialog(tester);

      expect(find.text('A new update is available!'), findsOne);
      expect(find.text('Version 1.8.0'), findsOne);
      expect(find.text('(Current: 1.7.0)'), findsOne);
      // The changelog renders in its card — this branch used to be inverted.
      expect(find.textContaining('Something new'), findsOne);
      expect(find.text('No changelog :('), findsNothing);
    });

    testWidgets('says so when a release publishes no changelog', (tester) async {
      await pumpDialog(tester, data: update(changelog: null));
      expect(find.text('No changelog :('), findsOne);
    });

    testWidgets('marks a beta release as such', (tester) async {
      await pumpDialog(tester, isBeta: true);
      expect(find.text('A new beta update is available!'), findsOne);
    });
  });

  group('actions', () {
    testWidgets('always offers the manual escape routes', (tester) async {
      // These must survive regardless of whether self-install is possible.
      for (final preflight in [installable, blocked, wrongPlatform]) {
        await pumpDialog(tester, preflight: preflight);
        expect(isEnabled(tester, 'Download'), isTrue);
        expect(isEnabled(tester, 'GitHub'), isTrue);
        expect(find.text('Not now'), findsOne);
      }
    });

    testWidgets('offers Install when nothing blocks it', (tester) async {
      await pumpDialog(tester, preflight: installable);
      expect(isEnabled(tester, 'Install update'), isTrue);
    });

    testWidgets('explains why Install is unavailable instead of leaving a dead button', (tester) async {
      await pumpDialog(tester, preflight: blocked);

      expect(find.text('Install update'), findsOne);
      expect(isEnabled(tester, 'Install update'), isFalse);
      // The reason has to be on screen, not only in a tooltip.
      expect(visibleText(tester), contains('cannot modify'));
    });

    testWidgets('hides Install entirely on a platform that cannot self-install', (tester) async {
      // A disabled button plus "not supported here" is worse than no button.
      await pumpDialog(tester, preflight: wrongPlatform);
      expect(find.text('Install update'), findsNothing);
      expect(visibleText(tester), isNot(contains('Windows-only')));
    });
  });

  group('preflight failure', () {
    testWidgets('a failed check blocks installing rather than stalling the dialog', (tester) async {
      // Before this was handled, a throw in preflight left the phase at `checking`
      // forever: a permanently disabled button with no explanation.
      const failed = UpdatePreflight(
        blockers: [UpdateBlocker('preflight-failed', "Couldn't check whether this app can update itself.")],
      );
      await pumpDialog(tester, preflight: failed);

      expect(isEnabled(tester, 'Install update'), isFalse);
      expect(visibleText(tester), contains("Couldn't check"));
      expect(isEnabled(tester, 'Download'), isTrue);
    });
  });
}
