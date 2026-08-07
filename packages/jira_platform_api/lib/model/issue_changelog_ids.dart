//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueChangelogIds {
  /// Returns a new [IssueChangelogIds] instance.
  IssueChangelogIds({
    this.changelogIds = const [],
  });

  /// The list of changelog IDs.
  List<int> changelogIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueChangelogIds &&
    _deepEquality.equals(other.changelogIds, changelogIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (changelogIds.hashCode);

  @override
  String toString() => 'IssueChangelogIds[changelogIds=$changelogIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'changelogIds'] = this.changelogIds;
    return json;
  }

  /// Returns a new [IssueChangelogIds] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueChangelogIds? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'changelogIds'), 'Required key "IssueChangelogIds[changelogIds]" is missing from JSON.');
        assert(json[r'changelogIds'] != null, 'Required key "IssueChangelogIds[changelogIds]" has a null value in JSON.');
        return true;
      }());

      return IssueChangelogIds(
        changelogIds: json[r'changelogIds'] is Iterable
            ? (json[r'changelogIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueChangelogIds> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueChangelogIds>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueChangelogIds.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueChangelogIds> mapFromJson(dynamic json) {
    final map = <String, IssueChangelogIds>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueChangelogIds.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueChangelogIds-objects as value to a dart map
  static Map<String, List<IssueChangelogIds>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueChangelogIds>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueChangelogIds.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'changelogIds',
  };
}

