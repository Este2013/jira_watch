import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jira_watch/models/api_model.dart';

import 'overview_widgets/issue_badge.dart';
import 'overview_widgets/issue_details_view.dart';

/// Simple data holder for all of your grouped ticket lists.
class _TicketData {
  final List<dynamic> today;
  final List<dynamic> yesterday;
  final List<dynamic> thisWeek;
  final Map<String, List<dynamic>> monthGroups;
  final List<String> sortedMonths;
  final Set<String> starredProjects;

  _TicketData({
    required this.today,
    required this.yesterday,
    required this.thisWeek,
    required this.monthGroups,
    required this.sortedMonths,
    required this.starredProjects,
  });
}

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  late Future<_TicketData> _ticketDataFuture;
  int loadedMonths = 0;
  Widget? view;

  @override
  void initState() {
    super.initState();
    _ticketDataFuture = _loadTicketData();
  }

  /// Loads API key, starred projects, fetches issues, and groups them.
  Future<_TicketData> _loadTicketData({bool debug = false}) async {
    final now = DateTime.now();

    // 1) Load APIModel and prefs
    await APIModel().load();
    final prefs = await SharedPreferences.getInstance();
    final starred = prefs.getStringList('starred_projects')?.toSet() ?? {};

    // 2) Only fetch if we actually have credentials
    if (APIModel().apiKey == null || APIModel().apiKey!.isEmpty || APIModel().domain == null || APIModel().domain!.isEmpty) {
      throw Exception('Missing API credentials');
    }

    // 3) Build JQL
    String projectFilter = '';
    if (starred.isNotEmpty) {
      final keys = starred.map((k) => k.trim()).where((k) => k.isNotEmpty).join(',');
      projectFilter = 'project in ($keys) AND ';
    }
    final jql = '$projectFilter updated >= -30d ORDER BY updated DESC';

    // 4) Fetch and parse
    var issues = await IssuesModel().jqlSearch(jql, expand: 'changelog');

    // 5) Group into buckets
    final today = <dynamic>[];
    final yesterday = <dynamic>[];
    final thisWeek = <dynamic>[];
    final monthGroups = <String, List<dynamic>>{};

    bool isSameDay(DateTime a, DateTime b) => a.year == b.year && a.month == b.month && a.day == b.day;

    for (var issue in issues) {
      final updated = DateTime.parse(issue['fields']['updated'] as String);

      if (isSameDay(updated, now)) {
        today.add(issue);
      } else if (isSameDay(updated, now.subtract(Duration(days: 1)))) {
        yesterday.add(issue);
      } else if (updated.isAfter(now.subtract(Duration(days: 7)))) {
        thisWeek.add(issue);
      } else {
        final key = '${updated.year}-${updated.month.toString().padLeft(2, '0')}';
        monthGroups.putIfAbsent(key, () => []).add(issue);
      }
    }

    final sortedMonths = monthGroups.keys.toList()..sort((a, b) => b.compareTo(a));

    return _TicketData(
      today: today,
      yesterday: yesterday,
      thisWeek: thisWeek,
      monthGroups: monthGroups,
      sortedMonths: sortedMonths,
      starredProjects: starred,
    );
  }

  void _loadMore() {
    if (mounted && loadedMonths + 1 < (_ticketDataFuture as dynamic).sortedMonths.length) {
      setState(() => loadedMonths++);
    }
  }

  void updateView(Widget w) => setState(() => view = w);

  @override
  Widget build(BuildContext context) => FutureBuilder<_TicketData>(
    future: _ticketDataFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return Center(child: CircularProgressIndicator());
      }
      if (snapshot.hasError) {
        return Padding(
          padding: EdgeInsetsGeometry.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: Text('An error occured:')),
                  IconButton(
                    onPressed: () => Clipboard.setData(ClipboardData(text: snapshot.error.toString())),
                    tooltip: 'Copy error text',
                    icon: Icon(Icons.copy),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      _ticketDataFuture = _loadTicketData();
                    }),
                    tooltip: 'Refresh',
                    icon: Icon(Icons.refresh),
                  ),
                  IconButton(
                    onPressed: () => setState(() {
                      _ticketDataFuture = _loadTicketData(debug: true);
                    }),
                    tooltip: 'Use last cached values',
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
              Expanded(child: ErrorWidget('Error loading tickets:\n${snapshot.error}${(snapshot.error is Error) ? '\n\nAt stacktrace:\n${(snapshot.error as Error).stackTrace}' : ''}')),
            ],
          ),
        );
      }

      final data = snapshot.data!;

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildTicketGroup('Today', data.today),
                  _buildTicketGroup('Yesterday', data.yesterday),
                  _buildTicketGroup('This Week', data.thisWeek),
                  // show increasingly more months
                  ...data.sortedMonths.take(loadedMonths + 1).map((monthKey) => _buildMonthGroup(monthKey, data.monthGroups[monthKey]!)),
                  if (loadedMonths + 1 < data.sortedMonths.length)
                    Center(
                      child: ElevatedButton(
                        onPressed: _loadMore,
                        child: Text('Load More'),
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
    },
  );

  Widget _buildTicketGroup(String title, List<dynamic> tickets) {
    if (tickets.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...tickets.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildMonthGroup(String month, List<dynamic> tickets) {
    final parts = month.split('-');
    final year = parts[0], m = parts[1];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$year-$m', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...tickets.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
        const SizedBox(height: 16),
      ],
    );
  }
}

class OldOverviewPage extends StatefulWidget {
  const OldOverviewPage({super.key});

  @override
  State<OldOverviewPage> createState() => _OldOverviewPageState();
}

class _OldOverviewPageState extends State<OldOverviewPage> {
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
          'expand': 'changelog',
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
              // TODO better than this bad list: a pagination system
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
    final colors = _ticketColors(context, ticket);
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
        onTap: () => updateView?.call(IssueDetailsView(ticket)),
      ),
    );
  }

  Map<String, Color> _ticketColors(context, ticket) {
    var type = ticket['fields']['issuetype']['name'];
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    switch (type) {
      case 'Bug':
        return {
          'bg': isLightTheme ? Colors.red.shade50 : Colors.red.shade900,
          'border': Colors.red.shade700,
        };
      case 'Task':
        return {
          'bg': isLightTheme ? Colors.blue.shade50 : Colors.blue.shade900,
          'border': Colors.blue.shade700,
        };
      case 'Story':
        return {
          'bg': isLightTheme ? Colors.green.shade50 : Colors.green.shade900,
          'border': Colors.green.shade700,
        };
      case 'Epic':
        return {
          'bg': isLightTheme ? Colors.purple.shade50 : Colors.purple.shade900,
          'border': Colors.purple.shade700,
        };
      default:
        return {
          'bg': isLightTheme ? Colors.grey.shade50 : Colors.grey.shade900,
          'border': Colors.grey.shade700,
        };
    }
  }
}
