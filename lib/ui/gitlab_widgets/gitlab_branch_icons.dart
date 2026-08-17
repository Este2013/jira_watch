import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

/// The icons a favorite branch can be labelled with.
///
/// A hand-picked subset of Material Symbols rather than the package's own
/// generated name-to-icon map: that map references every symbol in the font
/// in one file, and importing it anywhere defeats Flutter's icon tree-shaking
/// for the whole app — every glyph ships whether a branch favorite ever uses
/// it or not. Each entry here is instead its own literal `Symbols.x`
/// reference, which tree-shakes exactly like every other icon already used
/// across the app.
///
/// Kept as a name-keyed map, not a bare list, so a rule can persist a stable
/// string rather than an [IconData] — see [GitLabQuickBranchRule.iconName].
const Map<String, IconData> gitLabBranchIconChoices = {
  'star': Symbols.star,
  'bolt': Symbols.bolt,
  'rocket_launch': Symbols.rocket_launch,
  'flag': Symbols.flag,
  'label': Symbols.label,
  'bug_report': Symbols.bug_report,
  'science': Symbols.science,
  'construction': Symbols.construction,
  'verified': Symbols.verified,
  'push_pin': Symbols.push_pin,
  'bookmark': Symbols.bookmark,
  'favorite': Symbols.favorite,
  'thumb_up': Symbols.thumb_up,
  'grade': Symbols.grade,
  'shield': Symbols.shield,
  'shield_with_heart': Symbols.shield_with_heart,
  'lock': Symbols.lock,
  'lock_open': Symbols.lock_open,
  'key': Symbols.key,
  'visibility': Symbols.visibility,
  'visibility_off': Symbols.visibility_off,
  'update': Symbols.update,
  'schedule': Symbols.schedule,
  'history': Symbols.history,
  'timer': Symbols.timer,
  'hourglass_top': Symbols.hourglass_top,
  'today': Symbols.today,
  'event': Symbols.event,
  'calendar_month': Symbols.calendar_month,
  'fork_right': Symbols.fork_right,
  'merge': Symbols.merge,
  'call_split': Symbols.call_split,
  'call_merge': Symbols.call_merge,
  'commit': Symbols.commit,
  'account_tree': Symbols.account_tree,
  'conversion_path': Symbols.conversion_path,
  'deployed_code': Symbols.deployed_code,
  'deployed_code_update': Symbols.deployed_code_update,
  'package_2': Symbols.package_2,
  'inventory_2': Symbols.inventory_2,
  'folder': Symbols.folder,
  'folder_open': Symbols.folder_open,
  'folder_zip': Symbols.folder_zip,
  'terminal': Symbols.terminal,
  'code': Symbols.code,
  'code_blocks': Symbols.code_blocks,
  'data_object': Symbols.data_object,
  'build': Symbols.build,
  'build_circle': Symbols.build_circle,
  'settings': Symbols.settings,
  'tune': Symbols.tune,
  'speed': Symbols.speed,
  'electric_bolt': Symbols.electric_bolt,
  'whatshot': Symbols.whatshot,
  'local_fire_department': Symbols.local_fire_department,
  'ac_unit': Symbols.ac_unit,
  'water_drop': Symbols.water_drop,
  'eco': Symbols.eco,
  'spa': Symbols.spa,
  'park': Symbols.park,
  'pets': Symbols.pets,
  'cruelty_free': Symbols.cruelty_free,
  'coronavirus': Symbols.coronavirus,
  'warning': Symbols.warning,
  'error': Symbols.error,
  'report': Symbols.report,
  'priority_high': Symbols.priority_high,
  'new_releases': Symbols.new_releases,
  'auto_awesome': Symbols.auto_awesome,
  'celebration': Symbols.celebration,
  'emoji_events': Symbols.emoji_events,
  'military_tech': Symbols.military_tech,
  'workspace_premium': Symbols.workspace_premium,
  'diamond': Symbols.diamond,
  'crown': Symbols.crown,
  'check_circle': Symbols.check_circle,
  'cancel': Symbols.cancel,
  'block': Symbols.block,
  'do_not_disturb_on': Symbols.do_not_disturb_on,
  'pause_circle': Symbols.pause_circle,
  'play_circle': Symbols.play_circle,
  'stop_circle': Symbols.stop_circle,
  'sync': Symbols.sync,
  'sync_alt': Symbols.sync_alt,
  'restart_alt': Symbols.restart_alt,
  'refresh': Symbols.refresh,
  'north': Symbols.north,
  'south': Symbols.south,
  'east': Symbols.east,
  'west': Symbols.west,
  'arrow_upward': Symbols.arrow_upward,
  'arrow_forward': Symbols.arrow_forward,
  'trending_up': Symbols.trending_up,
  'rocket': Symbols.rocket,
  'flight': Symbols.flight,
  'anchor': Symbols.anchor,
  'sailing': Symbols.sailing,
  'directions_run': Symbols.directions_run,
  'directions_bike': Symbols.directions_bike,
  'home': Symbols.home,
  'apartment': Symbols.apartment,
  'store': Symbols.store,
  'factory': Symbols.factory,
  'public': Symbols.public,
  'language': Symbols.language,
  'group': Symbols.group,
  'person': Symbols.person,
  'groups': Symbols.groups,
  'diversity_3': Symbols.diversity_3,
  'psychology': Symbols.psychology,
  'lightbulb': Symbols.lightbulb,
  'palette': Symbols.palette,
  'brush': Symbols.brush,
  'photo_camera': Symbols.photo_camera,
  'movie': Symbols.movie,
  'music_note': Symbols.music_note,
  'sports_esports': Symbols.sports_esports,
  'extension': Symbols.extension,
  'toys': Symbols.toys,
  'cake': Symbols.cake,
  'coffee': Symbols.coffee,
  'restaurant': Symbols.restaurant,
  'egg': Symbols.egg,
  'nutrition': Symbols.nutrition,
  'fireplace': Symbols.fireplace,
  'thunderstorm': Symbols.thunderstorm,
  'wb_sunny': Symbols.wb_sunny,
  'nights_stay': Symbols.nights_stay,
  'star_half': Symbols.star_half,
  'circle': Symbols.circle,
  'square': Symbols.square,
  'hexagon': Symbols.hexagon,
  'pentagon': Symbols.pentagon,
  'change_history': Symbols.change_history,
  'category': Symbols.category,
  'grid_view': Symbols.grid_view,
  'apps': Symbols.apps,
  'widgets': Symbols.widgets,
  'dashboard': Symbols.dashboard,
  'insights': Symbols.insights,
  'analytics': Symbols.analytics,
  'query_stats': Symbols.query_stats,
  'bar_chart': Symbols.bar_chart,
  'donut_small': Symbols.donut_small,
  'attach_money': Symbols.attach_money,
  'savings': Symbols.savings,
  'paid': Symbols.paid,
  'receipt_long': Symbols.receipt_long,
  'shopping_cart': Symbols.shopping_cart,
  'redeem': Symbols.redeem,
  'card_giftcard': Symbols.card_giftcard,
};

/// A handful of icons offered directly in the rule editor, without opening the
/// full picker — chosen for what a favorite branch is usually named after:
/// releases, hotfixes, work in progress, and the default star.
const List<String> gitLabBranchQuickIconNames = [
  'star',
  'bolt',
  'rocket_launch',
  'flag',
  'label',
  'bug_report',
  'science',
  'construction',
];

/// Resolves [name] to an icon, falling back to the default star for anything
/// not in [gitLabBranchIconChoices] — including names a future version of the
/// app might add that this build has never heard of.
IconData gitLabBranchIcon(String name) => gitLabBranchIconChoices[name] ?? Symbols.star;

/// Lets the reader search the full icon list by typing part of its name.
class GitLabBranchIconPickerDialog extends StatefulWidget {
  const GitLabBranchIconPickerDialog({super.key, required this.selected});

  final String selected;

  @override
  State<GitLabBranchIconPickerDialog> createState() => _GitLabBranchIconPickerDialogState();
}

class _GitLabBranchIconPickerDialogState extends State<GitLabBranchIconPickerDialog> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final entries = gitLabBranchIconChoices.entries.where((e) => query.isEmpty || e.key.contains(query)).toList();

    return AlertDialog(
      title: const Text('Choose an icon'),
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 560),
      content: SizedBox(
        width: 440,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 12,
          children: [
            TextField(
              controller: _searchController,
              autofocus: true,
              decoration: const InputDecoration(
                isDense: true,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Symbols.search, size: 18),
                labelText: 'Filter icons',
              ),
              onChanged: (_) => setState(() {}),
            ),
            Expanded(
              child: entries.isEmpty
                  ? const Center(child: Text('No icon matches.'))
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 56, mainAxisSpacing: 4, crossAxisSpacing: 4),
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        final isSelected = entry.key == widget.selected;
                        return Tooltip(
                          message: entry.key,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(8),
                            onTap: () => Navigator.of(context).pop(entry.key),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isSelected ? Theme.of(context).colorScheme.primaryContainer : null,
                                border: isSelected ? Border.all(color: Theme.of(context).colorScheme.primary) : null,
                              ),
                              alignment: Alignment.center,
                              child: Icon(entry.value, fill: isSelected ? 1 : 0),
                            ),
                          ),
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
}
