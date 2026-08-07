//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkFetchIssueRequestBean {
  /// Returns a new [BulkFetchIssueRequestBean] instance.
  BulkFetchIssueRequestBean({
    this.expand = const [],
    this.fields = const [],
    this.fieldsByKeys,
    this.issueIdsOrKeys = const [],
    this.properties = const [],
  });

  /// Use [expand](#expansion) to include additional information about issues in the response. Note that, unlike the majority of instances where `expand` is specified, `expand` is defined as a list of values. The expand options are:   *  `renderedFields` Returns field values rendered in HTML format.  *  `names` Returns the display name of each field.  *  `schema` Returns the schema describing a field type.  *  `transitions` Returns all possible transitions for the issue.  *  `operations` Returns all possible operations for the issue.  *  `editmeta` Returns information about how each field can be edited.  *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent. This returns a maximum of 40 changelogs. If you require more, please refer to [Bulk fetch changelogs](#api-rest-api-3-changelog-bulkfetch-post).  *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.
  List<String> expand;

  /// A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:   *  `*all` Returns all fields.  *  `*navigable` Returns navigable fields.  *  Any issue field, prefixed with a minus to exclude.  The default is `*navigable`.  Examples:   *  `summary,comment` Returns the summary and comments fields only.  *  `-description` Returns all navigable (default) fields except description.  *  `*all,-comment` Returns all fields except comments.  Multiple `fields` parameters can be included in a request.  Note: All navigable fields are returned by default. This differs from [GET issue](#api-rest-api-3-issue-issueIdOrKey-get) where the default is all fields.
  List<String> fields;

  /// Reference fields by their key (rather than ID). The default is `false`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? fieldsByKeys;

  /// An array of issue IDs or issue keys to fetch. You can mix issue IDs and keys in the same query.
  List<String> issueIdsOrKeys;

  /// A list of issue property keys of issue properties to be included in the results. A maximum of 5 issue property keys can be specified.
  List<String> properties;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkFetchIssueRequestBean &&
    _deepEquality.equals(other.expand, expand) &&
    _deepEquality.equals(other.fields, fields) &&
    other.fieldsByKeys == fieldsByKeys &&
    _deepEquality.equals(other.issueIdsOrKeys, issueIdsOrKeys) &&
    _deepEquality.equals(other.properties, properties);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand.hashCode) +
    (fields.hashCode) +
    (fieldsByKeys == null ? 0 : fieldsByKeys!.hashCode) +
    (issueIdsOrKeys.hashCode) +
    (properties.hashCode);

  @override
  String toString() => 'BulkFetchIssueRequestBean[expand=$expand, fields=$fields, fieldsByKeys=$fieldsByKeys, issueIdsOrKeys=$issueIdsOrKeys, properties=$properties]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'expand'] = this.expand;
      json[r'fields'] = this.fields;
    if (this.fieldsByKeys != null) {
      json[r'fieldsByKeys'] = this.fieldsByKeys;
    } else {
      json[r'fieldsByKeys'] = null;
    }
      json[r'issueIdsOrKeys'] = this.issueIdsOrKeys;
      json[r'properties'] = this.properties;
    return json;
  }

  /// Returns a new [BulkFetchIssueRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkFetchIssueRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueIdsOrKeys'), 'Required key "BulkFetchIssueRequestBean[issueIdsOrKeys]" is missing from JSON.');
        assert(json[r'issueIdsOrKeys'] != null, 'Required key "BulkFetchIssueRequestBean[issueIdsOrKeys]" has a null value in JSON.');
        return true;
      }());

      return BulkFetchIssueRequestBean(
        expand: json[r'expand'] is Iterable
            ? (json[r'expand'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        fields: json[r'fields'] is Iterable
            ? (json[r'fields'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        fieldsByKeys: mapValueOfType<bool>(json, r'fieldsByKeys'),
        issueIdsOrKeys: json[r'issueIdsOrKeys'] is Iterable
            ? (json[r'issueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        properties: json[r'properties'] is Iterable
            ? (json[r'properties'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<BulkFetchIssueRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkFetchIssueRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkFetchIssueRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkFetchIssueRequestBean> mapFromJson(dynamic json) {
    final map = <String, BulkFetchIssueRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkFetchIssueRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkFetchIssueRequestBean-objects as value to a dart map
  static Map<String, List<BulkFetchIssueRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkFetchIssueRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkFetchIssueRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueIdsOrKeys',
  };
}

