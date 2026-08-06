//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeIdsToRemove {
  /// Returns a new [IssueTypeIdsToRemove] instance.
  IssueTypeIdsToRemove({
    this.issueTypeIds = const [],
  });

  /// The list of issue type IDs. Must contain unique values not longer than 255 characters and not be empty. Maximum of 100 IDs.
  List<String> issueTypeIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeIdsToRemove &&
    _deepEquality.equals(other.issueTypeIds, issueTypeIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueTypeIds.hashCode);

  @override
  String toString() => 'IssueTypeIdsToRemove[issueTypeIds=$issueTypeIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueTypeIds'] = this.issueTypeIds;
    return json;
  }

  /// Returns a new [IssueTypeIdsToRemove] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeIdsToRemove? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueTypeIds'), 'Required key "IssueTypeIdsToRemove[issueTypeIds]" is missing from JSON.');
        assert(json[r'issueTypeIds'] != null, 'Required key "IssueTypeIdsToRemove[issueTypeIds]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeIdsToRemove(
        issueTypeIds: json[r'issueTypeIds'] is Iterable
            ? (json[r'issueTypeIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueTypeIdsToRemove> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeIdsToRemove>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeIdsToRemove.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeIdsToRemove> mapFromJson(dynamic json) {
    final map = <String, IssueTypeIdsToRemove>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeIdsToRemove.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeIdsToRemove-objects as value to a dart map
  static Map<String, List<IssueTypeIdsToRemove>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeIdsToRemove>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeIdsToRemove.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueTypeIds',
  };
}

