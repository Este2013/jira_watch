//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlFunctionPrecomputationUpdateBean {
  /// Returns a new [JqlFunctionPrecomputationUpdateBean] instance.
  JqlFunctionPrecomputationUpdateBean({
    this.error,
    required this.id,
    this.value,
  });

  /// The error message to be displayed to the user if the given function clause is no longer valid during recalculation of the precomputation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? error;

  /// The id of the precomputation to update.
  String id;

  /// The new value of the precomputation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlFunctionPrecomputationUpdateBean &&
    other.error == error &&
    other.id == id &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (error == null ? 0 : error!.hashCode) +
    (id.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'JqlFunctionPrecomputationUpdateBean[error=$error, id=$id, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.error != null) {
      json[r'error'] = this.error;
    } else {
      json[r'error'] = null;
    }
      json[r'id'] = this.id;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [JqlFunctionPrecomputationUpdateBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlFunctionPrecomputationUpdateBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "JqlFunctionPrecomputationUpdateBean[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "JqlFunctionPrecomputationUpdateBean[id]" has a null value in JSON.');
        return true;
      }());

      return JqlFunctionPrecomputationUpdateBean(
        error: mapValueOfType<String>(json, r'error'),
        id: mapValueOfType<String>(json, r'id')!,
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<JqlFunctionPrecomputationUpdateBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlFunctionPrecomputationUpdateBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlFunctionPrecomputationUpdateBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlFunctionPrecomputationUpdateBean> mapFromJson(dynamic json) {
    final map = <String, JqlFunctionPrecomputationUpdateBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlFunctionPrecomputationUpdateBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlFunctionPrecomputationUpdateBean-objects as value to a dart map
  static Map<String, List<JqlFunctionPrecomputationUpdateBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlFunctionPrecomputationUpdateBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlFunctionPrecomputationUpdateBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
  };
}

