import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/ui/updates_widgets/updates_view_single_work_item/work_item_details_view.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkItemSearchDialog extends StatefulWidget {
  const WorkItemSearchDialog({
    super.key,
    this.selectionMode = false,
  });
  final bool selectionMode;
  // TODO unimplemented
  final bool canSelectMultiple = false;

  @override
  State<WorkItemSearchDialog> createState() => _WorkItemSearchDialogState();
}

class _WorkItemSearchDialogState extends State<WorkItemSearchDialog> {
  late String searchName;
  TextEditingController searchController = TextEditingController();

  Set<String> selectedKeys = {};

  Future<String> get myOwnRecentEdits async {
    var data = await DataModel().jiraApi.myself().then((value) => jsonDecode(value.body)['displayName']);
    return 'issue in updatedBy("$data") ORDER BY updated';
  }

  @override
  void initState() {
    searchName = 'My recent edits';
    super.initState();
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Row(
      spacing: 8,
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            controller: searchController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              suffix: IconButton(
                onPressed: () => searchController.text = '',
                icon: Icon(Symbols.close),
                visualDensity: VisualDensity.compact,
                iconSize: 16,
              ),
              label: Text('Search'),
            ),

            onChanged: (value) => setState(() {
              searchName = 'Search results';
            }),
            onEditingComplete: () => setState(() {
              searchName = 'Search results';
            }),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            border: (searchName == 'My recent edits')
                ? Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2,
                  )
                : null,
          ),
          child: IconButton(
            iconSize: 32,
            tooltip: 'My recent edits',
            onPressed: () => setState(() {
              searchName = 'My recent edits';
            }),
            icon: Icon(Symbols.change_circle),
            isSelected: searchName == 'My recent edits',
          ),
        ),
      ],
    ),
    constraints: BoxConstraints(maxWidth: 1200 - 50, minWidth: 600),

    content: AnimatedSize(
      duration: Durations.long4,
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text('${widget.selectionMode ? 'Select from: ' : ''}$searchName', style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.start),
          ),
          if (searchName == 'Search results')
            FutureBuilder(
              future: Future.wait([
                // direct key search
                Future.microtask(
                  () async {
                    List results = [];
                    var directWorkItemIds = RegExp(r'[A-Z]+-[0-9]+').allMatches(searchController.text);
                    if (directWorkItemIds.isNotEmpty) {
                      for (var m in directWorkItemIds) {
                        String? key = m.group(0);
                        if (key == null) continue;
                        results.add(jsonDecode((await DataModel().jiraApi.getWorkItem(key)).body));
                      }
                    }
                    return results;
                  },
                ),
                // text search
                DataModel().jiraApi.jqlSearch(
                  '${searchController.text.isEmpty ? '' : 'text ~ "${searchController.text}"'} ORDER BY created',
                  fields: [
                    'issuetype',
                    'priority',
                    'status',
                    'statusCategory',
                    'summary',
                  ],
                  expand: [],
                ),
              ]),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List workItems = [...snapshot.data![0], ...(snapshot.data![1]['issues'] as List)];

                  return Flexible(
                    child: SizedBox(
                      height: 500,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i in workItems)
                              IssueLinkTile(
                                i,
                                onSelect: widget.selectionMode
                                    ? (issueKey) => setState(() {
                                        if (selectedKeys.contains(issueKey)) {
                                          selectedKeys.remove(issueKey);
                                        } else {
                                          selectedKeys.add(issueKey);
                                        }
                                        if (!widget.canSelectMultiple) {
                                          Navigator.of(context).pop(issueKey);
                                        }
                                      })
                                    : null,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return LinearProgressIndicator();
              },
            ),
          if (searchName == 'My recent edits')
            FutureBuilder(
              future: myOwnRecentEdits.then(
                (jql) => DataModel().jiraApi.jqlSearch(
                  jql,
                  fields: [
                    'issuetype',
                    'priority',
                    'status',
                    'statusCategory',
                    'summary',
                  ],
                  expand: [],
                ),
              ),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List workItems = (snapshot.data!['issues'] as List); //.map((e) => IssueData(e)).toList();

                  return Flexible(
                    child: SizedBox(
                      height: 500,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            for (var i in workItems)
                              IssueLinkTile(
                                i,
                                onSelect: widget.selectionMode
                                    ? (issueKey) => setState(() {
                                        if (selectedKeys.contains(issueKey)) {
                                          selectedKeys.remove(issueKey);
                                        } else {
                                          selectedKeys.add(issueKey);
                                        }
                                        if (!widget.canSelectMultiple) {
                                          Navigator.of(context).pop(issueKey);
                                        }
                                      })
                                    : null,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return LinearProgressIndicator();
              },
            ),

          // "GO TO ALL" SECTION
          if (!widget.selectionMode)
            Row(
              spacing: 16,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    SizedBox(),
                    Transform.rotate(angle: pi / 4, child: Icon(Symbols.navigation)),
                    Text('Go to all:'),
                  ],
                ),
                ActionChip(label: Text('Boards'), onPressed: () => launchUrl(Uri.parse('https://${DataModel().jiraApi.dao.domain}/jira/boards?page=1&sortKey=name&sortOrder=ASC'))),
                ActionChip(label: Text('Projects'), onPressed: () => launchUrl(Uri.parse('https://${DataModel().jiraApi.dao.domain}/jira/projects?page=1&sortKey=name&sortOrder=ASC'))),
                ActionChip(label: Text('Filters'), onPressed: () => launchUrl(Uri.parse('https://${DataModel().jiraApi.dao.domain}/jira/filters?Search=Search&filterView=search&name='))),
                ActionChip(label: Text('Plans'), onPressed: () => launchUrl(Uri.parse('https://${DataModel().jiraApi.dao.domain}/jira/plans'))),
                ActionChip(
                  label: Text('Teams'),
                  onPressed: () => launchUrl(
                    Uri.parse('https://${DataModel().jiraApi.dao.domain}/jira/people'),
                  ),
                ),
              ],
            ),
        ],
      ),
    ),
  );
}

class OpenWorkItemSearchDialogIntent extends Intent {}

class OpenWorkItemSearchDialogAction extends Action with UiLoggy {
  BuildContext context;
  OpenWorkItemSearchDialogAction(this.context);
  @override
  Object? invoke(Intent intent) {
    loggy.info('User pressed ctrl + F: showing search issue dialog');
    return showDialog(context: context, builder: (context) => WorkItemSearchDialog());
  }
}
