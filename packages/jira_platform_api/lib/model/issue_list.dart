//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueList {
  /// Returns a new [IssueList] instance.
  IssueList({
    this.issueIds = const [],
  });

  /// The list of issue IDs.
  List<String> issueIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueList &&
    _deepEquality.equals(other.issueIds, issueIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueIds.hashCode);

  @override
  String toString() => 'IssueList[issueIds=$issueIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueIds'] = this.issueIds;
    return json;
  }

  /// Returns a new [IssueList] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueList? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'issueIds'), 'Required key "IssueList[issueIds]" is missing from JSON.');
        assert(json[r'issueIds'] != null, 'Required key "IssueList[issueIds]" has a null value in JSON.');
        return true;
      }());

      return IssueList(
        issueIds: json[r'issueIds'] is Iterable
            ? (json[r'issueIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueList> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueList>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueList.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueList> mapFromJson(dynamic json) {
    final map = <String, IssueList>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueList.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueList-objects as value to a dart map
  static Map<String, List<IssueList>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueList>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueList.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'issueIds',
  };
}

