import 'package:confluence_api/api.dart' as confluence;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/dao/confluence/confluence_api.dart';
import 'package:jira_watcher/models/settings_model.dart';
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
          const Divider(height: 1),
          _ReadingBar(page: page),
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
            IconButton(
              tooltip: 'Copy link to this page',
              icon: const Icon(Symbols.link),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: webUrl));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Link copied.'), duration: Duration(seconds: 2)),
                );
              },
            ),
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

    return ValueListenableBuilder<double>(
      valueListenable: SettingsModel().confluenceTextScale,
      builder: (context, scale, _) => SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: AdfRenderer(
          adf: page.adf!,
          attachments: const [],
          mediaBuilder: confluenceMediaBuilder(page.id),
          macroBuilder: confluenceMacroBuilder(
            page.id,
            onOpen: (pageId, mode) => widget.onOpenLink?.call(pageId, mode),
          ),
          linkHandler: _handleLink,
          linkTitleResolver: resolveConfluenceLinkTitle,
          textScale: scale,
        ),
      ),
    );
  }

  static String _shortDate(DateTime date) =>
      '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

/// The strip under the article: who wrote it and how it has been received on
/// the left, reading controls on the right.
///
/// Each figure is fetched separately and each is allowed to be absent. The
/// author costs a second call because the page reports only an account id, and
/// the view count comes from an analytics endpoint that not every Confluence
/// plan exposes — so a missing figure is normal here and simply omitted rather
/// than shown as an error.
class _ReadingBar extends StatefulWidget {
  const _ReadingBar({required this.page});

  final ConfluencePage page;

  @override
  State<_ReadingBar> createState() => _ReadingBarState();
}

class _ReadingBarState extends State<_ReadingBar> {
  late Future<confluence.User?> _author;
  late Future<int?> _views;
  late Future<int?> _likes;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(_ReadingBar old) {
    super.didUpdateWidget(old);
    if (old.page.id != widget.page.id) setState(_load);
  }

  void _load() {
    final api = ConfluenceApi();
    final authorId = widget.page.authorId;
    _author = authorId == null ? Future.value(null) : api.user(authorId);
    _views = api.viewCount(widget.page.id);
    _likes = api.likeCount(widget.page.id);
  }

  /// The status is only worth showing when it is not the ordinary one — every
  /// page a reader opens is `current`, so labelling them all says nothing.
  String? get _status {
    final status = widget.page.status;
    if (status == null || status.isEmpty || status == 'current') return null;
    return '${status[0].toUpperCase()}${status.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    final hint = Theme.of(context).hintColor;
    final small = Theme.of(context).textTheme.bodySmall!.copyWith(color: hint);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 6, 8, 6),
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 16,
              runSpacing: 4,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FutureBuilder<confluence.User?>(
                  future: _author,
                  builder: (context, snapshot) => snapshot.data?.displayName == null
                      ? const SizedBox.shrink()
                      : _Fact(icon: Symbols.person, label: snapshot.data!.displayName!, style: small),
                ),
                if (_status != null) _Fact(icon: Symbols.flag, label: _status!, style: small),
                FutureBuilder<int?>(
                  future: _views,
                  builder: (context, snapshot) => snapshot.data == null
                      ? const SizedBox.shrink()
                      : _Fact(icon: Symbols.visibility, label: '${snapshot.data} views', style: small),
                ),
                FutureBuilder<int?>(
                  future: _likes,
                  builder: (context, snapshot) => snapshot.data == null || snapshot.data == 0
                      ? const SizedBox.shrink()
                      : _Fact(icon: Symbols.mood, label: '${snapshot.data}', style: small),
                ),
              ],
            ),
          ),
          const _TextMagnifier(),
        ],
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact({required this.icon, required this.label, required this.style});

  final IconData icon;
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    spacing: 4,
    children: [
      Icon(icon, size: 14, color: style.color),
      Text(label, style: style),
    ],
  );
}

/// Sets the article text size for every Confluence article, not just this one —
/// somebody who wants larger text wants it on the next page too.
class _TextMagnifier extends StatelessWidget {
  const _TextMagnifier();

  static const _min = 0.8;
  static const _max = 2.0;
  static const _step = 0.1;

  @override
  Widget build(BuildContext context) {
    final setting = SettingsModel().confluenceTextScale;

    return ValueListenableBuilder<double>(
      valueListenable: setting,
      builder: (context, scale, _) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            tooltip: 'Smaller text',
            icon: const Icon(Symbols.text_decrease),
            visualDensity: VisualDensity.compact,
            onPressed: scale <= _min ? null : () => setting.value = (scale - _step).clamp(_min, _max),
          ),
          // Doubles as the reset: the percentage is the only place the current
          // setting is visible, so it is also where it can be undone.
          Tooltip(
            message: 'Reset to 100%',
            child: InkWell(
              onTap: scale == 1.0 ? null : () => setting.value = 1.0,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                child: Text('${(scale * 100).round()}%', style: Theme.of(context).textTheme.bodySmall),
              ),
            ),
          ),
          IconButton(
            tooltip: 'Larger text',
            icon: const Icon(Symbols.text_increase),
            visualDensity: VisualDensity.compact,
            onPressed: scale >= _max ? null : () => setting.value = (scale + _step).clamp(_min, _max),
          ),
        ],
      ),
    );
  }
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
