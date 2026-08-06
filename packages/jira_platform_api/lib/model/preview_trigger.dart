//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PreviewTrigger {
  /// Returns a new [PreviewTrigger] instance.
  PreviewTrigger({
    this.id,
    this.ruleKey,
  });

  /// The ID of the trigger.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The key of the trigger rule.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? ruleKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PreviewTrigger &&
    other.id == id &&
    other.ruleKey == ruleKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id == null ? 0 : id!.hashCode) +
    (ruleKey == null ? 0 : ruleKey!.hashCode);

  @override
  String toString() => 'PreviewTrigger[id=$id, ruleKey=$ruleKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.ruleKey != null) {
      json[r'ruleKey'] = this.ruleKey;
    } else {
      json[r'ruleKey'] = null;
    }
    return json;
  }

  /// Returns a new [PreviewTrigger] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PreviewTrigger? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PreviewTrigger(
        id: mapValueOfType<String>(json, r'id'),
        ruleKey: mapValueOfType<String>(json, r'ruleKey'),
      );
    }
    return null;
  }

  static List<PreviewTrigger> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PreviewTrigger>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PreviewTrigger.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PreviewTrigger> mapFromJson(dynamic json) {
    final map = <String, PreviewTrigger>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PreviewTrigger.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PreviewTrigger-objects as value to a dart map
  static Map<String, List<PreviewTrigger>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PreviewTrigger>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PreviewTrigger.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

