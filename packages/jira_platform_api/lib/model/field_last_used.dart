//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldLastUsed {
  /// Returns a new [FieldLastUsed] instance.
  FieldLastUsed({
    this.type,
    this.value,
  });

  /// Last used value type:   *  *TRACKED*: field is tracked and a last used date is available.  *  *NOT\\_TRACKED*: field is not tracked, last used date is not available.  *  *NO\\_INFORMATION*: field is tracked, but no last used date is available.
  FieldLastUsedTypeEnum? type;

  /// The date when the value of the field last changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldLastUsed &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type == null ? 0 : type!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'FieldLastUsed[type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value!.toUtc().toIso8601String();
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [FieldLastUsed] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldLastUsed? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldLastUsed(
        type: FieldLastUsedTypeEnum.fromJson(json[r'type']),
        value: mapDateTime(json, r'value', r''),
      );
    }
    return null;
  }

  static List<FieldLastUsed> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldLastUsed>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldLastUsed.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldLastUsed> mapFromJson(dynamic json) {
    final map = <String, FieldLastUsed>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldLastUsed.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldLastUsed-objects as value to a dart map
  static Map<String, List<FieldLastUsed>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldLastUsed>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldLastUsed.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Last used value type:   *  *TRACKED*: field is tracked and a last used date is available.  *  *NOT\\_TRACKED*: field is not tracked, last used date is not available.  *  *NO\\_INFORMATION*: field is tracked, but no last used date is available.
enum FieldLastUsedTypeEnum {
  TRACKED._(r'TRACKED'),
  NOT_TRACKED._(r'NOT_TRACKED'),
  NO_INFORMATION._(r'NO_INFORMATION'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldLastUsedTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldLastUsedTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldLastUsedTypeEnum? fromJson(dynamic value) => FieldLastUsedTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldLastUsedTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldLastUsedTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldLastUsedTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldLastUsedTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldLastUsedTypeEnum] to String,
/// and [decode] dynamic data back to [FieldLastUsedTypeEnum].
class FieldLastUsedTypeEnumTypeTransformer {
  factory FieldLastUsedTypeEnumTypeTransformer() => _instance ??= const FieldLastUsedTypeEnumTypeTransformer._();

  const FieldLastUsedTypeEnumTypeTransformer._();

  String encode(FieldLastUsedTypeEnum data) => data._value;

  /// Returns the instance of [FieldLastUsedTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldLastUsedTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldLastUsedTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TRACKED': return FieldLastUsedTypeEnum.TRACKED;
        case r'NOT_TRACKED': return FieldLastUsedTypeEnum.NOT_TRACKED;
        case r'NO_INFORMATION': return FieldLastUsedTypeEnum.NO_INFORMATION;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldLastUsedTypeEnumTypeTransformer? _instance;
}


