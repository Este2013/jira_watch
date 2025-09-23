import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_json/flutter_json.dart';
import 'package:jira_watcher/ui/home/overview_widgets/issue_badge.dart';
import 'package:jira_watcher/ui/home/overview_widgets/issue_details/issue_history_view.dart';
import 'package:material_symbols_icons/symbols.dart';

// ignore: unused_import
import 'issue_edit_view.dart';

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
        text: 'Comments',
        icon: Icon(Symbols.chat_bubble),
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
