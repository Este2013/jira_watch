//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkTypeParameters {
  /// Returns a new [WorkTypeParameters] instance.
  WorkTypeParameters({
    this.description,
    required this.isRequired,
    this.rendererType,
    required this.workTypeId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  bool isRequired;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rendererType;

  int workTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkTypeParameters &&
    other.description == description &&
    other.isRequired == isRequired &&
    other.rendererType == rendererType &&
    other.workTypeId == workTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (isRequired.hashCode) +
    (rendererType == null ? 0 : rendererType!.hashCode) +
    (workTypeId.hashCode);

  @override
  String toString() => 'WorkTypeParameters[description=$description, isRequired=$isRequired, rendererType=$rendererType, workTypeId=$workTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'isRequired'] = this.isRequired;
    if (this.rendererType != null) {
      json[r'rendererType'] = this.rendererType;
    } else {
      json[r'rendererType'] = null;
    }
      json[r'workTypeId'] = this.workTypeId;
    return json;
  }

  /// Returns a new [WorkTypeParameters] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkTypeParameters? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'isRequired'), 'Required key "WorkTypeParameters[isRequired]" is missing from JSON.');
        assert(json[r'isRequired'] != null, 'Required key "WorkTypeParameters[isRequired]" has a null value in JSON.');
        assert(json.containsKey(r'workTypeId'), 'Required key "WorkTypeParameters[workTypeId]" is missing from JSON.');
        assert(json[r'workTypeId'] != null, 'Required key "WorkTypeParameters[workTypeId]" has a null value in JSON.');
        return true;
      }());

      return WorkTypeParameters(
        description: mapValueOfType<String>(json, r'description'),
        isRequired: mapValueOfType<bool>(json, r'isRequired')!,
        rendererType: mapValueOfType<String>(json, r'rendererType'),
        workTypeId: mapValueOfType<int>(json, r'workTypeId')!,
      );
    }
    return null;
  }

  static List<WorkTypeParameters> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkTypeParameters>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkTypeParameters.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkTypeParameters> mapFromJson(dynamic json) {
    final map = <String, WorkTypeParameters>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkTypeParameters.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkTypeParameters-objects as value to a dart map
  static Map<String, List<WorkTypeParameters>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkTypeParameters>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkTypeParameters.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'isRequired',
    'workTypeId',
  };
}

