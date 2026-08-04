import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/file_download_service.dart';
import 'package:jira_watcher/dao/gitlab_download_service.dart';

void main() {
  group('DownloadFailed wording', () {
    test('is provider-neutral by default', () {
      // The shared core is used by the app updater too, so its messages must not
      // mention GitLab.
      expect(DownloadFailed(404, '').toString(), isNot(contains('GitLab')));
      expect(DownloadFailed(404, '').toString(), contains('404'));
      expect(DownloadFailed(403, '').toString(), contains('403'));
      expect(DownloadFailed(500, 'oops').toString(), contains('oops'));
    });

    test('defers to a caller-supplied description', () {
      final failure = DownloadFailed(404, '', describe: (code, detail) => 'custom $code');
      expect(failure.toString(), 'custom 404');
    });
  });

  group('DownloadTask', () {
    DownloadTask task() => DownloadTask(label: 'x', destination: File('x'));

    test('reports an indeterminate fraction until a total is known', () {
      final t = task();
      expect(t.isIndeterminate, isTrue);
      expect(t.fraction, isNull);
      t.total = 0; // a content-length of zero is still no information
      expect(t.isIndeterminate, isTrue);
    });

    test('clamps the fraction when more bytes arrive than were advertised', () {
      final t = task()..total = 100;
      expect(t.fraction, 0.0);
      t.received = 50;
      expect(t.fraction, 0.5);
      // A content-length that undercounts must not drive a progress bar past 1.0.
      t.received = 150;
      expect(t.fraction, 1.0);
    });

    test('notifies listeners on cancel', () {
      final t = task();
      var notified = 0;
      t.addListener(() => notified++);
      t.cancel();
      expect(t.isCancelled, isTrue);
      expect(notified, 1);
    });
  });

  group('GitLab adapter', () {
    test('keeps its task and cancellation types usable as the shared ones', () {
      // These are typedefs onto the shared names; the `is` check below is what
      // gitlab_download_ui.dart relies on to swallow cancellation.
      final GitLabDownloadTask t = DownloadTask(label: 'x', destination: File('x'));
      expect(t, isA<DownloadTask>());

      final Object cancelled = DownloadCancelled();
      expect(cancelled is GitLabDownloadCancelled, isTrue);
    });
  });
}
