//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ParameterRemovalDetails {
  /// Returns a new [ParameterRemovalDetails] instance.
  ParameterRemovalDetails({
    this.parameters = const [],
    this.schemeId,
    this.workTypeIds = const [],
  });

  /// Set of parameter names to remove
  List<String> parameters;

  /// ID of the field scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? schemeId;

  /// Set of work type (issue type) IDs
  List<int> workTypeIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ParameterRemovalDetails &&
    _deepEquality.equals(other.parameters, parameters) &&
    other.schemeId == schemeId &&
    _deepEquality.equals(other.workTypeIds, workTypeIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (parameters.hashCode) +
    (schemeId == null ? 0 : schemeId!.hashCode) +
    (workTypeIds.hashCode);

  @override
  String toString() => 'ParameterRemovalDetails[parameters=$parameters, schemeId=$schemeId, workTypeIds=$workTypeIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'parameters'] = this.parameters;
    if (this.schemeId != null) {
      json[r'schemeId'] = this.schemeId;
    } else {
      json[r'schemeId'] = null;
    }
      json[r'workTypeIds'] = this.workTypeIds;
    return json;
  }

  /// Returns a new [ParameterRemovalDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ParameterRemovalDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ParameterRemovalDetails(
        parameters: json[r'parameters'] is Iterable
            ? (json[r'parameters'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        schemeId: mapValueOfType<int>(json, r'schemeId'),
        workTypeIds: json[r'workTypeIds'] is Iterable
            ? (json[r'workTypeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<ParameterRemovalDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ParameterRemovalDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ParameterRemovalDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ParameterRemovalDetails> mapFromJson(dynamic json) {
    final map = <String, ParameterRemovalDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ParameterRemovalDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ParameterRemovalDetails-objects as value to a dart map
  static Map<String, List<ParameterRemovalDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ParameterRemovalDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ParameterRemovalDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

