import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/updates_widgets/diff_matcher.dart';
import 'package:jira_watcher/ui/utils/time_utils.dart';

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

  final JiraWorkItemData workItem;

  /// Provide the raw issue JSON (with `changelog.histories` included)
  HistoryPage({
    super.key,
    required this.workItem,
  }) : _entries = (workItem['changelog']['histories'] as List<dynamic>).map((h) => HistoryEntry.fromJson(h as Map<String, dynamic>)).toList();

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

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: groups.length + 1, // +1 reseved for the work item's creation
      itemBuilder: (context, index) {
        // workItem's creation
        if (index == groups.length) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                spacing: 8,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10000),
                    child: JiraAvatar(key: Key(workItem.fields?['creator']['displayName'] ?? 'unknown creator\'s avatar'), url: workItem.fields?['creator']['avatarUrls']['32x32']),
                  ),
                  Text(
                    "Issue created by ${workItem.fields?['creator']['displayName'] ?? 'unknown creator\'s'}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  TimeAgoDisplay(timeStr: workItem.fields?['created']),
                ],
              ),
            ),
          );
        }
        // any edit
        final group = groups[index];
        return EditingGroupDisplay(group: group);
      },
    );
  }
}

class EditingGroupDisplay extends StatelessWidget {
  const EditingGroupDisplay({
    super.key,
    required this.group,
  });

  final List<HistoryEntry> group;

  @override
  Widget build(BuildContext context) => Card(
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
                  (item) {
                    Widget diff;
                    if ([
                      'assignee',
                      'Key',
                      'priority',
                      'project',
                      'reporter',
                      'status',
                      'statusCategory',
                    ].contains(item.field)) {
                      diff = Text.rich(
                        TextSpan(
                          children: [
                            if (item.fromString?.isEmpty ?? true) TextSpan(text: 'None') else TextSpan(text: item.fromString, style: DiffReviewer.removedTextStyle),
                            TextSpan(text: ' → '),
                            if (item.toStringData?.isEmpty ?? true) TextSpan(text: 'None') else TextSpan(text: item.toStringData, style: DiffReviewer.addedTextStyle),
                          ],
                        ),
                      );
                    } else {
                      diff = DiffReviewer(
                        before: item.fromString ?? '',
                        after: item.toStringData ?? '',
                      );
                    }
                    return TableRow(
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
                            child: diff,
                          ),
                        ),
                      ],
                    );
                  },
                )
                .toList(),
          ),
        ],
      ),
    ),
  );
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
