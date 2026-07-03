import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

List<(String, List<ChangeLogSection>)> _versionsDataRaw = [
  (
    '1.7.0',
    [
      ChangeLogSection.features([
        ChangeLogItem('All "Add to tasks" buttons now show how many tasks already reference the work item'),
        ChangeLogItem('Can now copy link to work item as well as just the key'),
        ChangeLogItem('Added multi-select options in updates view'),
        ChangeLogItem('Assignee is now shown at the start of update view items'),
        ChangeLogItem('Can now sort To Do Tasks'),
      ]),

      ChangeLogSection.bugFixes([
        ChangeLogItem('Fixed wrong spacing between style nodes in ADF renderer'),
        ChangeLogItem('Fixed wrong alignment in bullet list when items were not plain text'),
        ChangeLogItem('Fixed some text could not be highlighted in the ADF renders of bullet lists'),
      ]),
      ChangeLogSection.chores([
        ChangeLogItem('Bumped version number.'),
        ChangeLogItem('Updated icon styling'),
      ]),
    ],
  ),

  ...[
    (
      '1.6.0',
      [
        ChangeLogSection.features([
          ChangeLogItem(
            'General updates list improvements',
            subItems: [
              ChangeLogItem('Added context menu to work items in update view'),
              ChangeLogItem('Added markdown attachment reader'),
              ChangeLogItem('Added support for mediaInline chips in ADF renderer'),
              ChangeLogItem('Confluence inlineCards and blockCards now show a basic Chip instead of failing to render'),
            ],
          ),
          ChangeLogItem(
            'General todo list improvements',
            subItems: [
              ChangeLogItem('You can now link/unlink work items from notes view'),
              ChangeLogItem('Task selector now can be collapsed'),
            ],
          ),
          ChangeLogItem('Added blockCard and checkbox elements to the document renderer'),
          ChangeLogItem('Added whimsy :)'),
        ]),

        ChangeLogSection.bugFixes([
          ChangeLogItem('Restored functionality of TO DO Task category filters'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
        ]),
      ],
    ),
    (
      '1.5.0',
      [
        ChangeLogSection.features([
          ChangeLogItem('🍎 macOS is now supported!'),
          ChangeLogItem('👤 Improved setting\'s "Connection" page and login page;'),
          ChangeLogItem('🧪 Added beta update track;'),
          ChangeLogItem('📁 Json and ips files are now handled in attachements with a proper Json viewer.'),
          ChangeLogItem(
            '🕜 Work item history view:',
            subItems: [
              ChangeLogItem('Work item history now shows an entry for the ticket\'s creation.'),
              ChangeLogItem('Improved display of some default field edits in history view'),
            ],
          ),
          ChangeLogItem(
            '😀 Assignee/reporter:',
            subItems: [
              ChangeLogItem('now show a higher-res profile picture;'),
              ChangeLogItem('their names can be copied.'),
            ],
          ),
        ]),
        ChangeLogSection.bugFixes([
          ChangeLogItem('Settings dialog can now scroll when too small;'),
          ChangeLogItem('App now can no longer be shrunk below 900x600.'),
          ChangeLogItem('Link cards that aren\'t linking to Jira can now be opened in browser.'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Added window_manager as dependency;'),
          ChangeLogItem('More code renamed to fit Jira\'s convention "work item" (instead of "issue" or "ticket");'),
          ChangeLogItem('Removed that ugly placeholder in Updates page.'),
          ChangeLogItem(
            'In Settings > Advanced > Log-reading dialog',
            subItems: [
              ChangeLogItem('Added log level filter and search'),
              ChangeLogItem('Now legible in light mode'),
            ],
          ),
        ]),
      ],
    ),

    (
      '1.4.1',
      [
        ChangeLogSection.bugFixes([
          ChangeLogItem('Todo tasks can now be edited correctly'),
          ChangeLogItem('Jira link cards now open in an in-app dialog (instead of in browser)'),
          ChangeLogItem('You can now open and zoom on medias from Jira.'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Moved known bugs to the project\'s README.'),
          ChangeLogItem('Code classes will be renamed to fit Jira\'s convention "work item", instead of "issue" or "ticket".'),
        ]),
      ],
    ),

    (
      '1.4.0',
      [
        ChangeLogSection.features([
          ChangeLogItem('🔍 Issue search is now available!'),
          ChangeLogItem('💬 When the window is too small, the issue details section gets shown in a new modal'),
          ChangeLogItem('🔗 Jira link tiles now open in an in-app dialog'),
        ]),
        ChangeLogSection.bugFixes([
          ChangeLogItem('Updates section would reload in a never-ending loop if no project was selected'),
          ChangeLogItem('Windows: media_kit\'s video player is now statically kept to avoid crashes caused by underlying plugin after dispose calls'),
          ChangeLogItem(
            '"To do" section fixes:',
            subItems: [
              ChangeLogItem('Filters menu now show filtered-out categories as options'),
              ChangeLogItem('Category is now saved when using "Add to tasks" button'),
              ChangeLogItem('Reworked the dang whole todotasks event system to fix UI jank and missed updates'),
            ],
          ),
          ChangeLogItem(
            'Text renderer fixes:',
            subItems: [
              ChangeLogItem('Link cards were unreadable in light mode'),
              ChangeLogItem('Description panels would overflow if text was longer than could fit on one line'),
            ],
          ),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Updated  Dart SDK version, and made adequate fixes.'),
        ]),
        ChangeLogSection.knownBugs([
          ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
          ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
          ChangeLogItem('Comments: nested replies are not shown as nested'),
        ]),
      ],
    ),

    (
      '1.3.0',
      [
        ChangeLogSection.features([
          ChangeLogItem('📝 New TO DO system allows to easily set issues aside for later :D'),
          ChangeLogItem(
            '🅰️ Text renderer improvements:',
            subItems: [
              ChangeLogItem('Tables, panels, images and videos are now rendered'),
              ChangeLogItem('Whole description and comments can now be selected and copied'),
            ],
          ),
          ChangeLogItem('🧭 Main navigation pages now persist through navigation rail selections'),
          ChangeLogItem('☀️ Assigned to and Reporter field are now lit when you are the person in it'),
        ]),
        ChangeLogSection.bugFixes([
          ChangeLogItem('😎 SVGs from jira would not get in-line style (eg. colors would be lost)'),
          ChangeLogItem(
            '🅰️ Text renderer fixes:',
            subItems: [
              ChangeLogItem('🔗 Links from the details view would not open in browser'),
              ChangeLogItem('🥸 Mentions were unreadable in light mode'),
              ChangeLogItem('🧑‍🚀 Corrected spacing after AdfRenderer widgets'),
            ],
          ),
          ChangeLogItem('🛞 Attachements loading animation was stretched horizontally'),
          ChangeLogItem('🙍 Incorrect person was shown as updater when the update was a comment'),
          ChangeLogItem('🛑 App no longer commits seppuku when switching pages then editing projects (setstate after dispose)'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Added dependency to xml.'),
        ]),
        ChangeLogSection.knownBugs([
          ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
          ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
          ChangeLogItem('Comments: nested replies are not shown as nested'),
        ]),
      ],
    ),

    (
      '1.2.0',
      [
        ChangeLogSection.features([
          ChangeLogItem('⚙️ Settings: Added Compact listing mode for Updates view'),
          ChangeLogItem('🕜 Custom time filtering is now available'),
          ChangeLogItem('📖 Ticket details view is now available with default fields! (custom fields tbd)'),
          ChangeLogItem('🌐 Added link to GitHub in settings'),
          ChangeLogItem('😣 Added logs and diagnostics options to help troubleshooting'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Removed dependency to flutter_json.'),
          ChangeLogItem('Added dependency to fading_edge_scrollview and calendar_date_picker2.'),
          ChangeLogItem('Refactored the ticket details 🡢 json view for more helpful debugging and inspection'),
        ]),
        ChangeLogSection.knownBugs([
          ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
          ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
          ChangeLogItem('Comments: nested replies are not shown as nested'),
        ]),
      ],
    ),

    (
      '1.1.1',
      [
        ChangeLogSection.features([
          ChangeLogItem('🔑 [BREAKING] API key is encrypted when stored in file system.'),
          ChangeLogItem('ℹ️ Your already saved API key (in plain text) will be encrypted and removed from settings file.'),
        ]),
        ChangeLogSection.bugFixes([
          ChangeLogItem('File that keeps track of the read status was not created properly'),
          ChangeLogItem('Changelog was not scrollable in "new update" notification dialog'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Added dependencies to flutter_secure_storage and cryptography packages.'),
        ]),
        ChangeLogSection.knownBugs([
          ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
          ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
          ChangeLogItem('Comments: nested replies are not shown as nested'),
        ]),
      ],
    ),

    (
      '1.1.0',
      [
        ChangeLogSection.features([
          ChangeLogItem("Renamed 'Overview' to 'Updates'"),
          ChangeLogItem('📫 Updates can now be marked as Read or Unread'),
          ChangeLogItem('⚙️ Added setting "Mark as read upon selection"'),
          ChangeLogItem("💬 View issue comments in the comments tab (all formatting isn't handled)"),
          ChangeLogItem('🏃 View issue status in list and details'),
          ChangeLogItem('🧪 [Experiment] Ticket details view'),
        ]),
        ChangeLogSection.bugFixes([
          ChangeLogItem('Chosen app theme is now kept between sessions'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
        ]),
        ChangeLogSection.knownBugs([
          ChangeLogItem('Emojis are not rendered in comments (there is no Atlassian API for that)'),
          ChangeLogItem('Newer request is dropped by UI if project filters are changed before request completes'),
          ChangeLogItem('Comments: nested replies are not shown as nested'),
        ]),
      ],
    ),

    (
      '1.0.2',
      [
        ChangeLogSection.features([
          ChangeLogItem('🔄️ Adds a manual refresh button'),
          ChangeLogItem('😀 Also I can test if my update mechanic works now :)'),
        ]),
      ],
    ),

    (
      '0.1.2',
      [
        ChangeLogSection.features([
          ChangeLogItem('🔍 Overview filters are now kept through app restarts and page navigation'),
          ChangeLogItem('🔄️ Implemented auto-update mechanic'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Added application icon 👁️.'),
          ChangeLogItem('Temporarily removed edit tag (it’s not working yet).'),
        ]),
        ChangeLogSection.knownBugs([
          ChangeLogItem('If project filters are changed before request completes, the newer request is not taken into account'),
        ]),
      ],
    ),

    (
      '0.1.1',
      [
        ChangeLogSection.features([
          ChangeLogItem('📋 On first boot after installing a new version, a changelog is shown. It is also accessible in Settings > General.'),
          ChangeLogItem('🧑 Better login page, with basic input validation.'),
          ChangeLogItem('📄 Added a default page for when no user project is set.'),
          ChangeLogItem('⚙️ Added a button to open the app settings files, in Settings > Advanced.'),
        ]),
        ChangeLogSection.bugFixes([
          ChangeLogItem('💡 Jira deprecated their /search API, now using /search/jql instead.'),
        ]),
        ChangeLogSection.chores([
          ChangeLogItem('Bumped version number.'),
          ChangeLogItem('Added About and Licences pages.'),
          ChangeLogItem('🛑 BREAKING: set a correct path for app settings. Old settings won’t be kept from previous versions.'),
        ]),
      ],
    ),
  ],
];
List<Widget> get _versionsData => _versionsDataRaw.map<Widget>((e) => ChangeLogCard(e.$1, sections: e.$2)).toList()..add(Card(child: Center(child: Text("V0: The app now exist 😎"))));

class ChangeLogsDialog extends StatelessWidget {
  const ChangeLogsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var ctrl = PageController(initialPage: _versionsData.length - 1);
    return AlertDialog(
      title: Row(
        children: [
          Text("Your app was updated!"),
          Spacer(),
          FutureBuilder(
            future: SettingsModel().appInfo.version,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Now running: ${asyncSnapshot.data}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),

      content: SizedBox(
        width: 600,
        height: 400,
        child: PageView(
          controller: ctrl,
          children: _versionsData.reversed.toList(),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 4,
              children: [
                AnimatedBuilder(
                  animation: ctrl,
                  builder: (context, _) => IconButton(
                    visualDensity: VisualDensity.compact,
                    onPressed: (ctrl.positions.isEmpty || ctrl.page?.round() == 0) ? null : () => ctrl.previousPage(duration: Durations.short4, curve: Curves.bounceIn),
                    icon: Icon(Symbols.navigate_before),
                  ),
                ),
                AnimatedBuilder(
                  animation: ctrl,
                  builder: (context, _) => DropdownMenu(
                    initialSelection: ctrl.positions.isEmpty ? 0 : _versionsDataRaw.length - (ctrl.page?.round() ?? _versionsDataRaw.length),
                    dropdownMenuEntries: [for (var v in _versionsDataRaw.indexed) DropdownMenuEntry(value: v.$1, label: v.$2.$1)],
                    decorationBuilder: (context, controller) => InputDecoration(
                      visualDensity: .compact,
                      border: OutlineInputBorder(borderRadius: .circular(100)),
                      isDense: true,
                    ),
                    onSelected: (value) => ctrl.animateToPage(_versionsDataRaw.length - (value ?? 0), duration: Durations.medium1, curve: Curves.easeIn),
                  ),
                ),
                AnimatedBuilder(
                  animation: ctrl,
                  builder: (context, _) => IconButton(
                    visualDensity: VisualDensity.compact,

                    onPressed: (ctrl.positions.isEmpty || ctrl.page?.round() == _versionsData.length - 1) ? null : () => ctrl.nextPage(duration: Durations.short4, curve: Curves.bounceIn),
                    icon: Icon(Symbols.navigate_next),
                  ),
                ),
              ],
            ),
            Spacer(),
            TextButton(onPressed: Navigator.of(context).pop, child: Text("Yep yep")),
          ],
        ),
      ],
    );
  }
}

class ChangeLogCard extends StatelessWidget {
  const ChangeLogCard(this.version, {super.key, required this.sections, this.intro, this.outro});

  final String version;
  final List<ChangeLogSection> sections;
  final TextSpan? intro, outro;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ScrollbarTheme(
        data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SelectableText.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "What's new in $version?\n\n",

                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ?intro,
                  for (var section in sections) ...[section.toTextSpan(), TextSpan(text: '\n')],
                  ?outro,
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class ChangeLogSection {
  ChangeLogSection(this.name, {required this.emote, required this.items});

  factory ChangeLogSection.features(List<ChangeLogItem> items) => ChangeLogSection('Features:', emote: '✨', items: items);
  factory ChangeLogSection.bugFixes(List<ChangeLogItem> items) => ChangeLogSection('Bug fixes', emote: '🪲', items: items);
  factory ChangeLogSection.chores(List<ChangeLogItem> items) => ChangeLogSection('Chores', emote: '🧼', items: items);
  factory ChangeLogSection.knownBugs(List<ChangeLogItem> items) => ChangeLogSection('Known bugs', emote: '🐛', items: items);

  String emote, name;
  List<ChangeLogItem> items;

  TextSpan toTextSpan() {
    return TextSpan(
      children: [
        TextSpan(text: '$emote '),
        TextSpan(
          text: '$name\n',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        for (var i in items) ...[i.toTextSpan(), TextSpan(text: '\n')],
      ],
    );
  }
}

class ChangeLogItem {
  ChangeLogItem(this.description, {this.subItems});

  String description;
  List<ChangeLogItem>? subItems;

  TextSpan toTextSpan({int indent = 0}) {
    String indentStr = '    ' * (indent);
    String prefix = ' ᛫ ';
    var mainItem = TextSpan(text: '$indentStr$prefix${description.replaceAll('\n', '\n$indentStr   ')}');
    if (subItems == null || subItems!.isEmpty) {
      return mainItem;
    }
    return TextSpan(
      children: [
        mainItem,
        for (var i in subItems!) ...[
          TextSpan(text: '\n'),
          i.toTextSpan(indent: indent + 1),
        ],
      ],
    );
  }
}

class NewUpdateAvailableAlertDialog extends StatelessWidget {
  const NewUpdateAvailableAlertDialog({
    super.key,
    required this.data,
    required this.version,
  });

  final (bool, String?, Map?) data;
  final String version;

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: Text('A new update is available!'),
    content: ScrollbarTheme(
      data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
      child: SizedBox(
        width: 400,
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Row(
              children: [
                Expanded(child: Text('Version ${data.$2!}', style: Theme.of(context).textTheme.titleMedium)),
                Text('(Current: $version)'),
              ],
            ),
            if (data.$3?['changelog'] == null)
              Expanded(
                child: SingleChildScrollView(child: Text(data.$3?['changelog'] ?? 'No changelog :(')),
              )
            else
              Expanded(
                child: Card(
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(16),
                    child: SingleChildScrollView(child: Text(data.$3?['changelog'] ?? 'No changelog :(')),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
    actions: [
      Row(
        spacing: 8,
        children: [
          TextButton(onPressed: Navigator.of(context).pop, child: Text('Not now')),
          Spacer(),
          TextButton(
            onPressed: () => launchUrl(Uri.parse('https://github.com/Este2013/jira_watch/releases')),
            child: Text('Github'),
          ),
          FilledButton(
            onPressed: () {
              String targetOS = Platform.isWindows ? 'x64' : 'osX';
              launchUrl(Uri.parse('https://este2013.github.io/jira_watch/${data.$3?[targetOS]}'));
            },
            child: Text('Download'),
          ),
        ],
      ),
    ],
  );
}
