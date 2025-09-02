import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:jira_watch/dao/api_dao.dart';
import 'package:jira_watch/models/data_model.dart';
import 'package:mime/mime.dart';

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
      future: _getAvatarUrl(),
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
          return Icon(Icons.folder, size: size);
        }
        return JiraAvatar(url: url, size: size);
      },
    );
  }
}

class JiraAvatar extends StatefulWidget {
  final String url;
  final double size;

  const JiraAvatar({
    super.key,
    required this.url,
    this.size = 32,
  });

  @override
  State<JiraAvatar> createState() => _JiraAvatarState();
}

class _JiraAvatarState extends State<JiraAvatar> {
  // 1️⃣ Create a custom cache manager instance

  late Future<Widget> _avatarFuture;

  @override
  void initState() {
    super.initState();
    _avatarFuture = _loadAvatar(widget.url);
  }

  Future<Widget> _loadAvatar(String url) async {
    // 2️⃣ Fetch via cacheManager; it returns a File from disk or network
    final file = await jiraAvatarCacheManager.getSingleFile(
      url,
      headers: {
        'Authorization': APIDao().authHeader,
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
      return SvgPicture.memory(
        bytes,
        width: widget.size,
        height: widget.size,
        placeholderBuilder: (_) => SizedBox(
          width: widget.size / 2,
          height: widget.size / 2,
          child: const Center(
            child: FractionallySizedBox(
              widthFactor: .8,
              heightFactor: .8,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
        ),
        fit: BoxFit.contain,
      );
    } else if (mimeType.startsWith('image/')) {
      return Image.memory(
        bytes,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.contain,
      );
    } else {
      throw Exception('Unsupported content type: $mimeType');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _avatarFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox.square(
            dimension: widget.size,
            child: const Center(
              child: FractionallySizedBox(
                widthFactor: .8,
                heightFactor: .8,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return IconButton(
            icon: const Icon(Icons.error),
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
}
