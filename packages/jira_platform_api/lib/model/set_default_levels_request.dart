//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SetDefaultLevelsRequest {
  /// Returns a new [SetDefaultLevelsRequest] instance.
  SetDefaultLevelsRequest({
    this.defaultValues = const [],
  });

  /// List of objects with issue security scheme ID and new default level ID.
  List<DefaultLevelValue> defaultValues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SetDefaultLevelsRequest &&
    _deepEquality.equals(other.defaultValues, defaultValues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultValues.hashCode);

  @override
  String toString() => 'SetDefaultLevelsRequest[defaultValues=$defaultValues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'defaultValues'] = this.defaultValues;
    return json;
  }

  /// Returns a new [SetDefaultLevelsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SetDefaultLevelsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'defaultValues'), 'Required key "SetDefaultLevelsRequest[defaultValues]" is missing from JSON.');
        assert(json[r'defaultValues'] != null, 'Required key "SetDefaultLevelsRequest[defaultValues]" has a null value in JSON.');
        return true;
      }());

      return SetDefaultLevelsRequest(
        defaultValues: DefaultLevelValue.listFromJson(json[r'defaultValues']),
      );
    }
    return null;
  }

  static List<SetDefaultLevelsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SetDefaultLevelsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SetDefaultLevelsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SetDefaultLevelsRequest> mapFromJson(dynamic json) {
    final map = <String, SetDefaultLevelsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SetDefaultLevelsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SetDefaultLevelsRequest-objects as value to a dart map
  static Map<String, List<SetDefaultLevelsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SetDefaultLevelsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SetDefaultLevelsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'defaultValues',
  };
}

