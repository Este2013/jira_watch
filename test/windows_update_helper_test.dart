import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/dao/windows_self_update_dao.dart';
import 'package:jira_watcher/dao/windows_update_helper.dart';

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
