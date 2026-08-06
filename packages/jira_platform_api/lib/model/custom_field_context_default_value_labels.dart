//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldContextDefaultValueLabels {
  /// Returns a new [CustomFieldContextDefaultValueLabels] instance.
  CustomFieldContextDefaultValueLabels({
    required this.contextId,
    this.labels = const [],
    required this.type,
  });

  /// The ID of the context.
  String contextId;

  /// The default labels value.
  List<String> labels;

  String type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldContextDefaultValueLabels &&
    other.contextId == contextId &&
    _deepEquality.equals(other.labels, labels) &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextId.hashCode) +
    (labels.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'CustomFieldContextDefaultValueLabels[contextId=$contextId, labels=$labels, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'contextId'] = this.contextId;
      json[r'labels'] = this.labels;
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [CustomFieldContextDefaultValueLabels] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldContextDefaultValueLabels? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'contextId'), 'Required key "CustomFieldContextDefaultValueLabels[contextId]" is missing from JSON.');
        assert(json[r'contextId'] != null, 'Required key "CustomFieldContextDefaultValueLabels[contextId]" has a null value in JSON.');
        assert(json.containsKey(r'labels'), 'Required key "CustomFieldContextDefaultValueLabels[labels]" is missing from JSON.');
        assert(json[r'labels'] != null, 'Required key "CustomFieldContextDefaultValueLabels[labels]" has a null value in JSON.');
        assert(json.containsKey(r'type'), 'Required key "CustomFieldContextDefaultValueLabels[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "CustomFieldContextDefaultValueLabels[type]" has a null value in JSON.');
        return true;
      }());

      return CustomFieldContextDefaultValueLabels(
        contextId: mapValueOfType<String>(json, r'contextId')!,
        labels: json[r'labels'] is Iterable
            ? (json[r'labels'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        type: mapValueOfType<String>(json, r'type')!,
      );
    }
    return null;
  }

  static List<CustomFieldContextDefaultValueLabels> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldContextDefaultValueLabels>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldContextDefaultValueLabels.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldContextDefaultValueLabels> mapFromJson(dynamic json) {
    final map = <String, CustomFieldContextDefaultValueLabels>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldContextDefaultValueLabels.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldContextDefaultValueLabels-objects as value to a dart map
  static Map<String, List<CustomFieldContextDefaultValueLabels>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldContextDefaultValueLabels>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldContextDefaultValueLabels.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'contextId',
    'labels',
    'type',
  };
}

