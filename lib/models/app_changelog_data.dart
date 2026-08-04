/// The app's changelog, and the plain-text rendering of it.
///
/// Deliberately free of any Flutter import so `dart run` can reach it: the
/// release tooling renders the same data into the `changelog` field published on
/// GitHub Pages. That field used to be pasted in by hand and had already drifted
/// from what the app shows, so this file is the single source of truth and the
/// UI renders from it through extensions in `lib/ui/utils/app_changelog.dart`.
library;

/// Newest first. The order drives both the changelog dialog's paging and the
/// version picker.
final List<(String, List<ChangeLogSection>)> appChangeLog = [
  (
    '1.7.1',
    [
      ChangeLogSection.features([
        ChangeLogItem('Changed install icon'),
        ChangeLogItem('This release is there to make sure updating works starting from 1.7.1'),
      ]),
    ],
  ),
  ...[
    (
      '1.7.1',
      [
        ChangeLogSection.features([
          ChangeLogItem('🦊 Adapted some UI for GitLab view'),
        ]),
      ],
    ),
    (
      '1.7.0',
      [
        ChangeLogSection.features([
          ChangeLogItem('🦊 GitLab integration!'),
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

/// The changelog for [version] as plain text, exactly as the app renders it.
///
/// Returns null when the version has no entry, which the release tooling treats
/// as a hard error rather than shipping a release with no notes.
///
/// Trailing whitespace is trimmed: the app puts a blank line after every section
/// to space them apart on screen, but a trailing one at the end of the published
/// string is just noise — and trimming makes this byte-identical to the entries
/// already on the server.
String? changeLogPlainTextFor(String version) {
  for (final entry in appChangeLog) {
    if (entry.$1 != version) continue;
    return entry.$2.map((section) => '${section.toPlainText()}\n').join().trimRight();
  }
  return null;
}

class ChangeLogSection {
  ChangeLogSection(this.name, {required this.emote, required this.items});

  factory ChangeLogSection.features(List<ChangeLogItem> items) => ChangeLogSection('Features:', emote: '✨', items: items);
  factory ChangeLogSection.bugFixes(List<ChangeLogItem> items) => ChangeLogSection('Bug fixes', emote: '🪲', items: items);
  factory ChangeLogSection.chores(List<ChangeLogItem> items) => ChangeLogSection('Chores', emote: '🧼', items: items);
  factory ChangeLogSection.knownBugs(List<ChangeLogItem> items) => ChangeLogSection('Known bugs', emote: '🐛', items: items);

  String emote, name;
  List<ChangeLogItem> items;

  /// Mirrors the `toTextSpan` extension in the UI layer character for character.
  String toPlainText() => '$emote $name\n${items.map((i) => '${i.toPlainText()}\n').join()}';
}

class ChangeLogItem {
  ChangeLogItem(this.description, {this.subItems});

  String description;
  List<ChangeLogItem>? subItems;

  /// Mirrors the `toTextSpan` extension in the UI layer character for character,
  /// including the runic bullet and the hanging indent applied to wrapped lines.
  String toPlainText({int indent = 0}) {
    final indentStr = '    ' * indent;
    const prefix = ' ᛫ ';
    final main = '$indentStr$prefix${description.replaceAll('\n', '\n$indentStr   ')}';
    if (subItems == null || subItems!.isEmpty) return main;
    return main + subItems!.map((i) => '\n${i.toPlainText(indent: indent + 1)}').join();
  }
}
