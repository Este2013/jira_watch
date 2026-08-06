//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldCapabilityPayload {
  /// Returns a new [FieldCapabilityPayload] instance.
  FieldCapabilityPayload({
    this.customFieldDefinitions = const [],
    this.fieldLayoutScheme,
    this.fieldLayouts = const [],
    this.fieldScheme,
    this.issueLayouts = const [],
    this.issueTypeScreenScheme,
    this.screenScheme = const [],
    this.screens = const [],
  });

  /// The custom field definitions. See https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-fields/\\#api-rest-api-3-field-post
  List<CustomFieldPayload>? customFieldDefinitions;

  FieldLayoutSchemePayload? fieldLayoutScheme;

  /// The field layouts configuration.
  List<FieldLayoutPayload>? fieldLayouts;

  FieldSchemePayload? fieldScheme;

  /// The issue layouts configuration
  List<IssueLayoutPayload>? issueLayouts;

  IssueTypeScreenSchemePayload? issueTypeScreenScheme;

  /// The screen schemes See https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-screen-schemes/\\#api-rest-api-3-screenscheme-post
  List<ScreenSchemePayload>? screenScheme;

  /// The screens. See https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-screens/\\#api-rest-api-3-screens-post
  List<ScreenPayload>? screens;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldCapabilityPayload &&
    _deepEquality.equals(other.customFieldDefinitions, customFieldDefinitions) &&
    other.fieldLayoutScheme == fieldLayoutScheme &&
    _deepEquality.equals(other.fieldLayouts, fieldLayouts) &&
    other.fieldScheme == fieldScheme &&
    _deepEquality.equals(other.issueLayouts, issueLayouts) &&
    other.issueTypeScreenScheme == issueTypeScreenScheme &&
    _deepEquality.equals(other.screenScheme, screenScheme) &&
    _deepEquality.equals(other.screens, screens);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customFieldDefinitions == null ? 0 : customFieldDefinitions!.hashCode) +
    (fieldLayoutScheme == null ? 0 : fieldLayoutScheme!.hashCode) +
    (fieldLayouts == null ? 0 : fieldLayouts!.hashCode) +
    (fieldScheme == null ? 0 : fieldScheme!.hashCode) +
    (issueLayouts == null ? 0 : issueLayouts!.hashCode) +
    (issueTypeScreenScheme == null ? 0 : issueTypeScreenScheme!.hashCode) +
    (screenScheme == null ? 0 : screenScheme!.hashCode) +
    (screens == null ? 0 : screens!.hashCode);

  @override
  String toString() => 'FieldCapabilityPayload[customFieldDefinitions=$customFieldDefinitions, fieldLayoutScheme=$fieldLayoutScheme, fieldLayouts=$fieldLayouts, fieldScheme=$fieldScheme, issueLayouts=$issueLayouts, issueTypeScreenScheme=$issueTypeScreenScheme, screenScheme=$screenScheme, screens=$screens]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.customFieldDefinitions != null) {
      json[r'customFieldDefinitions'] = this.customFieldDefinitions;
    } else {
      json[r'customFieldDefinitions'] = null;
    }
    if (this.fieldLayoutScheme != null) {
      json[r'fieldLayoutScheme'] = this.fieldLayoutScheme;
    } else {
      json[r'fieldLayoutScheme'] = null;
    }
    if (this.fieldLayouts != null) {
      json[r'fieldLayouts'] = this.fieldLayouts;
    } else {
      json[r'fieldLayouts'] = null;
    }
    if (this.fieldScheme != null) {
      json[r'fieldScheme'] = this.fieldScheme;
    } else {
      json[r'fieldScheme'] = null;
    }
    if (this.issueLayouts != null) {
      json[r'issueLayouts'] = this.issueLayouts;
    } else {
      json[r'issueLayouts'] = null;
    }
    if (this.issueTypeScreenScheme != null) {
      json[r'issueTypeScreenScheme'] = this.issueTypeScreenScheme;
    } else {
      json[r'issueTypeScreenScheme'] = null;
    }
    if (this.screenScheme != null) {
      json[r'screenScheme'] = this.screenScheme;
    } else {
      json[r'screenScheme'] = null;
    }
    if (this.screens != null) {
      json[r'screens'] = this.screens;
    } else {
      json[r'screens'] = null;
    }
    return json;
  }

  /// Returns a new [FieldCapabilityPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldCapabilityPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldCapabilityPayload(
        customFieldDefinitions: CustomFieldPayload.listFromJson(json[r'customFieldDefinitions']),
        fieldLayoutScheme: FieldLayoutSchemePayload.fromJson(json[r'fieldLayoutScheme']),
        fieldLayouts: FieldLayoutPayload.listFromJson(json[r'fieldLayouts']),
        fieldScheme: FieldSchemePayload.fromJson(json[r'fieldScheme']),
        issueLayouts: IssueLayoutPayload.listFromJson(json[r'issueLayouts']),
        issueTypeScreenScheme: IssueTypeScreenSchemePayload.fromJson(json[r'issueTypeScreenScheme']),
        screenScheme: ScreenSchemePayload.listFromJson(json[r'screenScheme']),
        screens: ScreenPayload.listFromJson(json[r'screens']),
      );
    }
    return null;
  }

  static List<FieldCapabilityPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldCapabilityPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldCapabilityPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldCapabilityPayload> mapFromJson(dynamic json) {
    final map = <String, FieldCapabilityPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldCapabilityPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldCapabilityPayload-objects as value to a dart map
  static Map<String, List<FieldCapabilityPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldCapabilityPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldCapabilityPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

