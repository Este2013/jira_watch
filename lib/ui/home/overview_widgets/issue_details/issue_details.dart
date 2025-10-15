import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json/flutter_json.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/home/overview_widgets/issue_ui_elements.dart';
import 'package:jira_watcher/ui/home/overview_widgets/issue_details/issue_history_view.dart';
import 'package:material_symbols_icons/symbols.dart';

// ignore: unused_import
import 'issue_comments_view.dart';

class IssueDetailsView extends StatelessWidget {
  const IssueDetailsView(this.ticket, {super.key});

  final IssueData ticket;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(
        text: 'History',
        icon: Icon(Symbols.history),
      ),
      Tab(
        text: 'Comments (${ticket.commentsData?['comments']?.length ?? 0})',
        icon: Icon(Symbols.chat_bubble),
      ),
      Tab(
        text: 'Details',
        icon: Icon(Symbols.document_scanner),
      ),
      Tab(
        text: 'Json',
        icon: Icon(Symbols.data_object),
      ),
      // Tab(
      //   text: 'Edit',
      //   icon: Icon(Symbols.edit),
      // ),
    ];

    return DefaultTabController(
      length: tabs.length,

      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight + 10,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
                child: IssueLinkWithParentsRow(ticket),
              ),
              Text(ticket['fields']['summary'] ?? 'null'),
            ],
          ),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          children: [
            HistoryPage(ticket: ticket),
            CommentsPage(ticket: ticket),
            TicketDetailsView(ticket: ticket),
            JsonWidget(
              json: json.decode(JsonEncoder().convert(ticket)),
              initialExpandDepth: 2,
              nodeIndent: 32,
            ),
            // TODO IssueEditFieldsWidget(issueData: ticket),
          ],
        ),
      ),
    );
  }
}

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key, required this.ticket});
  final IssueData ticket;
  @override
  Widget build(BuildContext context) {
    if (ticket.fields == null) {
      return Text('No fields were found');
    }
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(color: Theme.of(context).dividerColor),
          children: [
            for (var field
                in ticket.fields!.entries.where((e) => !(e.key as String).contains('customfield')).toList()..sort(
                  (a, b) => (a.key as String).compareTo(b.key),
                ))
              TableRow(
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: SelectableText(field.key),
                      ),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: SelectableText(field.value.runtimeType.toString())),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ['String', 'Null', 'int'].contains(field.value.runtimeType.toString())
                          ? Center(child: SelectableText(field.value.toString()))
                          : TextButton.icon(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text(field.key),
                                    content: SingleChildScrollView(child: SelectableText(JsonEncoder.withIndent('    ').convert(field.value))),
                                  ),
                                );
                              },
                              label: Text('Inspect'),
                              icon: Icon(Symbols.document_search),
                            ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
