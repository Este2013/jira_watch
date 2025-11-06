import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/utils/avatar.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows an issues icon and key, formatting appropriately for links and adding a copy button if requested.
class IssueBadge extends StatefulWidget {
  const IssueBadge(
    this.label, {
    super.key,
    this.url,
    this.iconUrl,
    this.badgeSize = 24,
    this.copyable = false,
    this.compact = false,
  });

  final int badgeSize;
  final String label;
  final String? url;
  final String? iconUrl;
  final bool copyable, compact;

  @override
  State<IssueBadge> createState() => _IssueBadgeState();
}

class _IssueBadgeState extends State<IssueBadge> {
  bool _hovering = false;
  bool _hoveringCopy = false;
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
                    if (widget.url != null) {
                      await launchUrl(
                        Uri.parse(widget.url!),
                        mode: LaunchMode.externalApplication,
                      );
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
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 150),
                                opacity: 1,
                                child: MouseRegion(
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
                                        Icons.copy,
                                        size: 16,
                                        color: _hoveringCopy ? Theme.of(context).hintColor : Theme.of(context).iconTheme.color,
                                      ),
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

/// Shows the issues project, parent and key as [IssueBadge]s.
class IssueLinkWithParentsRow extends StatefulWidget {
  final IssueData ticket;
  final bool compact;

  const IssueLinkWithParentsRow(this.ticket, {super.key, this.compact = false});

  @override
  State<IssueLinkWithParentsRow> createState() => _IssueLinkWithParentsRowState();
}

class _IssueLinkWithParentsRowState extends State<IssueLinkWithParentsRow> {
  String? _ticketUrl(dynamic ticketKey) {
    final domain = APIDao().domain;
    if (domain != null && ticketKey != null) {
      return 'https://$domain/browse/$ticketKey';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final ticket = widget.ticket;
    final fields = ticket['fields'] ?? {};
    final project = fields['project'] ?? {};
    final parent = fields['parent'];
    final projectName = project['name'] ?? '';

    int badgeSize = 16;

    final projectIconUrl = project['avatarUrls']?['${badgeSize}x$badgeSize'] ?? project['iconUrl'];
    final parentKey = parent?['key'];
    final parentIconUrl = parent?['fields']?['issuetype']?['iconUrl'];

    final issueKey = ticket['key'] ?? '';

    return Row(
      children: [
        // Project badge
        if (projectIconUrl != null) ...[
          IssueBadge(
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
          IssueBadge(
            parentKey,
            key: Key(parentKey),
            iconUrl: parentIconUrl,
            url: _ticketUrl(parentKey),
            badgeSize: badgeSize,
            compact: widget.compact,
          ),
          const SizedBox(width: 6),
          const Text('/'),
          const SizedBox(width: 6),
        ],

        // Your existing ticket key + copy-on-hover
        IssueBadge(
          issueKey,
          key: Key(issueKey),
          iconUrl: fields?['issuetype']?['iconUrl'],
          url: _ticketUrl(issueKey),
          badgeSize: badgeSize,
          copyable: true,
        ),
      ],
    );
  }
}

class TicketStatusIndicator extends StatelessWidget {
  const TicketStatusIndicator({
    super.key,
    required this.issue,
  });

  final IssueData issue;

  @override
  Widget build(BuildContext context) {
    String colorName = issue.fields?['statusCategory']['colorName'];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: color(context, colorName),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        issue.fields?['status']['name'],
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

class CustomTicketStatusIndicator extends StatelessWidget {
  const CustomTicketStatusIndicator(
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
