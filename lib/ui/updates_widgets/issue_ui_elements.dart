import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/single_work_item_view.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
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
  });

  final int badgeSize;
  final String label;
  final String? url;
  final String? workItemKeyForDialog;
  final String? iconUrl;
  final bool copyable, compact;

  @override
  State<WorkItemBadge> createState() => _WorkItemBadgeState();
}

class _WorkItemBadgeState extends State<WorkItemBadge> {
  bool _hovering = false;
  bool _hoveringCopy = false;
  bool _hoveringLink = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.iconUrl != null)
          Tooltip(
            message: (widget.compact) ? widget.label : '',
            child: SizedBox.square(
              dimension: widget.badgeSize.toDouble(),
              child: JiraAvatar(url: widget.iconUrl!),
            ),
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Copied ${widget.url}')),
                                    );
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
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Copied ${widget.label}')),
                                    );
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

    final issueKey = workItem['key'] ?? '';

    return Row(
      children: [
        // Project badge
        if (projectIconUrl != null) ...[
          WorkItemBadge(
            projectName,
            iconUrl: projectIconUrl,
            badgeSize: badgeSize,
            compact: widget.compact,
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
            compact: widget.compact,
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
