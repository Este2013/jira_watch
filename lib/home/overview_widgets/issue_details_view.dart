import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json/flutter_json.dart';
import 'package:jira_watch/home/overview_widgets/diff_matcher.dart';
import 'package:jira_watch/home/time_utils.dart';
import 'package:material_symbols_icons/symbols.dart';

class IssueDetailsView extends StatelessWidget {
  const IssueDetailsView(this.ticket, {super.key});

  final dynamic ticket;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(
        text: 'History',
        icon: Icon(Symbols.history),
      ),
      Tab(
        text: 'Json',
        icon: Icon(Symbols.data_object),
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: TabBar(tabs: tabs),
        body: TabBarView(
          children: [
            HistoryPage(issueJson: ticket),
            JsonWidget(
              json: json.decode(JsonEncoder().convert(ticket)),
              initialExpandDepth: 2,
              nodeIndent: 32,
            ),
          ],
        ),
      ),
    );
  }
}

/// Model for an individual change item in the changelog
class ChangeItem {
  final String field;
  final String? fromString;
  final String? toStringData;

  ChangeItem({
    required this.field,
    this.fromString,
    this.toStringData,
  });

  factory ChangeItem.fromJson(Map<String, dynamic> json) {
    return ChangeItem(
      field: json['field'] as String,
      fromString: json['fromString'] as String?,
      toStringData: json['toString'] as String?,
    );
  }
}

/// Model for a history entry in the changelog
class HistoryEntry {
  final String created;
  final String author;
  final List<ChangeItem> items;

  HistoryEntry({
    required this.created,
    required this.author,
    required this.items,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      created: json['created'],
      author: (json['author'] as Map<String, dynamic>)['displayName'] as String,
      items: (json['items'] as List<dynamic>).map((item) => ChangeItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }
}

/// A page that displays the changelog for a JIRA issue given its JSON
class HistoryPage extends StatelessWidget {
  final List<HistoryEntry> _entries;

  /// Provide the raw issue JSON (with `changelog.histories` included)
  HistoryPage({
    super.key,
    required Map<String, dynamic> issueJson,
  }) : _entries = (issueJson['changelog']['histories'] as List<dynamic>).map((h) => HistoryEntry.fromJson(h as Map<String, dynamic>)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue History'),
      ),
      body: _entries.isEmpty
          ? const Center(child: Text('No history available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                final entry = _entries[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'By ${entry.author}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TimeAgoDisplay(timeStr: entry.created),
                          ],
                        ),
                        Divider(),
                        const SizedBox(height: 8),
                        ...entry.items.map(
                          (item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2),
                            child: Row(
                              children: [
                                Chip(label: Text(item.field.capitalize())),
                                Expanded(
                                  child: DiffReviewer(before: item.fromString ?? '', after: item.toStringData ?? ''),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

extension StringCasingExtension on String {
  /// Capitalizes the first letter of this string.
  ///
  /// If the string is empty, returns it unchanged.
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}
