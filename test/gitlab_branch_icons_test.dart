import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_branch_icons.dart';
import 'package:material_symbols_icons/symbols.dart';

void main() {
  group('gitLabBranchIcon', () {
    test('resolves a known name to its icon', () {
      expect(gitLabBranchIcon('rocket_launch'), Symbols.rocket_launch);
    });

    test('falls back to the star for a name this build has never heard of', () {
      // What resolving a rule saved by a future version, with an icon name
      // this build's curated list does not have, must do instead of failing
      // to render at all.
      expect(gitLabBranchIcon('some_future_icon_name'), Symbols.star);
    });
  });

  test('every quick-select name is actually in the curated map', () {
    for (final name in gitLabBranchQuickIconNames) {
      expect(gitLabBranchIconChoices.containsKey(name), isTrue, reason: '"$name" is offered as a quick pick but missing from the full list');
    }
  });
}
