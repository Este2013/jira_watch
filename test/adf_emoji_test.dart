import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/adf_emoji.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_doc_renderer.dart';

Map<String, dynamic> doc(List<Map<String, dynamic>> content) => {'type': 'doc', 'version': 1, 'content': content};

/// The comment that crashed the renderer: an emoji node with nothing but a
/// shortname, where the old code read `attrs['text']` into a String.
Map<String, dynamic> kudosComment() => doc([
  {
    'type': 'paragraph',
    'content': [
      {'type': 'text', 'text': 'The onboarding is well done though, kudos to the team '},
      {
        'type': 'emoji',
        'attrs': {'shortName': ':clap:'},
      },
    ],
  },
]);

Future<void> pump(WidgetTester tester, Map<String, dynamic> adf) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(child: AdfRenderer(adf: adf, attachments: const [])),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  group('emoji nodes', () {
    testWidgets('a node carrying only a shortName renders instead of throwing', (tester) async {
      await pump(tester, kudosComment());

      expect(tester.takeException(), isNull);
      expect(find.text('\u{1f44f}'), findsOneWidget);
    });

    testWidgets('an unknown shortName falls back to the shortname itself', (tester) async {
      await pump(
        tester,
        doc([
          {
            'type': 'paragraph',
            'content': [
              {
                'type': 'emoji',
                'attrs': {'shortName': ':not_a_real_emoji:'},
              },
            ],
          },
        ]),
      );

      expect(tester.takeException(), isNull);
      expect(find.text(':not_a_real_emoji:'), findsOneWidget);
    });

    testWidgets('a node with no attrs at all renders nothing rather than throwing', (tester) async {
      await pump(
        tester,
        doc([
          {
            'type': 'paragraph',
            'content': [
              {'type': 'emoji'},
            ],
          },
        ]),
      );

      expect(tester.takeException(), isNull);
    });
  });

  group('resolving an emoji', () {
    test('prefers the text attribute, which already is the character', () {
      expect(adfEmojiCharacter({'shortName': ':clap:', 'id': '1f44f', 'text': '\u{1f44f}'}), '\u{1f44f}');
    });

    test('decodes the id when there is no text', () {
      expect(adfEmojiCharacter({'shortName': ':clap:', 'id': '1f44f'}), '\u{1f44f}');
    });

    test('joins an id built from several codepoints', () {
      expect(adfEmojiCharacter({'shortName': ':man_technologist:', 'id': '1f468-200d-1f4bb'}), '\u{1f468}\u{200d}\u{1f4bb}');
    });

    test('falls back to the shortname table', () {
      expect(adfEmojiCharacter({'shortName': ':clap:'}), '\u{1f44f}');
      expect(adfEmojiCharacter({'shortName': ':tada:'}), '\u{1f389}');
    });

    test('ignores a text attribute that is only the shortname repeated', () {
      // What an Atlassian emoji carries. The table still gets its turn.
      expect(adfEmojiCharacter({'shortName': ':thumbsup:', 'text': ':thumbsup:'}), '\u{1f44d}');
    });

    test('declines an Atlassian id rather than reading it as codepoints', () {
      expect(adfEmojiCharacter({'shortName': ':check_mark:', 'id': 'atlassian-check_mark'}), isNull);
    });

    test('declines an emoji it has no way to resolve', () {
      expect(adfEmojiCharacter({'shortName': ':some_site_emoji:'}), isNull);
      expect(adfEmojiCharacter(null), isNull);
      expect(adfEmojiCharacter(const {}), isNull);
    });
  });

  group('shortnames', () {
    test('are matched whatever their casing, and with or without the colons', () {
      expect(emojiForShortName(':CLAP:'), '\u{1f44f}');
      expect(emojiForShortName('clap'), '\u{1f44f}');
    });

    test('accept the aliases Atlassian uses', () {
      expect(emojiForShortName(':+1:'), emojiForShortName(':thumbsup:'));
      expect(emojiForShortName(':-1:'), emojiForShortName(':thumbsdown:'));
    });

    test('carry a skin tone onto the base emoji', () {
      expect(emojiForShortName(':clap::skin-tone-2:'), '\u{1f44f}\u{1f3fb}');
      expect(emojiForShortName(':clap::skin-tone-6:'), '\u{1f44f}\u{1f3ff}');
    });

    test('decline a tone on an emoji that is not in the table', () {
      expect(emojiForShortName(':not_real::skin-tone-2:'), isNull);
    });

    test('decline an empty name', () {
      expect(emojiForShortName(''), isNull);
      expect(emojiForShortName('  '), isNull);
    });
  });
}
