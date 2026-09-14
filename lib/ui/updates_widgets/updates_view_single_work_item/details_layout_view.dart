import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:material_symbols_icons/symbols.dart';

import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/details_layout_model.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/ui/utils/widgets/app_snackbar.dart';

import 'details_properties.dart';

/// The arrangeable half of the Details tab: everything below Description and
/// Environment, laid out as the reader left it.
///
/// Replaces the single "Custom fields" block that used to sit at the bottom —
/// each property is now its own thing, which is what lets it be hidden
/// (and, once the rest of this lands, pinned and grouped).
class DetailsPropertiesSection extends StatelessWidget {
  const DetailsPropertiesSection({super.key, required this.workItem});

  final JiraWorkItemData workItem;

  @override
  Widget build(BuildContext context) {
    final layout = DetailsLayoutModel();

    return FutureBuilder<Map<String, jira.FieldDetails>>(
      future: DataModel().fieldMetadata(),
      builder: (context, snapshot) {
        final metadata = snapshot.data ?? const <String, jira.FieldDetails>{};

        return ListenableBuilder(
          listenable: layout.listenable,
          builder: (context, _) {
            final properties = buildDetailsProperties(workItem, metadata);
            final showEmpty = layout.showEmptyProperties.value;
            final hiddenIds = layout.hiddenPropertyIds.list.toSet();
            final visible = properties.where((p) => !hiddenIds.contains(p.id) && (p.hasValue || showEmpty)).toList();

            // Resolved for every hidden property, not just the ones this
            // issue happens to have — otherwise something hidden while
            // reading one project's ticket could never be brought back from
            // another's.
            final byId = {for (final property in properties) property.id: property};
            final hiddenNames = {for (final id in hiddenIds) id: byId[id]?.name ?? metadata[id]?.name ?? id};

            // The dates stay where they have always been: last, in their
            // own order, below everything the reader arranges.
            final arranged = visible.where((p) => !p.isFooter);
            final footer = visible.where((p) => p.isFooter);

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                for (final property in arranged) DetailsPropertyTile(key: Key(property.id), property: property),
                if (footer.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 24, bottom: 8),
                    child: Divider(height: 1),
                  ),
                for (final property in footer) DetailsPropertyTile(key: Key(property.id), property: property),
                DetailsLayoutFooter(hiddenNames: hiddenNames),
              ],
            );
          },
        );
      },
    );
  }
}

/// One property, with its own right-click menu.
///
/// A context menu rather than a button that appears over the content:
/// nothing overlaps what you are reading, nothing shifts under the cursor,
/// and it is where the rest of the app already puts per-item actions.
class DetailsPropertyTile extends StatelessWidget {
  const DetailsPropertyTile({super.key, required this.property});

  final DetailsProperty property;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onSecondaryTapDown: (details) => _showMenu(context, details),
    child: property.build(context),
  );

  void _showMenu(BuildContext context, TapDownDetails details) {
    showContextMenu(
      context,
      onItemSelected: (_) {},
      contextMenu: ContextMenu(
        position: details.globalPosition,
        entries: <ContextMenuEntry>[
          MenuItem(label: Center(child: Text(property.name)), enabled: false),
          const MenuDivider(),
          MenuItem(
            label: const Text('Hide on every issue'),
            icon: const Icon(Symbols.visibility_off),
            // Shown disabled rather than left out, so it is clear this
            // section is deliberately not hideable rather than the menu
            // being broken.
            enabled: property.canHide,
            onSelected: (_) => _hide(context),
          ),
        ],
      ),
    );
  }

  void _hide(BuildContext context) {
    DetailsLayoutModel().hide(property.id);
    showAppSnackBar(
      context,
      SnackBar(
        content: Text('Hid "${property.name}" on every issue'),
        action: SnackBarAction(label: 'Undo', onPressed: () => DetailsLayoutModel().restore(property.id)),
      ),
    );
  }
}

/// The layout's own controls, at the bottom of the tab: whether to show
/// properties this issue left blank, and a way back for anything hidden.
class DetailsLayoutFooter extends StatelessWidget {
  const DetailsLayoutFooter({super.key, required this.hiddenNames});

  /// Every hidden property, by id, with the best name available for it.
  final Map<String, String> hiddenNames;

  @override
  Widget build(BuildContext context) {
    final layout = DetailsLayoutModel();

    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              children: [
                Icon(Symbols.tune, size: 18, color: Theme.of(context).hintColor),
                const SizedBox(width: 8),
                Expanded(child: Text('Layout', style: Theme.of(context).textTheme.titleSmall)),
                Text('Show properties without a value', style: Theme.of(context).textTheme.bodyMedium),
                Switch(
                  value: layout.showEmptyProperties.value,
                  onChanged: (show) => layout.setShowEmptyProperties(show: show),
                ),
              ],
            ),
            if (hiddenNames.isNotEmpty) ...[
              Text('Hidden — click to bring back', style: Theme.of(context).textTheme.labelMedium),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final entry in hiddenNames.entries)
                    ActionChip(
                      avatar: const Icon(Symbols.visibility, size: 16),
                      label: Text(entry.value),
                      onPressed: () => layout.restore(entry.key),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
