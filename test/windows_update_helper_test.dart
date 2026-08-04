import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/dao/windows_update_helper.dart';
import 'package:path/path.dart' as p;

void main() {
  group('apply_update.ps1', () {
    // Read as text rather than executed: the ordering guarantees below are what
    // keep a failed update recoverable, and they are easy to break by accident
    // while editing the script.
    final script = applyUpdateScript;

    test('declares every parameter the launcher passes', () {
      for (final parameter in ['OldPid', 'Install', 'Payload', 'Version', 'Markers', 'LogPath']) {
        expect(script, contains('\$$parameter'), reason: '$parameter is passed by launchHelper');
      }
    });

    test('waits for the executable to unlock before touching anything', () {
      final unlockCheck = script.indexOf('Test-Unlocked');
      final firstMove = script.indexOf('Move-Item');
      expect(unlockCheck, greaterThan(-1));
      expect(unlockCheck, lessThan(firstMove), reason: 'the swap must not begin while the old exe is mapped');
    });

    test('banks the old install before writing anything new', () {
      // The core invariant: the install folder must never hold a mixture of old
      // and new files, because that is the only state that cannot be recovered.
      final banked = script.indexOf('the old install is fully banked');
      final firstCopy = script.indexOf('Copy-Item');
      expect(banked, greaterThan(-1));
      expect(firstCopy, greaterThan(banked), reason: 'copying new files must come after banking the old ones');
    });

    test('records every move in a journal so rollback is exact', () {
      expect(script, contains('Add-Content -LiteralPath \$journal'));
      expect(script, contains('[array]::Reverse(\$names)'));
    });

    test('retries a failed move rather than giving up immediately', () {
      // Antivirus and indexers hold brief handles just after a process exits.
      expect(script, contains(r'$attempt -le 5'));
    });

    test('skips its own working folder when banking', () {
      expect(script, contains(r"$item.Name -eq '.jw_update'"));
    });

    test('rolls back on a process that exits, not on a missing marker', () {
      // Rolling back on a missing marker would mean a regression in writing it
      // silently reverts every update.
      expect(script, contains(r'$new.HasExited'));
      expect(script, contains('treating as success'));
    });

    test('falls back to launching the backup copy when rollback itself fails', () {
      expect(script, contains('Invoke-LastResort'));
      expect(script, contains(r'Start-Process -FilePath $backupExe'));
    });

    test('writes the markers startup bookkeeping looks for', () {
      for (final marker in ['pending_cleanup.json', 'update_failed.json', 'update_ok.']) {
        expect(script, contains(marker));
      }
    });

    test('relaunches with the flag that confirms the update', () {
      expect(script, contains("'--post-update', \$Version"));
    });
  });

  group('preflight probe', () {
    test('emits the sentinel that proves script execution is allowed', () {
      // Its presence in the output is the only signal that a .ps1 can run here.
      expect(preflightProbeScript, contains("Write-Output 'probe-ok'"));
    });

    test('reports the values preflight parses', () {
      for (final key in ['instances=', 'installFree=', 'tempFree=']) {
        expect(preflightProbeScript, contains(key));
      }
    });

    test('uses Get-PSDrive rather than wmic', () {
      expect(preflightProbeScript, contains('Get-PSDrive'));
      // Comment lines are stripped, since the comment explaining why wmic is
      // avoided naturally mentions it.
      final code = preflightProbeScript
          .split('\n')
          .where((line) => !line.trimLeft().startsWith('#'))
          .join('\n')
          .toLowerCase();
      expect(code, isNot(contains('wmic')), reason: 'wmic is removed on Windows 11 24H2 and later');
    });

    test('counts only instances of this exact executable', () {
      expect(preflightProbeScript, contains(r'$_.Path -eq $ExePath'));
    });
  });

  group('helper launch', () {
    test('is not a detached mode', () {
      // Both detached modes map to DETACHED_PROCESS on Windows, which leaves the
      // child with no console. powershell.exe is console-subsystem, so it dies
      // during startup — and silently, because detached also means no stderr.
      expect(WindowsSelfUpdateDao.helperLaunchMode, isNot(ProcessStartMode.detached));
      expect(WindowsSelfUpdateDao.helperLaunchMode, isNot(ProcessStartMode.detachedWithStdio));
    });

    test('passes -File last, so its arguments reach the script', () {
      final args = WindowsSelfUpdateDao.helperArgumentsFor(r'C:\x\apply.ps1', ['-OldPid', '42']);
      final fileIndex = args.indexOf('-File');
      expect(fileIndex, greaterThan(-1));
      expect(args[fileIndex + 1], r'C:\x\apply.ps1');
      // Anything before -File would be read by powershell rather than the script.
      expect(args.sublist(fileIndex + 2), ['-OldPid', '42']);
    });

    test('bypasses execution policy and shows no window', () {
      final args = WindowsSelfUpdateDao.helperArgumentsFor('x.ps1', const []);
      expect(args, containsAllInOrder(['-ExecutionPolicy', 'Bypass']));
      expect(args, containsAllInOrder(['-WindowStyle', 'Hidden']));
      expect(args, contains('-NoProfile'));
    });

    test('the launch mode and flags actually run a script', () async {
      // The regression this pins: with a detached mode the helper never ran at
      // all, so the app exited and nothing happened. Runs a real script through
      // the real flags and requires it to have done its work.
      //
      // Kept under the repo rather than the system temp directory: on the CI
      // image, TEMP sits below a junctioned AppData that PowerShell fails to
      // resolve — the same path that makes a plugin's build script log
      // "Could not find item C:\Users\runneradmin\AppData".
      final work = Directory(p.join(Directory.current.path, '.dart_tool', 'jw_launch_${DateTime.now().microsecondsSinceEpoch}'))
        ..createSync(recursive: true);
      addTearDown(() => work.existsSync() ? work.deleteSync(recursive: true) : null);

      final marker = File(p.join(work.path, 'ran.txt'));
      final script = File(p.join(work.path, 'probe.ps1'))
        ..writeAsStringSync('param([string]\$Out)\nSet-Content -LiteralPath \$Out -Value "ran"\n');

      final process = await Process.start(
        'powershell.exe',
        WindowsSelfUpdateDao.helperArgumentsFor(script.path, ['-Out', marker.path]),
        workingDirectory: work.path,
        mode: WindowsSelfUpdateDao.helperLaunchMode,
      );
      // Captured so a failure here explains itself rather than just saying "no":
      // the original bug was a launch that failed with nowhere to report it.
      final errors = process.stderr.transform(const SystemEncoding().decoder).join();
      final exitCode = await process.exitCode.timeout(const Duration(seconds: 30), onTimeout: () => -1);

      expect(
        marker.existsSync(),
        isTrue,
        reason: 'the script never ran (exit $exitCode). stderr:\n${await errors}',
      );
      expect(marker.readAsStringSync().trim(), 'ran');
    }, timeout: const Timeout(Duration(seconds: 60)));
  });

  group('UpdatePreflight', () {
    test('is installable only with no blockers', () {
      expect(const UpdatePreflight(blockers: []).canAutoInstall, isTrue);
      expect(const UpdatePreflight(blockers: [UpdateBlocker('x', 'y')]).canAutoInstall, isFalse);
    });

    test('distinguishes an unsupported platform, which hides the button entirely', () {
      expect(
        const UpdatePreflight(blockers: [UpdateBlocker.unsupportedPlatform]).isUnsupportedPlatform,
        isTrue,
      );
      expect(
        const UpdatePreflight(blockers: [UpdateBlocker('not-writable', 'y')]).isUnsupportedPlatform,
        isFalse,
      );
    });

    test('summarises every blocker, so nothing is hidden from the user', () {
      const preflight = UpdatePreflight(
        blockers: [UpdateBlocker('a', 'first reason'), UpdateBlocker('b', 'second reason')],
      );
      expect(preflight.summary, contains('first reason'));
      expect(preflight.summary, contains('second reason'));
    });
  });

  group('UpdateAftermath', () {
    test('reports a failure only when one was recorded', () {
      expect(const UpdateAftermath().hadFailure, isFalse);
      expect(const UpdateAftermath(failureReport: '{}').hadFailure, isTrue);
    });
  });
}
