import 'dart:convert';
import 'package:charset/charset.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/settings_model.dart';
import 'package:jira_watcher/ui/utils/avatar.dart';
import 'package:jira_watcher/ui/utils/expandable_panel.dart';
import 'package:jira_watcher/ui/utils/jira_doc_renderer.dart';
import 'package:jira_watcher/ui/utils/labelled_text_presenter.dart';
import 'package:jira_watcher/ui/utils/network_video_player.dart';
import 'package:loggy/loggy.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

import '../issue_ui_elements.dart';
import 'single_ticket_view.dart';

class TicketDetailsView extends StatelessWidget {
  const TicketDetailsView({super.key, required this.ticket});
  final IssueData ticket;
  @override
  Widget build(BuildContext context) {
    if (ticket.fields == null) {
      return Text('No fields were found');
    }

    bool labels = ticket.fields?['labels'] != null && ticket.fields!['labels'].isNotEmpty;
    bool components = ticket.fields?['components'] != null && ticket.fields!['components'].isNotEmpty;
    return Padding(
      key: Key(ticket['key']),
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
          if (labels || components)
            Row(
              children: [
                if (labels)
                  Expanded(
                    child: ListingTypeField(
                      'Labels',
                      icon: Icon(Icons.label),
                      itemList: ticket.fields?['labels'],
                    ),
                  ),
                if (components)
                  Expanded(
                    child: ListingTypeField(
                      'Components',
                      icon: Icon(Icons.extension),
                      itemList: ticket.fields?['components'],
                      itemToString: (item) => (item as Map)['name']!,
                    ),
                  ),
              ],
            ),
          Row(
            children: [
              Expanded(
                child: VersionsField('Affected version', ticket: ticket, property: 'versions', icon: Icon(Icons.bug_report)),
              ),
              Expanded(
                child: VersionsField('Fix version', ticket: ticket, property: 'fixVersions', icon: Icon(Icons.auto_awesome)),
              ),
            ],
          ),
          if (ticket.fields!['description'] != null) DescriptionLikeField('Description', contentData: ticket.fields!['description'], attachments: (ticket.fields!['attachment'] as List)),
          if (ticket.fields!['environment'] != null) DescriptionLikeField('Environment', contentData: ticket.fields!['environment'], attachments: (ticket.fields!['attachment'] as List)),
          if (ticket.fields!['attachment'] != null && (ticket.fields!['attachment'] as List).isNotEmpty) AttachmentsField(attachmentsData: ticket.fields!['attachment']),
          if (ticket.fields?['issuelinks'] != null && ticket.fields!['issuelinks'].isNotEmpty) IssueLinksField(issueLinksData: (ticket.fields!['issuelinks']! as List).cast()),

          DateDisplay('Created${ticket.fields!['creator']?['displayName'] != null ? " by ${ticket.fields!['creator']['displayName']}" : ''}', date: ticket.fields!['created']),
          if (ticket.fields?['updated'] != null) DateDisplay('Updated', date: ticket.fields!['updated']),
          if (ticket.fields?['resolutiondate'] != null) DateDisplay('Resolution date', date: ticket.fields!['resolutiondate']),
          if (ticket.fields?['statuscategorychangedate'] != null) DateDisplay('Last status category change', date: ticket.fields!['statuscategorychangedate']),
          if (ticket.fields?['lastViewed'] != null) DateDisplay('Last viewed', date: ticket.fields!['lastViewed']),
          // Text(ticket.fields!['fixVersions'].toString()),
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
    Future<bool> isMe = APIModel().myself().then(
      (value) => jsonDecode(value.body)['accountId'] == ticket.fields?[field]?['accountId'],
    );

    var hasPerson = ticket.fields?[field] != null;
    return FutureBuilder(
      future: isMe,
      builder: (context, asyncSnapshot) {
        return LabeledPopupTextField(
          controller: TextEditingController(text: hasPerson ? (ticket.fields?[field]['displayName']) : 'Unnassigned'),
          label: name,
          readOnly: true,
          showPopupOnFocus: true,
          borderColor: (asyncSnapshot.data ?? false) ? null : Theme.of(context).colorScheme.outlineVariant,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, left: 8),
            child: hasPerson ? ClipOval(child: JiraAvatar(url: ticket.fields?[field]['avatarUrls']['16x16'])) : Icon(Icons.account_circle_outlined),
          ),
          popupBuilder: hasPerson
              ? (context, dismiss, controller) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 400,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 8,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(4),
                                child: JiraAvatar(url: ticket.fields?[field]['avatarUrls']['48x48']),
                              ),
                              Text(ticket.fields?[field]['displayName'], style: Theme.of(context).textTheme.titleLarge),
                            ],
                          ),
                          Divider(),
                          if (ticket.fields?[field]?['emailAddress'] != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Icon(Icons.email),
                                Text(ticket.fields?[field]['emailAddress']),
                                IconButton(
                                  onPressed: () => Clipboard.setData(ClipboardData(text: ticket.fields?[field]['emailAddress'])),
                                  icon: Icon(Icons.copy),
                                  visualDensity: VisualDensity.compact,
                                  iconSize: 16,
                                ),
                              ],
                            ),
                          if (ticket.fields?[field]?['timeZone'] != null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 8,
                              children: [
                                Icon(Icons.schedule),
                                Text(ticket.fields?[field]['timeZone']),
                              ],
                            ),

                          if (ticket.fields?[field]?['active'] != null)
                            Text(
                              '${ticket.fields?[field]?['active'] ? "🟢" : "🔴"} This account is ${ticket.fields?[field]?['active'] ? '' : 'in'}active',
                              style: TextStyle(color: Theme.of(context).hintColor),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              Flexible(
                                child: Text(
                                  'ID #${ticket.fields?[field]['accountId']}',
                                  style: TextStyle(color: Theme.of(context).hintColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                onPressed: () => Clipboard.setData(ClipboardData(text: ticket.fields?[field]['accountId'])),
                                icon: Icon(Icons.copy),
                                visualDensity: VisualDensity.compact,
                                iconSize: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : null,
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
      borderColor: Theme.of(context).colorScheme.outlineVariant,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
        child: hasField ? ClipOval(child: JiraAvatar(url: ticket.fields?[field]['iconUrl'])) : Icon(Icons.block),
      ),
      popupBuilder: (context, dismiss, controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 400,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    JiraAvatar(url: ticket.fields?[field]['iconUrl']),
                    Text(ticket.fields?[field]['name'], style: Theme.of(context).textTheme.titleLarge),
                  ],
                ),
                Divider(),
                if (ticket.fields?[field]?['description'] != null) Text(ticket.fields?[field]['description']),
                Text(
                  'ID #${ticket.fields?[field]['id']}',
                  style: TextStyle(color: Theme.of(context).hintColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WatchedByField extends StatefulWidget {
  const WatchedByField({
    super.key,
    required this.ticket,
  });

  final IssueData ticket;

  @override
  State<WatchedByField> createState() => _WatchedByFieldState();
}

class _WatchedByFieldState extends State<WatchedByField> with UiLoggy {
  Future<http.Response>? cache;

  @override
  Widget build(BuildContext context) {
    String field = 'watches';
    var hasField = widget.ticket.fields?[field] != null;
    bool isCurrentlyWatching = widget.ticket.fields?[field]['isWatching'] ?? false;
    return LabeledPopupTextField(
      controller: TextEditingController(text: hasField ? (widget.ticket.fields?[field]['name']) : 'None'),
      label: '',
      readOnly: true,
      showPopupOnFocus: true,
      borderColor: isCurrentlyWatching ? null : Theme.of(context).colorScheme.outlineVariant,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
        child: hasField ? ClipOval(child: Icon(isCurrentlyWatching ? Icons.visibility : Icons.visibility_off)) : Icon(Icons.block),
      ),

      popupBuilder: (context, dismiss, controller) {
        int watchCount = widget.ticket.fields?[field]['watchCount'];

        if (watchCount == 0) {
          return Text('No one is wathing this issue.');
        }

        Future<http.Response>? resp;
        if (cache == null) {
          String url = widget.ticket.fields?[field]['self'];
          resp = APIDao().directRequest(Uri.parse(url));
          SchedulerBinding.instance.addPostFrameCallback(
            (timeStamp) => setState(() {
              cache = resp;
            }),
          );
        } else {
          resp = cache!;
        }
        return FutureBuilder(
          future: resp,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              if (asyncSnapshot.data!.statusCode != 200) {
                String problem = '${asyncSnapshot.data!.statusCode}: ${asyncSnapshot.data!.reasonPhrase}';
                loggy.warning(problem);
                return Text(problem);
              }
              var data = jsonDecode(asyncSnapshot.data!.body);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 8,
                      children: [
                        Text('Watching this issue:', style: Theme.of(context).textTheme.titleMedium),

                        for (var person in data['watchers'])
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: JiraAvatar(url: person['avatarUrls']['48x48']),
                            ),
                            title: Text(person['displayName']),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),

              child: Text('a'),
            );
          },
        );
      },
    );
  }
}

class DescriptionLikeField extends StatelessWidget {
  const DescriptionLikeField(
    this.name, {
    super.key,
    required this.contentData,
    this.attachments,
  });

  final String name;
  final dynamic contentData;
  final List? attachments;

  @override
  Widget build(BuildContext context) => ExpandablePanel(
    name,
    content: AdfRenderer(
      adf: contentData,
      mediaBuilder: (context, node, size) => AdfRenderer.defaultMediaBuilder(node, context, attachments ?? [], size),
    ),
  );
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
    } // TODO are there non-plain text types?
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
    trailing: IconButton(
      onPressed: () => launchUrl(Uri.parse('https://${SettingsModel().domainController.text}.atlassian.net/browse/${issueLinkData['key']}')),
      icon: Icon(Icons.open_in_new),
      tooltip: 'Open in browser',
    ),
    onTap: () => showDialog(
      context: context,
      builder: (_) => SingleTicketDialog(
        IssueData.fromJson({'data': issueLinkData}),
      ),
    ),
  );
}

class ListingTypeField<T> extends StatelessWidget {
  const ListingTypeField(
    this.name, {
    super.key,
    required this.itemList,
    this.itemToString,
    this.itemToTooltip,
    this.onTap,
    this.icon,
  });

  final String name;
  final List<T>? itemList;
  final String Function(T item)? itemToString;
  final String Function(T item)? itemToTooltip;
  final void Function(T item)? onTap;
  final Widget? icon;

  @override
  Widget build(BuildContext context) => Card(
    child: Container(
      height: 50,
      padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          ?icon,

          Expanded(
            child: FadingEdgeScrollView.fromScrollView(
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: ScrollController(),
                children: [
                  // NAME
                  Center(child: Text(name, style: Theme.of(context).textTheme.titleSmall)),
                  SizedBox(width: 8),
                  // If none is listed
                  if (itemList == null || itemList!.isEmpty)
                    Center(child: Text('None'))
                  else
                    for (var item in itemList!)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Tooltip(
                          message: _itemToTooltip(item),
                          child: Chip(label: Text(_itemToString(item))),
                        ),
                      ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  String _itemToString(T item) => itemToString?.call(item) ?? item.toString();
  String _itemToTooltip(T item) => itemToTooltip?.call(item) ?? '';
}

class VersionsField extends StatelessWidget {
  const VersionsField(
    this.name, {
    super.key,
    required this.ticket,
    required this.property,
    this.icon,
  });

  final String name, property;
  final IssueData ticket;
  final Widget? icon;

  @override
  Widget build(BuildContext context) => ListingTypeField(
    name,
    icon: icon,
    itemList: versionList(),
    itemToString: (item) => item['name'],
    itemToTooltip: (item) => item['description'],
  );

  List<dynamic>? versionList() {
    var versionList = ticket.fields![property] as List?;
    versionList?.sort(
      (a, b) {
        if (a['released'] && b['released']) {
          return DateTime.parse(b['releaseDate']).compareTo(DateTime.parse(a['releaseDate']));
        } else if (a['released']) {
          return DateTime(9999).compareTo(DateTime.parse(a['releaseDate']));
        } else if (b['released']) {
          return DateTime.parse(b['releaseDate']).compareTo(DateTime(9999));
        }
        return int.parse(b['id']).compareTo(int.parse(a['id']));
      },
    );
    return versionList;
  }
}

class DateDisplay extends StatelessWidget {
  const DateDisplay(this.title, {super.key, required this.date});
  final String title, date;
  @override
  Widget build(BuildContext context) => Text(
    '$title: ${formatDateString(date)}',
    style: TextStyle(
      color: Theme.of(context).hintColor,
    ),
  );

  String formatDateString(String input) {
    try {
      // Parse the input string — note that the timezone offset format (+0100)
      // isn't ISO 8601-compliant, so we insert a colon for Dart's parser.
      final normalized = input.replaceFirstMapped(
        RegExp(r'([+-]\d{2})(\d{2})$'),
        (match) => '${match[1]}:${match[2]}',
      );

      final dateTime = DateTime.parse(normalized);

      // Example: "December 6, 2024 at 10:32 AM"
      final formatted = DateFormat("MMMM d, y 'at' h:mm a").format(dateTime);
      return formatted;
    } catch (e) {
      return 'Invalid date';
    }
  }
}
