import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/home/home.dart';
import 'package:jira_watcher/ui/home/overview_widgets/issue_ui_elements.dart';
import 'package:jira_watcher/ui/home/overview_widgets/updates_view_single_ticket/issue_history_view.dart';
import 'package:jira_watcher/ui/utils/json_viewer.dart';
import 'package:material_symbols_icons/symbols.dart';

// ignore: unused_import
import 'issue_comments_view.dart';
import 'issue_details_view.dart';

class SingleTicketView extends StatelessWidget {
  const SingleTicketView(this.ticket, {super.key});

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
                child: Row(
                  children: [
                    IssueLinkWithParentsRow(ticket),

                    TicketStatusIndicator(issue: ticket),
                  ],
                ),
              ),
              Text(ticket['fields']['summary'] ?? 'null'),
            ],
          ),
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HistoryPage(ticket: ticket),
            CommentsPage(ticket: ticket),
            TicketDetailsView(ticket: ticket),
            AdvancedDataView(ticket: ticket),
            // TODO IssueEditFieldsWidget(issueData: ticket),
          ],
        ),
      ),
    );
  }
}

class AdvancedDataView extends StatelessWidget {
  const AdvancedDataView({
    super.key,
    required this.ticket,
  });

  final IssueData ticket;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar.secondary(
            tabs: [
              Tab(text: 'Full json'),
              Tab(text: 'Default fields'),
              Tab(text: '🚧 Custom fields'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TabBarView(
                children: [
                  JsonTicketView(ticket: ticket),
                  // JsonWidget(
                  //   json: json.decode(JsonEncoder().convert(ticket)),
                  //   initialExpandDepth: 2,
                  //   nodeIndent: 32,
                  // ),
                  FieldsTable(ticket),
                  UnderConstructionNotice(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JsonTicketView extends StatefulWidget {
  const JsonTicketView({
    super.key,
    required this.ticket,
  });

  final IssueData ticket;

  @override
  State<JsonTicketView> createState() => _JsonTicketViewState();
}

class _JsonTicketViewState extends State<JsonTicketView> {
  TextEditingController search = TextEditingController();
  bool filterEmpties = false;

  @override
  Widget build(BuildContext context) => Column(
    spacing: 8,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Row(
        spacing: 8,
        children: [
          Expanded(
            child: TextField(
              controller: search,
              decoration: InputDecoration(border: OutlineInputBorder(), icon: Icon(Icons.search)),
            ),
          ),
          IconButton(
            tooltip: 'Filtering null values: ${filterEmpties ? 'ON' : 'OFF'}',
            onPressed: () => setState(() {
              filterEmpties = !filterEmpties;
            }),
            icon: Icon(Icons.circle_outlined),
            selectedIcon: Icon(Icons.block),
            isSelected: filterEmpties,
          ),
        ],
      ),
      Expanded(
        child: SingleChildScrollView(
          child: JsonViewer(
            data: json.decode(JsonEncoder().convert(widget.ticket)),
            initialExpandDepth: 2,
            searchController: search,
            filterNullValues: filterEmpties,
          ),
        ),
      ),
    ],
  );
}

class FieldsTable extends StatefulWidget {
  const FieldsTable(this.ticket, {super.key});

  final IssueData ticket;
  @override
  State<FieldsTable> createState() => _FieldsTableState();
}

class _FieldsTableState extends State<FieldsTable> {
  TextEditingController searchController = TextEditingController();

  bool onlyNonHandled = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            IconButton(
              onPressed: () => setState(() {
                onlyNonHandled = !onlyNonHandled;
              }),
              icon: Icon(Icons.filter_alt_off),
              selectedIcon: Icon(Icons.filter_alt),
              isSelected: onlyNonHandled,
            ),
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: AnimatedBuilder(
              animation: searchController,

              builder: (context, _) {
                return Table(
                  border: TableBorder.all(color: Theme.of(context).dividerColor),
                  children: [
                    for (var field
                        in widget.ticket.fields!.entries
                            .where(
                              (e) => !(e.key as String).contains('customfield'),
                            )
                            .where(
                              // search
                              (e) => (e.key as String).toLowerCase().contains(searchController.text.toLowerCase()),
                            )
                            .where(
                              // non-handled filtering
                              (e) =>
                                  !onlyNonHandled ||
                                  ![
                                    'assignee',
                                    'assignee',
                                    'attachment',
                                    'comment',
                                    'components',
                                    'created',
                                    'description',
                                    'environment',
                                    'fixVersions',
                                    'issuelinks',
                                    'issuetype',
                                    'labels',
                                    'lastViewed',
                                    'priority',
                                    'project',
                                    'reporter',
                                    'status',
                                    'statusCategory',
                                    'statuscategorychangedate',
                                    'summary',
                                    'updated',
                                    'versions',
                                    'watches',
                                  ].contains(e.key as String),
                            )
                            .toList()
                          ..sort(
                            (a, b) => (a.key as String).compareTo(b.key),
                          ))
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment: TableCellVerticalAlignment.middle,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Builder(
                                  builder: (context) {
                                    String type = field.value.runtimeType.toString().replaceAll(RegExp('^_'), '').replaceAll(RegExp('<.*>'), '');
                                    var typeSpan = TextSpan(
                                      text: type,
                                      style: TextStyle(
                                        color: type == 'Null' ? Colors.red : Colors.green.shade600,
                                      ),
                                    );
                                    return SelectableText.rich(
                                      TextSpan(
                                        children: [
                                          if (type != 'Null') typeSpan,
                                          const TextSpan(text: ' '),
                                          TextSpan(text: field.key),
                                          if (type == 'Null')
                                            TextSpan(
                                              children: [
                                                TextSpan(text: ' ('),
                                                typeSpan,
                                                TextSpan(text: ')'),
                                              ],
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
