import 'package:flutter/material.dart';
import 'package:jira_watch/dao/api_dao.dart';
import 'package:jira_watch/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watch/ui/home/overview_widgets/diff_matcher.dart';
import 'package:jira_watch/ui/home/time_utils.dart';

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
  final dynamic data;

  HistoryEntry(
    this.data, {
    required this.created,
    required this.author,
    required this.items,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      json,
      created: json['created'],
      author: (json['author'] as Map<String, dynamic>)['displayName'] as String,
      items: (json['items'] as List<dynamic>).map((item) => ChangeItem.fromJson(item as Map<String, dynamic>)).toList(),
    );
  }

  String get authorAvatar => data['author']['avatarUrls']['32x32'];
}

/// A page that displays the changelog for a JIRA issue given its JSON
class HistoryPage extends StatelessWidget {
  final List<HistoryEntry> _entries;

  final IssueData ticket;

  /// Provide the raw issue JSON (with `changelog.histories` included)
  HistoryPage({
    super.key,
    required this.ticket,
  }) : _entries = (ticket['changelog']['histories'] as List<dynamic>).map((h) => HistoryEntry.fromJson(h as Map<String, dynamic>)).toList();

  @override
  Widget build(BuildContext context) {
    List<List<HistoryEntry>> groups = [];

    late HistoryEntry last;
    for (var e in _entries) {
      if (groups.isEmpty) {
        groups.add([e]);
        last = e;
        continue;
      }

      if (e.author == last.author && DateTime.parse(e.created).difference(DateTime.parse(last.created)) < Duration(minutes: 5)) {
        groups.last.add(e);
        last = e;
        continue;
      }
      groups.add([e]);
      last = e;
    }

    return Scaffold(
      key: Key(ticket['key']),
      appBar: AppBar(
        title: const Text('Issue History'),
      ),
      body: _entries.isEmpty
          ? const Center(child: Text('No history available.'))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: groups.length,
              itemBuilder: (context, index) {
                final group = groups[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // title
                        Row(
                          spacing: 8,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(10000),
                              child: JiraAvatar(key: Key(group.first.author), url: group.first.authorAvatar),
                            ),
                            Text(
                              'By ${group.first.author}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TimeAgoDisplay(timeStr: group.first.created),
                          ],
                        ),
                        Divider(),
                        const SizedBox(height: 8),
                        // changes
                        Table(
                          columnWidths: {0: IntrinsicColumnWidth()},
                          border: TableBorder(horizontalInside: BorderSide(color: Theme.of(context).dividerColor.withAlpha(100))),
                          children: group
                              .fold(
                                <ChangeItem>[],
                                (previousValue, element) => previousValue..addAll(element.items.reversed),
                              )
                              .map(
                                (item) => TableRow(
                                  children: [
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Chip(label: Text(item.field.capitalize())),
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: DiffReviewer(before: item.fromString ?? '', after: item.toStringData ?? ''),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
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
