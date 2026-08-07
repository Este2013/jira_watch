import 'dart:convert';

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

  final int? versionNumber;
  final DateTime? versionCreatedAt;

  /// Site-relative, as Confluence returns it.
  final String? webPath;
}

/// A node in a space's page tree.
class ConfluencePageNode {
  ConfluencePageNode({required this.id, required this.title, this.children = const []});

  final String id;
  final String title;
  final List<ConfluencePageNode> children;

  bool get hasChildren => children.isNotEmpty;
}

/// A space's tree, and whether it is all of it.
typedef ConfluenceTree = ({List<ConfluencePageNode> roots, bool truncated});

/// The fields of a page listing the tree is built from, without the generated
/// model — so the assembly below can be exercised without a Confluence.
typedef ConfluenceListedPage = ({String id, String? title, String? parentId, int? position});

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
            children: build(page.id, seen),
          ),
    ];
  }

  return build(null, <String>{});
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

  // The generated surface, for anything the conveniences below do not cover.
  confluence.SpaceApi get spacesApi => confluence.SpaceApi(client);
  confluence.PageApi get pagesApi => confluence.PageApi(client);
  confluence.ChildrenApi get childrenApi => confluence.ChildrenApi(client);
  confluence.VersionApi get versionsApi => confluence.VersionApi(client);
  confluence.AttachmentApi get attachmentsApi => confluence.AttachmentApi(client);
  confluence.CommentApi get commentsApi => confluence.CommentApi(client);

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
      final result = await spacesApi.getSpaces(limit: perPage, cursor: cursor);
      spaces.addAll(result?.results ?? const []);
      cursor = _cursorOf(result?.links?.next);
      if (cursor == null) break;
    }
    for (final space in spaces) {
      if (space.id != null && space.name != null) _spaceNameCache[space.id!] = space.name!;
    }
    return spaces;
  }

  Future<confluence.GetSpaceById200Response?> space(String spaceId) async {
    final id = int.tryParse(spaceId);
    if (id == null) return null;
    return spacesApi.getSpaceById(id);
  }

  // PAGE TREE /////////////////////////////////////////////////////////////////

  /// A space's whole page tree.
  ///
  /// Built from one paged listing rather than a request per expanded node,
  /// because the listing already carries each page's `parentId`. Level-by-level
  /// fetching would also have to draw every node as expandable — v2 reports no
  /// child count — so half the chevrons would open onto nothing.
  ///
  /// [maxPages] caps how far it will page. A space past the cap returns
  /// `truncated: true` rather than pretending the tree is complete; the parts
  /// that did arrive are still usable.
  Future<ConfluenceTree> pageTree(String spaceId, {int maxPages = 12, int perPage = 250}) async {
    final id = int.tryParse(spaceId);
    if (id == null) return (roots: const <ConfluencePageNode>[], truncated: false);

    final pages = <confluence.PageBulk>[];
    String? cursor;
    var truncated = false;
    for (var page = 0; ; page++) {
      if (page >= maxPages) {
        truncated = true;
        break;
      }
      final result = await pagesApi.getPagesInSpace(id, limit: perPage, cursor: cursor, status: const ['current']);
      pages.addAll(result?.results ?? const []);
      cursor = _cursorOf(result?.links?.next);
      if (cursor == null) break;
    }

    return (
      roots: assembleConfluenceTree([
        for (final page in pages)
          if (page.id != null) (id: page.id!, title: page.title, parentId: page.parentId, position: page.position),
      ]),
      truncated: truncated,
    );
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
