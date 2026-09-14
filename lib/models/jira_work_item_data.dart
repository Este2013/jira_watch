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

  /// Jira's own numeric-looking issue id (`fields.id`, distinct from [key])
  /// — sent by the REST API as a string despite being numeric. Read as
  /// whichever of the two actually comes through rather than assuming the
  /// documented shape, since every current caller wants a string right back
  /// anyway (e.g. as a query parameter).
  String? get databaseId => switch (this['id']) {
    String s => s,
    int i => i.toString(),
    _ => null,
  };
  String? get key => this['key'];
  Map? get changelog => this['changelog'];
  Map? get fields => this['fields'];

  Map? get parent => fields?['parent'];
  Map? get statusCategory => fields?['statusCategory'];
  Map? get priority => fields?['priority'];
  List<String>? get labels => fields?['labels'];
  Map? get commentsData => fields?['comment'];

  static final _customFieldKey = RegExp(r'^customfield_\d+$');

  /// This issue's custom field values, keyed by field id (e.g.
  /// `customfield_10056`) — limited to the ones actually set on this issue,
  /// since most custom fields are project-specific and simply absent
  /// everywhere else.
  Map<String, dynamic> get customFields {
    final f = fields;
    if (f == null) return const {};
    return {
      for (final entry in f.entries)
        if (_customFieldKey.hasMatch(entry.key as String) && entry.value != null) entry.key as String: entry.value,
    };
  }

  /// The `customfield_*` ids present in [fields] but with no value set on
  /// this issue — the complement of [customFields]. Not useful to show
  /// there (there is nothing to render), but worth surfacing in a debug
  /// view: "this field is attached to this issue but empty" is a different
  /// fact from "this field isn't part of this issue at all".
  List<String> get emptyCustomFieldKeys {
    final f = fields;
    if (f == null) return const [];
    return [
      for (final entry in f.entries)
        if (_customFieldKey.hasMatch(entry.key as String) && entry.value == null) entry.key as String,
    ];
  }
}
