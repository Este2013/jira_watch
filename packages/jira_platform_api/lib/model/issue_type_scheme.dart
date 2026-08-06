//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeScheme {
  /// Returns a new [IssueTypeScheme] instance.
  IssueTypeScheme({
    this.defaultIssueTypeId,
    this.description,
    required this.id,
    this.isDefault,
    required this.name,
  });

  /// The ID of the default issue type of the issue type scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultIssueTypeId;

  /// The description of the issue type scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the issue type scheme.
  String id;

  /// Whether the issue type scheme is the default.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDefault;

  /// The name of the issue type scheme.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeScheme &&
    other.defaultIssueTypeId == defaultIssueTypeId &&
    other.description == description &&
    other.id == id &&
    other.isDefault == isDefault &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (defaultIssueTypeId == null ? 0 : defaultIssueTypeId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (isDefault == null ? 0 : isDefault!.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'IssueTypeScheme[defaultIssueTypeId=$defaultIssueTypeId, description=$description, id=$id, isDefault=$isDefault, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.defaultIssueTypeId != null) {
      json[r'defaultIssueTypeId'] = this.defaultIssueTypeId;
    } else {
      json[r'defaultIssueTypeId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
    if (this.isDefault != null) {
      json[r'isDefault'] = this.isDefault;
    } else {
      json[r'isDefault'] = null;
    }
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [IssueTypeScheme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeScheme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "IssueTypeScheme[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "IssueTypeScheme[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "IssueTypeScheme[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "IssueTypeScheme[name]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeScheme(
        defaultIssueTypeId: mapValueOfType<String>(json, r'defaultIssueTypeId'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        isDefault: mapValueOfType<bool>(json, r'isDefault'),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<IssueTypeScheme> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeScheme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeScheme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeScheme> mapFromJson(dynamic json) {
    final map = <String, IssueTypeScheme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeScheme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeScheme-objects as value to a dart map
  static Map<String, List<IssueTypeScheme>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeScheme>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeScheme.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
  };
}

