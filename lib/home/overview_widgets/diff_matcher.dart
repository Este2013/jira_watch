import 'package:diff_match_patch/diff_match_patch.dart';
import 'package:flutter/material.dart';

/// A widget that displays the diff between two strings,
/// highlighting additions in green, deletions in red,
/// with toggles to show/hide each.
class DiffReviewer extends StatefulWidget {
  final String before;
  final String after;

  final bool showAdditions;
  final bool showDeletions;

  const DiffReviewer({
    super.key,
    required this.before,
    required this.after,
    this.showAdditions = true,
    this.showDeletions = true,
  });

  @override
  State<DiffReviewer> createState() => _DiffReviewerState();
}

class _DiffReviewerState extends State<DiffReviewer> {
  late final List<Diff> _diffs;

  @override
  void initState() {
    super.initState();
    final dmp = DiffMatchPatch();
    _diffs = dmp.diff(widget.before, widget.after);
    dmp.diffCleanupSemantic(_diffs);
  }

  List<TextSpan> _buildSpans() {
    final spans = <TextSpan>[];
    for (var diff in _diffs) {
      switch (diff.operation) {
        case DIFF_INSERT:
          if (!widget.showAdditions) continue;
          spans.add(
            TextSpan(
              text: diff.text,
              style: TextStyle(
                backgroundColor: Colors.green.withAlpha(255 ~/ 3),
              ),
            ),
          );
          break;
        case DIFF_DELETE:
          if (!widget.showDeletions) continue;
          spans.add(
            TextSpan(
              text: diff.text,
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                backgroundColor: Colors.red.withAlpha(255 ~/ 3),
              ),
            ),
          );
          break;
        case DIFF_EQUAL:
          spans.add(TextSpan(text: diff.text));
          break;
      }
    }
    return spans;
  }

  @override
  Widget build(BuildContext context) => RichText(
    text: TextSpan(
      style: DefaultTextStyle.of(context).style,
      children: _buildSpans(),
    ),
  );
}
