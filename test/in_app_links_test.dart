import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/ui/utils/in_app_links.dart';

void main() {
  setUp(() => JiraAuth().domain = 'example.atlassian.net');
  tearDown(() => JiraAuth().domain = null);

  group('work item links', () {
    test('a browse URL on this site is a work item', () {
      final link = inAppLinkFor('https://example.atlassian.net/browse/STUDIO-1234');

      expect(link?.kind, InAppLinkKind.jiraWorkItem);
      expect(link?.id, 'STUDIO-1234');
    });

    test('the key is read out of a board URL too', () {
      // What the address bar holds while looking at a board, which is what
      // most people copy.
      final link = inAppLinkFor('https://example.atlassian.net/jira/software/projects/WL/boards/3?selectedIssue=WL-77');

      expect(link?.id, 'WL-77');
    });

    test('a lowercase key is normalised', () {
      expect(inAppLinkFor('https://example.atlassian.net/browse/studio-1')?.id, 'STUDIO-1');
    });

    test('a browse URL with a query and a fragment still resolves', () {
      expect(inAppLinkFor('https://example.atlassian.net/browse/WL-1?filter=2#comment-3')?.id, 'WL-1');
    });

    test('something that is not a key is not a work item', () {
      expect(inAppLinkFor('https://example.atlassian.net/browse/not-a-key-at-all'), isNull);
      expect(inAppLinkFor('https://example.atlassian.net/secure/Dashboard.jspa'), isNull);
    });
  });

  group('wiki links', () {
    test('a space page URL is a page', () {
      final link = inAppLinkFor('https://example.atlassian.net/wiki/spaces/QA/pages/123456/Some+Title');

      expect(link?.kind, InAppLinkKind.confluencePage);
      expect(link?.id, '123456');
    });

    test('the older viewpage URL is a page too', () {
      expect(inAppLinkFor('https://example.atlassian.net/wiki/pages/viewpage.action?pageId=987')?.id, '987');
    });

    test('a tiny wiki link is left to the browser, since its id is unknowable', () {
      expect(inAppLinkFor('https://example.atlassian.net/wiki/x/AbCdEf'), isNull);
    });

    test('a wiki URL is never mistaken for a work item', () {
      // Both products share one host, so the path is the only thing that
      // separates them — and a space key looks a lot like a project key.
      expect(inAppLinkFor('https://example.atlassian.net/wiki/spaces/WL/overview'), isNull);
    });
  });

  group('everything else', () {
    test('the same shapes on another site are not ours to open', () {
      expect(inAppLinkFor('https://someone-else.atlassian.net/browse/STUDIO-1'), isNull);
      expect(inAppLinkFor('https://someone-else.atlassian.net/wiki/spaces/QA/pages/1/X'), isNull);
    });

    test('an ordinary link is left alone', () {
      expect(inAppLinkFor('https://app.qase.io/project/WL'), isNull);
      expect(inAppLinkFor('https://gitlab.com/group/project/-/merge_requests/9'), isNull);
    });

    test('nothing resolves while the app has no site', () {
      JiraAuth().domain = null;

      expect(inAppLinkFor('https://example.atlassian.net/browse/STUDIO-1'), isNull);
    });

    test('junk does not throw', () {
      expect(inAppLinkFor(''), isNull);
      expect(inAppLinkFor('not a url'), isNull);
      expect(inAppLinkFor('example.atlassian.net/browse/WL-1'), isNull);
    });

    test('the host is matched whatever its casing', () {
      expect(inAppLinkFor('https://EXAMPLE.Atlassian.NET/browse/WL-1')?.id, 'WL-1');
    });
  });
}
