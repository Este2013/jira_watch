import 'package:flutter/material.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:material_symbols_icons/symbols.dart';

import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/details_layout_model.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';

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

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8,
              children: [
                for (final property in visible) DetailsPropertyTile(key: Key(property.id), property: property),
                DetailsLayoutFooter(hiddenNames: hiddenNames),
              ],
            );
          },
        );
      },
    );
  }
}

/// One property, with the controls for rearranging it revealed on hover.
///
/// Hover rather than an edit mode, and a small button rather than a whole
/// draggable surface: the tab stays readable, and nothing moves because a
/// click landed slightly off.
class DetailsPropertyTile extends StatefulWidget {
  const DetailsPropertyTile({super.key, required this.property});

  final DetailsProperty property;

  @override
  State<DetailsPropertyTile> createState() => _DetailsPropertyTileState();
}

class _DetailsPropertyTileState extends State<DetailsPropertyTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _hovering = true),
    onExit: (_) => setState(() => _hovering = false),
    child: Stack(
      children: [
        widget.property.build(context),
        if (_hovering)
          Positioned(
            top: 0,
            right: 0,
            child: PropertyActionButton(
              icon: Symbols.visibility_off,
              tooltip: 'Hide "${widget.property.name}" on every issue',
              onPressed: () => DetailsLayoutModel().hide(widget.property.id),
            ),
          ),
      ],
    ),
  );
}

/// Sized to sit in the corner of even a single line of text without
/// covering it or forcing the row taller.
class PropertyActionButton extends StatelessWidget {
  const PropertyActionButton({super.key, required this.icon, required this.tooltip, required this.onPressed});

  final IconData icon;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip,
    child: Material(
      color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.92),
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Icon(icon, size: 14),
        ),
      ),
    ),
  );
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
