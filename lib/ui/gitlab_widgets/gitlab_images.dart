import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:jira_watcher/dao/gitlab_dao.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:mime/mime.dart';

/// Separate from [jiraAvatarCacheManager] on purpose: that one hardcodes Jira's
/// Basic auth header, and since flutter_cache_manager keys purely on URL, sharing
/// it would risk sending one service's credentials to the other.
final CacheManager gitlabAvatarCacheManager = CacheManager(
  Config(
    'gitlabAvatarCache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 200,
  ),
);

/// An avatar for a GitLab user, group or project.
///
/// [url] is nullable because GitLab frequently has no avatar for an entity, in
/// which case initials are shown instead.
class GitLabAvatar extends StatefulWidget {
  const GitLabAvatar({
    super.key,
    required this.url,
    this.size = 32,
    this.fallbackLabel,
    this.boxFit = BoxFit.contain,
  });

  final String? url;
  final double size;

  /// Name the initials are derived from when there is no image.
  final String? fallbackLabel;
  final BoxFit boxFit;

  static void clearMemoryCache() {
    _GitLabAvatarState._futureCache.clear();
    _GitLabAvatarState._resolvedCache.clear();
  }

  @override
  State<GitLabAvatar> createState() => _GitLabAvatarState();
}

class _GitLabAvatarState extends State<GitLabAvatar> {
  // Shared across every avatar so a given image is fetched and decoded once.
  static final Map<String, Future<Widget>> _futureCache = {};
  static final Map<String, Widget> _resolvedCache = {};

  Future<Widget>? _avatarFuture;

  /// Includes the auth generation so entries that failed under a stale token are
  /// bypassed after a reconnect, instead of staying broken for the whole session.
  String get _cacheKey => '${GitLabDao().authGeneration}|${widget.url}|${widget.size}|${widget.boxFit}';

  @override
  void initState() {
    super.initState();
    _resolve();
  }

  @override
  void didUpdateWidget(covariant GitLabAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url || oldWidget.size != widget.size || oldWidget.boxFit != widget.boxFit) {
      _resolve();
    }
  }

  void _resolve() {
    final url = widget.url;
    _avatarFuture = (url == null || url.isEmpty) ? null : _futureCache.putIfAbsent(_cacheKey, () => _loadAvatar(url));
  }

  Future<Widget> _loadAvatar(String url) async {
    final dao = GitLabDao();
    // GitLab avatar URLs often point at gravatar or object storage; the token
    // must only ever go to the configured instance.
    final isOwnHost = Uri.parse(url).host == dao.host.split(':').first;

    final file = await gitlabAvatarCacheManager.getSingleFile(
      url,
      headers: {
        if (isOwnHost && dao.isConnected) 'Authorization': dao.authHeader,
        'Accept': '*/*',
      },
    );

    final bytes = await file.readAsBytes();
    final mimeType = lookupMimeType(file.path, headerBytes: bytes) ?? '';

    if (mimeType.contains('svg')) {
      return svgFromBytes(bytes, size: widget.size);
    }
    if (mimeType.startsWith('image/')) {
      return Image.memory(bytes, width: widget.size, height: widget.size, fit: widget.boxFit);
    }
    throw Exception('Unsupported content type: $mimeType');
  }

  Widget _fallback() {
    final label = widget.fallbackLabel?.trim() ?? '';
    final initials = label.isEmpty
        ? '?'
        : label
              .split(RegExp(r'[\s/_-]+'))
              .where((w) => w.isNotEmpty)
              .take(2)
              .map((w) => w[0].toUpperCase())
              .join();

    // Deterministic hue, so the same entity keeps the same colour between runs.
    final hue = (label.hashCode.abs() % 360).toDouble();
    final background = HSLColor.fromAHSL(1, hue, .35, Theme.of(context).brightness == Brightness.dark ? .3 : .75).toColor();

    return SizedBox.square(
      dimension: widget.size,
      child: CircleAvatar(
        backgroundColor: background,
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.all(widget.size * .2),
            child: Text(initials, style: TextStyle(color: ThemeData.estimateBrightnessForColor(background) == Brightness.dark ? Colors.white : Colors.black87)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final future = _avatarFuture;
    if (future == null) return _fallback();

    final resolved = _resolvedCache[_cacheKey];
    if (resolved != null) return resolved;

    return FutureBuilder<Widget>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox.square(
            dimension: widget.size,
            child: const FractionallySizedBox(
              widthFactor: .8,
              heightFactor: .8,
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
          );
        }
        if (snapshot.hasError) return _fallback();
        _resolvedCache[_cacheKey] = snapshot.data!;
        return snapshot.data!;
      },
    );
  }
}
