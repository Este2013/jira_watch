import 'dart:convert';
import 'dart:typed_data';

import 'package:confluence_api/api.dart' as confluence;
import 'package:http/http.dart' as http;
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:loggy/loggy.dart';

/// One page, reduced to what the reader actually renders.
///
/// A small class rather than the generated model because the part that matters
/// most — the body — has to come out as a raw ADF map for `AdfRenderer`, and a
/// half-typed object whose most important field is untyped is worse than an
/// honest one.
class ConfluencePage {
  const ConfluencePage({
    required this.id,
    required this.title,
    required this.spaceId,
    required this.adf,
    this.authorId,
    this.status,
    this.parentId,
    this.versionNumber,
    this.versionCreatedAt,
    this.webPath,
  });

  final String id;
  final String title;
  final String? spaceId;

  /// The Atlassian Document Format body, already decoded. Null when Confluence
  /// returned no ADF for this page — see [ConfluenceApi.page].
  final Map<String, dynamic>? adf;

  /// Resolved to a name separately: the pages API reports only an account id.
  final String? authorId;

  /// `current`, `draft`, `archived` — what Confluence calls the page's state.
  final String? status;

  /// Whatever the page hangs from — which need not be a page; see
  /// [ConfluenceApi.pageTree].
  final String? parentId;

  final int? versionNumber;
  final DateTime? versionCreatedAt;

  /// Site-relative, as Confluence returns it.
  final String? webPath;
}

/// A node in a space's page tree.
class ConfluencePageNode {
  ConfluencePageNode({required this.id, required this.title, this.openable = true, this.children = const []});

  final String id;
  final String title;
  final List<ConfluencePageNode> children;

  /// False for a container that holds pages but is not one — a folder, a
  /// whiteboard, a database. Clicking it can only expand it; there is no
  /// article behind it to fetch.
  final bool openable;

  bool get hasChildren => children.isNotEmpty;
}

/// A space's tree, and whether it is all of it.
typedef ConfluenceTree = ({List<ConfluencePageNode> roots, bool truncated});

/// The fields of a page listing the tree is built from, without the generated
/// model — so the assembly below can be exercised without a Confluence.
typedef ConfluenceListedPage = ({String id, String? title, String? parentId, int? position, bool openable});

/// Turns a flat page listing into roots and children.
///
/// A page whose parent is not in the listing is treated as a root: with a
/// truncated fetch its parent may simply be missing, and dropping the page
/// would hide a whole subtree rather than misplace one node.
List<ConfluencePageNode> assembleConfluenceTree(List<ConfluenceListedPage> pages) {
  final byParent = <String?, List<ConfluenceListedPage>>{};
  final ids = {for (final page in pages) page.id};
  for (final page in pages) {
    byParent.putIfAbsent(ids.contains(page.parentId) ? page.parentId : null, () => []).add(page);
  }

  // Confluence orders siblings by an explicit position; pages without one fall
  // to the end, alphabetically, which is how the web UI shows them.
  List<ConfluencePageNode> build(String? parentId, Set<String> seen) {
    final children = [...byParent[parentId] ?? const <ConfluenceListedPage>[]]..sort((a, b) {
      final byPosition = (a.position ?? 1 << 31).compareTo(b.position ?? 1 << 31);
      return byPosition != 0 ? byPosition : (a.title ?? '').toLowerCase().compareTo((b.title ?? '').toLowerCase());
    });
    return [
      for (final page in children)
        // A cycle would otherwise recurse until the stack gives out. Nothing
        // should produce one, but this tree comes off the wire.
        if (seen.add(page.id))
          ConfluencePageNode(
            id: page.id,
            title: page.title ?? '(untitled)',
            openable: page.openable,
            children: build(page.id, seen),
          ),
    ];
  }

  return build(null, <String>{});
}

/// Turns Confluence's stored emoji into characters.
///
/// It stores the codepoints rather than the character: `1f4da`, or
/// `1f468-200d-1f4bb` for one built from several joined by a zero-width joiner.
/// A shortname such as `:books:` is also possible and cannot be resolved without
/// a table, so it is declined rather than shown raw.
///
/// Returns null for anything unrecognisable, which the caller treats as "this
/// space has no emoji".
String? decodeConfluenceEmoji(Object? value) {
  final raw = value is String ? value : (value is Map ? value['value']?.toString() : null);
  if (raw == null || raw.trim().isEmpty) return null;

  final text = raw.trim();

  if (!RegExp(r'^[0-9a-fA-F-]+$').hasMatch(text)) {
    // Not codepoints. An emoji sent as an actual character has no ASCII letters
    // or digits in it, which is what separates it from a shortname like
    // `:books:` or from a value that is simply malformed — both of which are
    // declined rather than rendered as literal text in the tab strip.
    return RegExp(r'[A-Za-z0-9]').hasMatch(text) ? null : text;
  }

  final codePoints = <int>[];
  for (final part in text.split('-')) {
    final point = int.tryParse(part, radix: 16);
    // A codepoint outside Unicode's range would throw in fromCharCodes.
    if (point == null || point < 0 || point > 0x10FFFF) return null;
    codePoints.add(point);
  }
  return codePoints.isEmpty ? null : String.fromCharCodes(codePoints);
}

/// Confluence access for the app.
///
/// Shaped like [JiraApi]: the generated API classes are exposed directly so any
/// of the 218 published operations is reachable, with conveniences on top for
/// the handful of calls the reader makes.
///
/// Credentials come from [JiraAuth] rather than a store of their own. An
/// Atlassian Cloud API token authenticates against the whole site, so a separate
/// Confluence sign-in would only ask for the same token twice.
class ConfluenceApi with GlobalLoggy {
  static final ConfluenceApi _instance = ConfluenceApi._internal();

  factory ConfluenceApi() => _instance;

  ConfluenceApi._internal() {
    JiraAuth().addListener(_invalidateClient);
  }

  confluence.ApiClient? _client;

  void _invalidateClient() {
    _client = null;
    _spaceNameCache.clear();
    _spaceEmojiCache.clear();
    _iconBytes.clear();
  }

  /// The v2 spec's paths are relative to a server of `{site}/wiki/api/v2`, so
  /// the whole prefix belongs in the base path — unlike the Jira specs, whose
  /// paths are absolute from the site root.
  confluence.ApiClient get client => _client ??= confluence.ApiClient(
    basePath: '${JiraAuth().siteUrl ?? 'https://unconfigured.invalid'}/wiki/api/v2',
    authentication: confluence.HttpBasicAuth(username: JiraAuth().email ?? '', password: JiraAuth().apiToken ?? ''),
  );

  bool get isReady => JiraAuth().isReady;

  /// Where the browser has to go for anything this reader does not do: editing,
  /// creating, and the app links people out to it rather than reimplementing it.
  String? get siteWikiUrl => JiraAuth().siteUrl == null ? null : '${JiraAuth().siteUrl}/wiki';

  /// Turns a site-relative path from the API — `_links.webui`, `webPath` — into
  /// something launchable.
  String? webUrl(String? relativePath) {
    if (relativePath == null || relativePath.isEmpty) return null;
    if (relativePath.startsWith('http')) return relativePath;
    final base = siteWikiUrl;
    if (base == null) return null;
    return '$base$relativePath';
  }

  /// Like [webUrl], but for paths that already carry the `/wiki` prefix.
  ///
  /// A space icon's `path` is inconsistent about it — some sites return
  /// `/wiki/download/...` and others `/download/...` — and prefixing blindly
  /// would produce `/wiki/wiki/download/...`, which 404s and shows as a missing
  /// image with no explanation.
  String? absoluteUrl(String? path) {
    if (path == null || path.isEmpty) return null;
    if (path.startsWith('http')) return path;
    final site = JiraAuth().siteUrl;
    if (site == null) return null;
    return path.startsWith('/wiki/') ? '$site$path' : webUrl(path);
  }

  /// Which of a space icon's two URLs to use.
  ///
  /// `path` is the web UI's route and can be `/wiki/aa-avatar/...` for a space
  /// with a generated icon, which rejects an API token — that is the 401 those
  /// icons produced. The spec says outright to prefer `apiDownloadLink` for
  /// programmatic retrieval; it is only returned for global spaces, so `path`
  /// stays as the fallback.
  static String? iconPathOf(confluence.SpaceIcon? icon) {
    final api = icon?.apiDownloadLink;
    if (api != null && api.isNotEmpty) return api;
    final path = icon?.path;
    return (path != null && path.isNotEmpty) ? path : null;
  }

  /// Whether a stored icon path is one an API token cannot fetch.
  ///
  /// Tabs saved before [iconPathOf] existed hold the web UI's `path`, and for a
  /// space with a generated icon that is an `aa-avatar` route which answers 401.
  /// Treating those as missing makes such a tab look its space up once more and
  /// pick up the API link, rather than showing initials forever.
  static bool isUnauthenticatableIconPath(String path) => path.contains('/aa-avatar/');

  /// A space icon's bytes, or null if it could not be fetched.
  ///
  /// Cached including the failures: an icon that 401s would otherwise be
  /// re-requested on every rebuild of every tab showing that space.
  final Map<String, Uint8List?> _iconBytes = {};

  Future<Uint8List?> iconBytes(String url) async {
    if (_iconBytes.containsKey(url)) return _iconBytes[url];
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': JiraAuth().authHeader,
        'Accept': 'image/*',
      });
      if (response.statusCode != 200) {
        loggy.info('Space icon $url returned ${response.statusCode}; falling back to initials.');
        return _iconBytes[url] = null;
      }
      return _iconBytes[url] = response.bodyBytes;
    } on Object catch (e) {
      loggy.info('Space icon $url could not be fetched ($e); falling back to initials.');
      return _iconBytes[url] = null;
    }
  }

  // The generated surface, for anything the conveniences below do not cover.
  confluence.SpaceApi get spacesApi => confluence.SpaceApi(client);
  confluence.PageApi get pagesApi => confluence.PageApi(client);
  confluence.ChildrenApi get childrenApi => confluence.ChildrenApi(client);
  confluence.FolderApi get foldersApi => confluence.FolderApi(client);
  confluence.VersionApi get versionsApi => confluence.VersionApi(client);
  confluence.AttachmentApi get attachmentsApi => confluence.AttachmentApi(client);
  confluence.CommentApi get commentsApi => confluence.CommentApi(client);
  confluence.SpacePropertiesApi get spacePropertiesApi => confluence.SpacePropertiesApi(client);

  // SPACES ////////////////////////////////////////////////////////////////////

  final Map<String, String> _spaceNameCache = {};

  /// Every space the token can see, newest listing first.
  ///
  /// Paged through rather than capped at one response: the picker filters
  /// locally, so a space missing from the list simply cannot be opened.
  Future<List<confluence.SpaceBulk>> allSpaces({int maxPages = 10, int perPage = 250}) async {
    final spaces = <confluence.SpaceBulk>[];
    String? cursor;
    for (var page = 0; page < maxPages; page++) {
      final result = await spacesApi.getSpaces(limit: perPage, cursor: cursor, includeIcon: true);
      spaces.addAll(result?.results ?? const []);
      cursor = _cursorOf(result?.links?.next);
      if (cursor == null) break;
    }
    for (final space in spaces) {
      if (space.id != null && space.name != null) _spaceNameCache[space.id!] = space.name!;
    }
    return spaces;
  }

  final Map<String, String?> _spaceEmojiCache = {};

  /// The emoji a space uses as its icon, if it does.
  ///
  /// Confluence's newer space icons are emoji, not images, and the v2 spec does
  /// not describe them at all — the word never appears in it. They are stored as
  /// a space property whose value is the emoji's codepoints, so this reads the
  /// properties and looks for one, rather than hardcoding a key the spec never
  /// promised.
  ///
  /// A space with an emoji reports no `icon`, which is why such a space looked
  /// like it had no icon at all.
  Future<String?> spaceEmoji(String spaceId) async {
    if (_spaceEmojiCache.containsKey(spaceId)) return _spaceEmojiCache[spaceId];

    for (final property in await spaceProperties(spaceId)) {
      if (!(property.key ?? '').toLowerCase().contains('emoji')) continue;
      final emoji = decodeConfluenceEmoji(property.value);
      if (emoji != null) return _spaceEmojiCache[spaceId] = emoji;
    }
    return _spaceEmojiCache[spaceId] = null;
  }

  /// A space's properties, as Confluence returns them.
  ///
  /// Public because this is where an emoji icon hides and the spec says nothing
  /// about it — so the debug dialog shows the lot, which is the only way to see
  /// what key a site actually uses.
  Future<List<confluence.SpaceProperty>> spaceProperties(String spaceId) async {
    final id = int.tryParse(spaceId);
    if (id == null) return const [];
    try {
      final result = await spacePropertiesApi.getSpaceProperties(id, limit: 100);
      return result?.results ?? const [];
    } on Object catch (e) {
      loggy.info('Could not read the space properties of $spaceId: $e');
      return const [];
    }
  }

  /// A space by its key rather than its id, for a macro that names one — the
  /// page-tree macro's `spaces` parameter carries the key.
  Future<confluence.SpaceBulk?> spaceByKey(String key) async {
    if (key.isEmpty) return null;
    try {
      final result = await spacesApi.getSpaces(keys: [key], limit: 1, includeIcon: true);
      return result?.results.firstOrNull;
    } on Object catch (e) {
      loggy.info('Could not look up space "$key": $e');
      return null;
    }
  }

  /// A space's home page, which is where the page-tree macro roots itself by
  /// default (`root: @home`).
  Future<String?> spaceHomepageId(String spaceId) async {
    try {
      return (await space(spaceId))?.homepageId;
    } on Object catch (e) {
      loggy.info('Could not read the home page of space $spaceId: $e');
      return null;
    }
  }

  Future<confluence.GetSpaceById200Response?> space(String spaceId) async {
    final id = int.tryParse(spaceId);
    if (id == null) return null;
    // includeIcon is opt-in, and forgetting it here was why a space resolved
    // through this path always came back iconless and fell back to initials.
    return spacesApi.getSpaceById(id, includeIcon: true);
  }

  // PAGE TREE /////////////////////////////////////////////////////////////////

  /// A space's whole page tree.
  ///
  /// Built from one paged listing rather than a request per expanded node,
  /// because the listing already carries each page's `parentId`. Level-by-level
  /// fetching would also have to draw every node as expandable — v2 reports no
  /// child count — so half the chevrons would open onto nothing.
  ///
  /// A page's parent need not be a page: `parentType` also allows folder,
  /// whiteboard, database and embed. None of those appear in a listing of the
  /// space's *pages*, so their children arrive looking parentless and would sit
  /// at the top of the tree beside the space's real roots — several levels
  /// shallower than they belong. Missing parents are fetched instead, which
  /// also puts the folders themselves into the tree, where Confluence shows
  /// them too.
  ///
  /// [maxPages] caps how far it will page. A space past the cap returns
  /// `truncated: true` rather than pretending the tree is complete; the parts
  /// that did arrive are still usable.
  Future<ConfluenceTree> pageTree(String spaceId, {int maxPages = 12, int perPage = 250}) async {
    final id = int.tryParse(spaceId);
    if (id == null) return (roots: const <ConfluencePageNode>[], truncated: false);

    final listed = <String, ConfluenceListedPage>{};
    // Kept beside the entries because only a parent's own record says what kind
    // of thing it is, and that decides which endpoint can fetch it.
    final parentKinds = <String, confluence.ParentContentType>{};

    void record(String id, {String? title, String? parentId, confluence.ParentContentType? parentType, int? position, bool openable = true}) {
      listed[id] = (id: id, title: title, parentId: parentId, position: position, openable: openable);
      if (parentId != null && parentType != null) parentKinds[parentId] = parentType;
    }

    String? cursor;
    var truncated = false;
    for (var page = 0; ; page++) {
      if (page >= maxPages) {
        truncated = true;
        break;
      }
      final result = await pagesApi.getPagesInSpace(id, limit: perPage, cursor: cursor, status: const ['current']);
      for (final page in result?.results ?? const <confluence.PageBulk>[]) {
        if (page.id == null) continue;
        record(page.id!, title: page.title, parentId: page.parentId, parentType: page.parentType, position: page.position);
      }
      cursor = _cursorOf(result?.links?.next);
      if (cursor == null) break;
    }

    await _resolveMissingParents(listed, parentKinds, record);

    return (roots: assembleConfluenceTree(listed.values.toList()), truncated: truncated);
  }

  /// Walks up from every parentless entry, fetching the parent, until nothing is
  /// missing.
  ///
  /// Looped because a resolved parent can itself have a parent that was never
  /// listed — a page inside a folder inside a folder. [maxRounds] bounds it, so
  /// data that disagrees with itself cannot spin here forever.
  Future<void> _resolveMissingParents(
    Map<String, ConfluenceListedPage> listed,
    Map<String, confluence.ParentContentType> parentKinds,
    void Function(String id, {String? title, String? parentId, confluence.ParentContentType? parentType, int? position, bool openable}) record,
  ) async {
    final unreachable = <String>{};

    for (var round = 0; round < 6; round++) {
      final missing = {
        for (final entry in listed.values)
          if (entry.parentId != null && !listed.containsKey(entry.parentId) && !unreachable.contains(entry.parentId)) entry.parentId!,
      };
      if (missing.isEmpty) return;

      // In parallel: these are independent single-object reads, and a folder
      // with twenty pages under it would otherwise be twenty serial round trips.
      await Future.wait(
        missing.map((parentId) async {
          final resolved = await _fetchContainer(parentId, parentKinds[parentId]);
          if (resolved == null) {
            // Left out of reach on purpose: a parent nobody can read means its
            // children stay where they are rather than the walk retrying it on
            // every round.
            unreachable.add(parentId);
            return;
          }
          record(
            parentId,
            title: resolved.title,
            parentId: resolved.parentId,
            parentType: resolved.parentType,
            position: resolved.position,
            openable: resolved.openable,
          );
        }),
      );
    }
  }

  /// Fetches whatever a page hangs from, by kind.
  ///
  /// Folders and pages are the cases that occur in practice and are read
  /// properly. A whiteboard, database or embed becomes a labelled placeholder:
  /// none of them can be read as an article anyway, and the only thing the tree
  /// needs from it is somewhere to hang its children.
  Future<({String? title, String? parentId, confluence.ParentContentType? parentType, int? position, bool openable})?> _fetchContainer(
    String containerId,
    confluence.ParentContentType? kind,
  ) async {
    final id = int.tryParse(containerId);
    if (id == null) return null;

    try {
      if (kind == confluence.ParentContentType.folder) {
        final folder = await foldersApi.getFolderById(id);
        if (folder == null) return null;
        return (title: folder.title, parentId: folder.parentId, parentType: folder.parentType, position: folder.position, openable: false);
      }

      if (kind == null || kind == confluence.ParentContentType.page) {
        final page = await pagesApi.getPageById(id);
        if (page == null) return null;
        return (title: page.title, parentId: page.parentId, parentType: page.parentType, position: page.position, openable: true);
      }

      return (title: '${kind.toString()[0].toUpperCase()}${kind.toString().substring(1)}', parentId: null, parentType: null, position: null, openable: false);
    } on Object catch (e) {
      // An archived or restricted parent is a 404 or a 403 here, which is not a
      // reason to fail the whole tree.
      loggy.info('Could not resolve tree parent $containerId: $e');
      return null;
    }
  }

  // PAGES /////////////////////////////////////////////////////////////////////

  /// A page, with its body as decoded ADF.
  ///
  /// Confluence returns Atlassian Document Format for every page, including ones
  /// authored in the legacy editor and migrated years ago — which is what lets
  /// the reader reuse `AdfRenderer` rather than rendering storage XHTML. The
  /// body arrives as a JSON *string* inside the response, so it is decoded here
  /// and never handed to a widget still encoded.
  ///
  /// [version] fetches a historical revision instead of the current one.
  Future<ConfluencePage?> page(String pageId, {int? version}) async {
    final id = int.tryParse(pageId);
    if (id == null) return null;

    final response = await pagesApi.getPageById(
      id,
      bodyFormat: confluence.PrimaryBodyRepresentationSingle.atlasDocFormat,
      version: version,
    );
    if (response == null) return null;

    return ConfluencePage(
      id: response.id ?? pageId,
      title: response.title ?? '(untitled)',
      spaceId: response.spaceId,
      adf: _decodeAdf(response.body?.atlasDocFormat?.value, pageId),
      authorId: response.authorId,
      status: response.status?.toString(),
      parentId: response.parentId,
      versionNumber: response.version?.number,
      versionCreatedAt: response.version?.createdAt,
      // The response's _links carries only a base, no page path. This form
      // needs no space key and Confluence redirects it to the canonical URL.
      webPath: '/pages/viewpage.action?pageId=${response.id ?? pageId}',
    );
  }

  Map<String, dynamic>? _decodeAdf(String? value, String pageId) {
    if (value == null || value.isEmpty) return null;
    try {
      final decoded = jsonDecode(value);
      return decoded is Map<String, dynamic> ? decoded : null;
    } on FormatException catch (e) {
      loggy.warning('Page $pageId has an atlas_doc_format body that is not JSON: $e');
      return null;
    }
  }

  // PAGE DETAILS //////////////////////////////////////////////////////////////

  final Map<String, String> _pageTitleCache = {};

  /// A page's title, for labelling a link to it.
  ///
  /// Cached hard: an article linking to the same page five times would
  /// otherwise fetch it five times while rendering, and a title does not change
  /// while someone is reading.
  Future<String?> pageTitle(String pageId) async {
    final cached = _pageTitleCache[pageId];
    if (cached != null) return cached;

    final id = int.tryParse(pageId);
    if (id == null) return null;
    try {
      final page = await pagesApi.getPageById(id);
      final title = page?.title;
      if (title != null) _pageTitleCache[pageId] = title;
      return title;
    } on Object catch (e) {
      // A link to a page the reader cannot see is not an error worth showing;
      // the chip falls back to the URL.
      loggy.info('Could not read the title of page $pageId: $e');
      return null;
    }
  }

  final Map<String, confluence.User> _userCache = {};

  /// A display name for an account id.
  ///
  /// The pages API reports only `authorId`, so an author's name always costs
  /// this second call.
  Future<confluence.User?> user(String accountId) async {
    final cached = _userCache[accountId];
    if (cached != null) return cached;
    try {
      final result = await confluence.UserApi(client).createBulkUserLookup(
        confluence.CreateBulkUserLookupRequest(accountIds: [accountId]),
      );
      final user = result?.results.firstOrNull;
      if (user != null) _userCache[accountId] = user;
      return user;
    } on Object catch (e) {
      loggy.info('Could not look up user $accountId: $e');
      return null;
    }
  }

  /// How many people reacted to the page.
  ///
  /// v2 models this as footer *likes*; Confluence's own footer shows the same
  /// number behind an emoji.
  Future<int?> likeCount(String pageId) async {
    final id = int.tryParse(pageId);
    if (id == null) return null;
    try {
      final result = await confluence.LikeApi(client).getFooterLikeCount(id);
      return result?.count;
    } on Object catch (e) {
      loggy.info('Could not read the like count of page $pageId: $e');
      return null;
    }
  }

  /// How many times the page has been viewed.
  ///
  /// Analytics is a v1 endpoint with no v2 equivalent, and it is not available
  /// on every Confluence plan — so this returns null rather than failing, and
  /// the reader simply omits the figure.
  Future<int?> viewCount(String pageId) async {
    final site = JiraAuth().siteUrl;
    if (site == null) return null;
    try {
      final response = await http.get(
        Uri.parse('$site/wiki/rest/api/analytics/content/$pageId/views'),
        headers: {'Authorization': JiraAuth().authHeader, 'Accept': 'application/json'},
      );
      if (response.statusCode != 200) {
        loggy.info('Analytics returned ${response.statusCode} for page $pageId; view count omitted.');
        return null;
      }
      return (jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>)['count'] as int?;
    } on Object catch (e) {
      loggy.info('Could not read the view count of page $pageId: $e');
      return null;
    }
  }

  /// A page's direct children, for the child-pages macro.
  Future<List<ConfluencePageNode>> childPages(String pageId) async {
    final id = int.tryParse(pageId);
    if (id == null) return const [];
    final result = await childrenApi.getChildPages(id, limit: 250);
    final children = [...result?.results ?? const <confluence.ChildPage>[]]
      ..sort((a, b) => (a.childPosition ?? 1 << 31).compareTo(b.childPosition ?? 1 << 31));
    return [
      for (final child in children)
        if (child.id != null) ConfluencePageNode(id: child.id!, title: child.title ?? '(untitled)'),
    ];
  }

  // VERSIONS //////////////////////////////////////////////////////////////////

  /// A page's revisions, newest first.
  Future<List<confluence.PageVersion>> versions(String pageId, {int limit = 100}) async {
    final id = int.tryParse(pageId);
    if (id == null) return const [];
    // modifiedDate2 is the descending variant, so the newest revision is first.
    final result = await versionsApi.getPageVersions(id, limit: limit, sort: confluence.VersionSortOrder.modifiedDate2);
    return result?.results ?? const [];
  }

  // ATTACHMENTS ///////////////////////////////////////////////////////////////

  /// Maps a page's media ids to absolute download URLs.
  ///
  /// ADF media nodes carry a `fileId`, not a URL, so a page's images cannot be
  /// fetched without this lookup. Cached per page: a page with a dozen images
  /// would otherwise ask once per image while rendering.
  final Map<String, Map<String, String>> _mediaUrlCache = {};

  Future<Map<String, String>> mediaUrls(String pageId) async {
    final cached = _mediaUrlCache[pageId];
    if (cached != null) return cached;

    final id = int.tryParse(pageId);
    if (id == null) return const {};

    final result = await attachmentsApi.getPageAttachments(id, limit: 250);
    final urls = <String, String>{
      for (final attachment in result?.results ?? const <confluence.AttachmentBulk>[])
        if (attachment.fileId != null && attachment.downloadLink != null)
          attachment.fileId!: webUrl(attachment.downloadLink) ?? attachment.downloadLink!,
    };
    return _mediaUrlCache[pageId] = urls;
  }

  // SEARCH ////////////////////////////////////////////////////////////////////

  /// CQL search, as raw JSON.
  ///
  /// The one call that does not go through the generated client: there is no
  /// search operation anywhere in the v2 spec — it exists only in v1 — and one
  /// endpoint is not worth a second generated package. If more of v1 is ever
  /// needed, add its spec to tool/generate_jira_api.ps1 and this moves onto it.
  Future<List<Map<String, dynamic>>> search(String text, {String? spaceKey, int limit = 25}) async {
    final site = JiraAuth().siteUrl;
    if (site == null || text.trim().isEmpty) return const [];

    // Quotes would otherwise terminate the CQL string literal early and the
    // whole query would be rejected as malformed.
    final escaped = text.replaceAll(r'\', r'\\').replaceAll('"', r'\"');
    final cql = [
      'siteSearch ~ "$escaped"',
      'type = page',
      if (spaceKey != null && spaceKey.isNotEmpty) 'space = "$spaceKey"',
    ].join(' AND ');

    final uri = Uri.parse('$site/wiki/rest/api/search').replace(
      queryParameters: {'cql': cql, 'limit': '$limit'},
    );

    final response = await http.get(uri, headers: {
      'Authorization': JiraAuth().authHeader,
      'Accept': 'application/json',
    });
    if (response.statusCode != 200) {
      loggy.warning('Confluence search returned ${response.statusCode}: ${response.body}');
      return const [];
    }

    final data = jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
    return (data['results'] as List? ?? const []).map((e) => (e as Map).cast<String, dynamic>()).toList();
  }

  // HELPERS ///////////////////////////////////////////////////////////////////

  /// Confluence pages a cursor through an opaque token buried in the `next`
  /// link, rather than returning it as a field of its own.
  static String? _cursorOf(String? nextLink) {
    if (nextLink == null || nextLink.isEmpty) return null;
    return Uri.parse(nextLink).queryParameters['cursor'];
  }

  /// The space name for an id already seen while listing spaces. Null rather
  /// than a request, for callers that only want a label if it is free.
  String? cachedSpaceName(String spaceId) => _spaceNameCache[spaceId];
}
