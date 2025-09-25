import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watcher/ui/home/overview_widgets/diff_matcher.dart';
import 'package:jira_watcher/ui/home/time_utils.dart';
import 'package:jira_watcher/ui/utils/jira_doc_renderer.dart';

/// Model for a Comment entry
class CommentEntry {
  final String created;
  final String updated;
  final Map author;
  final Map updateAuthor;
  final dynamic body;

  final dynamic data;

  CommentEntry(
    this.data, {
    required this.created,
    required this.updated,
    required this.author,
    required this.updateAuthor,
    required this.body,
  });

  factory CommentEntry.fromJson(Map<String, dynamic> json) {
    return CommentEntry(
      json,
      created: json['created'],
      updated: json['updated'],
      author: (json['author'] as Map<String, dynamic>) as Map,
      updateAuthor: (json['updateAuthor'] as Map<String, dynamic>) as Map,
      body: json['body'],
    );
  }

  String get authorAvatar => author['avatarUrls']['32x32'];
  String get updateAuthorAvatar => updateAuthor['avatarUrls']['32x32'];
  String get authorDisplayName => author['displayName'].toString();
  String get updateAuthorDisplayName => updateAuthor['displayName'].toString();

  bool get wasUpdated => created != updated;
}

/// A page that displays the changelog for a JIRA issue given its JSON
class CommentsPage extends StatelessWidget {
  final List<CommentEntry>? _entries;

  final IssueData ticket;

  /// Provide the raw issue JSON (with `changelog.histories` included)
  CommentsPage({
    super.key,
    required this.ticket,
  }) : _entries = (ticket.commentsData?['comments'] as List<dynamic>?)?.map((h) => CommentEntry.fromJson(h as Map<String, dynamic>)).toList().reversed.toList();

  @override
  Widget build(BuildContext context) {
    if (_entries == null) {
      return Center(
        child: Text('There are no comments'),
      );
    }

    return Scaffold(
      key: Key(ticket['key']),
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: _entries.isEmpty
          ? const Center(child: Text('There are no comments'))
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                final comment = _entries[index];
                return CommentListEntry(comment: comment);
              },
            ),
    );
  }
}

class CommentListEntry extends StatelessWidget {
  const CommentListEntry({
    super.key,
    required this.comment,
  });

  final CommentEntry comment;

  @override
  Widget build(BuildContext context) {
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
                  child: JiraAvatar(key: Key(comment.created), url: comment.authorAvatar),
                ),
                Text(
                  'By ${comment.authorDisplayName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                TimeAgoDisplay(timeStr: comment.created),
              ],
            ),
            if (comment.wasUpdated)
              Padding(
                padding: EdgeInsetsGeometry.only(top: 8),
                child: Row(
                  spacing: 8,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(10000),
                      child: JiraAvatar(key: Key(comment.updated), url: comment.updateAuthorAvatar),
                    ),
                    Text(
                      'Updated by ${comment.updateAuthorDisplayName}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    TimeAgoDisplay(timeStr: comment.updated),
                  ],
                ),
              ),
            Divider(),
            const SizedBox(height: 8),

            // body
            if (comment.body['type'] == 'doc')
              AdfRenderer(
                adf: comment.body,
                mediaBuilder: (context, attrs) {
                  // Map Jira media attrs to a widget (image/placeholder/etc.)
                  print(attrs);
                  return Text(
                    '[medias are not handled yet]',
                    style: TextStyle(color: Colors.red),
                  );
                  // if (attrs['type'] == 'file') {
                  //   final id = attrs['id']; // e.g., Jira file UUID
                  //   final url = yourFileUrlFromJira(id); // <-- your logic/auth
                  //   return Image.network(url, fit: BoxFit.contain);
                  // }
                  // if (attrs['type'] == 'external') {
                  //   return Image.network(attrs['url'], fit: BoxFit.contain);
                  // }
                  // return const SizedBox.shrink();
                },
                linkHandler: (url) {
                  // Optional: handle link taps (e.g., with url_launcher)
                  // launchUrlString(url);
                },
              ),

            if (kDebugMode)
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Colors.amber.shade900),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => CommentDebugDialog(comment),
                    );
                  },
                  child: Text('Debug'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class CommentDebugDialog extends StatelessWidget {
  const CommentDebugDialog(this.comment, {super.key});

  final CommentEntry comment;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('Comment debugger'),
    content: SizedBox(
      width: 600,
      child: DefaultTabController(
        length: 4,

        child: Column(
          children: [
            TabBar(
              tabs: [
                Tab(
                  text: 'Basic data',
                ),
                Tab(
                  text: 'Author',
                ),
                Tab(
                  text: 'Update author',
                ),
                Tab(
                  text: 'Body',
                ),
              ],
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TabBarView(
                  children: [
                    Column(
                      children: [
                        Text('Basic properties', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 8),
                        for (var e in (comment.data as Map).entries.where((e) => !['author', 'updateAuthor', 'body'].contains(e.key)))
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      Text(e.key.toString()),
                                      Spacer(),
                                      IconButton(
                                        iconSize: 16,
                                        visualDensity: VisualDensity.compact,
                                        onPressed: () => Clipboard.setData(ClipboardData(text: e.value.toString())),
                                        icon: Icon(Icons.copy),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100.0),
                                    child: Text(e.value.toString(), textAlign: TextAlign.end),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Author', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SelectableText(JsonEncoder.withIndent('  ').convert(comment.author)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text('Update author', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SelectableText(JsonEncoder.withIndent('  ').convert(comment.updateAuthor)),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        // TODO true body debugger
                        Text('Body', style: Theme.of(context).textTheme.titleMedium),
                        SizedBox(height: 8),
                        for (var e in (comment.body as Map).entries.where((e) => !['content'].contains(e.key)))
                          Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                spacing: 8,
                                children: [
                                  Text(e.key.toString()),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 100.0),
                                    child: Text(e.value.toString(), textAlign: TextAlign.end),
                                  ),
                                  IconButton(
                                    iconSize: 16,
                                    visualDensity: VisualDensity.compact,
                                    onPressed: () => Clipboard.setData(ClipboardData(text: e.value.toString())),
                                    icon: Icon(Icons.copy),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        SizedBox(height: 8),
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(child: Divider()),
                            Text('Body content:'),
                            Expanded(child: Divider()),
                          ],
                        ),

                        SelectableText(JsonEncoder.withIndent('  ').convert(comment.body)),
                      ],
                    ),
                  ].map((w) => SingleChildScrollView(child: w)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    actions: [
      TextButton(onPressed: Navigator.of(context).pop, child: Text('Close')),
    ],
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
