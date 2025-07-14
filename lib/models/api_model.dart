import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_svg/svg.dart';
import 'package:html/parser.dart' as html_parser;
import 'package:mime/mime.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class APIModel {
  static final APIModel _instance = APIModel._internal();

  factory APIModel() => _instance;

  APIModel._internal();

  String? email;
  String? apiKey;
  String? domain;

  String get authHeader => 'Basic ${base64Encode(utf8.encode('$email:$apiKey'))}';

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    email = prefs.getString('jira_email');
    apiKey = prefs.getString('jira_api_key');
    domain = prefs.getString('jira_domain');
  }

  Future<void> update({String? email, String? apiKey, String? domain}) async {
    final prefs = await SharedPreferences.getInstance();
    if (email != null) {
      this.email = email;
      await prefs.setString('jira_email', email);
    }
    if (apiKey != null) {
      this.apiKey = apiKey;
      await prefs.setString('jira_api_key', apiKey);
    }
    if (domain != null) {
      this.domain = domain;
      await prefs.setString('jira_domain', domain);
    }
  }

  bool get isReady => email != null && email!.isNotEmpty && apiKey != null && apiKey!.isNotEmpty && domain != null && domain!.isNotEmpty;

  /// General authenticated request helper
  Future<http.Response> request(
    String path, {
    String method = 'GET',
    Map<String, String>? headers,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (!isReady) throw Exception('API credentials not set');
    final uri = Uri.https(domain!, path, queryParameters);

    final allHeaders = {
      'Authorization': authHeader,
      'Accept': 'application/json',
      if (headers != null) ...headers,
    };

    switch (method.toUpperCase()) {
      case 'POST':
        return await http.post(uri, headers: allHeaders, body: body);
      case 'PUT':
        return await http.put(uri, headers: allHeaders, body: body);
      case 'DELETE':
        return await http.delete(uri, headers: allHeaders, body: body);
      default:
        return await http.get(uri, headers: allHeaders);
    }
  }

  /// Convenience for GET requests, returns decoded JSON
  Future<dynamic> getJson(String path, {Map<String, dynamic>? queryParameters}) async {
    final response = await request(path, queryParameters: queryParameters);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Jira API error: ${response.statusCode}');
  }

  ///////// PROJECTS /////////

  List? _projectsCache;

  /// Fetch projects from Jira API, caching results
  /// https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-projects/#api-rest-api-3-project-get
  ///
  /// Each project is a map as follows: s
  /// ```json{
  ///  "avatarUrls": {
  ///    "16x16": "https://your-domain.atlassian.net/secure/projectavatar?size=xsmall&pid=10000",
  ///    "24x24": "https://your-domain.atlassian.net/secure/projectavatar?size=small&pid=10000",
  ///    "32x32": "https://your-domain.atlassian.net/secure/projectavatar?size=medium&pid=10000",
  ///    "48x48": "https://your-domain.atlassian.net/secure/projectavatar?size=large&pid=10000"
  ///  },
  ///  "id": "10000",
  ///  "insight": {
  ///    "lastIssueUpdateTime": 1619069825000,
  ///    "totalIssueCount": 100
  ///  },
  ///  "key": "EX",
  ///  "name": "Example",
  ///  "projectCategory": {
  ///    "description": "First Project Category",
  ///    "id": "10000",
  ///    "name": "FIRST",
  ///    "self": "https://your-domain.atlassian.net/rest/api/3/projectCategory/10000"
  ///  },
  ///  "self": "https://your-domain.atlassian.net/rest/api/3/project/EX",
  ///  "simplified": false,
  ///  "style": "CLASSIC"
  /// ```
  Future<List> fetchProjects({bool refresh = false}) async {
    if (_projectsCache != null && !refresh) {
      return _projectsCache!;
    }

    final data = await getJson(
      '/rest/api/3/project/',
      // queryParameters: {
      //   'properties': ['id', 'avatarUrls', 'key', 'favourite', 'isPrivate', 'expand', 'issueTypes', 'name', 'url', 'style'],
      // },
    );
    final result = (data as List);
    print('Fetched projects: $result');
    _projectsCache = result;
    return result;
  }

  /// Fetch starred projects and store locally
  Future<List> starredProjects({bool refresh = false}) async {
    final projects = await fetchProjects(refresh: refresh);
    return projects.where((p) => p['favourite'] == true).toList();
  }

  ///////// IMAGES /////////

  Widget avatarFromJira(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3),
      child: JiraAvatar(
        key: Key(url),
        url: url,
        authHeader: authHeader,
      ),
    );
  }
}

final CacheManager jiraAvatarCacheManager = CacheManager(
  Config(
    'jiraAvatarCache',
    stalePeriod: const Duration(days: 7),
    maxNrOfCacheObjects: 200,
  ),
);

class JiraAvatar extends StatefulWidget {
  final String url;
  final String authHeader;
  final double size;

  const JiraAvatar({
    super.key,
    required this.url,
    required this.authHeader,
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
        'Authorization': widget.authHeader,
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
