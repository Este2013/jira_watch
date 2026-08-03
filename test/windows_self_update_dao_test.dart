import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:path/path.dart' as p;

/// A zip built in memory, so the extraction guards can be exercised without a
/// real release archive.
File writeZip(Directory dir, String name, List<ArchiveFile> files) {
  final archive = Archive();
  for (final file in files) {
    archive.add(file);
  }
  final bytes = ZipEncoder().encode(archive);
  return File(p.join(dir.path, name))..writeAsBytesSync(bytes);
}

ArchiveFile text(String name, [String content = 'x']) {
  final bytes = Uint8List.fromList(content.codeUnits);
  return ArchiveFile.bytes(name, bytes);
}

/// The files a payload must contain to be considered a usable build.
List<ArchiveFile> validBuild() => [
  text('jira_watch.exe', 'MZ fake'),
  text('flutter_windows.dll', 'dll'),
  text('data/app.so', 'so'),
  text('data/flutter_assets/AssetManifest.bin', 'manifest'),
  text('libmpv-2.dll', 'dll'),
];

void main() {
  late Directory work;
  final dao = WindowsSelfUpdateDao();

  setUp(() => work = Directory.systemTemp.createTempSync('jw_update_test_'));
  tearDown(() {
    if (work.existsSync()) work.deleteSync(recursive: true);
  });

  Directory payloadDir() => Directory(p.join(work.path, 'payload'));

  group('extraction', () {
    test('unpacks a loose-at-root archive, which is the shape releases use', () async {
      final zip = writeZip(work, 'update.zip', validBuild());
      final root = await dao.extractTo(archive: zip, payload: payloadDir());

      expect(root.path, payloadDir().path);
      expect(File(p.join(root.path, 'jira_watch.exe')).existsSync(), isTrue);
      expect(File(p.join(root.path, 'data', 'flutter_assets', 'AssetManifest.bin')).existsSync(), isTrue);
    });

    test('descends into a single wrapping folder', () async {
      // Not the shape this project publishes, but handled rather than rejected.
      final zip = writeZip(work, 'update.zip', [
        for (final f in validBuild()) text('jira_watch-1.7.0/${f.name}', 'x'),
      ]);
      final root = await dao.extractTo(archive: zip, payload: payloadDir());

      expect(p.basename(root.path), 'jira_watch-1.7.0');
      expect(File(p.join(root.path, 'jira_watch.exe')).existsSync(), isTrue);
    });

    test('rejects an archive with no executable anywhere obvious', () async {
      final zip = writeZip(work, 'update.zip', [text('readme.txt'), text('notes/other.txt')]);
      await expectLater(
        dao.extractTo(archive: zip, payload: payloadDir()),
        throwsA(isA<InvalidUpdatePayload>()),
      );
    });

    test('rejects an empty archive', () async {
      final zip = writeZip(work, 'update.zip', []);
      await expectLater(
        dao.extractTo(archive: zip, payload: payloadDir()),
        throwsA(isA<InvalidUpdatePayload>()),
      );
    });

    test('overwrites a previous extraction rather than merging into it', () async {
      final stale = payloadDir();
      stale.createSync(recursive: true);
      File(p.join(stale.path, 'leftover.txt')).writeAsStringSync('from a previous run');

      final zip = writeZip(work, 'update.zip', validBuild());
      final root = await dao.extractTo(archive: zip, payload: stale);

      // A merged tree could pass validation while mixing two builds.
      expect(File(p.join(root.path, 'leftover.txt')).existsSync(), isFalse);
    });
  });

  group('zip-slip', () {
    test('refuses an entry that climbs out with ..', () async {
      final zip = writeZip(work, 'evil.zip', [...validBuild(), text('../escaped.txt', 'pwned')]);
      await expectLater(
        dao.extractTo(archive: zip, payload: payloadDir()),
        throwsA(isA<MaliciousArchiveEntry>()),
      );
      expect(File(p.join(work.path, 'escaped.txt')).existsSync(), isFalse);
    });

    test('refuses a deeply nested climb that normalises outside the target', () async {
      final zip = writeZip(work, 'evil.zip', [...validBuild(), text('data/../../escaped.txt', 'pwned')]);
      await expectLater(
        dao.extractTo(archive: zip, payload: payloadDir()),
        throwsA(isA<MaliciousArchiveEntry>()),
      );
      expect(File(p.join(work.path, 'escaped.txt')).existsSync(), isFalse);
    });

    test('refuses an absolute path and a drive-qualified path', () async {
      for (final name in [r'C:\Windows\System32\evil.dll', '/etc/passwd']) {
        final zip = writeZip(work, 'evil.zip', [...validBuild(), text(name, 'pwned')]);
        await expectLater(
          dao.extractTo(archive: zip, payload: payloadDir()),
          throwsA(isA<MaliciousArchiveEntry>()),
          reason: 'should have refused "$name"',
        );
      }
    });

    test('treats a backslash entry name as a path, not a filename', () async {
      // Zip entries should use forward slashes, but a Windows-built archive may
      // not — and "..\\x" must not be mistaken for an innocuous filename.
      final zip = writeZip(work, 'evil.zip', [...validBuild(), text(r'..\escaped.txt', 'pwned')]);
      await expectLater(
        dao.extractTo(archive: zip, payload: payloadDir()),
        throwsA(isA<MaliciousArchiveEntry>()),
      );
      expect(File(p.join(work.path, 'escaped.txt')).existsSync(), isFalse);
    });
  });

  group('validatePayload', () {
    Directory buildTree({Set<String> omit = const {}, Set<String> empty = const {}}) {
      // Rebuilt from scratch each time: reusing the directory would leave files
      // behind from a previous call and mask an omission.
      final root = Directory(p.join(work.path, 'tree'));
      if (root.existsSync()) root.deleteSync(recursive: true);
      root.createSync(recursive: true);
      for (final entry in WindowsSelfUpdateDao.requiredPayloadEntries) {
        if (omit.contains(entry)) continue;
        final file = File(p.join(root.path, p.joinAll(entry.split('/'))));
        file.parent.createSync(recursive: true);
        file.writeAsStringSync(empty.contains(entry) ? '' : 'content');
      }
      return root;
    }

    test('accepts a complete tree', () {
      expect(() => dao.validatePayload(buildTree()), returnsNormally);
    });

    test('names the missing file, for each required file in turn', () {
      for (final entry in WindowsSelfUpdateDao.requiredPayloadEntries) {
        expect(
          () => dao.validatePayload(buildTree(omit: {entry})),
          throwsA(isA<InvalidUpdatePayload>().having((e) => e.reason, 'reason', contains(entry))),
        );
      }
    });

    test('rejects a zero-length required file', () {
      // A truncated or quarantined extraction can leave the name behind.
      expect(
        () => dao.validatePayload(buildTree(empty: {'flutter_windows.dll'})),
        throwsA(isA<InvalidUpdatePayload>()),
      );
    });
  });

  group('hashOf', () {
    test('matches a known SHA-256', () async {
      final file = File(p.join(work.path, 'abc.txt'))..writeAsStringSync('abc');
      // The canonical SHA-256 of "abc".
      expect(await dao.hashOf(file), 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad');
    });

    test('is stable across a chunk boundary', () async {
      final big = File(p.join(work.path, 'big.bin'))..writeAsBytesSync(List.filled(200000, 7));
      expect(await dao.hashOf(big), await dao.hashOf(big));
      expect(await dao.hashOf(big), hasLength(64));
    });
  });

  group('self-test version gate', () {
    Directory stagedTree() {
      final root = Directory(p.join(work.path, 'staged'))..createSync(recursive: true);
      // A file, not a real binary: the gate must decide before launching anything.
      File(p.join(root.path, WindowsSelfUpdateDao.executableName)).writeAsStringSync('not a real exe');
      return root;
    }

    test('skips builds that predate the flag, without launching them', () async {
      // Launching one would start a whole second copy of the app, write to the
      // same log file, show a window, and then time out — indistinguishable from
      // a genuine failure. Verified against the real 1.6.0 release.
      for (final old in ['1.6.0', '1.5.0', '1.0.2']) {
        expect(
          await dao.selfTestStagedBinary(root: stagedTree(), version: old),
          SelfTestOutcome.skippedUnsupported,
          reason: '$old has no --self-test',
        );
      }
    });

    test('attempts builds from the supporting version onward', () async {
      // The placeholder exe cannot run, so reaching a failure proves the gate let
      // it through rather than skipping.
      for (final current in [WindowsSelfUpdateDao.selfTestSupportedFrom, '1.8.0', '2.0.0']) {
        await expectLater(
          dao.selfTestStagedBinary(root: stagedTree(), version: current, timeout: const Duration(seconds: 2)),
          throwsA(anything),
          reason: '$current should be smoke-tested, not skipped',
        );
      }
    });
  });

  group('failure messages', () {
    test('a checksum mismatch shows both digests, since users paste them into issues', () {
      final message = UpdateChecksumMismatch('aaa', 'bbb').toString();
      expect(message, contains('aaa'));
      expect(message, contains('bbb'));
    });

    test('a missing checksum explains why installing is refused', () {
      expect(UpdateChecksumMissing().toString(), contains('verified'));
    });

    test('a self-test failure reports the exit code', () {
      expect(StagedBinarySelfTestFailed(-1073741515, 'missing dll').toString(), contains('-1073741515'));
    });
  });
}
