//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JQLReferenceData {
  /// Returns a new [JQLReferenceData] instance.
  JQLReferenceData({
    this.jqlReservedWords = const [],
    this.visibleFieldNames = const [],
    this.visibleFunctionNames = const [],
  });

  /// List of JQL query reserved words.
  List<String> jqlReservedWords;

  /// List of fields usable in JQL queries.
  List<FieldReferenceData> visibleFieldNames;

  /// List of functions usable in JQL queries.
  List<FunctionReferenceData> visibleFunctionNames;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JQLReferenceData &&
    _deepEquality.equals(other.jqlReservedWords, jqlReservedWords) &&
    _deepEquality.equals(other.visibleFieldNames, visibleFieldNames) &&
    _deepEquality.equals(other.visibleFunctionNames, visibleFunctionNames);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (jqlReservedWords.hashCode) +
    (visibleFieldNames.hashCode) +
    (visibleFunctionNames.hashCode);

  @override
  String toString() => 'JQLReferenceData[jqlReservedWords=$jqlReservedWords, visibleFieldNames=$visibleFieldNames, visibleFunctionNames=$visibleFunctionNames]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'jqlReservedWords'] = this.jqlReservedWords;
      json[r'visibleFieldNames'] = this.visibleFieldNames;
      json[r'visibleFunctionNames'] = this.visibleFunctionNames;
    return json;
  }

  /// Returns a new [JQLReferenceData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JQLReferenceData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JQLReferenceData(
        jqlReservedWords: json[r'jqlReservedWords'] is Iterable
            ? (json[r'jqlReservedWords'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        visibleFieldNames: FieldReferenceData.listFromJson(json[r'visibleFieldNames']),
        visibleFunctionNames: FunctionReferenceData.listFromJson(json[r'visibleFunctionNames']),
      );
    }
    return null;
  }

  static List<JQLReferenceData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JQLReferenceData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JQLReferenceData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JQLReferenceData> mapFromJson(dynamic json) {
    final map = <String, JQLReferenceData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JQLReferenceData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JQLReferenceData-objects as value to a dart map
  static Map<String, List<JQLReferenceData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JQLReferenceData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JQLReferenceData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

