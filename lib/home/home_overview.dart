import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
  String? apiKey, userEmail;

  @override
  void initState() {
    super.initState();
    _loadApiKeyAndFetch();
  }

  String? domain;

  Future<void> _loadApiKeyAndFetch() async {
    final prefs = await SharedPreferences.getInstance();
    apiKey = prefs.getString('jira_api_key');
    userEmail = prefs.getString('jira_email');
    domain = prefs.getString('jira_domain');

    if (apiKey != null && domain != null && apiKey!.isNotEmpty && domain!.isNotEmpty) {
      await _fetchTickets(days: 30);
    }
  }

  Future<void> _fetchTickets({required int days, DateTime? before}) async {
    setState(() => isLoading = true);

    final jql = 'updated >= -${days}d ${before != null ? "AND updated <= ${before.toIso8601String()}" : ""} ORDER BY updated DESC';
    final url = Uri.parse('https://$domain/rest/api/3/search?jql=${Uri.encodeComponent(jql)}&maxResults=100');

    final authHeader = 'Basic ${base64Encode(utf8.encode('$userEmail:${apiKey!}'))}';

    final response = await http.get(
      url,
      headers: {
        'Authorization': authHeader,
        'Accept': 'application/json',
      },
    );
    print(url.toString());
    print(authHeader);
    print(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
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
    } else {
      setState(() => isLoading = false);
      throw Exception('Failed to fetch tickets: ${response.statusCode}');
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
    );
  }

  Widget _buildTicketGroup(String title, List<dynamic> tickets) {
    if (tickets.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ...tickets.map(
          (t) => ListTile(
            title: Text(t['fields']['summary'] ?? 'No Title'),
            subtitle: Text('Updated: ${t['fields']['updated']}'),
          ),
        ),
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
        ...tickets.map(
          (t) => ListTile(
            title: Text(t['fields']['summary'] ?? 'No Title'),
            subtitle: Text('Updated: ${t['fields']['updated']}'),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  bool _isSameDay(DateTime d1, DateTime d2) {
    return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
  }
}
