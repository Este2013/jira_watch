import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:jira_watch/api_model.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final now = DateTime.now();
  bool isLoading = true;
  bool isLoadingMore = false;
  int loadedMonths = 0;
  Map<String, List<dynamic>> monthGroups = {};
  List<dynamic> today = [];
  List<dynamic> yesterday = [];
  List<dynamic> thisWeek = [];
  List<String> olderMonths = [];
  Set<String> starredProjects = {};

  Widget? view;

  @override
  void initState() {
    super.initState();
    _loadApiKeyAndFetch();
  }

  Future<void> _loadApiKeyAndFetch() async {
    await APIModel().load();
    final prefs = await SharedPreferences.getInstance();
    starredProjects = prefs.getStringList('starred_projects')?.toSet() ?? {};

    if (APIModel().apiKey != null && APIModel().domain != null && APIModel().apiKey!.isNotEmpty && APIModel().domain!.isNotEmpty) {
      await _fetchTickets(days: 30);
    }
  }

  Future<void> _fetchTickets({required int days, DateTime? before}) async {
    setState(() => isLoading = true);

    String projectFilter = '';
    if (starredProjects.isNotEmpty) {
      final keys = starredProjects.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');
      projectFilter = 'project in ($keys) AND ';
    }

    final jql = '${projectFilter}updated >= -${days}d ${before != null ? "AND updated <= ${before.toIso8601String()}" : ""} ORDER BY updated DESC';

    try {
      final data = await APIModel().getJson(
        '/rest/api/3/search',
        queryParameters: {
          'jql': jql,
          'maxResults': '100',
        },
      );
      final issues = data['issues'] as List<dynamic>;

      for (var issue in issues) {
        final updatedStr = issue['fields']['updated'];
        final updated = DateTime.parse(updatedStr);

        if (_isSameDay(updated, now)) {
          today.add(issue);
        } else if (_isSameDay(updated, now.subtract(Duration(days: 1)))) {
          yesterday.add(issue);
        } else if (updated.isAfter(now.subtract(Duration(days: 7)))) {
          thisWeek.add(issue);
        } else {
          final monthKey = '${updated.year}-${updated.month.toString().padLeft(2, '0')}';
          monthGroups.putIfAbsent(monthKey, () => []).add(issue);
        }
      }

      setState(() {
        isLoading = false;
        olderMonths = monthGroups.keys.toList()..sort((a, b) => b.compareTo(a));
      });
    } catch (e) {
      setState(() => isLoading = false);
      throw Exception('Failed to fetch tickets: $e');
    }
  }

  Future<void> _loadMore() async {
    if (loadedMonths >= olderMonths.length) return;
    setState(() => isLoadingMore = true);
    loadedMonths++;
    await Future.delayed(Duration(milliseconds: 200)); // Simulate delay
    setState(() => isLoadingMore = false);
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildTicketGroup('Today', today),
                _buildTicketGroup('Yesterday', yesterday),
                _buildTicketGroup('This Week', thisWeek),
                ...olderMonths.take(loadedMonths + 1).map((monthKey) {
                  return _buildMonthGroup(monthKey, monthGroups[monthKey]!);
                }),
                if (loadedMonths + 1 < olderMonths.length)
                  Center(
                    child: ElevatedButton(
                      onPressed: _loadMore,
                      child: isLoadingMore ? CircularProgressIndicator() : Text('Load More'),
                    ),
                  ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(child: view ?? Placeholder()),
        ],
      ),
    );
  }

  void updateView(Widget w) => setState(() => view = w);

  Widget _buildTicketGroup(String title, List<dynamic> tickets) {
    if (tickets.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ...tickets.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMonthGroup(String month, List<dynamic> tickets) {
    final monthDate = DateTime.parse('$month-01');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${monthDate.year}-${monthDate.month.toString().padLeft(2, '0')}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ...tickets.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
        SizedBox(height: 16),
      ],
    );
  }

  bool _isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }
}

class JiraTicketPreviewItem extends StatelessWidget {
  final dynamic ticket;
  final Function(Widget)? updateView;

  const JiraTicketPreviewItem({super.key, required this.ticket, this.updateView});

  @override
  Widget build(BuildContext context) {
    final colors = _ticketColors(ticket);
    final summary = ticket['fields']['summary'] ?? 'No Title';

    return Card(
      color: colors['bg'],
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors['border']!, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(4),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IssueHeaderRow(ticket),
              Text(
                summary,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        onTap: () => updateView?.call(SingleChildScrollView(child: Text(JsonEncoder.withIndent('     ').convert(ticket)))),
      ),
    );
  }

  Map<String, Color> _ticketColors(ticket) {
    var type = ticket['fields']['issuetype']['name'];
    switch (type) {
      case 'Bug':
        return {
          'bg': Colors.red.shade50,
          'border': Colors.red.shade700,
        };
      case 'Task':
        return {
          'bg': Colors.blue.shade50,
          'border': Colors.blue.shade700,
        };
      case 'Story':
        return {
          'bg': Colors.green.shade50,
          'border': Colors.green.shade700,
        };
      case 'Epic':
        return {
          'bg': Colors.purple.shade50,
          'border': Colors.purple.shade700,
        };
      default:
        return {
          'bg': Colors.grey.shade50,
          'border': Colors.grey.shade700,
        };
    }
  }
}

class IssueHeaderRow extends StatefulWidget {
  final dynamic ticket;

  const IssueHeaderRow(this.ticket, {super.key});

  @override
  State<IssueHeaderRow> createState() => _IssueHeaderRowState();
}

class _IssueHeaderRowState extends State<IssueHeaderRow> {
  bool _hovering = false;

  String _timeAgo(String updatedStr) {
    final updated = DateTime.parse(updatedStr).toLocal();
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

  String? _ticketUrl(BuildContext context, dynamic ticket) {
    final key = ticket['key'];
    final domain = APIModel().domain;
    if (domain != null && key != null) {
      return 'https://$domain/browse/$key';
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

    // avatarUrls is a map of size → URL, choose 48x48 (or iconUrl if available)
    final projectIconUrl = project['avatarUrls']?['48x48'] ?? project['iconUrl'];
    final parentKey = parent?['key'];
    final parentIconUrl = parent?['fields']?['project']?['avatarUrls']?['48x48'];

    final issueKey = ticket['key'] ?? '';
    final updated = fields['updated'] as String? ?? '';
    final url = _ticketUrl(context, ticket);

    Widget badge(String? iconUrl, Widget label) {
      if (iconUrl == null) return label;
      return Row(
        children: [
          // Image.network(iconUrl, width: 20, height: 20),
          const SizedBox(width: 4),
          label,
        ],
      );
    }

    return Row(
      children: [
        // Project badge
        if (projectIconUrl != null) ...[
          badge(
            projectIconUrl,
            Text(projectName),
          ),
          const SizedBox(width: 6),
          const Text('/'),
          const SizedBox(width: 6),
        ],

        // Parent badge, if any
        if (parentKey != null) ...[
          badge(
            parentIconUrl,
            Text(parentKey),
          ),
          const SizedBox(width: 6),
          const Text('/'),
          const SizedBox(width: 6),
        ],

        // Your existing ticket key + copy-on-hover
        MouseRegion(
          onEnter: (_) => setState(() => _hovering = true),
          onExit: (_) => setState(() => _hovering = false),
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  if (url != null) {
                    await launchUrl(
                      Uri.parse(url),
                      mode: LaunchMode.externalApplication,
                    );
                  }
                },
                child: Text(
                  issueKey,
                  style: const TextStyle(decoration: TextDecoration.underline),
                ),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: _hovering ? 1 : 0,
                child: IconButton(
                  icon: const Icon(Icons.copy, size: 18),
                  tooltip: 'Copy ticket key',
                  visualDensity: VisualDensity.compact,
                  onPressed: _hovering
                      ? () {
                          Clipboard.setData(ClipboardData(text: issueKey));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Copied $issueKey')),
                          );
                        }
                      : null,
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        Text(
          _timeAgo(updated),
          style: TextStyle(fontSize: 12, color: Colors.grey[700]),
        ),
      ],
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   var ticket = widget.ticket;
  //   final issueKey = ticket['key'] ?? '';
  //   final updated = ticket['fields']['updated'];
  //   final url = _ticketUrl(context, ticket);

  //   return Row(
  //     children: [
  //       // Wrap only the text+icon in a MouseRegion
  //       MouseRegion(
  //         onEnter: (_) => setState(() => _hovering = true),
  //         onExit: (_) => setState(() => _hovering = false),
  //         child: Row(
  //           spacing: 4,
  //           children: [
  //             GestureDetector(
  //               onTap: () async {
  //                 if (url != null) {
  //                   await launchUrl(
  //                     Uri.parse(url),
  //                     mode: LaunchMode.externalApplication,
  //                   );
  //                 }
  //               },
  //               child: Text(
  //                 issueKey,
  //                 style: const TextStyle(
  //                   decoration: TextDecoration.underline,
  //                 ),
  //               ),
  //             ),

  //             // show the copy button only when _hovering
  //             AnimatedOpacity(
  //               duration: const Duration(milliseconds: 150),
  //               opacity: _hovering ? 1 : 0,
  //               child: IconButton(
  //                 icon: const Icon(Icons.copy, size: 18),
  //                 tooltip: 'Copy ticket key',
  //                 visualDensity: VisualDensity.compact,
  //                 onPressed: _hovering
  //                     ? () {
  //                         Clipboard.setData(
  //                           ClipboardData(text: issueKey),
  //                         );
  //                         ScaffoldMessenger.of(context).showSnackBar(
  //                           SnackBar(
  //                             content: Text('Copied $issueKey'),
  //                           ),
  //                         );
  //                       }
  //                     : null,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),

  //       const Spacer(),

  //       Text(
  //         _timeAgo(updated),
  //         style: TextStyle(
  //           fontSize: 12,
  //           color: Colors.grey[700],
  //         ),
  //       ),
  //     ],
  //   );
  // }
}
