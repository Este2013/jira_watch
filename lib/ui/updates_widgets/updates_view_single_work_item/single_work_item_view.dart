import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/updates_widgets/issue_ui_elements.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_history_view.dart';
import 'package:jira_watcher/ui/utils/json_viewer.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';

// ignore: unused_import
import '../../utils/under_constuction_notice.dart';
import 'work_item_comments_view.dart';
import 'work_item_details_view.dart';

enum JiraWorkItemTab { history, comments, details, json }

class SingleJiraWorkItemView extends StatefulWidget {
  const SingleJiraWorkItemView(this.workItem, {super.key, this.isPartOfDialog = false, this.initialTab = JiraWorkItemTab.history});

  final JiraWorkItemData workItem;
  final bool isPartOfDialog;
  final JiraWorkItemTab initialTab;

  @override
  State<SingleJiraWorkItemView> createState() => _SingleJiraWorkItemViewState();
}

class _SingleJiraWorkItemViewState extends State<SingleJiraWorkItemView> with TickerProviderStateMixin, UiLoggy {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      initialIndex: widget.initialTab.index,
      vsync: this,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(
        text: 'History',
        icon: Icon(Symbols.history),
      ),
      Tab(
        text: 'Comments (${widget.workItem.commentsData?['comments']?.length ?? 0})',
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
    Future<JiraWorkItemData>? fullWorkItemData;
    if ([widget.workItem.changelog, widget.workItem.fields, widget.workItem.commentsData].any((e) => e == null)) {
      loggy.info('Provided data for ${widget.workItem.key} is incomplete; fetching a full version online');
      if (widget.workItem.key == null) return ErrorWidget("Can't work if the issue's key is null!!!");
      fullWorkItemData = DataModel().jiraApi.getWorkItem(widget.workItem.key!, expand: ['changelog']).then(
        (value) {
          return JiraWorkItemData.fromJson({'data': jsonDecode(value.body)});
        },
      );
    } else {
      fullWorkItemData = Future.value(widget.workItem);
    }

    return FutureBuilder(
      future: fullWorkItemData,
      builder: (context, asyncSnapshot) {
        if (asyncSnapshot.hasData) {
          var workItem = asyncSnapshot.data!;
          return DefaultTabController(
            length: tabs.length,

            child: Scaffold(
              backgroundColor: widget.isPartOfDialog ? Colors.transparent : null,
              appBar: AppBar(
                backgroundColor: widget.isPartOfDialog ? Colors.transparent : null,
                toolbarHeight: kToolbarHeight + 10,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.bodyMedium ?? TextStyle(),
                      child: Row(
                        children: [
                          WorkItemLinkWithParentsRow(workItem),

                          JiraWorkItemStatusIndicator(issue: workItem),
                        ],
                      ),
                    ),
                    SelectableText(workItem['fields']['summary'] ?? 'null'),
                  ],
                ),
                bottom: TabBar(tabs: tabs, controller: tabController),
              ),
              body: TabBarView(
                controller: tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  HistoryPage(workItem: workItem),
                  CommentsPage(workItem: workItem),
                  JiraWorkItemDetailsView(workItem: workItem),
                  AdvancedDataView(workItem: workItem),
                ],
              ),
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

class SingleJiraWorkItemDialog extends StatelessWidget {
  const SingleJiraWorkItemDialog(this.workItem, {super.key, this.initialTab = JiraWorkItemTab.history});

  final JiraWorkItemTab initialTab;
  final JiraWorkItemData workItem;

  @override
  Widget build(BuildContext context) => AlertDialog(
    clipBehavior: Clip.hardEdge,
    content: SizedBox(
      width: 1200 - 50,
      child: SingleJiraWorkItemView(
        workItem,
        isPartOfDialog: true,
        key: Key(workItem.data['key']),
        initialTab: initialTab,
      ),
    ),
  );
}

class AdvancedDataView extends StatelessWidget {
  const AdvancedDataView({
    super.key,
    required this.workItem,
  });

  final JiraWorkItemData workItem;

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
                JsonWorkItemView(workItem: workItem),
                FieldsTable(workItem),
                UnderConstructionNotice(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class JsonWorkItemView extends StatefulWidget {
  const JsonWorkItemView({
    super.key,
    required this.workItem,
  });

  final JiraWorkItemData workItem;

  @override
  State<JsonWorkItemView> createState() => _JsonWorkItemViewState();
}

class _JsonWorkItemViewState extends State<JsonWorkItemView> {
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
            data: json.decode(JsonEncoder().convert(widget.workItem)),
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
  const FieldsTable(this.workItem, {super.key});

  final JiraWorkItemData workItem;
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
                      widget.workItem.fields!.entries
                          .where(
                            (e) => !(e.key as String).contains('customfield'),
                          )
                          .where(
                            // search
                            (e) => (e.key as String).toLowerCase().contains(searchController.text.toLowerCase()),
                          )
                          .where(
                            // non-handled filtering
                            (e) => !onlyNonHandled || !DataModel().jiraApi.defaultFields.contains(e.key as String),
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
                                    data: widget.workItem.fields![selectedKey],
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
