import 'package:confluence_api/api.dart' as confluence;
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/models/confluence_tabs_model.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_images.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Picks a space to open as a tab.
///
/// Every space is fetched once and filtered locally: a site has tens to
/// hundreds of them, which is small enough to hold, and typing then costs
/// nothing instead of a request per keystroke.
class ConfluenceSpacePickerDialog extends StatefulWidget {
  const ConfluenceSpacePickerDialog({super.key});

  @override
  State<ConfluenceSpacePickerDialog> createState() => _ConfluenceSpacePickerDialogState();
}

class _ConfluenceSpacePickerDialogState extends State<ConfluenceSpacePickerDialog> {
  late final Future<List<confluence.SpaceBulk>> _spaces;
  final _searchController = TextEditingController();

  /// Archived spaces are hidden by default: they are read-only leftovers and on
  /// a long-lived site they outnumber the live ones.
  bool _includeArchived = false;

  @override
  void initState() {
    super.initState();
    _spaces = ConfluenceApi().allSpaces();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool _matches(confluence.SpaceBulk space) {
    if (!_includeArchived && space.status == confluence.SpaceStatus.archived) return false;
    final query = _searchController.text.trim().toLowerCase();
    if (query.isEmpty) return true;
    return '${space.name}'.toLowerCase().contains(query) || '${space.key}'.toLowerCase().contains(query);
  }

  void _open(confluence.SpaceBulk space) => Navigator.of(context).pop(
    ConfluenceSpaceTab(
      tabId: ConfluenceSpaceTab.newTabId(),
      spaceId: space.id ?? '',
      spaceKey: space.key ?? '',
      spaceName: space.name ?? space.key ?? 'Space',
      iconPath: ConfluenceApi.iconPathOf(space.icon),
    ),
  );

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Open a space'),
    // A minWidth here would make the dialog ask its content how wide it wants
    // to be, and the content is a lazy ListView, which cannot answer — sizing
    // it would mean building every child. The content is given a width instead.
    constraints: const BoxConstraints(maxWidth: 650, maxHeight: 650),
    content: SizedBox(
      width: 600,
      height: 480,
      child: Column(
        spacing: 12,
        children: [
          TextField(
            controller: _searchController,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              prefixIcon: Icon(Symbols.search),
              labelText: 'Filter spaces',
            ),
            onChanged: (_) => setState(() {}),
          ),
          Row(
            children: [
              Switch(value: _includeArchived, onChanged: (v) => setState(() => _includeArchived = v)),
              const SizedBox(width: 8),
              const Text('Include archived spaces'),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<confluence.SpaceBulk>>(
              future: _spaces,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Could not load your spaces.\n${snapshot.error}', textAlign: TextAlign.center));
                }
                if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

                final spaces = snapshot.data!.where(_matches).toList()
                  ..sort((a, b) => '${a.name}'.toLowerCase().compareTo('${b.name}'.toLowerCase()));
                if (spaces.isEmpty) return const Center(child: Text('No space matches.'));

                return ListView.builder(
                  itemCount: spaces.length,
                  itemBuilder: (context, i) {
                    final space = spaces[i];
                    return ListTile(
                      leading: ConfluenceSpaceIcon(path: ConfluenceApi.iconPathOf(space.icon), size: 24, fallbackLabel: space.name ?? space.key),
                      title: Text('${space.name}'),
                      subtitle: Text('${space.key}'),
                      trailing: space.status == confluence.SpaceStatus.archived
                          ? const Chip(label: Text('Archived', style: TextStyle(fontSize: 11)), visualDensity: VisualDensity.compact)
                          : null,
                      onTap: () => _open(space),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    ),
    actions: [TextButton(onPressed: Navigator.of(context).pop, child: const Text('Cancel'))],
  );
}
