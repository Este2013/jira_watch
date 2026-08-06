//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateIssueSecuritySchemeDetails {
  /// Returns a new [CreateIssueSecuritySchemeDetails] instance.
  CreateIssueSecuritySchemeDetails({
    this.description,
    this.levels = const [],
    required this.name,
  });

  /// The description of the issue security scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The list of scheme levels which should be added to the security scheme.
  List<SecuritySchemeLevelBean> levels;

  /// The name of the issue security scheme. Must be unique (case-insensitive).
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateIssueSecuritySchemeDetails &&
    other.description == description &&
    _deepEquality.equals(other.levels, levels) &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (levels.hashCode) +
    (name.hashCode);

  @override
  String toString() => 'CreateIssueSecuritySchemeDetails[description=$description, levels=$levels, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'levels'] = this.levels;
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [CreateIssueSecuritySchemeDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateIssueSecuritySchemeDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CreateIssueSecuritySchemeDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreateIssueSecuritySchemeDetails[name]" has a null value in JSON.');
        return true;
      }());

      return CreateIssueSecuritySchemeDetails(
        description: mapValueOfType<String>(json, r'description'),
        levels: SecuritySchemeLevelBean.listFromJson(json[r'levels']),
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<CreateIssueSecuritySchemeDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateIssueSecuritySchemeDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateIssueSecuritySchemeDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateIssueSecuritySchemeDetails> mapFromJson(dynamic json) {
    final map = <String, CreateIssueSecuritySchemeDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateIssueSecuritySchemeDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateIssueSecuritySchemeDetails-objects as value to a dart map
  static Map<String, List<CreateIssueSecuritySchemeDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateIssueSecuritySchemeDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateIssueSecuritySchemeDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

