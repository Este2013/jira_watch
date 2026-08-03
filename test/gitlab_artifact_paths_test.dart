import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/gitlab_api_model.dart';
import 'package:jira_watcher/models/gitlab_quick_downloads_model.dart';
import 'package:jira_watcher/ui/gitlab_widgets/gitlab_suggest_field.dart';

/// GitLab marks directories inside an artifacts archive with a trailing slash.
/// Getting that convention wrong silently produced patterns that matched nothing,
/// so it is pinned here.
void main() {
  group('artifact path normalisation', () {
    test('strips a trailing slash, and leaves other paths alone', () {
      expect(stripTrailingSlash('AppPackages/'), 'AppPackages');
      expect(stripTrailingSlash('AppPackages'), 'AppPackages');
      expect(stripTrailingSlash('a/b/c.exe'), 'a/b/c.exe');
      expect(stripTrailingSlash(''), '');
    });

    test('reads the path from either key', () {
      expect(gitlabArtifactPathOf({'path': 'a/b.exe', 'name': 'b.exe'}), 'a/b.exe');
      expect(gitlabArtifactPathOf({'name': 'b.exe'}), 'b.exe');
      expect(gitlabArtifactPathOf({}), '');
    });

    test('detects directories by type or by trailing slash', () {
      expect(gitlabArtifactIsDirectory({'path': 'AppPackages/', 'type': 'directory'}), isTrue);
      expect(gitlabArtifactIsDirectory({'path': 'AppPackages/', 'type': 'tree'}), isTrue);
      // No type at all: the trailing slash still settles it.
      expect(gitlabArtifactIsDirectory({'path': 'AppPackages/'}), isTrue);
      expect(gitlabArtifactIsDirectory({'path': 'AppPackages/app.msix', 'type': 'file'}), isFalse);
    });
  });

  group('GitLabQuickDownloadRule', () {
    GitLabQuickDownloadRule rule({
      String job = 'windows:build-x64',
      String path = '',
      bool jobIsRegex = false,
      bool pathIsRegex = true,
      String? stage,
    }) => GitLabQuickDownloadRule(
      id: 1,
      label: 'MSIX installer',
      jobPattern: job,
      pathPattern: path,
      jobIsRegex: jobIsRegex,
      pathIsRegex: pathIsRegex,
      stage: stage,
    );

    test('matches a job by substring, case-insensitively', () {
      final r = rule();
      expect(r.matchesJob({'name': 'windows:build-x64', 'stage': 'build'}), isTrue);
      expect(r.matchesJob({'name': 'WINDOWS:BUILD-X64', 'stage': 'build'}), isTrue);
      expect(r.matchesJob({'name': 'linux:build-x64', 'stage': 'build'}), isFalse);
    });

    test('honours a stage restriction', () {
      final r = rule(stage: 'build');
      expect(r.matchesJob({'name': 'windows:build-x64', 'stage': 'build'}), isTrue);
      expect(r.matchesJob({'name': 'windows:build-x64', 'stage': 'test'}), isFalse);
    });

    test('matches a job by regex when enabled', () {
      final r = rule(job: r'^windows:build-(x64|arm64)$', jobIsRegex: true);
      expect(r.matchesJob({'name': 'windows:build-x64'}), isTrue);
      expect(r.matchesJob({'name': 'windows:build-arm64'}), isTrue);
      expect(r.matchesJob({'name': 'windows:build-x86'}), isFalse);
    });

    test('an invalid regex matches nothing rather than throwing', () {
      final r = rule(job: '([unclosed', jobIsRegex: true);
      expect(r.matchesJob({'name': '([unclosed'}), isFalse);
      expect(r.isValid, isFalse);
    });

    test('matches a versioned file with a generalised pattern', () {
      final generalised = generalizeNumbersToRegex('AppPackages/Elgato Studio_1.4.2.0_x64.msix');
      final r = rule(path: generalised);
      expect(r.matchesPath('AppPackages/Elgato Studio_1.4.2.0_x64.msix'), isTrue);
      // The point of generalising: it survives the next version bump.
      expect(r.matchesPath('AppPackages/Elgato Studio_2.0.11.3_x64.msix'), isTrue);
      expect(r.matchesPath('AppPackages/Elgato Studio_1.4.2.0_arm64.msix'), isFalse);
    });

    test('requires a label and both patterns to be valid', () {
      expect(rule(path: r'.*\.msix$').isValid, isTrue);
      expect(rule(path: '').isValid, isFalse);
      expect(rule(job: '', path: 'x').isValid, isFalse);
      expect(rule(path: '([unclosed').isValid, isFalse);
    });

    test('survives a round trip through json', () {
      final original = rule(path: r'AppPackages/.*\.msix$', stage: 'build');
      final restored = GitLabQuickDownloadRule.fromJson(original.toJson());
      expect(restored.id, original.id);
      expect(restored.label, original.label);
      expect(restored.jobPattern, original.jobPattern);
      expect(restored.pathPattern, original.pathPattern);
      expect(restored.jobIsRegex, original.jobIsRegex);
      expect(restored.pathIsRegex, original.pathIsRegex);
      expect(restored.stage, original.stage);
    });
  });

  group('generalizeNumbersToRegex', () {
    test('escapes metacharacters and turns digit runs into \\d+', () {
      // A hyphen is not a metacharacter outside a character class, so it is
      // deliberately left as-is.
      expect(generalizeNumbersToRegex('MyApp-1.4.2.exe'), r'MyApp-\d+\.\d+\.\d+\.exe');
    });

    test('produces a pattern that matches its own input', () {
      const literal = r'AppPackages/App_1.2.3.0_x64.msix';
      expect(RegExp(generalizeNumbersToRegex(literal)).hasMatch(literal), isTrue);
    });

    test('only offers to generalise when there are digits', () {
      expect(hasGeneralizableNumbers('MyApp-1.4.2.exe'), isTrue);
      expect(hasGeneralizableNumbers('MyApp.exe'), isFalse);
    });
  });

  group('GitLabQuickDownloadMatch', () {
    test('exposes a slash-free path and file name for a directory match', () {
      const match = GitLabQuickDownloadMatch(
        jobId: 1,
        jobName: 'windows:build-x64',
        path: 'AppPackages/',
        isDirectory: true,
      );
      expect(match.cleanPath, 'AppPackages');
      expect(match.fileName, 'AppPackages');
    });

    test('leaves a file path untouched', () {
      const match = GitLabQuickDownloadMatch(
        jobId: 1,
        jobName: 'windows:build-x64',
        path: 'AppPackages/app.msix',
        isDirectory: false,
      );
      expect(match.cleanPath, 'AppPackages/app.msix');
      expect(match.fileName, 'app.msix');
    });
  });
}
