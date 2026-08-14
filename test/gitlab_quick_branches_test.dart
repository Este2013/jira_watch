import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/gitlab_quick_branches_model.dart';

void main() {
  // Constructing GitLabQuickBranchesModel reaches for its settings folder in a
  // field initializer, which goes through platform plugins that do not exist
  // in a test. Left unstubbed, those calls resolve after the test that
  // triggered them has finished and are reported as that test failing, with
  // assertions that all passed — the same problem the Confluence tabs model
  // hit for the same reason.
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
        return Directory.systemTemp.createTempSync('gitlab_quick_branches_test').path;
      });
    }
  });

  group('GitLabQuickBranchRule.matches', () {
    test('exact requires the whole name to be identical', () {
      final rule = GitLabQuickBranchRule(id: 1, label: 'l', pattern: 'release/1.4');
      expect(rule.matches('release/1.4'), isTrue);
      expect(rule.matches('release/1.40'), isFalse);
      expect(rule.matches('RELEASE/1.4'), isFalse, reason: 'exact means exact, not case-insensitive');
    });

    test('contains is a case-insensitive substring check', () {
      final rule = GitLabQuickBranchRule(id: 1, label: 'l', pattern: 'release', matchType: GitLabBranchMatchType.contains);
      expect(rule.matches('release/1.4'), isTrue);
      expect(rule.matches('RELEASE/1.4'), isTrue);
      expect(rule.matches('hotfix'), isFalse);
    });

    test('regex matches case-insensitively', () {
      final rule = GitLabQuickBranchRule(id: 1, label: 'l', pattern: r'^release/\d+\.\d+$', matchType: GitLabBranchMatchType.regex);
      expect(rule.matches('release/1.4'), isTrue);
      expect(rule.matches('RELEASE/1.4'), isTrue);
      expect(rule.matches('release/1.4.2'), isFalse);
    });

    test('an invalid regex matches nothing rather than throwing', () {
      final rule = GitLabQuickBranchRule(id: 1, label: 'l', pattern: '(unclosed', matchType: GitLabBranchMatchType.regex);
      expect(rule.matches('anything'), isFalse);
    });
  });

  group('GitLabQuickBranchRule.isValid', () {
    test('needs a label and a pattern', () {
      expect(GitLabQuickBranchRule(id: 1, label: '', pattern: 'x').isValid, isFalse);
      expect(GitLabQuickBranchRule(id: 1, label: 'x', pattern: '').isValid, isFalse);
      expect(GitLabQuickBranchRule(id: 1, label: 'x', pattern: 'x').isValid, isTrue);
    });

    test('a regex rule is only valid if the regex compiles', () {
      final broken = GitLabQuickBranchRule(id: 1, label: 'l', pattern: '(unclosed', matchType: GitLabBranchMatchType.regex);
      expect(broken.isValid, isFalse);

      final working = GitLabQuickBranchRule(id: 1, label: 'l', pattern: r'^release/\d+$', matchType: GitLabBranchMatchType.regex);
      expect(working.isValid, isTrue);
    });

    test('exact and contains do not need to look like a regex at all', () {
      final rule = GitLabQuickBranchRule(id: 1, label: 'l', pattern: '(((', matchType: GitLabBranchMatchType.contains);
      expect(rule.isValid, isTrue);
    });
  });

  group('rule round-trips through JSON', () {
    test('every field survives, including a non-default match type', () {
      final rule = GitLabQuickBranchRule(id: 7, label: 'Release', pattern: 'release/', matchType: GitLabBranchMatchType.contains);
      final restored = GitLabQuickBranchRule.fromJson(rule.toJson());

      expect(restored.id, 7);
      expect(restored.label, 'Release');
      expect(restored.pattern, 'release/');
      expect(restored.matchType, GitLabBranchMatchType.contains);
    });

    test('an unrecognised match type falls back to exact rather than throwing', () {
      // What reading a file from a future version with a new match type does.
      final restored = GitLabQuickBranchRule.fromJson({'id': 1, 'label': 'l', 'pattern': 'p', 'matchType': 'something-new'});
      expect(restored.matchType, GitLabBranchMatchType.exact);
    });
  });

  group('GitLabQuickBranchesModel', () {
    // A fresh, unique project id per test, since the model is a singleton and
    // its per-project lists would otherwise leak state between tests.
    var nextProjectId = 900000;
    int newProjectId() => nextProjectId++;

    test('createRule mints ids that do not collide with what is already there', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();

      final first = model.createRule(projectId);
      final second = model.createRule(projectId);

      expect(second.id, isNot(first.id));
    });

    test('replaceRule updates a rule found by id, and appends one that is not', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();
      final rule = model.createRule(projectId);

      rule.label = 'Renamed';
      model.replaceRule(projectId, rule);
      expect(model.forProject(projectId).list.single.label, 'Renamed');

      final external = GitLabQuickBranchRule(id: 999, label: 'External', pattern: 'x');
      model.replaceRule(projectId, external);
      expect(model.forProject(projectId).list.map((r) => r.label), containsAll(['Renamed', 'External']));
    });

    test('deleteRule removes only the matching id', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();
      final keep = model.createRule(projectId);
      final drop = model.createRule(projectId);

      model.deleteRule(projectId, drop);

      expect(model.forProject(projectId).list.map((r) => r.id), [keep.id]);
    });

    test('reorder moves an item forward to the index onReorderItem reports', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();
      final a = model.createRule(projectId)..label = 'a';
      final b = model.createRule(projectId)..label = 'b';
      final c = model.createRule(projectId)..label = 'c';
      model.replaceRule(projectId, a);
      model.replaceRule(projectId, b);
      model.replaceRule(projectId, c);

      // onReorderItem's contract: 2 is where "a" should end up, post-removal.
      model.reorder(projectId, 0, 2);

      expect(model.forProject(projectId).list.map((r) => r.label), ['b', 'c', 'a']);
    });

    test('reorder moves an item backward to the index onReorderItem reports', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();
      final a = model.createRule(projectId)..label = 'a';
      final b = model.createRule(projectId)..label = 'b';
      final c = model.createRule(projectId)..label = 'c';
      model.replaceRule(projectId, a);
      model.replaceRule(projectId, b);
      model.replaceRule(projectId, c);

      // Moves "c" (index 2) to the front.
      model.reorder(projectId, 2, 0);

      expect(model.forProject(projectId).list.map((r) => r.label), ['c', 'a', 'b']);
    });

    test('toggleExactFavorite adds an exact rule, then removes it on a second tap', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();

      expect(model.hasExactFavorite(projectId, 'main'), isFalse);

      model.toggleExactFavorite(projectId, 'main');
      expect(model.hasExactFavorite(projectId, 'main'), isTrue);
      expect(model.forProject(projectId).list.single.matchType, GitLabBranchMatchType.exact);
      expect(model.forProject(projectId).list.single.pattern, 'main');

      model.toggleExactFavorite(projectId, 'main');
      expect(model.hasExactFavorite(projectId, 'main'), isFalse);
      expect(model.forProject(projectId).list, isEmpty);
    });

    test('toggleExactFavorite only touches the one branch it is given', () {
      final model = GitLabQuickBranchesModel();
      final projectId = newProjectId();

      model.toggleExactFavorite(projectId, 'main');
      model.toggleExactFavorite(projectId, 'develop');

      expect(model.hasExactFavorite(projectId, 'main'), isTrue);
      expect(model.hasExactFavorite(projectId, 'develop'), isTrue);

      model.toggleExactFavorite(projectId, 'main');
      expect(model.hasExactFavorite(projectId, 'main'), isFalse);
      expect(model.hasExactFavorite(projectId, 'develop'), isTrue, reason: 'toggling one favorite must not disturb another');
    });
  });

  group('GitLabQuickBranchesModel.resolveBranch', () {
    test('an exact rule resolves to its pattern without touching the network', () async {
      // No DataModel/GitLabDao is wired up in this test at all — if this needed
      // the network, it would throw, not return a value.
      final model = GitLabQuickBranchesModel();
      final rule = GitLabQuickBranchRule(id: 1, label: 'l', pattern: 'main');

      expect(await model.resolveBranch(123, rule), 'main');
    });
  });
}
