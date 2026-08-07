//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class EditTemplateRequest {
  /// Returns a new [EditTemplateRequest] instance.
  EditTemplateRequest({
    this.templateDescription,
    this.templateGenerationOptions,
    this.templateKey,
    this.templateName,
  });

  /// The description of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? templateDescription;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomTemplateOptions? templateGenerationOptions;

  /// The unique identifier of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? templateKey;

  /// The name of the template
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? templateName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is EditTemplateRequest &&
    other.templateDescription == templateDescription &&
    other.templateGenerationOptions == templateGenerationOptions &&
    other.templateKey == templateKey &&
    other.templateName == templateName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (templateDescription == null ? 0 : templateDescription!.hashCode) +
    (templateGenerationOptions == null ? 0 : templateGenerationOptions!.hashCode) +
    (templateKey == null ? 0 : templateKey!.hashCode) +
    (templateName == null ? 0 : templateName!.hashCode);

  @override
  String toString() => 'EditTemplateRequest[templateDescription=$templateDescription, templateGenerationOptions=$templateGenerationOptions, templateKey=$templateKey, templateName=$templateName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.templateDescription != null) {
      json[r'templateDescription'] = this.templateDescription;
    } else {
      json[r'templateDescription'] = null;
    }
    if (this.templateGenerationOptions != null) {
      json[r'templateGenerationOptions'] = this.templateGenerationOptions;
    } else {
      json[r'templateGenerationOptions'] = null;
    }
    if (this.templateKey != null) {
      json[r'templateKey'] = this.templateKey;
    } else {
      json[r'templateKey'] = null;
    }
    if (this.templateName != null) {
      json[r'templateName'] = this.templateName;
    } else {
      json[r'templateName'] = null;
    }
    return json;
  }

  /// Returns a new [EditTemplateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static EditTemplateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return EditTemplateRequest(
        templateDescription: mapValueOfType<String>(json, r'templateDescription'),
        templateGenerationOptions: CustomTemplateOptions.fromJson(json[r'templateGenerationOptions']),
        templateKey: mapValueOfType<String>(json, r'templateKey'),
        templateName: mapValueOfType<String>(json, r'templateName'),
      );
    }
    return null;
  }

  static List<EditTemplateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <EditTemplateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = EditTemplateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, EditTemplateRequest> mapFromJson(dynamic json) {
    final map = <String, EditTemplateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = EditTemplateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of EditTemplateRequest-objects as value to a dart map
  static Map<String, List<EditTemplateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<EditTemplateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = EditTemplateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

