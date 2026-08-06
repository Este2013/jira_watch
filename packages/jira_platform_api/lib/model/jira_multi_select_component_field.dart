//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraMultiSelectComponentField {
  /// Returns a new [JiraMultiSelectComponentField] instance.
  JiraMultiSelectComponentField({
    required this.bulkEditMultiSelectFieldOption,
    this.components = const [],
    required this.fieldId,
  });

  JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum bulkEditMultiSelectFieldOption;

  List<JiraComponentField> components;

  String fieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraMultiSelectComponentField &&
    other.bulkEditMultiSelectFieldOption == bulkEditMultiSelectFieldOption &&
    _deepEquality.equals(other.components, components) &&
    other.fieldId == fieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (bulkEditMultiSelectFieldOption.hashCode) +
    (components.hashCode) +
    (fieldId.hashCode);

  @override
  String toString() => 'JiraMultiSelectComponentField[bulkEditMultiSelectFieldOption=$bulkEditMultiSelectFieldOption, components=$components, fieldId=$fieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'bulkEditMultiSelectFieldOption'] = this.bulkEditMultiSelectFieldOption;
      json[r'components'] = this.components;
      json[r'fieldId'] = this.fieldId;
    return json;
  }

  /// Returns a new [JiraMultiSelectComponentField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraMultiSelectComponentField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'bulkEditMultiSelectFieldOption'), 'Required key "JiraMultiSelectComponentField[bulkEditMultiSelectFieldOption]" is missing from JSON.');
        assert(json[r'bulkEditMultiSelectFieldOption'] != null, 'Required key "JiraMultiSelectComponentField[bulkEditMultiSelectFieldOption]" has a null value in JSON.');
        assert(json.containsKey(r'components'), 'Required key "JiraMultiSelectComponentField[components]" is missing from JSON.');
        assert(json[r'components'] != null, 'Required key "JiraMultiSelectComponentField[components]" has a null value in JSON.');
        assert(json.containsKey(r'fieldId'), 'Required key "JiraMultiSelectComponentField[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "JiraMultiSelectComponentField[fieldId]" has a null value in JSON.');
        return true;
      }());

      return JiraMultiSelectComponentField(
        bulkEditMultiSelectFieldOption: JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum.fromJson(json[r'bulkEditMultiSelectFieldOption'])!,
        components: JiraComponentField.listFromJson(json[r'components']),
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
      );
    }
    return null;
  }

  static List<JiraMultiSelectComponentField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraMultiSelectComponentField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraMultiSelectComponentField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraMultiSelectComponentField> mapFromJson(dynamic json) {
    final map = <String, JiraMultiSelectComponentField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraMultiSelectComponentField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraMultiSelectComponentField-objects as value to a dart map
  static Map<String, List<JiraMultiSelectComponentField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraMultiSelectComponentField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraMultiSelectComponentField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'bulkEditMultiSelectFieldOption',
    'components',
    'fieldId',
  };
}


enum JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum {
  ADD._(r'ADD'),
  REMOVE._(r'REMOVE'),
  REPLACE._(r'REPLACE'),
  REMOVE_ALL._(r'REMOVE_ALL'),
  ;

  /// Instantiate a new enum with the provided value.
  const JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum? fromJson(dynamic value) => JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum] to String,
/// and [decode] dynamic data back to [JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum].
class JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer {
  factory JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer() => _instance ??= const JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer._();

  const JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer._();

  String encode(JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum data) => data._value;

  /// Returns the instance of [JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ADD': return JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum.ADD;
        case r'REMOVE': return JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum.REMOVE;
        case r'REPLACE': return JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum.REPLACE;
        case r'REMOVE_ALL': return JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnum.REMOVE_ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JiraMultiSelectComponentFieldBulkEditMultiSelectFieldOptionEnumTypeTransformer? _instance;
}


