import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/app_changelog_data.dart';
import 'package:jira_watcher/ui/utils/app_changelog.dart';

/// What the changelog dialog actually puts on screen, as plain text.
///
/// Mirrors how `ChangeLogCard` assembles its sections, minus the "What's new"
/// header, which is chrome rather than content.
String renderedByUi(List<ChangeLogSection> sections) => TextSpan(
  children: [
    for (final section in sections) ...[section.toTextSpan(), const TextSpan(text: '\n')],
  ],
).toPlainText().trimRight();

void main() {
  group('changeLogPlainTextFor', () {
    test('matches what the UI renders, for every version', () {
      // The whole point of splitting the data out of the UI: the string published
      // to the server and the text shown in the app come from one source. If the
      // two renderings ever diverge, this is what says so.
      expect(appChangeLog, isNotEmpty);
      for (final (version, sections) in appChangeLog) {
        expect(
          changeLogPlainTextFor(version),
          renderedByUi(sections),
          reason: 'plain-text and rich-text renderings disagree for $version',
        );
      }
    });

    test('returns null for a version with no entry', () {
      // The release tool treats this as a hard failure rather than publishing a
      // release with empty notes.
      expect(changeLogPlainTextFor('99.99.99'), isNull);
    });

    test('covers the version currently being built', () {
      // Catches the easy mistake of bumping pubspec and forgetting the changelog.
      expect(changeLogPlainTextFor('1.7.0'), isNotNull);
      expect(changeLogPlainTextFor('1.7.0'), contains('GitLab'));
    });

    test('has no trailing whitespace, matching the published entries', () {
      for (final (version, _) in appChangeLog) {
        final text = changeLogPlainTextFor(version)!;
        expect(text, text.trimRight(), reason: '$version has trailing whitespace');
      }
    });

    test('uses the runic bullet and a space after the section emoji', () {
      // Both are places where the hand-maintained server copies drifted: some
      // used tabs, and some rendered "✨Features:" with no space.
      final text = changeLogPlainTextFor('1.6.0')!;
      expect(text, contains(' ᛫ '));
      expect(text, contains('✨ Features:'));
      expect(text, isNot(contains('\t')));
    });

    test('every version key is dotted-numeric', () {
      // The update check compares versions by splitting on '.' and parsing ints,
      // so a key like "1.8.0-beta.1" would make it useless for that user.
      for (final (version, _) in appChangeLog) {
        expect(
          RegExp(r'^\d+(\.\d+)*$').hasMatch(version),
          isTrue,
          reason: '"$version" is not comparable by the update check',
        );
      }
    });

    test('versions are ordered newest first', () {
      // The dialog's paging and the release tool both rely on this.
      List<int> parts(String v) => v.split('.').map(int.parse).toList();
      for (var i = 1; i < appChangeLog.length; i++) {
        final newer = parts(appChangeLog[i - 1].$1);
        final older = parts(appChangeLog[i].$1);
        expect(
          _compare(newer, older) > 0,
          isTrue,
          reason: '${appChangeLog[i - 1].$1} should sort above ${appChangeLog[i].$1}',
        );
      }
    });
  });

  group('ChangeLogItem.toPlainText', () {
    test('indents nested items and hangs wrapped lines under the bullet', () {
      final item = ChangeLogItem(
        'parent',
        subItems: [ChangeLogItem('child'), ChangeLogItem('two\nlines')],
      );
      // A nested level adds four spaces of indent, then the three-character
      // bullet prefix on top — so five spaces precede a child's bullet. A wrapped
      // line hangs under the text rather than under the bullet.
      expect(item.toPlainText(), ' ᛫ parent\n     ᛫ child\n     ᛫ two\n       lines');
    });
  });
}

int _compare(List<int> a, List<int> b) {
  for (var i = 0; i < a.length || i < b.length; i++) {
    final l = i < a.length ? a[i] : 0;
    final r = i < b.length ? b[i] : 0;
    if (l != r) return l - r;
  }
  return 0;
}
