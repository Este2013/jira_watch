//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContextDefaultValues {
  /// Returns a new [ContextDefaultValues] instance.
  ContextDefaultValues({
    required this.contextId,
    this.defaultValues = const [],
  });

  /// The ID of the context.
  int contextId;

  /// Per-issue-type default values for this context. May contain a single entry for unconverted contexts, or one entry per issue type for converted contexts.
  List<IssueTypeDefaultValue> defaultValues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContextDefaultValues &&
    other.contextId == contextId &&
    _deepEquality.equals(other.defaultValues, defaultValues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (defaultValues.hashCode);

  @override
  String toString() => 'ContextDefaultValues[contextId=$contextId, defaultValues=$defaultValues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'defaultValues'] = this.defaultValues;
    return json;
  }

  /// Returns a new [ContextDefaultValues] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContextDefaultValues? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "ContextDefaultValues[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "ContextDefaultValues[contextId]" has a null value in JSON.');
        return true;
      }());

      return ContextDefaultValues(
        contextId: mapValueOfType<int>(json, r'contextId')!,
        defaultValues: IssueTypeDefaultValue.listFromJson(json[r'defaultValues']),
      );
    }
    return null;
  }

  static List<ContextDefaultValues> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContextDefaultValues>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContextDefaultValues.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContextDefaultValues> mapFromJson(dynamic json) {
    final map = <String, ContextDefaultValues>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContextDefaultValues.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContextDefaultValues-objects as value to a dart map
  static Map<String, List<ContextDefaultValues>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContextDefaultValues>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContextDefaultValues.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
  };
}

