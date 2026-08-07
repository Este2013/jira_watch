//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraMultipleVersionPickerField {
  /// Returns a new [JiraMultipleVersionPickerField] instance.
  JiraMultipleVersionPickerField({
    required this.bulkEditMultiSelectFieldOption,
    required this.fieldId,
    this.versions = const [],
  });

  JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum bulkEditMultiSelectFieldOption;

  String fieldId;

  List<JiraVersionField> versions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraMultipleVersionPickerField &&
    other.bulkEditMultiSelectFieldOption == bulkEditMultiSelectFieldOption &&
    other.fieldId == fieldId &&
    _deepEquality.equals(other.versions, versions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bulkEditMultiSelectFieldOption.hashCode) +
    (fieldId.hashCode) +
    (versions.hashCode);

  @override
  String toString() => 'JiraMultipleVersionPickerField[bulkEditMultiSelectFieldOption=$bulkEditMultiSelectFieldOption, fieldId=$fieldId, versions=$versions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'bulkEditMultiSelectFieldOption'] = this.bulkEditMultiSelectFieldOption;
      json[r'fieldId'] = this.fieldId;
      json[r'versions'] = this.versions;
    return json;
  }

  /// Returns a new [JiraMultipleVersionPickerField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraMultipleVersionPickerField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'bulkEditMultiSelectFieldOption'), 'Required key "JiraMultipleVersionPickerField[bulkEditMultiSelectFieldOption]" is missing from JSON.');
        assert(json[r'bulkEditMultiSelectFieldOption'] != null, 'Required key "JiraMultipleVersionPickerField[bulkEditMultiSelectFieldOption]" has a null value in JSON.');
        assert(json.containsKey(r'fieldId'), 'Required key "JiraMultipleVersionPickerField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraMultipleVersionPickerField[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'versions'), 'Required key "JiraMultipleVersionPickerField[versions]" is missing from JSON.');
        assert(json[r'versions'] != null, 'Required key "JiraMultipleVersionPickerField[versions]" has a null value in JSON.');
        return true;
      }());

      return JiraMultipleVersionPickerField(
        bulkEditMultiSelectFieldOption: JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum.fromJson(json[r'bulkEditMultiSelectFieldOption'])!,
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        versions: JiraVersionField.listFromJson(json[r'versions']),
      );
    }
    return null;
  }

  static List<JiraMultipleVersionPickerField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraMultipleVersionPickerField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraMultipleVersionPickerField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraMultipleVersionPickerField> mapFromJson(dynamic json) {
    final map = <String, JiraMultipleVersionPickerField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraMultipleVersionPickerField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraMultipleVersionPickerField-objects as value to a dart map
  static Map<String, List<JiraMultipleVersionPickerField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraMultipleVersionPickerField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraMultipleVersionPickerField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'bulkEditMultiSelectFieldOption',
    'fieldId',
    'versions',
  };
}


enum JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum {
  ADD._(r'ADD'),
  REMOVE._(r'REMOVE'),
  REPLACE._(r'REPLACE'),
  REMOVE_ALL._(r'REMOVE_ALL'),
  ;

  /// Instantiate a new enum with the provided value.
  const JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum? fromJson(dynamic value) => JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum] to String,
/// and [decode] dynamic data back to [JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum].
class JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer {
  factory JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer() => _instance ??= const JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer._();

  const JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer._();

  String encode(JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum data) => data._value;

  /// Returns the instance of [JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ADD': return JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum.ADD;
        case r'REMOVE': return JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum.REMOVE;
        case r'REPLACE': return JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum.REPLACE;
        case r'REMOVE_ALL': return JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnum.REMOVE_ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JiraMultipleVersionPickerFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer? _instance;
}


