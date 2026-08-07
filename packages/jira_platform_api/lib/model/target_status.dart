//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class TargetStatus {
  /// Returns a new [TargetStatus] instance.
  TargetStatus({
    this.statuses = const {},
  });

  /// An object with the key as the ID of the target status and value with the list of the IDs of the current source statuses.
  Map<String, List<String>> statuses;

  @override
  bool operator ==(Object other) => identical(this, other) || other is TargetStatus &&
    _deepEquality.equals(other.statuses, statuses);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (statuses.hashCode);

  @override
  String toString() => 'TargetStatus[statuses=$statuses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'statuses'] = this.statuses;
    return json;
  }

  /// Returns a new [TargetStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static TargetStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'statuses'), 'Required key "TargetStatus[statuses]" is missing from JSON.');
        assert(json[r'statuses'] != null, 'Required key "TargetStatus[statuses]" has a null value in JSON.');
        return true;
      }());

      return TargetStatus(
        statuses: json[r'statuses'] == null
          ? const {}
            : (json[r'statuses'] as Map<String, dynamic>).map((k, v) => MapEntry(k, v == null ? const <String>[] : (v as List).map((value) => value as String).toList(growable: false))),
      );
    }
    return null;
  }

  static List<TargetStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <TargetStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = TargetStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, TargetStatus> mapFromJson(dynamic json) {
    final map = <String, TargetStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = TargetStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of TargetStatus-objects as value to a dart map
  static Map<String, List<TargetStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<TargetStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = TargetStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'statuses',
  };
}

