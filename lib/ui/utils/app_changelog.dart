import 'package:flutter/material.dart';
import 'package:jira_watcher/models/app_changelog_data.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:material_symbols_icons/symbols.dart';

List<Widget> get _versionsData => appChangeLog.map<Widget>((e) => ChangeLogCard(e.$1, sections: e.$2)).toList()..add(Card(child: Center(child: Text("V0: The app now exist 😎"))));

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
                    initialSelection: ctrl.positions.isEmpty ? 0 : appChangeLog.length - (ctrl.page?.round() ?? appChangeLog.length),
                    dropdownMenuEntries: [for (var v in appChangeLog.indexed) DropdownMenuEntry(value: v.$1, label: v.$2.$1)],
                    decorationBuilder: (context, controller) => InputDecoration(
                      visualDensity: .compact,
                      border: OutlineInputBorder(borderRadius: .circular(100)),
                      isDense: true,
                    ),
                    onSelected: (value) => ctrl.animateToPage(appChangeLog.length - (value ?? 0), duration: Durations.medium1, curve: Curves.easeIn),
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

/// The rich-text rendering of the changelog model.
///
/// The model and the data live in `lib/models/app_changelog_data.dart`, which
/// imports no Flutter so the release tooling can render the same content as plain
/// text. These extensions are what keep the two in step — change one, change the
/// other, and the test comparing them will say so.
extension ChangeLogSectionSpan on ChangeLogSection {
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

extension ChangeLogItemSpan on ChangeLogItem {
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

