import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jira_watch/models/api_model.dart';

import 'overview_widgets/issue_badge.dart';
import 'overview_widgets/issue_details_view.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  final now = DateTime.now();
  int pageShown = 0;
  late StreamController<int> pageRequester;
  late Stream<Iterable<IssueData>> pageStream;

  Widget? view;

  @override
  void initState() {
    super.initState();
    pageRequester = StreamController()..add(0);
    pageStream = IssuesModel().getLastUpdatedIssuesPageCached(pageSize: 25, pageIndexStream: pageRequester.stream);
  }

  @override
  void dispose() {
    pageRequester.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: StreamBuilder(
                    stream: pageStream,
                    builder: (context, snapshot) {
                      print(snapshot.connectionState);
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) return ErrorWidget('${snapshot.error}');

                      if (snapshot.hasData) {
                        return FutureBuilder<Iterable<dynamic>>(
                          //TODO this thing needs to recieve actual Futures.
                          future: Future.value(snapshot.data!),
                          builder: (context, futureSnapshot) {
                            if (futureSnapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            if (futureSnapshot.hasError) {
                              return ErrorWidget('${futureSnapshot.error}\n\n${(futureSnapshot.error as Error).stackTrace}');
                            }
                            if (futureSnapshot.hasData) {
                              return ListView(
                                children: [
                                  ...futureSnapshot.data!.map((t) => JiraTicketPreviewItem(ticket: t, updateView: updateView)),
                                ],
                              );
                            }
                            return Center(child: CircularProgressIndicator(color: Colors.amber));
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator(color: Colors.amber));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: pageShown == 0
                          ? null
                          : () {
                              pageRequester.add(pageShown - 1);
                              setState(() {
                                pageShown--;
                              });
                            },
                      icon: Icon(Icons.navigate_before),
                    ),
                    //TODO surrounding pages.
                    IconButton(
                      onPressed: null,
                      icon: Text(pageShown.toString()),
                    ),

                    //TODO detect end
                    IconButton(
                      onPressed: () {
                        pageRequester.add(pageShown + 1);
                        setState(() {
                          pageShown++;
                        });
                      },
                      icon: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(child: view ?? Placeholder()),
        ],
      ),
    );
  }

  void updateView(Widget w) => setState(() => view = w);
}

class JiraTicketPreviewItem extends StatelessWidget {
  final dynamic ticket;
  final Function(Widget)? updateView;

  const JiraTicketPreviewItem({super.key, required this.ticket, this.updateView});

  @override
  Widget build(BuildContext context) {
    final colors = _ticketColors(context, ticket);
    final summary = ticket['fields']['summary'] ?? 'No Title';

    return Card(
      color: colors['bg'],
      shape: RoundedRectangleBorder(
        side: BorderSide(color: colors['border']!, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.all(4),
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IssueHeaderRow(ticket),
              Text(
                summary,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        onTap: () => updateView?.call(IssueDetailsView(ticket)),
      ),
    );
  }

  Map<String, Color> _ticketColors(context, ticket) {
    var type = ticket['fields']['issuetype']['name'];
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    switch (type) {
      case 'Bug':
        return {
          'bg': isLightTheme ? Colors.red.shade50 : Colors.red.shade900,
          'border': Colors.red.shade700,
        };
      case 'Task':
        return {
          'bg': isLightTheme ? Colors.blue.shade50 : Colors.blue.shade900,
          'border': Colors.blue.shade700,
        };
      case 'Story':
        return {
          'bg': isLightTheme ? Colors.green.shade50 : Colors.green.shade900,
          'border': Colors.green.shade700,
        };
      case 'Epic':
        return {
          'bg': isLightTheme ? Colors.purple.shade50 : Colors.purple.shade900,
          'border': Colors.purple.shade700,
        };
      default:
        return {
          'bg': isLightTheme ? Colors.grey.shade50 : Colors.grey.shade900,
          'border': Colors.grey.shade700,
        };
    }
  }
}
