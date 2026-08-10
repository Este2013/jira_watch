import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/confluence_tabs_model.dart';

ConfluenceSpaceTab tab({String? pageId}) => ConfluenceSpaceTab(
  tabId: ConfluenceSpaceTab.newTabId(),
  spaceId: '1',
  spaceKey: 'K',
  spaceName: 'Space',
  pageId: pageId,
);

// Driven through the tab rather than the model: the model is a singleton that
// reads its file on construction, and the trail's rules are the tab's own.

void main() {
  // Constructing the model reaches for its settings folder, which goes through
  // platform plugins that do not exist in a test. Left unstubbed, those calls
  // resolve after the test that triggered them has finished and are reported as
  // that test failing, with assertions that all passed.
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    for (final channel in const [
      MethodChannel('dev.fluttercommunity.plus/package_info'),
      MethodChannel('plugins.flutter.io/path_provider'),
      MethodChannel('plugins.flutter.io/path_provider_windows'),
    ]) {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
        if (call.method == 'getAll') {
          return <String, Object?>{'appName': 'test', 'packageName': 'test', 'version': '0.0.0', 'buildNumber': '0'};
        }
        return Directory.systemTemp.createTempSync('confluence_tabs_test').path;
      });
    }
  });

  group('tab navigation history', () {
    test('a tab opened on a page starts with that page in its history', () {
      final t = tab(pageId: '1');

      expect(t.history, ['1']);
      expect(t.historyIndex, 0);
      expect(t.canGoBack, isFalse);
      expect(t.canGoForward, isFalse);
    });

    test('a tab opened on no page starts empty', () {
      final t = tab();

      expect(t.history, isEmpty);
      expect(t.historyIndex, -1);
      expect(t.canGoBack, isFalse);
    });

    test('opening pages builds a trail that can be walked back and forward', () {
      final t = tab(pageId: '1');
      t.openPage('2');
      t.openPage('3');

      expect(t.canGoBack, isTrue);
      expect(t.canGoForward, isFalse);

      expect(t.goBack(), '2');
      expect(t.goBack(), '1');
      expect(t.canGoBack, isFalse, reason: 'at the start of the trail');
      expect(t.goBack(), isNull);

      expect(t.goForward(), '2');
      expect(t.goForward(), '3');
      expect(t.goForward(), isNull, reason: 'at the end of the trail');
    });

    test('opening a page from partway back drops what was ahead', () {
      // A browser does the same: a forward button that led somewhere unrelated
      // to where you just went would be worse than no forward button.
      final t = tab(pageId: '1');
      t.openPage('2');
      t.openPage('3');
      t.goBack();

      t.openPage('4');

      expect(t.history, ['1', '2', '4']);
      expect(t.canGoForward, isFalse);
      expect(t.goBack(), '2');
    });

    test('reopening the page already shown does not add an entry', () {
      // Clicking the open article in the tree, or a link back to it, should not
      // fill the trail with repeats.
      final t = tab(pageId: '1');
      t.openPage('1');
      t.openPage('1');

      expect(t.history, ['1']);
    });

    test('going back clears the stale title rather than mislabelling the tab', () {
      final t = tab(pageId: '1');
      t.openPage('2', title: 'Second');
      expect(t.pageTitle, 'Second');

      t.goBack();

      expect(t.pageId, '1');
      expect(t.pageTitle, isNull, reason: 'the title belonged to the page being left');
    });

    test('describePage corrects the label without touching the trail', () {
      final t = tab(pageId: '1');
      t.openPage('2');

      t.pageTitle = 'Resolved title';

      expect(t.pageTitle, 'Resolved title');
      expect(t.history, ['1', '2']);
      expect(t.historyIndex, 1);
    });

    test('a duplicated tab carries its own copy of the trail', () {
      final t = tab(pageId: '1');
      t.openPage('2');

      final copy = t.duplicate();
      copy.openPage('3');

      expect(t.history, ['1', '2'], reason: 'the original must not follow the duplicate');
      expect(copy.history, ['1', '2', '3']);
    });

    test('a trail survives being written out and read back', () {
      final t = tab(pageId: '1');
      t.openPage('2');
      t.openPage('3');
      t.goBack();

      final restored = ConfluenceSpaceTab.fromJson(t.toJson());

      expect(restored.history, ['1', '2', '3']);
      expect(restored.historyIndex, 1);
      expect(restored.canGoBack, isTrue);
      expect(restored.canGoForward, isTrue);
    });

    test('editing a tab notifies, so the strip showing it rebuilds', () {
      // The bug this guards: the strip listens to the tab list, which reports
      // insertions and removals but not edits to a tab already in it — so
      // navigating within a tab left its label on the page it was opened at.
      // Every mutation goes through requestSave, which is where the signal is.
      final model = ConfluenceTabsModel();
      var notifications = 0;
      // Held in a variable: passing a fresh closure to removeListener would
      // remove nothing, and the leaked listener would count another test's
      // edits into this one.
      void onChange() => notifications++;
      model.revision.addListener(onChange);
      addTearDown(() => model.revision.removeListener(onChange));

      final t = tab(pageId: '1');
      model.setPage(t, '2', title: 'Second');
      expect(notifications, 1);

      model.describePage(t, 'Corrected');
      expect(notifications, 2);

      model.goBack(t);
      expect(notifications, 3);
    });

    test('a tab saved before history existed still loads', () {
      // Files written by the previous version have no history key at all.
      final restored = ConfluenceSpaceTab.fromJson({
        'tabId': 'old',
        'spaceId': '1',
        'spaceKey': 'K',
        'spaceName': 'Space',
        'pageId': '42',
      });

      expect(restored.history, ['42'], reason: 'seeded from the open page');
      expect(restored.historyIndex, 0);
    });
  });
}
