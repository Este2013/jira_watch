//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NestedResponse {
  /// Returns a new [NestedResponse] instance.
  NestedResponse({
    this.errorCollection,
    this.status,
    this.warningCollection,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ErrorCollection? errorCollection;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? status;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WarningCollection? warningCollection;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NestedResponse &&
    other.errorCollection == errorCollection &&
    other.status == status &&
    other.warningCollection == warningCollection;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errorCollection == null ? 0 : errorCollection!.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (warningCollection == null ? 0 : warningCollection!.hashCode);

  @override
  String toString() => 'NestedResponse[errorCollection=$errorCollection, status=$status, warningCollection=$warningCollection]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.errorCollection != null) {
      json[r'errorCollection'] = this.errorCollection;
    } else {
      json[r'errorCollection'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.warningCollection != null) {
      json[r'warningCollection'] = this.warningCollection;
    } else {
      json[r'warningCollection'] = null;
    }
    return json;
  }

  /// Returns a new [NestedResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NestedResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NestedResponse(
        errorCollection: ErrorCollection.fromJson(json[r'errorCollection']),
        status: mapValueOfType<int>(json, r'status'),
        warningCollection: WarningCollection.fromJson(json[r'warningCollection']),
      );
    }
    return null;
  }

  static List<NestedResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NestedResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NestedResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NestedResponse> mapFromJson(dynamic json) {
    final map = <String, NestedResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NestedResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NestedResponse-objects as value to a dart map
  static Map<String, List<NestedResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NestedResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NestedResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

