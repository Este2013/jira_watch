//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueContextVariable {
  /// Returns a new [IssueContextVariable] instance.
  IssueContextVariable({
    this.id,
    this.key,
    required this.type,
  });

  /// The issue ID.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The issue key.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  /// Type of custom context variable.
  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueContextVariable &&
    other.id == id &&
    other.key == key &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'IssueContextVariable[id=$id, key=$key, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [IssueContextVariable] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueContextVariable? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "IssueContextVariable[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "IssueContextVariable[type]" has a null value in JSON.');
        return true;
      }());

      return IssueContextVariable(
        id: mapValueOfType<int>(json, r'id'),
        key: mapValueOfType<String>(json, r'key'),
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<IssueContextVariable> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueContextVariable>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueContextVariable.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueContextVariable> mapFromJson(dynamic json) {
    final map = <String, IssueContextVariable>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueContextVariable.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueContextVariable-objects as value to a dart map
  static Map<String, List<IssueContextVariable>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueContextVariable>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueContextVariable.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

