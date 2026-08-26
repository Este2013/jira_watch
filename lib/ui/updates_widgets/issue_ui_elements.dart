import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows a work item's icon and key, formatting appropriately for links and adding a copy button if requested.
class WorkItemBadge extends StatefulWidget {
  const WorkItemBadge(
    this.label, {
    super.key,
    this.url,
    this.iconUrl,
    this.badgeSize = 24,
    this.copyable = false,
    this.compact = false,
    this.workItemKeyForDialog,
    this.tooltipMessage,
  });

  final int badgeSize;
  final String label;
  final String? url;
  final String? workItemKeyForDialog;
  final String? iconUrl;
  final bool copyable, compact;

  /// Shown on hover over the whole badge, e.g. the full project name when
  /// [compact] has hidden it, or a parent issue's title. Null/empty shows
  /// no tooltip at all — not every badge needs one (the label itself is
  /// already right there when not [compact]).
  final String? tooltipMessage;

  @override
  State<WorkItemBadge> createState() => _WorkItemBadgeState();
}

class _WorkItemBadgeState extends State<WorkItemBadge> {
  bool _hovering = false;
  bool _hoveringCopy = false;
  bool _hoveringLink = false;

  @override
  Widget build(BuildContext context) {
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.iconUrl != null)
          SizedBox.square(
            dimension: widget.badgeSize.toDouble(),
            child: JiraAvatar(url: widget.iconUrl!),
          ),
        const SizedBox(width: 4),

        if (!widget.compact)
          MouseRegion(
            onEnter: (_) => setState(() => _hovering = true),
            onExit: (_) => setState(() => _hovering = false),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (widget.workItemKeyForDialog != null) {
                      showDialog(context: context, builder: (context) => SingleJiraWorkItemDialog(JiraWorkItemData({'key': widget.workItemKeyForDialog!})));
                      return;
                    }
                    if (widget.url != null) {
                      launchUrl(
                        Uri.parse(widget.url!),
                        mode: LaunchMode.externalApplication,
                      );
                      return;
                    }
                  },
                  child: Text(
                    widget.label,
                    style: widget.url != null && _hovering ? const TextStyle(decoration: TextDecoration.underline) : null,
                  ),
                ),

                if (widget.copyable)
                  AnimatedSize(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOutCubic,
                    alignment: Alignment.centerLeft,
                    clipBehavior: Clip.hardEdge,
                    child: _hovering
                        ? Row(
                            key: const ValueKey('copy-area'),
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(width: 4),
                              MouseRegion(
                                onEnter: (_) => setState(() => _hoveringLink = true),
                                onExit: (_) => setState(() => _hoveringLink = false),
                                child: GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(text: widget.url!));
                                    showAppSnackBar(context, SnackBar(content: Text('Copied ${widget.url}')));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Transform.rotate(
                                      angle: -pi / 4,
                                      child: Icon(
                                        Symbols.link,
                                        size: 16,
                                        color: _hoveringLink ? Theme.of(context).hintColor : Theme.of(context).iconTheme.color,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              MouseRegion(
                                onEnter: (_) => setState(() => _hoveringCopy = true),
                                onExit: (_) => setState(() => _hoveringCopy = false),
                                child: GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(
                                      ClipboardData(text: widget.label),
                                    );
                                    showAppSnackBar(context, SnackBar(content: Text('Copied ${widget.label}')));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                    child: Icon(
                                      Symbols.content_copy,
                                      size: 16,
                                      color: _hoveringCopy ? Theme.of(context).hintColor : Theme.of(context).iconTheme.color,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],
                          )
                        : const SizedBox(width: 8, key: ValueKey('copy-area-empty')),
                  ),
              ],
            ),
          ),
      ],
    );
    final tooltip = widget.tooltipMessage;
    return tooltip == null || tooltip.isEmpty ? content : Tooltip(message: tooltip, child: content);
  }
}

/// Shows the work items project, parent and key as [WorkItemBadge]s.
class WorkItemLinkWithParentsRow extends StatefulWidget {
  final JiraWorkItemData workItem;
  final bool compact;

  const WorkItemLinkWithParentsRow(this.workItem, {super.key, this.compact = false});

  @override
  State<WorkItemLinkWithParentsRow> createState() => _WorkItemLinkWithParentsRowState();
}

class _WorkItemLinkWithParentsRowState extends State<WorkItemLinkWithParentsRow> {
  String? _workItemUrl(dynamic workItemKey) {
    final domain = JiraAuth().domain;
    if (domain != null && workItemKey != null) {
      return 'https://$domain/browse/$workItemKey';
    }
    return null;
  }

  /// Roughly how wide [text] renders in the ambient [DefaultTextStyle] —
  /// only ever used to compare against the space this row actually has, to
  /// decide whether the project name has room, never to lay anything out
  /// directly.
  double _textWidth(BuildContext context, String text) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: DefaultTextStyle.of(context).style),
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    return painter.width;
  }

  @override
  Widget build(BuildContext context) {
    final workItem = widget.workItem;
    final fields = workItem['fields'] ?? {};
    final project = fields['project'] ?? {};
    final parent = fields['parent'];
    final projectName = project['name'] ?? '';

    int badgeSize = 16;

    final projectIconUrl = project['avatarUrls']?['${badgeSize}x$badgeSize'] ?? project['iconUrl'];
    final parentKey = parent?['key'];
    final parentIconUrl = parent?['fields']?['issuetype']?['iconUrl'];
    final parentTitle = parent?['fields']?['summary'] as String?;

    final issueKey = workItem['key'] ?? '';

    return LayoutBuilder(
      builder: (context, constraints) {
        // A rough estimate of what this row needs to show a given
        // combination of segments in full — badge icon + gap, then its
        // label (skipped for a folded segment, which still keeps its icon
        // and the separator after it), then the " / " separator. Only ever
        // compared against the space actually available, never used to lay
        // anything out directly.
        const iconAndGap = 16 + 4.0;
        const separator = 6 + 12 + 6.0;
        // The issue key badge's copy/link icons only appear on hover, but
        // this has to budget for that expanded width up front regardless —
        // there's no rebuild-on-hover here to react to it appearing later,
        // and that's exactly what was causing the overflow they reported:
        // the row fit right up until a reader actually hovered it.
        const maxCopyAreaWidth = 4 + 24 + 24 + 4.0;
        double neededWidth({required bool foldProject, required bool foldParent}) {
          double w = 0;
          if (projectIconUrl != null) w += iconAndGap + (foldProject ? 0 : _textWidth(context, projectName)) + separator;
          if (parentKey != null && !widget.compact) w += iconAndGap + (foldParent ? 0 : _textWidth(context, parentKey)) + separator;
          return w + iconAndGap + _textWidth(context, issueKey) + maxCopyAreaWidth;
        }

        // Folding the project name to just its icon is the first thing to
        // give under space pressure — it's the segment a reader needs
        // least, since the epic and issue key are what actually identify
        // this specific item. The epic only follows suit once folding the
        // project name alone still isn't enough; it never folds on its own
        // while the project name is still shown in full.
        final fitsInFull = neededWidth(foldProject: false, foldParent: false) <= constraints.maxWidth;
        final fitsProjectFolded = neededWidth(foldProject: true, foldParent: false) <= constraints.maxWidth;
        final collapseProject = !fitsInFull;
        final collapseParent = !fitsInFull && !fitsProjectFolded;

        return Row(
          // min, not the Row default of max — this only has a meaningful
          // maxWidth to react to once its caller actually bounds it (see
          // JiraWorkItemPreviewItem, which wraps this in a ConstrainedBox);
          // sizing to max there would claim that whole budget even when the
          // badges themselves need far less of it, stealing room the status
          // chip/time-ago area next to it needs.
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project badge
            if (projectIconUrl != null) ...[
              WorkItemBadge(
                projectName,
                iconUrl: projectIconUrl,
                badgeSize: badgeSize,
                compact: widget.compact || collapseProject,
                tooltipMessage: collapseProject ? projectName : null,
              ),
              const SizedBox(width: 6),
              const Text('/'),
              const SizedBox(width: 6),
            ],

            // Parent badge, if any
            if (parentKey != null && !widget.compact) ...[
              WorkItemBadge(
                parentKey,
                key: Key(parentKey),
                iconUrl: parentIconUrl,
                url: _workItemUrl(parentKey),
                workItemKeyForDialog: parentKey,
                badgeSize: badgeSize,
                compact: widget.compact || collapseParent,
                // Folded, the key itself is hidden along with the label —
                // the tooltip is all that's left to identify it by, so it
                // takes over showing the key too, not just the title.
                tooltipMessage: collapseParent ? (parentTitle != null && parentTitle.isNotEmpty ? '$parentKey — $parentTitle' : '$parentKey') : parentTitle,
              ),
              const SizedBox(width: 6),
              const Text('/'),
              const SizedBox(width: 6),
            ],

            // Your existing work item key + copy-on-hover
            WorkItemBadge(
              issueKey,
              key: Key(issueKey),
              iconUrl: fields?['issuetype']?['iconUrl'],
              url: _workItemUrl(issueKey),
              badgeSize: badgeSize,
              copyable: true,
            ),
          ],
        );
      },
    );
  }
}

class JiraWorkItemStatusIndicator extends StatelessWidget {
  const JiraWorkItemStatusIndicator({
    super.key,
    required this.issue,
  });

  final JiraWorkItemData issue;

  @override
  Widget build(BuildContext context) {
    String colorName = issue.fields?['statusCategory']['colorName'] ?? 'unknown';

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color(context, colorName),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        issue.fields?['status']['name'] ?? 'unknown status',
        style: TextStyle(color: onColor(context, colorName)),
      ),
    );
  }

  Color color(BuildContext context, String colorName) {
    var brightness = Theme.brightnessOf(context);
    bool isLightTheme = brightness == Brightness.light;
    switch (colorName) {
      case 'green':
        return isLightTheme ? Colors.lightGreen : Colors.green.shade900;
      case 'yellow':
        return isLightTheme ? Colors.amber : Colors.deepOrange.shade700;
      case 'blue-gray':
      default:
        return isLightTheme ? Colors.blueGrey.shade200 : Colors.blueGrey.shade800;
    }
  }

  Color? onColor(BuildContext context, String colorName) {
    switch (colorName) {
      case 'green':
        return null;
      case 'yellow':
        return null;
      case 'blue-gray':
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }
}

class CustomWorkItemStatusIndicator extends StatelessWidget {
  const CustomWorkItemStatusIndicator(
    this.statusName, {
    this.color,
    this.colorName,
    this.textColor,
    super.key,
  }) : assert(!(color == null && colorName == null) && !(color != null && textColor == null));

  final String? colorName;
  final Color? color, textColor;
  final String statusName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color ?? getColor(context, colorName!),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        statusName,
        style: TextStyle(color: textColor ?? onColor(context, colorName!)),
      ),
    );
  }

  Color getColor(BuildContext context, String colorName) {
    var brightness = Theme.brightnessOf(context);
    bool isLightTheme = brightness == Brightness.light;
    switch (colorName) {
      case 'green':
        return isLightTheme ? Colors.lightGreen : Colors.green.shade900;
      case 'yellow':
        return isLightTheme ? Colors.amber : Colors.deepOrange.shade700;
      case 'blue-gray':
      default:
        return isLightTheme ? Colors.blueGrey.shade200 : Colors.blueGrey.shade800;
    }
  }

  Color? onColor(BuildContext context, String colorName) {
    switch (colorName) {
      case 'green':
        return null;
      case 'yellow':
        return null;
      case 'blue-gray':
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }
}
