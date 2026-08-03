import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The status vocabulary shared by pipelines and jobs.
///
/// GitLab returns the same set of strings for both, so one mapping covers the
/// pipelines, jobs and (later) merge request views.
enum GitLabStatus {
  created('created', 'Created', Symbols.circle, Color(0xFF868686)),
  waitingForResource('waiting_for_resource', 'Waiting for resource', Symbols.hourglass_empty, Color(0xFF868686)),
  preparing('preparing', 'Preparing', Symbols.hourglass_top, Color(0xFF868686)),
  waitingForCallback('waiting_for_callback', 'Waiting for callback', Symbols.hourglass_top, Color(0xFF868686)),
  pending('pending', 'Pending', Symbols.pending, Color(0xFFB37700)),
  running('running', 'Running', Symbols.progress_activity, Color(0xFF1F75CB)),
  success('success', 'Passed', Symbols.check_circle, Color(0xFF108548)),
  failed('failed', 'Failed', Symbols.cancel, Color(0xFFDD2B0E)),
  canceling('canceling', 'Cancelling', Symbols.pause_circle, Color(0xFF737278)),
  canceled('canceled', 'Cancelled', Symbols.do_not_disturb_on, Color(0xFF737278)),
  skipped('skipped', 'Skipped', Symbols.skip_next, Color(0xFF868686)),
  manual('manual', 'Manual', Symbols.settings, Color(0xFF737278)),
  scheduled('scheduled', 'Scheduled', Symbols.schedule, Color(0xFF737278)),
  unknown('unknown', 'Unknown', Symbols.help, Color(0xFF868686));

  const GitLabStatus(this.id, this.label, this.icon, this.color);

  final String id;
  final String label;
  final IconData icon;
  final Color color;

  static GitLabStatus from(String? id) => values.firstWhere((s) => s.id == id, orElse: () => GitLabStatus.unknown);

  bool get isRunning => this == running || this == pending || this == preparing || this == canceling;
  bool get isFinished => this == success || this == failed || this == canceled || this == skipped;
}

class GitLabStatusChip extends StatelessWidget {
  const GitLabStatusChip({super.key, required this.status, this.compact = false});

  final GitLabStatus status;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    // The palette is GitLab's, so it needs lightening on dark backgrounds to
    // stay legible.
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = isDark ? HSLColor.fromColor(status.color).withLightness(.65).toColor() : status.color;

    return Tooltip(
      message: status.label,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: compact ? 6 : 8, vertical: 2),
        decoration: BoxDecoration(
          color: color.withValues(alpha: .12),
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: color.withValues(alpha: .5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Icon(status.icon, size: compact ? 12 : 14, color: color, fill: status.isFinished ? 1 : 0),
            if (!compact)
              Text(
                status.label,
                style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }
}

/// Formats a GitLab duration (seconds, possibly fractional) as `1m 04s`.
String formatGitLabDuration(num? seconds) {
  if (seconds == null) return '—';
  final total = seconds.round();
  if (total < 60) return '${total}s';
  final minutes = total ~/ 60;
  final rest = total % 60;
  if (minutes < 60) return '${minutes}m ${rest.toString().padLeft(2, '0')}s';
  return '${minutes ~/ 60}h ${(minutes % 60).toString().padLeft(2, '0')}m';
}

/// Short SHA, the way GitLab displays it.
String shortSha(String? sha) => (sha == null || sha.length < 8) ? (sha ?? '—') : sha.substring(0, 8);
