import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/home.dart';
import 'package:jira_watcher/ui/updates_widgets/issue_ui_elements.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_ticket/issue_history_view.dart';
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
  Widget build(BuildContext context) => DefaultTabController(
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
  String? selectedKey;

  TextEditingController searchController = TextEditingController();

  bool onlyNonHandled = false;

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
            tooltip: 'Hide fields that are handled in Details view: ${onlyNonHandled ? 'ON' : 'OFF'}',
            icon: Icon(Icons.filter_alt_off),
            selectedIcon: Icon(Icons.filter_alt),
            isSelected: onlyNonHandled,
          ),
        ],
      ),
      Expanded(
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: searchController,
                builder: (context, _) {
                  List<MapEntry<dynamic, dynamic>> fields =
                      widget.ticket.fields!.entries
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
                                  'creator',
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
                                  'resolutiondate',
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
                        );
                  return ListView(
                    children: [
                      for (var field in fields)
                        Builder(
                          builder: (context) {
                            String type = field.value.runtimeType.toString().replaceAll(RegExp('^_'), '').replaceAll(RegExp('<.*>'), '');
                            var typeSpan = TextSpan(
                              text: type,
                              style: TextStyle(
                                color: type == 'Null' ? Colors.red : Colors.green.shade600,
                              ),
                            );
                            return ListTile(
                              title: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: field.key),

                                    TextSpan(
                                      children: [
                                        TextSpan(text: ' ('),
                                        typeSpan,
                                        TextSpan(text: ')'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              subtitle: type == 'Map'
                                  ? Text('{ ${(field.value as Map).length} }')
                                  : type == 'List'
                                  ? Text('[ ${(field.value as List).length} ]')
                                  : Text(field.value.toString()),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () => Clipboard.setData(ClipboardData(text: field.key)),
                                    icon: Icon(Icons.key),
                                    tooltip: 'Copy key',
                                  ),
                                  IconButton(
                                    onPressed: () => Clipboard.setData(ClipboardData(text: JsonEncoder.withIndent('    ').convert(field.value))),
                                    icon: Icon(Icons.data_object),
                                    tooltip: 'Copy value',
                                  ),
                                ],
                              ),
                              onTap: () => setState(() => selectedKey = field.key),
                              selected: selectedKey == field.key,
                              selectedTileColor: Theme.of(context).colorScheme.secondaryContainer.withAlpha(200),
                            );
                          },
                        ),
                    ],
                  );
                },
              ),
            ),

            AnimatedSize(
              key: Key(selectedKey ?? 'none is selected'),
              duration: Durations.medium1,
              child: selectedKey == null
                  ? SizedBox.shrink()
                  : SizedBox(
                      width: 500,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            spacing: 16,
                            children: [
                              Text(
                                selectedKey!,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Divider(),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: JsonViewer(
                                    key: Key('viewer:${selectedKey ?? 'none is selected'}'),
                                    data: widget.ticket.fields![selectedKey],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    ],
  );
}
