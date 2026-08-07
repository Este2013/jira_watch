//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SaveTemplateResponse {
  /// Returns a new [SaveTemplateResponse] instance.
  SaveTemplateResponse({
    this.projectTemplateKey,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectTemplateKey? projectTemplateKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SaveTemplateResponse &&
    other.projectTemplateKey == projectTemplateKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectTemplateKey == null ? 0 : projectTemplateKey!.hashCode);

  @override
  String toString() => 'SaveTemplateResponse[projectTemplateKey=$projectTemplateKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectTemplateKey != null) {
      json[r'projectTemplateKey'] = this.projectTemplateKey;
    } else {
      json[r'projectTemplateKey'] = null;
    }
    return json;
  }

  /// Returns a new [SaveTemplateResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SaveTemplateResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SaveTemplateResponse(
        projectTemplateKey: ProjectTemplateKey.fromJson(json[r'projectTemplateKey']),
      );
    }
    return null;
  }

  static List<SaveTemplateResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SaveTemplateResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SaveTemplateResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SaveTemplateResponse> mapFromJson(dynamic json) {
    final map = <String, SaveTemplateResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SaveTemplateResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SaveTemplateResponse-objects as value to a dart map
  static Map<String, List<SaveTemplateResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SaveTemplateResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SaveTemplateResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

