import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:http/http.dart' as http;
import 'package:jira_platform_api/api.dart' hide Icon;
import 'package:jira_watcher/dao/jira/jira_auth.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mime/mime.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xml/xml.dart' as xml;

import '../network_video_player.dart';

final CacheManager jiraAvatarCacheManager = CacheManager(
  Config(
    'jiraAvatarCache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 200,
  ),
);

class JiraProjectAvatar extends StatelessWidget {
  final String projectCode;
  final String resolution; // e.g. '16x16', '24x24', '32x32', '48x48'
  final double size;

  const JiraProjectAvatar({
    super.key,
    required this.projectCode,
    this.resolution = '32x32',
    this.size = 32,
  });

  // Resolve each project's avatar URL only once, so rebuilds don't recreate the
  // future (which used to re-run the lookup and flash a spinner).
  static final Map<String, Future<String?>> _urlCache = {};

  Future<String?> _getAvatarUrl() async {
    List projects = await DataModel().fetchProjects();
    var project = projects.firstWhere(
      (p) => p['key'] == projectCode,
      orElse: () => null,
    );
    if (project == null) {
      // Try refresh if not found
      projects = await DataModel().fetchProjects(refresh: true);
      project = projects.firstWhere(
        (p) => p['key'] == projectCode,
        orElse: () => null,
      );
    }
    if (project != null && project['avatarUrls'] != null) {
      return project['avatarUrls'][resolution] ?? project['avatarUrls']['32x32'];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _urlCache.putIfAbsent('$projectCode|$resolution', _getAvatarUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox.square(
            dimension: size,
            child: const Center(
              child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .8,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        final url = snapshot.data;
        if (url == null) {
          return Icon(Symbols.folder, size: size);
        }
        return JiraAvatar(url: url, size: size);
      },
    );
  }
}

class JiraAvatar extends StatefulWidget {
  final String url;
  final double size;

  final BoxFit boxFit;

  const JiraAvatar({
    super.key,
    required this.url,
    this.size = 32,
    this.boxFit = BoxFit.contain,
  });

  @override
  State<JiraAvatar> createState() => _JiraAvatarState();
}

class _JiraAvatarState extends State<JiraAvatar> {
  // Shared across every avatar so a given image is fetched + decoded only once.
  // _resolvedCache lets rebuilds/recreations render instantly (no FutureBuilder,
  // no spinner flash, no re-decode) — which is what kept the list choppy while
  // selecting items, since selection churns the avatar elements.
  static final Map<String, Future<Widget>> _futureCache = {};
  static final Map<String, Widget> _resolvedCache = {};

  late Future<Widget> _avatarFuture;

  String get _cacheKey => '${widget.url}|${widget.size}|${widget.boxFit}';

  @override
  void initState() {
    super.initState();
    _avatarFuture = _futureCache.putIfAbsent(_cacheKey, () => _loadAvatar(widget.url));
  }

  @override
  void didUpdateWidget(covariant JiraAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url || oldWidget.size != widget.size || oldWidget.boxFit != widget.boxFit) {
      _avatarFuture = _futureCache.putIfAbsent(_cacheKey, () => _loadAvatar(widget.url));
    }
  }

  Future<Widget> _loadAvatar(String url) async {
    // 2️⃣ Fetch via cacheManager; it returns a File from disk or network
    final file = await jiraAvatarCacheManager.getSingleFile(
      url,
      headers: {
        'Authorization': JiraAuth().authHeader,
        'Accept': '*/*',
      },
    );

    final bytes = await file.readAsBytes();

    // 3️⃣ Detect mime—either from extension or from magic‐bytes
    final mimeType = lookupMimeType(file.path, headerBytes: bytes) ?? '';
    if (mimeType.contains('text/html')) {
      // still scrape HTML if Jira wrapped the <img> in a page
      final document = html_parser.parse(String.fromCharCodes(bytes));
      final img = document.querySelector('img');
      final src = img?.attributes['src'];
      if (src != null && src.isNotEmpty) {
        return _loadAvatar(src);
      }
      throw Exception('No <img> found in HTML');
    } else if (mimeType.contains('svg')) {
      return svgFromBytes(bytes, size: widget.size);
    } else if (mimeType.startsWith('image/')) {
      return Image.memory(
        bytes,
        width: widget.size,
        height: widget.size,
        fit: widget.boxFit,
      );
    } else {
      throw Exception('Unsupported content type: $mimeType');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Already decoded once -> render instantly, skipping the FutureBuilder so
    // recreated elements don't flash a spinner or re-decode.
    final resolved = _resolvedCache[_cacheKey];
    if (resolved != null) return resolved;
    return FutureBuilder<Widget>(
      future: _avatarFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox.square(
            dimension: widget.size,
            child: const FractionallySizedBox(
              widthFactor: .8,
              heightFactor: .8,
              child: Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return IconButton(
            icon: const Icon(Symbols.error),
            color: Colors.red,
            tooltip: '${snapshot.error}\n${widget.url}',
            onPressed: () => Clipboard.setData(
              ClipboardData(text: widget.url),
            ),
          );
        }
        _resolvedCache[_cacheKey] = snapshot.data!;
        return snapshot.data!;
      },
    );
  }
}

class JiraImage extends StatefulWidget {
  final String url;
  final double? width;

  final BoxFit boxFit;

  const JiraImage({
    super.key,
    required this.url,
    this.width,
    this.boxFit = BoxFit.contain,
  });

  @override
  State<JiraImage> createState() => _JiraImageState();
}

class _JiraImageState extends State<JiraImage> {
  // 1️⃣ Create a custom cache manager instance

  late Future<Widget> _imgFuture;

  @override
  void initState() {
    super.initState();
    _imgFuture = _loadImg(widget.url);
  }

  Future<Widget> _loadImg(String url) async {
    // TODO FIX #json&ips (see readme)

    final uri = Uri.parse(url);
    final jiraUri = ApiClient().basePath;

    final headers = <String, String>{
      'Accept': 'image/*,*/*;q=0.8',
    };

    if (uri.host == jiraUri) {
      headers['Authorization'] = JiraAuth().authHeader;
    }
    // 2️⃣ Fetch via cacheManager; it returns a File from disk or network
    final file = await jiraAvatarCacheManager.getSingleFile(
      url,
      headers: {
        'Authorization': JiraAuth().authHeader,
        'Accept': '*/*',
      },
    );

    final bytes = await file.readAsBytes();

    // 3️⃣ Detect mime—either from extension or from magic‐bytes
    final mimeType = lookupMimeType(file.path, headerBytes: bytes) ?? '';

    if (mimeType.contains('text/html')) {
      // still scrape HTML if Jira wrapped the <img> in a page
      final document = html_parser.parse(String.fromCharCodes(bytes));
      final img = document.querySelector('img');
      final src = img?.attributes['src'];
      if (src != null && src.isNotEmpty) {
        return _loadImg(src);
      }
      throw Exception('No <img> found in HTML');
    } else if (mimeType.contains('svg')) {
      return svgFromBytes(bytes, size: widget.width ?? double.maxFinite);
    } else if (mimeType.startsWith('video/')) {
      return SizedBox(
        child: SizedBox(
          width: widget.width ?? double.maxFinite,
          child: NetworkVideoPlayer(url: url),
        ),
      );
    } else if (mimeType.startsWith('image/')) {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': JiraAuth().authHeader,
          'Accept': '*/*',
        },
      );
      print(response.statusCode);
      print(response.headers);
      print(response.bodyBytes.length);
      print(response.bodyBytes.take(32).toList());
      return Image.memory(
        bytes,
        width: widget.width ?? double.maxFinite,
        fit: widget.boxFit,
        errorBuilder: (_, error, stack) {
          print('decode error: $error');
          return Text('$error');
        },
      );
    } else {
      throw Exception('Unsupported content type: $mimeType');
    }
  }

  @override
  Widget build(BuildContext context) => FutureBuilder<Widget>(
    future: _imgFuture,
    builder: (context, snapshot) {
      if (snapshot.connectionState != ConnectionState.done) {
        return const Center(
          child: SizedBox(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      }
      if (snapshot.hasError) {
        return IconButton(
          icon: const Icon(Symbols.error),
          color: Colors.red,
          tooltip: '${snapshot.error}\n${widget.url}',
          onPressed: () => Clipboard.setData(
            ClipboardData(text: widget.url),
          ),
        );
      }
      return snapshot.data!;
    },
  );
}

/// Very small CSS-inliner for `.class{prop:value; ...}` rules in <style>.
String inlineSvgCss(String svg) {
  final doc = xml.XmlDocument.parse(svg);

  // 1) Grab all <style> text
  final styleText = doc.findAllElements('style').map((e) => e.innerText).join('\n');

  // 2) Parse rules like `.st0{fill:#FFAB00;stroke:none}`
  final classRule = RegExp(r'\.([a-zA-Z0-9_-]+)\s*\{([^}]*)\}');
  final declRule = RegExp(r'([a-zA-Z-]+)\s*:\s*([^;]+);?');

  final Map<String, Map<String, String>> css = {};

  for (final m in classRule.allMatches(styleText)) {
    final className = m.group(1)!;
    final body = m.group(2)!;
    final map = <String, String>{};
    for (final d in declRule.allMatches(body)) {
      map[d.group(1)!.trim()] = d.group(2)!.trim();
    }
    css[className] = map;
  }

  // 3) Apply class rules onto elements as attributes (or inline style)
  void applyTo(xml.XmlElement el) {
    final classAttr = el.getAttribute('class');
    if (classAttr != null && classAttr.trim().isNotEmpty) {
      final classes = classAttr.split(RegExp(r'\s+'));
      final Map<String, String> merged = {};
      for (final c in classes) {
        final rules = css[c];
        if (rules != null) merged.addAll(rules);
      }

      // Apply supported properties as SVG attributes. `flutter_svg` understands
      // these as presentation attributes.
      for (final entry in merged.entries) {
        final k = entry.key;
        final v = entry.value;
        // Map CSS -> SVG presentation attrs you care about:
        const passthrough = {'fill', 'stroke', 'stroke-width', 'stroke-linecap', 'stroke-linejoin', 'opacity', 'fill-opacity', 'stroke-opacity'};
        if (passthrough.contains(k)) {
          el.setAttribute(k, v);
        } else {
          // Fallback: stuff it into inline style, which flutter_svg also parses.
          final existing = el.getAttribute('style');
          final newStyle = (existing == null || existing.isEmpty) ? '$k:$v' : '$existing;$k:$v';
          el.setAttribute('style', newStyle);
        }
      }

      // Optional: remove the class attribute so there’s no confusion later.
      el.removeAttribute('class');
    }

    // Recurse
    for (final child in el.children.whereType<xml.XmlElement>()) {
      applyTo(child);
    }
  }

  for (final root in doc.findAllElements('*')) {
    applyTo(root);
  }

  // 4) Remove <style> and any <script> (not needed and best avoided)
  doc.findAllElements('style').toList().forEach((e) => e.parent?.children.remove(e));
  doc.findAllElements('script').toList().forEach((e) => e.parent?.children.remove(e));

  return doc.toXmlString();
}

// Usage
Widget svgFromBytes(Uint8List bytes, {required double size, BoxFit fit = BoxFit.contain}) {
  final svgStr = utf8.decode(bytes);
  final inlined = inlineSvgCss(svgStr);

  return SvgPicture.string(
    inlined,
    width: size,
    height: size,
    fit: fit,
    placeholderBuilder: (_) => SizedBox(
      width: size / 2,
      height: size / 2,
      child: const Center(
        child: FractionallySizedBox(
          widthFactor: .8,
          heightFactor: .8,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    ),
  );
}
