//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkWatchOrUnwatchPayload {
  /// Returns a new [IssueBulkWatchOrUnwatchPayload] instance.
  IssueBulkWatchOrUnwatchPayload({
    this.selectedIssueIdsOrKeys = const [],
  });

  /// List of issue IDs or keys which are to be bulk watched or unwatched. These IDs or keys can be from different projects and issue types.
  List<String> selectedIssueIdsOrKeys;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkWatchOrUnwatchPayload &&
    _deepEquality.equals(other.selectedIssueIdsOrKeys, selectedIssueIdsOrKeys);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (selectedIssueIdsOrKeys.hashCode);

  @override
  String toString() => 'IssueBulkWatchOrUnwatchPayload[selectedIssueIdsOrKeys=$selectedIssueIdsOrKeys]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'selectedIssueIdsOrKeys'] = this.selectedIssueIdsOrKeys;
    return json;
  }

  /// Returns a new [IssueBulkWatchOrUnwatchPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkWatchOrUnwatchPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'selectedIssueIdsOrKeys'), 'Required key "IssueBulkWatchOrUnwatchPayload[selectedIssueIdsOrKeys]" is missing from JSON.');
        assert(json[r'selectedIssueIdsOrKeys'] != null, 'Required key "IssueBulkWatchOrUnwatchPayload[selectedIssueIdsOrKeys]" has a null value in JSON.');
        return true;
      }());

      return IssueBulkWatchOrUnwatchPayload(
        selectedIssueIdsOrKeys: json[r'selectedIssueIdsOrKeys'] is Iterable
            ? (json[r'selectedIssueIdsOrKeys'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueBulkWatchOrUnwatchPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkWatchOrUnwatchPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkWatchOrUnwatchPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkWatchOrUnwatchPayload> mapFromJson(dynamic json) {
    final map = <String, IssueBulkWatchOrUnwatchPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkWatchOrUnwatchPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkWatchOrUnwatchPayload-objects as value to a dart map
  static Map<String, List<IssueBulkWatchOrUnwatchPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkWatchOrUnwatchPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkWatchOrUnwatchPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'selectedIssueIdsOrKeys',
  };
}

