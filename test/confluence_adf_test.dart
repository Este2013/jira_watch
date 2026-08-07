import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_adf.dart';

Map<String, dynamic> doc(List<Map<String, dynamic>> content) => {'type': 'doc', 'version': 1, 'content': content};

Map<String, dynamic> paragraph(String text) => {
  'type': 'paragraph',
  'content': [
    {'type': 'text', 'text': text},
  ],
};

void main() {
  group('confluencePageIdIn', () {
    test('reads the id out of a modern page URL', () {
      expect(
        confluencePageIdIn('https://elgato.atlassian.net/wiki/spaces/ACC/pages/186417159/Some+Title'),
        '186417159',
      );
    });

    test('reads the id out of a viewpage URL', () {
      expect(
        confluencePageIdIn('https://elgato.atlassian.net/wiki/pages/viewpage.action?pageId=190942862'),
        '190942862',
      );
    });

    test('gives up on a tiny link, which only the server can resolve', () {
      // Guessing here would open the wrong page; the browser gets it instead.
      expect(confluencePageIdIn('https://elgato.atlassian.net/wiki/x/Fc1bBw'), isNull);
    });

    test('gives up on a space URL, which names no page', () {
      expect(confluencePageIdIn('https://elgato.atlassian.net/wiki/spaces/ACC'), isNull);
    });

    test('gives up on a link out of Confluence', () {
      expect(confluencePageIdIn('https://example.com/pages/12345'), '12345', reason: 'the shape matches, so this is left to the caller to bound');
      expect(confluencePageIdIn('https://example.com/docs/intro'), isNull);
    });

    test('ignores a non-numeric id rather than opening a page called "new"', () {
      expect(confluencePageIdIn('https://elgato.atlassian.net/wiki/spaces/ACC/pages/new'), isNull);
    });

    test('survives something that is not a URL at all', () {
      expect(confluencePageIdIn('not a url'), isNull);
    });
  });

  group('adfToPlainText', () {
    test('reads the prose out of paragraphs, one per line', () {
      expect(
        adfToPlainText(doc([paragraph('First.'), paragraph('Second.')])),
        'First.\nSecond.',
      );
    });

    test('keeps list items on separate lines', () {
      final adf = doc([
        {
          'type': 'bulletList',
          'content': [
            {
              'type': 'listItem',
              'content': [paragraph('one')],
            },
            {
              'type': 'listItem',
              'content': [paragraph('two')],
            },
          ],
        },
      ]);

      expect(adfToPlainText(adf), 'one\ntwo');
    });

    test('reads inline nodes a diff would otherwise miss', () {
      final adf = doc([
        {
          'type': 'paragraph',
          'content': [
            {'type': 'text', 'text': 'Owner: '},
            {
              'type': 'mention',
              'attrs': {'id': 'abc', 'text': '@Esteban'},
            },
            {'type': 'text', 'text': ' status '},
            {
              'type': 'status',
              'attrs': {'text': 'Done', 'color': 'green'},
            },
          ],
        },
      ]);

      expect(adfToPlainText(adf), 'Owner: @Esteban status Done');
    });

    test('collapses the blank runs that nesting produces', () {
      // Nested blocks each end with a newline, so a section three levels deep
      // would otherwise show as several blank lines and read as a change when
      // only the nesting moved.
      final adf = doc([
        {
          'type': 'layoutSection',
          'content': [
            {
              'type': 'layoutColumn',
              'content': [paragraph('inside')],
            },
          ],
        },
        paragraph('after'),
      ]);

      expect(adfToPlainText(adf), 'inside\n\nafter');
    });

    test('is empty for a page with no body', () {
      expect(adfToPlainText(null), '');
      expect(adfToPlainText(doc([])), '');
    });

    test('two revisions differing by one word differ by one word', () {
      // The property the comparison depends on: unrelated structure must not
      // leak into the diff.
      final before = adfToPlainText(doc([paragraph('The cat sat.'), paragraph('Unchanged.')]));
      final after = adfToPlainText(doc([paragraph('The dog sat.'), paragraph('Unchanged.')]));

      expect(before, 'The cat sat.\nUnchanged.');
      expect(after, 'The dog sat.\nUnchanged.');
    });
  });
}
