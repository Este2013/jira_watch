//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldAssociationSchemeFieldSearchResult {
  /// Returns a new [FieldAssociationSchemeFieldSearchResult] instance.
  FieldAssociationSchemeFieldSearchResult({
    this.allowedOperations = const [],
    this.fieldId,
    this.parameters,
    this.restrictedToWorkTypes = const [],
    this.workTypeParameters = const [],
  });

  List<String> allowedOperations;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  SearchResultFieldParameters? parameters;

  List<String> restrictedToWorkTypes;

  List<SearchResultWorkTypeParameters> workTypeParameters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldAssociationSchemeFieldSearchResult &&
    _deepEquality.equals(other.allowedOperations, allowedOperations) &&
    other.fieldId == fieldId &&
    other.parameters == parameters &&
    _deepEquality.equals(other.restrictedToWorkTypes, restrictedToWorkTypes) &&
    _deepEquality.equals(other.workTypeParameters, workTypeParameters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (allowedOperations.hashCode) +
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (parameters == null ? 0 : parameters!.hashCode) +
    (restrictedToWorkTypes.hashCode) +
    (workTypeParameters.hashCode);

  @override
  String toString() => 'FieldAssociationSchemeFieldSearchResult[allowedOperations=$allowedOperations, fieldId=$fieldId, parameters=$parameters, restrictedToWorkTypes=$restrictedToWorkTypes, workTypeParameters=$workTypeParameters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'allowedOperations'] = this.allowedOperations;
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
      json[r'restrictedToWorkTypes'] = this.restrictedToWorkTypes;
      json[r'workTypeParameters'] = this.workTypeParameters;
    return json;
  }

  /// Returns a new [FieldAssociationSchemeFieldSearchResult] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldAssociationSchemeFieldSearchResult? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldAssociationSchemeFieldSearchResult(
        allowedOperations: json[r'allowedOperations'] is Iterable
            ? (json[r'allowedOperations'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        fieldId: mapValueOfType<String>(json, r'fieldId'),
        parameters: SearchResultFieldParameters.fromJson(json[r'parameters']),
        restrictedToWorkTypes: json[r'restrictedToWorkTypes'] is Iterable
            ? (json[r'restrictedToWorkTypes'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        workTypeParameters: SearchResultWorkTypeParameters.listFromJson(json[r'workTypeParameters']),
      );
    }
    return null;
  }

  static List<FieldAssociationSchemeFieldSearchResult> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldAssociationSchemeFieldSearchResult>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldAssociationSchemeFieldSearchResult.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldAssociationSchemeFieldSearchResult> mapFromJson(dynamic json) {
    final map = <String, FieldAssociationSchemeFieldSearchResult>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldAssociationSchemeFieldSearchResult.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldAssociationSchemeFieldSearchResult-objects as value to a dart map
  static Map<String, List<FieldAssociationSchemeFieldSearchResult>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldAssociationSchemeFieldSearchResult>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldAssociationSchemeFieldSearchResult.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

