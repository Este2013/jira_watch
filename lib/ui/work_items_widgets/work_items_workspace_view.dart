import 'package:flutter/material.dart';
import 'package:jira_watcher/models/work_item_tabs_model.dart';
import 'package:jira_watcher/ui/work_items_widgets/work_item_tab_content.dart';
import 'package:jira_watcher/ui/work_items_widgets/work_items_leading_views.dart';
import 'package:jira_watcher/ui/work_items_widgets/work_items_tab_strip.dart';

/// The Work items page: the tab strip plus whatever it currently has active —
/// a leading view, a real work item tab, or a search tab still picking one.
class WorkItemsWorkspaceView extends StatelessWidget {
  const WorkItemsWorkspaceView({super.key});

  @override
  Widget build(BuildContext context) {
    final model = WorkItemTabsModel();
    return FutureBuilder<bool>(
      future: model.isReady,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) return const Center(child: CircularProgressIndicator());
        return AnimatedBuilder(
          animation: Listenable.merge([model.tabs, model.groups, model.activeTabId, model.activeLeadingView, model.selectedGroupId]),
          builder: (context, _) => Column(
            children: [
              const WorkItemsTabStrip(),
              const Divider(height: 1),
              Expanded(child: _content(model)),
            ],
          ),
        );
      },
    );
  }

  Widget _content(WorkItemTabsModel model) {
    final leading = model.activeLeadingView.value;
    if (leading != null) return WorkItemsLeadingViewContent(key: ValueKey(leading), view: leading);

    final tab = model.activeTab;
    if (tab == null) return const WorkItemsLeadingViewContent(view: WorkItemsLeadingView.pinnedWorkItems);

    return tab.isSearchTab ? WorkItemSearchTabContent(key: ValueKey(tab.id), tab: tab) : WorkItemTabContent(key: ValueKey(tab.id), tab: tab);
  }
}
