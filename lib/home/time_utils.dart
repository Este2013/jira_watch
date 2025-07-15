import 'package:flutter/material.dart';

String timeAgo({DateTime? time, String? timeStr}) {
  final updated = (time ?? DateTime.parse(timeStr!)).toLocal();
  final now = DateTime.now();
  final diff = now.difference(updated);

  if (diff.inSeconds < 60) {
    return 'Just now';
  } else if (diff.inMinutes < 60) {
    return '${diff.inMinutes} min${diff.inMinutes == 1 ? '' : 's'} ago';
  } else if (diff.inHours < 24) {
    return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
  } else if (diff.inDays < 7) {
    return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
  } else if (diff.inDays < 30) {
    final weeks = (diff.inDays / 7).floor();
    return '$weeks week${weeks == 1 ? '' : 's'} ago';
  } else if (diff.inDays < 365) {
    final months = (diff.inDays / 30).floor();
    return '$months month${months == 1 ? '' : 's'} ago';
  } else {
    final years = (diff.inDays / 365).floor();
    return '$years year${years == 1 ? '' : 's'} ago';
  }
}

class TimeAgoDisplay extends StatelessWidget {
  const TimeAgoDisplay({super.key, this.time, this.timeStr}) : assert(time != null || timeStr != null);

  final DateTime? time;
  final String? timeStr;

  @override
  Widget build(BuildContext context) => Text(
    timeAgo(time: time, timeStr: timeStr),
    style: TextStyle(fontSize: 12, color: Theme.of(context).brightness == Brightness.light ? Colors.grey[700] : Colors.grey[300]),
  );
}
