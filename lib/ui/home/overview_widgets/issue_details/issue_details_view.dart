import 'dart:convert';
import 'package:charset/charset.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/api_dao.dart';
import 'package:jira_watcher/ui/home/overview_widgets/avatar.dart';
import 'package:jira_watcher/ui/utils/jira_doc_renderer.dart';
import 'package:jira_watcher/ui/utils/network_video_player.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

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
          if (ticket.fields!['description'] != null) DescriptionLikeField('Description', contentData: ticket.fields!['description']),
          if (ticket.fields!['environment'] != null) DescriptionLikeField('Environment', contentData: ticket.fields!['environment']),
          if (ticket.fields!['attachment'] != null && (ticket.fields!['attachment'] as List).isNotEmpty) AttachmentsField(attachmentsData: ticket.fields!['attachment']),

          Table(
            border: TableBorder.all(color: Theme.of(context).dividerColor),
            children: [
              for (var field
                  in ticket.fields!.entries.where((e) => !(e.key as String).contains('customfield')).toList()..sort(
                    (a, b) => (a.key as String).compareTo(b.key),
                  ))
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: SelectableText(field.key),
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: SelectableText(field.value.runtimeType.toString())),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ['String', 'Null', 'int'].contains(field.value.runtimeType.toString())
                            ? Center(child: SelectableText(field.value.toString()))
                            : TextButton.icon(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text(field.key),
                                      content: SingleChildScrollView(child: SelectableText(JsonEncoder.withIndent('    ').convert(field.value))),
                                    ),
                                  );
                                },
                                label: Text('Inspect'),
                                icon: Icon(Symbols.document_search),
                              ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ].expand((w) => [w, SizedBox(height: 8)]).toList(),
      ),
    );
  }
}

class ExpandablePanel extends StatefulWidget {
  const ExpandablePanel(this.name, {super.key, required this.content});

  final String name;
  final Widget content;

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              ),
              const SizedBox(width: 8),
              Text(
                widget.name,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          AnimatedSize(
            duration: Durations.medium1,
            curve: Curves.easeInOut,
            child: isExpanded
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Divider(),
                      widget.content,
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
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
