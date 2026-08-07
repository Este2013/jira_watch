//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomTemplateOptions {
  /// Returns a new [CustomTemplateOptions] instance.
  CustomTemplateOptions({
    this.enableScreenDelegatedAdminSupport,
    this.enableWorkflowDelegatedAdminSupport,
  });

  /// Enable screen delegated admin support for the template. This means screen and associated schemes will be copied rather than referenced.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enableScreenDelegatedAdminSupport;

  /// Enable workflow delegated admin support for the template. This means workflows and workflow schemes will be copied rather than referenced.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enableWorkflowDelegatedAdminSupport;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomTemplateOptions &&
    other.enableScreenDelegatedAdminSupport == enableScreenDelegatedAdminSupport &&
    other.enableWorkflowDelegatedAdminSupport == enableWorkflowDelegatedAdminSupport;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (enableScreenDelegatedAdminSupport == null ? 0 : enableScreenDelegatedAdminSupport!.hashCode) +
    (enableWorkflowDelegatedAdminSupport == null ? 0 : enableWorkflowDelegatedAdminSupport!.hashCode);

  @override
  String toString() => 'CustomTemplateOptions[enableScreenDelegatedAdminSupport=$enableScreenDelegatedAdminSupport, enableWorkflowDelegatedAdminSupport=$enableWorkflowDelegatedAdminSupport]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.enableScreenDelegatedAdminSupport != null) {
      json[r'enableScreenDelegatedAdminSupport'] = this.enableScreenDelegatedAdminSupport;
    } else {
      json[r'enableScreenDelegatedAdminSupport'] = null;
    }
    if (this.enableWorkflowDelegatedAdminSupport != null) {
      json[r'enableWorkflowDelegatedAdminSupport'] = this.enableWorkflowDelegatedAdminSupport;
    } else {
      json[r'enableWorkflowDelegatedAdminSupport'] = null;
    }
    return json;
  }

  /// Returns a new [CustomTemplateOptions] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomTemplateOptions? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomTemplateOptions(
        enableScreenDelegatedAdminSupport: mapValueOfType<bool>(json, r'enableScreenDelegatedAdminSupport'),
        enableWorkflowDelegatedAdminSupport: mapValueOfType<bool>(json, r'enableWorkflowDelegatedAdminSupport'),
      );
    }
    return null;
  }

  static List<CustomTemplateOptions> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomTemplateOptions>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomTemplateOptions.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomTemplateOptions> mapFromJson(dynamic json) {
    final map = <String, CustomTemplateOptions>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomTemplateOptions.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomTemplateOptions-objects as value to a dart map
  static Map<String, List<CustomTemplateOptions>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomTemplateOptions>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomTemplateOptions.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

