import 'dart:convert';
import 'package:charset/charset.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/utils/avatar.dart';
import 'package:jira_watcher/ui/utils/jira_doc_renderer.dart';
import 'package:jira_watcher/ui/utils/labelled_text_presenter.dart';
import 'package:jira_watcher/ui/utils/network_video_player.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../issue_ui_elements.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key, required this.ticket});
  final IssueData ticket;
  @override
  Widget build(BuildContext context) {
    if (ticket.fields == null) {
      return Text('No fields were found');
    }
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              spacing: 8,
              children: [
                Expanded(
                  child: PersonField('Assigned to', field: 'assignee', ticket: ticket),
                ),
                Expanded(
                  child: PersonField('Reported by', field: 'reporter', ticket: ticket),
                ),
                Expanded(child: PriorityField(ticket: ticket)),
                SizedBox(width: 50, child: WatchedByField(ticket: ticket)),
              ],
            ),
          ),
          if (ticket.fields?['labels'] != null && ticket.fields!['labels'].isNotEmpty)
            Wrap(
              runSpacing: 8,
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Labels:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                for (var t in ticket.fields?['labels']) Chip(label: Text(t)),
              ],
            ),
          if (ticket.fields?['components'] != null && ticket.fields!['components'].isNotEmpty)
            Wrap(
              runSpacing: 8,
              spacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  'Components:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                for (var t in ticket.fields?['components']) Chip(label: Text(t['name'])),
              ],
            ),
          if (ticket.fields!['description'] != null) DescriptionLikeField('Description', contentData: ticket.fields!['description']),
          if (ticket.fields!['environment'] != null) DescriptionLikeField('Environment', contentData: ticket.fields!['environment']),
          if (ticket.fields!['attachment'] != null && (ticket.fields!['attachment'] as List).isNotEmpty) AttachmentsField(attachmentsData: ticket.fields!['attachment']),
          if (ticket.fields?['issuelinks'] != null && ticket.fields!['issuelinks'].isNotEmpty) IssueLinksField(issueLinksData: (ticket.fields!['issuelinks']! as List).cast()),

          Row(),

          Text(ticket.fields!['fixVersions'].toString()),
          Text(ticket.fields!['versions'].toString()),
        ].expand((w) => [w, SizedBox(height: 8)]).toList(),
      ),
    );
  }
}

class PersonField extends StatelessWidget {
  const PersonField(
    this.name, {
    super.key,
    required this.field,
    required this.ticket,
  });

  final IssueData ticket;
  final String name, field;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        var hasPerson = ticket.fields?[field] != null;
        return LabeledPopupTextField(
          controller: TextEditingController(text: hasPerson ? (ticket.fields?[field]['displayName']) : 'Unnassigned'),
          label: name,
          readOnly: true,
          showPopupOnFocus: true,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8),
            child: hasPerson ? ClipOval(child: JiraAvatar(url: ticket.fields?[field]['avatarUrls']['16x16'])) : Icon(Icons.account_circle_outlined),
          ),
          // TODO
          // popupBuilder: (context, dismiss, controller) => Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
          // ),
        );
      },
    );
  }
}

class PriorityField extends StatelessWidget {
  const PriorityField({
    super.key,
    required this.ticket,
  });

  final IssueData ticket;

  @override
  Widget build(BuildContext context) {
    String field = 'priority';
    var hasField = ticket.fields?[field] != null;
    return LabeledPopupTextField(
      controller: TextEditingController(text: hasField ? (ticket.fields?[field]['name']) : 'None'),
      label: 'Priority',
      readOnly: true,
      showPopupOnFocus: true,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
        child: hasField ? ClipOval(child: JiraAvatar(url: ticket.fields?[field]['iconUrl'])) : Icon(Icons.block),
      ),
      // TODO
      // popupBuilder: (context, dismiss, controller) => Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
      // ),
    );
  }
}

class WatchedByField extends StatelessWidget {
  const WatchedByField({
    super.key,
    required this.ticket,
  });

  final IssueData ticket;

  @override
  Widget build(BuildContext context) {
    String field = 'watches';
    var hasField = ticket.fields?[field] != null;
    bool isCurrentlyWatching = ticket.fields?[field]['isWatching'] ?? false;
    return LabeledPopupTextField(
      controller: TextEditingController(text: hasField ? (ticket.fields?[field]['name']) : 'None'),
      label: '',
      readOnly: true,
      showPopupOnFocus: true,
      borderColor: isCurrentlyWatching ? null : Theme.of(context).colorScheme.outlineVariant,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
        child: hasField ? ClipOval(child: Icon(isCurrentlyWatching ? Icons.visibility : Icons.visibility_off)) : Icon(Icons.block),
      ),
      // TODO
      // popupBuilder: (context, dismiss, controller) => Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Text('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
      // ),
    );
  }
}

class ExpandablePanel extends StatefulWidget {
  const ExpandablePanel(this.name, {super.key, required this.content, this.isInitiallyExpanded = true});

  final String name;
  final Widget content;
  final bool isInitiallyExpanded;

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.isInitiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.hardEdge,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              key: Key('${widget.name}-header'),
              children: [
                IconButton(
                  onPressed: () => setState(() => isExpanded = !isExpanded),
                  icon: AnimatedRotation(
                    // 0 turns  = down   (expanded)
                    // -0.25    = right  (collapsed)
                    turns: isExpanded ? 0.0 : -0.25,
                    duration: Durations.medium1,
                    curve: Curves.easeInOut,
                    child: const Icon(Icons.expand_more),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: Durations.medium1,
          curve: Curves.easeInOut,
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.content,
                )
              : const SizedBox.shrink(),
        ),
      ],
    ),
  );
}

class DescriptionLikeField extends StatelessWidget {
  const DescriptionLikeField(
    this.name, {
    super.key,
    required this.contentData,
  });

  final String name;
  final dynamic contentData;

  @override
  Widget build(BuildContext context) => ExpandablePanel(name, content: AdfRenderer(adf: contentData));
}

class AttachmentsField extends StatelessWidget {
  const AttachmentsField({super.key, this.attachmentsData});

  final dynamic attachmentsData;

  @override
  Widget build(BuildContext context) {
    if (attachmentsData is! List) return Text('Why are attachments not a List (type: ${attachmentsData.runtimeType})? Contact Esteban');
    var attachments = attachmentsData as List;
    return ExpandablePanel(
      'Attachments (${attachments.length})',
      content: SizedBox(
        height: 150,
        child: CarouselView(
          itemExtent: 200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
          onTap: (value) {
            var attachment = attachments[value];
            showDialog(
              context: context,
              builder: (context) => AttachmentsDialog(
                attachments,
                selectedAttachmentID: attachment['id'],
              ),
            );
          },
          children: [
            for (var a in attachments) AttachmentPreview(a: a),
          ],
        ),
      ),
    );
  }
}

class AttachmentPreview extends StatelessWidget {
  const AttachmentPreview({
    super.key,
    required this.a,
  });

  final dynamic a;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Builder(
            builder: (context) {
              String filetype = a['mimeType'];

              if (filetype == 'text/plain') {
                return Center(
                  child: Icon(Icons.text_fields, size: 48),
                );
              }
              if (filetype.startsWith('video')) {
                return Center(
                  child: Icon(Icons.movie, size: 48),
                );
              }
              if (['zip', '7z'].any(filetype.endsWith)) {
                return Center(
                  child: Icon(Icons.folder_zip, size: 48),
                );
              }
              if (a['thumbnail'] != null) {
                return JiraAvatar(
                  url: a['thumbnail'],
                  boxFit: BoxFit.cover,
                );
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    Icon(Icons.file_present_rounded, size: 48),
                    Text(a['mimeType'], style: TextStyle(color: Theme.of(context).hintColor)),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              String name = a['filename'];
              String part1 = basenameWithoutExtension(name);
              String part2 = extension(name);
              if (part1.length > 5) {
                part2 = '${part1.substring(part1.length - 3)}$part2';
                part1 = part1.substring(0, part1.length - 3);
              }
              return Tooltip(
                message: name,
                child: Row(
                  children: [
                    Flexible(child: Text(part1, overflow: TextOverflow.ellipsis)),
                    Text(part2, overflow: TextOverflow.ellipsis),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AttachmentsDialog extends StatefulWidget {
  const AttachmentsDialog(this.attachments, {super.key, this.selectedAttachmentID});
  final List attachments;
  final String? selectedAttachmentID;

  @override
  State<AttachmentsDialog> createState() => _AttachmentsDialogState();
}

class _AttachmentsDialogState extends State<AttachmentsDialog> {
  late String selectedAttachmentID;
  bool previewAsText = false;

  @override
  void initState() {
    selectedAttachmentID = widget.selectedAttachmentID ?? widget.attachments.first['id'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map attachment = widget.attachments.firstWhere((a) => a['id'] == selectedAttachmentID);
    String contentURL = attachment['content'];
    String filetype = attachment['mimeType']; //"mimeType": "image/png"
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [
        Text('Cannot preview this content type (${attachment['mimeType']}).'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16,
          children: [
            TextButton.icon(
              onPressed: () => setState(() => previewAsText = true),
              label: Text('View as text'),
              icon: Icon(Icons.text_fields),
            ),
            FilledButton.icon(
              onPressed: () {
                launchUrl(Uri.parse(contentURL));
              },
              label: Text('Download'),
              icon: Icon(Icons.download),
            ),
          ],
        ),
      ],
    );

    if (filetype.split('/')[0] == 'image') {
      content = Image.network(
        contentURL,
        headers: {'Authorization': APIDao().authHeader},
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child; // <- key line
          final total = progress.expectedTotalBytes;
          final loaded = progress.cumulativeBytesLoaded;
          return Center(
            child: CircularProgressIndicator(
              value: total != null ? loaded / total : null,
            ),
          );
        },
        errorBuilder: (context, error, stack) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.broken_image_outlined),
            const SizedBox(height: 8),
            Text('Failed to load image\n$error', textAlign: TextAlign.center),
          ],
        ),
      );
    } else if (previewAsText || filetype == 'text/plain') {
      content = FutureBuilder(
        future: fetchText(contentURL),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.hasError) {
            return ErrorWidget('Could not load the text:\n${asyncSnapshot.error}');
          }
          if (asyncSnapshot.hasData) {
            return ScrollbarTheme(
              data: ScrollbarThemeData(thumbVisibility: WidgetStatePropertyAll(true)),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: SelectableText(
                        asyncSnapshot.data!,
                        style: TextStyle(fontFamily: 'RobotoMono'),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    } // TODO are there non-plain text types
    else if (filetype.startsWith('video')) {
      content = NetworkVideoPlayer(url: contentURL);
    }

    return AlertDialog(
      constraints: BoxConstraints.expand(),
      title: Row(
        children: [
          Text(attachment['filename']),
          Spacer(),
          IconButton(onPressed: () => launchUrl(Uri.parse(contentURL)), icon: Icon(Icons.download)),
        ],
      ),
      content: Row(
        children: [
          if (widget.attachments.length > 1)
            SizedBox(
              width: 200,
              child: ListView(
                scrollDirection: Axis.vertical,
                itemExtent: 150,

                children: [
                  for (var a in widget.attachments)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Material(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          child: InkWell(
                            onTap: (selectedAttachmentID == a['id'])
                                ? null
                                : () {
                                    setState(() {
                                      selectedAttachmentID = a['id'];
                                      previewAsText = false;
                                    });
                                  },
                            child: Container(
                              color: selectedAttachmentID == a['id'] ? Theme.of(context).colorScheme.secondaryContainer : null,
                              child: AttachmentPreview(a: a),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

          if (widget.attachments.length > 1) VerticalDivider(),
          Expanded(child: Center(child: content)),
        ],
      ),
      actions: [
        TextButton(onPressed: Navigator.of(context).pop, child: Text('Close')),
      ],
    );
  }

  Future<String> fetchText(String url, {Duration timeout = const Duration(seconds: 15)}) async {
    final uri = Uri.parse(url);
    final res = await http.get(uri, headers: {'Authorization': APIDao().authHeader}).timeout(timeout);

    if (res.statusCode != 200) {
      throw Exception('Failed to load: ${res.statusCode}');
    }

    // Try to respect the server’s charset if provided; default to UTF-8.
    final contentType = res.headers['content-type'] ?? '';
    final charset = RegExp(r'charset=([^\s;]+)', caseSensitive: false).firstMatch(contentType)?.group(1)?.toLowerCase();

    if (charset == 'iso-8859-1' || charset == 'latin1') {
      return const Latin1Decoder().convert(res.bodyBytes);
    } else if (charset == 'utf-16') {
      return const Utf16Codec().decode(res.bodyBytes);
    } else {
      return utf8.decode(res.bodyBytes);
    }
  }
}

class IssueLinksField extends StatelessWidget {
  const IssueLinksField({super.key, required this.issueLinksData});
  final List<Map> issueLinksData;

  @override
  Widget build(BuildContext context) {
    // type name => type data and list of links
    Map<String, (Map, List)> typesSplitData = {};

    for (var section in issueLinksData) {
      String sectionName = section['type']['name'];
      if (!typesSplitData.containsKey(sectionName)) {
        typesSplitData[sectionName] = (section['type'], []);
      }
      typesSplitData[sectionName]!.$2.add((section.containsKey('inwardIssue') ? 'in' : 'out', section['inwardIssue'] ?? section['outwardIssue']));
    }

    return ExpandablePanel(
      'Related issues',
      content: Column(
        spacing: 16,
        children: [
          for (var section in typesSplitData.entries) IssueLinkSection(section.value.$1, section.value.$2),
        ],
      ),
    );
  }
}

class IssueLinkSection extends StatelessWidget {
  const IssueLinkSection(this.typeData, this.issueLinksData, {super.key});

  final Map typeData;
  final List issueLinksData;

  @override
  Widget build(BuildContext context) {
    bool containsInward = issueLinksData.any((element) => element.$1 == 'in');
    bool containsOutward = issueLinksData.any((element) => element.$1 == 'out');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (containsInward) ...[
          Text(typeData['inward'], style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 4),
          for (var i in issueLinksData.where((element) => element.$1 == 'in')) IssueLinkTile(i.$2),
        ],
        if (containsInward && containsOutward) SizedBox(height: 16),
        if (containsOutward) ...[
          Text(typeData['outward'], style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 4),
          for (var i in issueLinksData.where((element) => element.$1 == 'out')) IssueLinkTile(i.$2),
        ],
      ],
    );
  }
}

class IssueLinkTile extends StatelessWidget {
  const IssueLinkTile(this.issueLinkData, {super.key});
  final Map issueLinkData;

  @override
  Widget build(BuildContext context) => ListTile(
    titleAlignment: ListTileTitleAlignment.titleHeight,
    leading: SizedBox.square(dimension: 20, child: JiraAvatar(url: issueLinkData['fields']['issuetype']['iconUrl'])),
    title: Row(
      spacing: 16,
      children: [
        Expanded(
          child: Text.rich(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                TextSpan(
                  text: issueLinkData['key'],
                  style: TextStyle(
                    decoration: issueLinkData['fields']['status']['statusCategory']['key'] == 'done' ? TextDecoration.lineThrough : null,
                  ),
                ),
                WidgetSpan(child: SizedBox(width: 8)),
                TextSpan(
                  text: issueLinkData['fields']['summary'],
                ),
              ],
            ),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).hintColor,
            ),
          ),
        ),
        CustomTicketStatusIndicator(
          issueLinkData['fields']['status']['name'],
          colorName: issueLinkData['fields']['status']['statusCategory']['colorName'],
        ),
        SizedBox.square(
          dimension: 20,
          child: Tooltip(
            message: issueLinkData['fields']['priority']['name'],
            child: JiraAvatar(url: issueLinkData['fields']['priority']['iconUrl']),
          ),
        ),
        if (kDebugMode)
          IconButton(
            onPressed: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: SingleChildScrollView(child: SelectableText(JsonEncoder.withIndent('    ').convert(issueLinkData))),
              ),
            ),
            icon: Icon(Icons.code),
            color: Colors.amber,
          ),
      ],
    ),
    onTap: () => launchUrl(Uri.parse('https://${SettingsModel().domainController.text}.atlassian.net/browse/${issueLinkData['key']}')),
  );
}
