//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldConfigurationItemsDetails {
  /// Returns a new [FieldConfigurationItemsDetails] instance.
  FieldConfigurationItemsDetails({
    this.fieldConfigurationItems = const [],
  });

  /// Details of fields in a field configuration.
  List<FieldConfigurationItem> fieldConfigurationItems;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldConfigurationItemsDetails &&
    _deepEquality.equals(other.fieldConfigurationItems, fieldConfigurationItems);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldConfigurationItems.hashCode);

  @override
  String toString() => 'FieldConfigurationItemsDetails[fieldConfigurationItems=$fieldConfigurationItems]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'fieldConfigurationItems'] = this.fieldConfigurationItems;
    return json;
  }

  /// Returns a new [FieldConfigurationItemsDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldConfigurationItemsDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'fieldConfigurationItems'), 'Required key "FieldConfigurationItemsDetails[fieldConfigurationItems]" is missing from JSON.');
        assert(json[r'fieldConfigurationItems'] != null, 'Required key "FieldConfigurationItemsDetails[fieldConfigurationItems]" has a null value in JSON.');
        return true;
      }());

      return FieldConfigurationItemsDetails(
        fieldConfigurationItems: FieldConfigurationItem.listFromJson(json[r'fieldConfigurationItems']),
      );
    }
    return null;
  }

  static List<FieldConfigurationItemsDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldConfigurationItemsDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldConfigurationItemsDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldConfigurationItemsDetails> mapFromJson(dynamic json) {
    final map = <String, FieldConfigurationItemsDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldConfigurationItemsDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldConfigurationItemsDetails-objects as value to a dart map
  static Map<String, List<FieldConfigurationItemsDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldConfigurationItemsDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldConfigurationItemsDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'fieldConfigurationItems',
  };
}

