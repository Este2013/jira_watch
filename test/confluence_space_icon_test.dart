import 'package:confluence_api/api.dart' as confluence;
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';

void main() {
  group('picking a space icon URL', () {
    test('prefers the API link over the web path', () {
      // The web `path` can be an /aa-avatar/ route, which answers 401 to an API
      // token — the spec says outright to use apiDownloadLink instead.
      final icon = confluence.SpaceIcon(
        path: '/wiki/aa-avatar/3382476835',
        apiDownloadLink: '/wiki/api/v2/spaces/3382476835/icon',
      );

      expect(ConfluenceApi.iconPathOf(icon), '/wiki/api/v2/spaces/3382476835/icon');
    });

    test('falls back to the path when there is no API link', () {
      // apiDownloadLink is only returned for global spaces, so a personal
      // space has nothing else to offer.
      final icon = confluence.SpaceIcon(path: '/wiki/download/attachments/1/logo.png');

      expect(ConfluenceApi.iconPathOf(icon), '/wiki/download/attachments/1/logo.png');
    });

    test('treats an empty string as absent rather than as a URL', () {
      expect(ConfluenceApi.iconPathOf(confluence.SpaceIcon(path: '', apiDownloadLink: '')), isNull);
      expect(ConfluenceApi.iconPathOf(confluence.SpaceIcon(path: '', apiDownloadLink: '/wiki/api/x')), '/wiki/api/x');
    });

    test('has nothing to offer for a space with no icon', () {
      expect(ConfluenceApi.iconPathOf(null), isNull);
      expect(ConfluenceApi.iconPathOf(confluence.SpaceIcon()), isNull);
    });
  });

  group('decoding a space emoji', () {
    // Confluence stores the codepoints rather than the character.
    const books = '\u{1f4da}';

    test('reads a single codepoint', () {
      expect(decodeConfluenceEmoji('1f4da'), books);
    });

    test('joins a multi-codepoint emoji', () {
      // A zero-width joiner sequence: several codepoints, one glyph.
      expect(decodeConfluenceEmoji('1f468-200d-1f4bb'), '\u{1f468}\u{200d}\u{1f4bb}');
    });

    test('reads the value out of a wrapped property', () {
      expect(decodeConfluenceEmoji({'value': '1f4da'}), books);
    });

    test('passes an actual character through unchanged', () {
      expect(decodeConfluenceEmoji(books), books);
    });

    test('declines a shortname, which needs a table to resolve', () {
      // Better no icon than the literal text ":books:" in the tab strip.
      expect(decodeConfluenceEmoji(':books:'), isNull);
    });

    test('declines nonsense rather than throwing mid-build', () {
      expect(decodeConfluenceEmoji(null), isNull);
      expect(decodeConfluenceEmoji(''), isNull);
      expect(decodeConfluenceEmoji('   '), isNull);
      // Past the top of Unicode — fromCharCodes would throw on this.
      expect(decodeConfluenceEmoji('ffffffff'), isNull);
      expect(decodeConfluenceEmoji('1f4da-zzzz'), isNull);
    });
  });

  group('re-resolving a stored icon path', () {
    test('spots the path a saved tab cannot fetch', () {
      expect(ConfluenceApi.isUnauthenticatableIconPath('/wiki/aa-avatar/3382476835'), isTrue);
    });

    test('leaves a download path alone', () {
      expect(ConfluenceApi.isUnauthenticatableIconPath('/wiki/download/attachments/1/logo.png'), isFalse);
      expect(ConfluenceApi.isUnauthenticatableIconPath('/wiki/api/v2/spaces/1/icon'), isFalse);
    });
  });
}
