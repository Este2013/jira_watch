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
          animation: Listenable.merge([model.tabs, model.groups, model.pinnedKeys, model.activeTabId, model.activeLeadingView, model.selectedGroupId]),
          builder: (context, _) => Column(
            children: [
              // Deliberately not `const`: a const widget is canonicalized to
              // one identical instance across rebuilds, and Flutter's element
              // reconciliation skips calling build() again on an unchanged
              // identical child — so the strip would render once and then
              // never again reflect a new tab, a closed one, or a group
              // switch, no matter how often this AnimatedBuilder re-fires.
              WorkItemsTabStrip(),
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
    // Not reached in practice — activeLeadingView and activeTabId are kept
    // as an XOR by every mutator below — but not `const` regardless, on the
    // same principle as everywhere else in this file.
    if (tab == null) return WorkItemsLeadingViewContent(view: WorkItemsLeadingView.pinnedWorkItems);

    return tab.isSearchTab ? WorkItemSearchTabContent(key: ValueKey(tab.id), tab: tab) : WorkItemTabContent(key: ValueKey(tab.id), tab: tab);
  }
}
