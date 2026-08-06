/// A work item as Jira returned it, kept as raw JSON.
///
/// Deliberately untyped. `AdfRenderer` and the update views read these maps
/// directly, and Atlassian Document Format is not described by the OpenAPI spec
/// at all — `Comment.body` carries a prose description and no type — so the
/// generated client hands back `Object?` for those fields regardless. Typing this
/// would mean rewriting the renderer for nothing.
library;

class JiraWorkItemData {
  dynamic data;
  DateTime? lastCacheUpdate;

  /// A distinct way to know which method added this to the cache / null if read from cache or irrelevant.
  String? providerToCache;

  JiraWorkItemData(this.data, {this.lastCacheUpdate});
  factory JiraWorkItemData.fromJson(Map data) => JiraWorkItemData(
    data['data'],
    lastCacheUpdate: data['last_updated'] == null ? null : DateTime.parse(data['last_updated']),
    // providerToCache left null
  );

  Map toJson() => {
    'data': data,
    'last_updated': lastCacheUpdate?.toIso8601String(),
    'provider_to_cache': providerToCache,
  };

  dynamic operator [](dynamic key) => data[key];

  int? get databaseId => this['id'];
  String? get key => this['key'];
  Map? get changelog => this['changelog'];
  Map? get fields => this['fields'];

  Map? get parent => fields?['parent'];
  Map? get statusCategory => fields?['statusCategory'];
  Map? get priority => fields?['priority'];
  List<String>? get labels => fields?['labels'];
  Map? get commentsData => fields?['comment'];
}
