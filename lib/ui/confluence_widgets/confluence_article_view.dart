import 'package:confluence_api/api.dart' as confluence;
import 'package:flutter/material.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_adf.dart';
import 'package:jira_watcher/ui/updates_widgets/diff_matcher.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_doc_renderer.dart';
import 'package:loggy/loggy.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:url_launcher/url_launcher.dart';

/// One article, rendered.
///
/// Used both as the right-hand pane of a space tab and, with [compact] set, as
/// the whole body of the alt-click preview dialog.
class ConfluenceArticleView extends StatefulWidget {
  const ConfluenceArticleView({
    super.key,
    required this.pageId,
    this.onOpenLink,
    this.compact = false,
  });

  final String pageId;

  /// Called for a wiki link the reader clicked, with the mode its modifiers
  /// asked for. Null falls back to opening every link in the browser.
  final void Function(String pageId, ConfluenceOpenMode mode)? onOpenLink;

  /// Drops the version history and the toolbar's space actions, for the preview
  /// dialog where neither has anywhere to go.
  final bool compact;

  @override
  State<ConfluenceArticleView> createState() => _ConfluenceArticleViewState();
}

class _ConfluenceArticleViewState extends State<ConfluenceArticleView> with UiLoggy {
  late Future<ConfluencePage?> _page;

  /// Set while comparing: the older revision's text and its number.
  ({int number, String text})? _comparingWith;
  bool _showHistory = false;

  @override
  void initState() {
    super.initState();
    _page = ConfluenceApi().page(widget.pageId);
  }

  @override
  void didUpdateWidget(ConfluenceArticleView old) {
    super.didUpdateWidget(old);
    if (old.pageId != widget.pageId) {
      setState(() {
        _page = ConfluenceApi().page(widget.pageId);
        _comparingWith = null;
        _showHistory = false;
      });
    }
  }

  void _handleLink(String url) {
    final pageId = confluencePageIdIn(url);
    // A link out of Confluence, or a tiny /wiki/x/ link this app cannot resolve
    // without asking the server, belongs in the browser.
    if (pageId == null || widget.onOpenLink == null) {
      launchUrl(Uri.parse(url));
      return;
    }
    widget.onOpenLink!(pageId, currentOpenMode());
  }

  Future<void> _compareWith(confluence.PageVersion version) async {
    final number = version.number;
    if (number == null) return;

    final older = await ConfluenceApi().page(widget.pageId, version: number);
    if (!mounted) return;
    if (older == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Version $number could not be loaded.')),
      );
      return;
    }
    setState(() {
      _comparingWith = (number: number, text: adfToPlainText(older.adf));
      _showHistory = false;
    });
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<ConfluencePage?>(
    future: _page,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return _Message(
          icon: Symbols.error,
          title: 'This page could not be loaded.',
          detail: '${snapshot.error}',
        );
      }
      if (!snapshot.hasData && snapshot.connectionState != ConnectionState.done) {
        return const Center(child: CircularProgressIndicator());
      }

      final page = snapshot.data;
      if (page == null) {
        return const _Message(
          icon: Symbols.visibility_off,
          title: 'This page could not be opened.',
          detail: 'Confluence refused the request — it may have been deleted, or your account may not have access.',
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _toolbar(context, page),
          const Divider(height: 1),
          if (_showHistory) ...[
            SizedBox(height: 220, child: _history(context)),
            const Divider(height: 1),
          ],
          Expanded(child: _body(context, page)),
        ],
      );
    },
  );

  Widget _toolbar(BuildContext context, ConfluencePage page) {
    final webUrl = ConfluenceApi().webUrl(page.webPath);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 8, 10),
      child: Row(
        spacing: 8,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(page.title, style: Theme.of(context).textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                if (page.versionNumber != null)
                  Text(
                    'Version ${page.versionNumber}${page.versionCreatedAt == null ? '' : ' · ${_shortDate(page.versionCreatedAt!)}'}',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Theme.of(context).hintColor),
                  ),
              ],
            ),
          ),
          if (_comparingWith != null)
            ActionChip(
              avatar: const Icon(Symbols.difference, size: 16),
              label: Text('Comparing with v${_comparingWith!.number}'),
              onPressed: () => setState(() => _comparingWith = null),
            ),
          if (!widget.compact)
            IconButton(
              tooltip: 'Version history',
              icon: const Icon(Symbols.history),
              isSelected: _showHistory,
              onPressed: () => setState(() => _showHistory = !_showHistory),
            ),
          if (webUrl != null) ...[
            // Editing and creating are deliberately not implemented; these hand
            // the reader over to the website rather than pretending otherwise.
            IconButton(
              tooltip: 'Edit on the website',
              icon: const Icon(Symbols.edit),
              onPressed: () => launchUrl(Uri.parse('$webUrl${webUrl.contains('?') ? '&' : '?'}editor=true')),
            ),
            IconButton(
              tooltip: 'Open in browser',
              icon: const Icon(Symbols.open_in_browser),
              onPressed: () => launchUrl(Uri.parse(webUrl)),
            ),
          ],
        ],
      ),
    );
  }

  Widget _history(BuildContext context) => FutureBuilder<List<confluence.PageVersion>>(
    future: ConfluenceApi().versions(widget.pageId),
    builder: (context, snapshot) {
      if (snapshot.hasError) return Center(child: Text('The history could not be loaded.\n${snapshot.error}', textAlign: TextAlign.center));
      if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());

      final versions = snapshot.data!;
      if (versions.isEmpty) return const Center(child: Text('No history for this page.'));

      return ListView.builder(
        itemCount: versions.length,
        itemBuilder: (context, i) {
          final version = versions[i];
          return ListTile(
            dense: true,
            leading: CircleAvatar(radius: 14, child: Text('${version.number ?? '?'}', style: const TextStyle(fontSize: 11))),
            title: Text(
              version.message?.trim().isNotEmpty == true ? version.message! : 'No description',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(version.createdAt == null ? '' : _shortDate(version.createdAt!)),
            trailing: TextButton.icon(
              icon: const Icon(Symbols.difference, size: 16),
              label: const Text('Compare'),
              // The newest version is what is on screen, so there is nothing to
              // compare it against.
              onPressed: i == 0 ? null : () => _compareWith(version),
            ),
          );
        },
      );
    },
  );

  Widget _body(BuildContext context, ConfluencePage page) {
    if (page.adf == null) {
      return const _Message(
        icon: Symbols.article,
        title: 'This page has no readable body.',
        detail: 'Confluence returned no Atlassian Document Format content for it. Opening it in the browser will show it.',
      );
    }

    final comparison = _comparingWith;
    if (comparison != null) {
      // Compared as plain text, since DiffReviewer takes two strings. That
      // loses formatting on purpose: what changed in the words is the question
      // being asked, and a rendered diff of two ADF trees is a different job.
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: DiffReviewer(before: comparison.text, after: adfToPlainText(page.adf)),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: AdfRenderer(
        adf: page.adf!,
        attachments: const [],
        mediaBuilder: confluenceMediaBuilder(page.id),
        linkHandler: _handleLink,
      ),
    );
  }

  static String _shortDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

class _Message extends StatelessWidget {
  const _Message({required this.icon, required this.title, required this.detail});

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          Icon(icon, size: 40, color: Theme.of(context).hintColor),
          Text(title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
          Text(detail, textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).hintColor)),
        ],
      ),
    ),
  );
}
