import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watch/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watch/ui/home/time_utils.dart';
import 'package:jira_watch/models/api_model.dart';
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
  });

  final int badgeSize;
  final String label;
  final String? url;
  final String? iconUrl;
  final bool copyable;

  @override
  State<IssueBadge> createState() => _IssueBadgeState();
}

class _IssueBadgeState extends State<IssueBadge> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.iconUrl != null)
          SizedBox.square(
            dimension: widget.badgeSize.toDouble(),
            child: JiraAvatar(url: widget.iconUrl!),
          ),
        const SizedBox(width: 4),

        MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: Row(
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
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: _hovering ? 1 : 0,
                  child: IconButton(
                    icon: const Icon(Icons.copy, size: 18),
                    visualDensity: VisualDensity.compact,
                    onPressed: _hovering
                        ? () {
                            Clipboard.setData(
                              ClipboardData(
                                text: widget.label,
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Copied ${widget.label}')),
                            );
                          }
                        : null,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Shows the issues project, parent and key as [IssueBadge]s.
class IssueHeaderRow extends StatefulWidget {
  final dynamic ticket;
  final bool showLastUpdateTime;

  const IssueHeaderRow(this.ticket, {super.key, this.showLastUpdateTime = true});

  @override
  State<IssueHeaderRow> createState() => _IssueHeaderRowState();
}

class _IssueHeaderRowState extends State<IssueHeaderRow> {
  String? _ticketUrl(dynamic ticketKey) {
    final domain = APIModel().domain;
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
    final updated = fields['updated'] as String? ?? '';

    return Row(
      children: [
        // Project badge
        if (projectIconUrl != null) ...[
          IssueBadge(
            projectName,
            iconUrl: projectIconUrl,
            // url: projectUrl,
            badgeSize: badgeSize,
          ),
          const SizedBox(width: 6),
          const Text('/'),
          const SizedBox(width: 6),
        ],

        // Parent badge, if any
        if (parentKey != null) ...[
          IssueBadge(
            parentKey,
            iconUrl: parentIconUrl,
            url: _ticketUrl(parentKey),
            badgeSize: badgeSize,
          ),
          const SizedBox(width: 6),
          const Text('/'),
          const SizedBox(width: 6),
        ],

        // Your existing ticket key + copy-on-hover
        IssueBadge(
          issueKey,
          iconUrl: fields?['issuetype']?['iconUrl'],
          url: _ticketUrl(issueKey),
          badgeSize: badgeSize,
          copyable: true,
        ),

        if (widget.showLastUpdateTime) const Spacer(),

        if (widget.showLastUpdateTime) TimeAgoDisplay(timeStr: updated),
      ],
    );
  }
}
