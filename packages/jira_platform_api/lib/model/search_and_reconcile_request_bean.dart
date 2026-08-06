//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchAndReconcileRequestBean {
  /// Returns a new [SearchAndReconcileRequestBean] instance.
  SearchAndReconcileRequestBean({
    this.expand,
    this.fields = const [],
    this.fieldsByKeys,
    this.jql,
    this.maxResults = 50,
    this.nextPageToken,
    this.properties = const [],
    this.reconcileIssues = const [],
  });

  /// Use [expand](#expansion) to include additional information about issues in the response. Note that, unlike the majority of instances where `expand` is specified, `expand` is defined as a comma-delimited string of values. The expand options are:   *  `renderedFields` Returns field values rendered in HTML format.  *  `names` Returns the display name of each field.  *  `schema` Returns the schema describing a field type.  *  `transitions` Returns all possible transitions for the issue.  *  `operations` Returns all possible operations for the issue.  *  `editmeta` Returns information about how each field can be edited.  *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.  *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.  Examples: `\"names,changelog\"` Returns the display name of each field as well as a list of recent updates to an issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// A list of fields to return for each issue. Use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:   *  `*all` Returns all fields.  *  `*navigable` Returns navigable fields.  *  `id` Returns only issue IDs.  *  Any issue field, prefixed with a dash to exclude.  The default is `id`.  Examples:   *  `summary,comment` Returns the summary and comments fields only.  *  `*all,-comment` Returns all fields except comments.  Multiple `fields` parameters can be included in a request.  Note: By default, this resource returns IDs only. This differs from [GET issue](#api-rest-api-3-issue-issueIdOrKey-get) where the default is all fields.
  List<String> fields;

  /// Reference fields by their key (rather than ID). The default is `false`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? fieldsByKeys;

  /// A [JQL](https://confluence.atlassian.com/x/egORLQ) expression. For performance reasons, this parameter requires a bounded query. A bounded query is a query with a search restriction.   *  Example of an unbounded query: `order by key desc`.  *  Example of a bounded query: `assignee = currentUser() order by key`.  Additionally, `orderBy` clause can contain a maximum of 7 fields.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jql;

  /// The maximum number of items to return per page. To manage page size, API may return fewer items per page where a large number of fields are requested. The greatest number of items returned per page is achieved when requesting `id` or `key` only. It returns max 5000 issues.
  int maxResults;

  /// The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  /// A list of up to 5 issue properties to include in the results. This parameter accepts a comma-separated list.
  List<String> properties;

  /// Strong consistency issue ids to be reconciled with search results. Accepts max 50 ids. This list of ids should be consistent with each paginated request across different pages.
  List<int> reconcileIssues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchAndReconcileRequestBean &&
    other.expand == expand &&
    _deepEquality.equals(other.fields, fields) &&
    other.fieldsByKeys == fieldsByKeys &&
    other.jql == jql &&
    other.maxResults == maxResults &&
    other.nextPageToken == nextPageToken &&
    _deepEquality.equals(other.properties, properties) &&
    _deepEquality.equals(other.reconcileIssues, reconcileIssues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand == null ? 0 : expand!.hashCode) +
    (fields.hashCode) +
    (fieldsByKeys == null ? 0 : fieldsByKeys!.hashCode) +
    (jql == null ? 0 : jql!.hashCode) +
    (maxResults.hashCode) +
    (nextPageToken == null ? 0 : nextPageToken!.hashCode) +
    (properties.hashCode) +
    (reconcileIssues.hashCode);

  @override
  String toString() => 'SearchAndReconcileRequestBean[expand=$expand, fields=$fields, fieldsByKeys=$fieldsByKeys, jql=$jql, maxResults=$maxResults, nextPageToken=$nextPageToken, properties=$properties, reconcileIssues=$reconcileIssues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
      json[r'fields'] = this.fields;
    if (this.fieldsByKeys != null) {
      json[r'fieldsByKeys'] = this.fieldsByKeys;
    } else {
      json[r'fieldsByKeys'] = null;
    }
    if (this.jql != null) {
      json[r'jql'] = this.jql;
    } else {
      json[r'jql'] = null;
    }
      json[r'maxResults'] = this.maxResults;
    if (this.nextPageToken != null) {
      json[r'nextPageToken'] = this.nextPageToken;
    } else {
      json[r'nextPageToken'] = null;
    }
      json[r'properties'] = this.properties;
      json[r'reconcileIssues'] = this.reconcileIssues;
    return json;
  }

  /// Returns a new [SearchAndReconcileRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchAndReconcileRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SearchAndReconcileRequestBean(
        expand: mapValueOfType<String>(json, r'expand'),
        fields: json[r'fields'] is Iterable
            ? (json[r'fields'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        fieldsByKeys: mapValueOfType<bool>(json, r'fieldsByKeys'),
        jql: mapValueOfType<String>(json, r'jql'),
        maxResults: mapValueOfType<int>(json, r'maxResults') ?? 50,
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
        properties: json[r'properties'] is Iterable
            ? (json[r'properties'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        reconcileIssues: json[r'reconcileIssues'] is Iterable
            ? (json[r'reconcileIssues'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<SearchAndReconcileRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchAndReconcileRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchAndReconcileRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchAndReconcileRequestBean> mapFromJson(dynamic json) {
    final map = <String, SearchAndReconcileRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchAndReconcileRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchAndReconcileRequestBean-objects as value to a dart map
  static Map<String, List<SearchAndReconcileRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchAndReconcileRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SearchAndReconcileRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

