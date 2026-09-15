import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_home_view.dart';

void main() {
  group('activeProjectFromFilters', () {
    test('an empty filter map lands on the combined feed', () {
      expect(activeProjectFromFilters({}), isNull);
    });

    test('a saved tab is read back', () {
      expect(activeProjectFromFilters({'active_project': 'STUDIO'}), 'STUDIO');
    });

    test('an explicitly saved "All" wins over any leftover legacy list', () {
      expect(
        activeProjectFromFilters({
          'active_project': null,
          'active_projects': ['STUDIO'],
        }),
        isNull,
      );
    });

    test('a lone legacy project filter becomes that project\'s tab', () {
      expect(
        activeProjectFromFilters({
          'active_projects': ['STUDIO'],
        }),
        'STUDIO',
      );
    });

    test('several legacy project filters fall back to the combined feed', () {
      expect(
        activeProjectFromFilters({
          'active_projects': ['STUDIO', 'WAVE'],
        }),
        isNull,
      );
    });

    test('no legacy project filter is already the combined feed', () {
      expect(activeProjectFromFilters({'active_projects': []}), isNull);
    });
  });
}
