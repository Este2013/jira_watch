//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateFieldSchemeParametersRequest {
  /// Returns a new [UpdateFieldSchemeParametersRequest] instance.
  UpdateFieldSchemeParametersRequest({
    this.parameters,
    this.schemeIds = const [],
    this.workTypeParameters = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FieldsSchemeItemParameter? parameters;

  /// The list of field scheme IDs to update
  List<int> schemeIds;

  /// The list of work type-specific parameter overrides, may be empty if only default parameters are being updated
  List<FieldsSchemeItemWorkTypeParameter> workTypeParameters;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateFieldSchemeParametersRequest &&
    other.parameters == parameters &&
    _deepEquality.equals(other.schemeIds, schemeIds) &&
    _deepEquality.equals(other.workTypeParameters, workTypeParameters);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (parameters == null ? 0 : parameters!.hashCode) +
    (schemeIds.hashCode) +
    (workTypeParameters.hashCode);

  @override
  String toString() => 'UpdateFieldSchemeParametersRequest[parameters=$parameters, schemeIds=$schemeIds, workTypeParameters=$workTypeParameters]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.parameters != null) {
      json[r'parameters'] = this.parameters;
    } else {
      json[r'parameters'] = null;
    }
      json[r'schemeIds'] = this.schemeIds;
      json[r'workTypeParameters'] = this.workTypeParameters;
    return json;
  }

  /// Returns a new [UpdateFieldSchemeParametersRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateFieldSchemeParametersRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateFieldSchemeParametersRequest(
        parameters: FieldsSchemeItemParameter.fromJson(json[r'parameters']),
        schemeIds: json[r'schemeIds'] is Iterable
            ? (json[r'schemeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        workTypeParameters: FieldsSchemeItemWorkTypeParameter.listFromJson(json[r'workTypeParameters']),
      );
    }
    return null;
  }

  static List<UpdateFieldSchemeParametersRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateFieldSchemeParametersRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateFieldSchemeParametersRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateFieldSchemeParametersRequest> mapFromJson(dynamic json) {
    final map = <String, UpdateFieldSchemeParametersRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateFieldSchemeParametersRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateFieldSchemeParametersRequest-objects as value to a dart map
  static Map<String, List<UpdateFieldSchemeParametersRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateFieldSchemeParametersRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateFieldSchemeParametersRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

