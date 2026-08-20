import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/utils/collapsible_pane.dart';

void main() {
  group('CollapsibleSidePaneController.reportLayoutMode', () {
    test('starts expanded when the first layout is wide', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false);
      expect(controller.state, isTrue);
    });

    test('starts collapsed when the first layout is narrow', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(true);
      expect(controller.state, isFalse);
    });

    test('collapses on narrowing, regardless of prior state', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false); // wide, expanded
      controller.reportLayoutMode(true); // narrows
      expect(controller.state, isFalse);
    });

    test('starting narrow then widening restores the "start expanded" intent', () {
      // The app-start case: too small on launch, list should auto-expand the
      // first time it becomes big enough.
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(true); // narrow at launch
      expect(controller.state, isFalse);

      controller.reportLayoutMode(false); // widens
      expect(controller.state, isTrue);
    });

    test('if the drawer was left open while narrow, widening keeps it expanded', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false); // wide
      controller.collapse(); // user closes it while still wide
      controller.reportLayoutMode(true); // narrows — drawer starts closed
      expect(controller.state, isFalse);

      controller.expand(); // user opens the drawer while narrow
      controller.reportLayoutMode(false); // widens again
      expect(controller.state, isTrue, reason: 'the open drawer should carry over rather than falling back to the pre-narrow intent');
    });

    test('if the drawer was left closed while narrow, widening restores what it was before narrowing', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false); // wide, expanded (default)
      controller.reportLayoutMode(true); // narrows — drawer starts closed
      expect(controller.state, isFalse);

      // Drawer never opened while narrow.
      controller.reportLayoutMode(false); // widens again
      expect(controller.state, isTrue, reason: 'was expanded before narrowing, so it should re-expand');
    });

    test('collapsing while wide is remembered as the new intent across a narrow/wide cycle', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false); // wide, expanded
      controller.collapse(); // user explicitly collapses while wide
      controller.reportLayoutMode(true); // narrows
      controller.reportLayoutMode(false); // widens again, drawer never opened

      expect(controller.state, isFalse, reason: 'the collapsed intent set while wide should survive the round trip');
    });

    test('a drawer left open through a widen keeps working across a second narrow/wide cycle', () {
      // Regression: restoring "drawer was already open" on a narrow->wide
      // transition can be a no-op (state doesn't change), which must still
      // update the remembered intent — otherwise a *second* narrow/wide
      // cycle with nothing manually toggled restores a stale intent instead
      // of what was actually true the first time.
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false); // wide, expanded
      controller.collapse();
      controller.reportLayoutMode(true); // narrows, closed
      controller.expand(); // opens while narrow
      controller.reportLayoutMode(false); // widens — stays open (no-op set)

      controller.reportLayoutMode(true); // narrows again, closed
      controller.reportLayoutMode(false); // widens again, nothing toggled this time

      expect(controller.state, isTrue);
    });

    test('repeated reports in the same mode do not toggle anything', () {
      final controller = CollapsibleSidePaneController();
      controller.reportLayoutMode(false);
      controller.reportLayoutMode(false);
      controller.reportLayoutMode(false);
      expect(controller.state, isTrue);
    });
  });

  group('CollapsibleSidePaneController basics', () {
    test('toggle flips state', () {
      final controller = CollapsibleSidePaneController();
      expect(controller.state, isTrue);
      controller.toggle();
      expect(controller.state, isFalse);
      controller.toggle();
      expect(controller.state, isTrue);
    });

    test('expand/collapse notify listeners only on an actual change', () {
      final controller = CollapsibleSidePaneController();
      var notifications = 0;
      controller.addListener(() => notifications++);

      controller.expand(); // already expanded — no-op
      expect(notifications, 0);

      controller.collapse();
      expect(notifications, 1);

      controller.collapse(); // already collapsed — no-op
      expect(notifications, 1);
    });
  });
}
