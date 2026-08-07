//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextProjectMapping {
  /// Returns a new [CustomFieldContextProjectMapping] instance.
  CustomFieldContextProjectMapping({
    required this.contextId,
    this.isGlobalContext,
    this.projectId,
  });

  /// The ID of the context.
  String contextId;

  /// Whether context is global.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isGlobalContext;

  /// The ID of the project.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextProjectMapping &&
    other.contextId == contextId &&
    other.isGlobalContext == isGlobalContext &&
    other.projectId == projectId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (isGlobalContext == null ? 0 : isGlobalContext!.hashCode) +
    (projectId == null ? 0 : projectId!.hashCode);

  @override
  String toString() => 'CustomFieldContextProjectMapping[contextId=$contextId, isGlobalContext=$isGlobalContext, projectId=$projectId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
    if (this.isGlobalContext != null) {
      json[r'isGlobalContext'] = this.isGlobalContext;
    } else {
      json[r'isGlobalContext'] = null;
    }
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldContextProjectMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextProjectMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextProjectMapping[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextProjectMapping[contextId]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextProjectMapping(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        isGlobalContext: mapValueOfType<bool>(json, r'isGlobalContext'),
        projectId: mapValueOfType<String>(json, r'projectId'),
      );
    }
    return null;
  }

  static List<CustomFieldContextProjectMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextProjectMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextProjectMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextProjectMapping> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextProjectMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextProjectMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextProjectMapping-objects as value to a dart map
  static Map<String, List<CustomFieldContextProjectMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextProjectMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextProjectMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
  };
}

