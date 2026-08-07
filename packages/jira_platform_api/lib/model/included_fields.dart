//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IncludedFields {
  /// Returns a new [IncludedFields] instance.
  IncludedFields({
    this.actuallyIncluded = const [],
    this.excluded = const [],
    this.included = const [],
  });

  List<String> actuallyIncluded;

  List<String> excluded;

  List<String> included;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IncludedFields &&
    _deepEquality.equals(other.actuallyIncluded, actuallyIncluded) &&
    _deepEquality.equals(other.excluded, excluded) &&
    _deepEquality.equals(other.included, included);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (actuallyIncluded.hashCode) +
    (excluded.hashCode) +
    (included.hashCode);

  @override
  String toString() => 'IncludedFields[actuallyIncluded=$actuallyIncluded, excluded=$excluded, included=$included]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'actuallyIncluded'] = this.actuallyIncluded;
      json[r'excluded'] = this.excluded;
      json[r'included'] = this.included;
    return json;
  }

  /// Returns a new [IncludedFields] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IncludedFields? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IncludedFields(
        actuallyIncluded: json[r'actuallyIncluded'] is Iterable
            ? (json[r'actuallyIncluded'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        excluded: json[r'excluded'] is Iterable
            ? (json[r'excluded'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        included: json[r'included'] is Iterable
            ? (json[r'included'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IncludedFields> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IncludedFields>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IncludedFields.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IncludedFields> mapFromJson(dynamic json) {
    final map = <String, IncludedFields>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IncludedFields.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IncludedFields-objects as value to a dart map
  static Map<String, List<IncludedFields>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IncludedFields>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IncludedFields.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

