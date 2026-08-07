//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContext {
  /// Returns a new [CustomFieldContext] instance.
  CustomFieldContext({
    required this.description,
    required this.id,
    required this.isAnyIssueType,
    required this.isGlobalContext,
    required this.name,
  });

  /// The description of the context.
  String description;

  /// The ID of the context.
  String id;

  /// Whether the context apply to all issue types.
  bool isAnyIssueType;

  /// Whether the context is global.
  bool isGlobalContext;

  /// The name of the context.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContext &&
    other.description == description &&
    other.id == id &&
    other.isAnyIssueType == isAnyIssueType &&
    other.isGlobalContext == isGlobalContext &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description.hashCode) +
    (id.hashCode) +
    (isAnyIssueType.hashCode) +
    (isGlobalContext.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'CustomFieldContext[description=$description, id=$id, isAnyIssueType=$isAnyIssueType, isGlobalContext=$isGlobalContext, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'description'] = this.description;
      json[r'id'] = this.id;
      json[r'isAnyIssueType'] = this.isAnyIssueType;
      json[r'isGlobalContext'] = this.isGlobalContext;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [CustomFieldContext] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContext? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'description'), 'Required key "CustomFieldContext[description]" is missing from JSON.');
        assert(json[r'description'] != null, 'Required key "CustomFieldContext[description]" has a null value in JSON.');
        assert(json.containsKey(r'id'), 'Required key "CustomFieldContext[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "CustomFieldContext[id]" has a null value in JSON.');
        assert(json.containsKey(r'isAnyIssueType'), 'Required key "CustomFieldContext[isAnyIssueType]" is missing from JSON.');
        assert(json[r'isAnyIssueType'] != null, 'Required key "CustomFieldContext[isAnyIssueType]" has a null value in JSON.');
        assert(json.containsKey(r'isGlobalContext'), 'Required key "CustomFieldContext[isGlobalContext]" is missing from JSON.');
        assert(json[r'isGlobalContext'] != null, 'Required key "CustomFieldContext[isGlobalContext]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "CustomFieldContext[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CustomFieldContext[name]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContext(
        description: mapValueOfType<String>(json, r'description')!,
        id: mapValueOfType<String>(json, r'id')!,
        isAnyIssueType: mapValueOfType<bool>(json, r'isAnyIssueType')!,
        isGlobalContext: mapValueOfType<bool>(json, r'isGlobalContext')!,
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<CustomFieldContext> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContext>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContext.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContext> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContext>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContext.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContext-objects as value to a dart map
  static Map<String, List<CustomFieldContext>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContext>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContext.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'description',
    'id',
    'isAnyIssueType',
    'isGlobalContext',
    'name',
  };
}

