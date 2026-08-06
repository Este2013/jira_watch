//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkChangelogRequestBean {
  /// Returns a new [BulkChangelogRequestBean] instance.
  BulkChangelogRequestBean({
    this.fieldIds = const [],
    this.issueIdsOrKeys = const [],
    this.maxResults = 1000,
    this.nextPageToken,
  });

  /// List of field IDs to filter changelogs
  List<String> fieldIds;

  /// List of issue IDs/keys to fetch changelogs for
  List<String> issueIdsOrKeys;

  /// The maximum number of items to return per page
  ///
  /// Minimum value: 1
  /// Maximum value: 10000
  int maxResults;

  /// The cursor for pagination
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkChangelogRequestBean &&
    _deepEquality.equals(other.fieldIds, fieldIds) &&
    _deepEquality.equals(other.issueIdsOrKeys, issueIdsOrKeys) &&
    other.maxResults == maxResults &&
    other.nextPageToken == nextPageToken;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldIds.hashCode) +
    (issueIdsOrKeys.hashCode) +
    (maxResults.hashCode) +
    (nextPageToken == null ? 0 : nextPageToken!.hashCode);

  @override
  String toString() => 'BulkChangelogRequestBean[fieldIds=$fieldIds, issueIdsOrKeys=$issueIdsOrKeys, maxResults=$maxResults, nextPageToken=$nextPageToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldIds'] = this.fieldIds;
      json[r'issueIdsOrKeys'] = this.issueIdsOrKeys;
      json[r'maxResults'] = this.maxResults;
    if (this.nextPageToken != null) {
      json[r'nextPageToken'] = this.nextPageToken;
    } else {
      json[r'nextPageToken'] = null;
    }
    return json;
  }

  /// Returns a new [BulkChangelogRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkChangelogRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueIdsOrKeys'), 'Required key "BulkChangelogRequestBean[issueIdsOrKeys]" is missing from JSON.');
        assert(json[r'issueIdsOrKeys'] != null, 'Required key "BulkChangelogRequestBean[issueIdsOrKeys]" has a null value in JSON.');
        return true;
      }());

      return BulkChangelogRequestBean(
        fieldIds: json[r'fieldIds'] is Iterable
            ? (json[r'fieldIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        issueIdsOrKeys: json[r'issueIdsOrKeys'] is Iterable
            ? (json[r'issueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        maxResults: mapValueOfType<int>(json, r'maxResults') ?? 1000,
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
      );
    }
    return null;
  }

  static List<BulkChangelogRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkChangelogRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkChangelogRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkChangelogRequestBean> mapFromJson(dynamic json) {
    final map = <String, BulkChangelogRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkChangelogRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkChangelogRequestBean-objects as value to a dart map
  static Map<String, List<BulkChangelogRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkChangelogRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkChangelogRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueIdsOrKeys',
  };
}

