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
