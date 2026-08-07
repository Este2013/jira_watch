//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CardLayoutField {
  /// Returns a new [CardLayoutField] instance.
  CardLayoutField({
    this.fieldId,
    this.id,
    this.mode,
    this.position,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  CardLayoutFieldModeEnum? mode;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? position;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CardLayoutField &&
    other.fieldId == fieldId &&
    other.id == id &&
    other.mode == mode &&
    other.position == position;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (fieldId == null ? 0 : fieldId!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (mode == null ? 0 : mode!.hashCode) +
    (position == null ? 0 : position!.hashCode);

  @override
  String toString() => 'CardLayoutField[fieldId=$fieldId, id=$id, mode=$mode, position=$position]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.fieldId != null) {
      json[r'fieldId'] = this.fieldId;
    } else {
      json[r'fieldId'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.mode != null) {
      json[r'mode'] = this.mode;
    } else {
      json[r'mode'] = null;
    }
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    return json;
  }

  /// Returns a new [CardLayoutField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CardLayoutField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CardLayoutField(
        fieldId: mapValueOfType<String>(json, r'fieldId'),
        id: mapValueOfType<int>(json, r'id'),
        mode: CardLayoutFieldModeEnum.fromJson(json[r'mode']),
        position: mapValueOfType<int>(json, r'position'),
      );
    }
    return null;
  }

  static List<CardLayoutField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CardLayoutField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CardLayoutField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CardLayoutField> mapFromJson(dynamic json) {
    final map = <String, CardLayoutField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CardLayoutField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CardLayoutField-objects as value to a dart map
  static Map<String, List<CardLayoutField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CardLayoutField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CardLayoutField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum CardLayoutFieldModeEnum {
  PLAN._(r'PLAN'),
  WORK._(r'WORK'),
  ;

  /// Instantiate a new enum with the provided value.
  const CardLayoutFieldModeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CardLayoutFieldModeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CardLayoutFieldModeEnum? fromJson(dynamic value) => CardLayoutFieldModeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CardLayoutFieldModeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CardLayoutFieldModeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CardLayoutFieldModeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CardLayoutFieldModeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CardLayoutFieldModeEnum] to String,
/// and [decode] dynamic data back to [CardLayoutFieldModeEnum].
class CardLayoutFieldModeEnumTypeTransformer {
  factory CardLayoutFieldModeEnumTypeTransformer() => _instance ??= const CardLayoutFieldModeEnumTypeTransformer._();

  const CardLayoutFieldModeEnumTypeTransformer._();

  String encode(CardLayoutFieldModeEnum data) => data._value;

  /// Returns the instance of [CardLayoutFieldModeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CardLayoutFieldModeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CardLayoutFieldModeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PLAN': return CardLayoutFieldModeEnum.PLAN;
        case r'WORK': return CardLayoutFieldModeEnum.WORK;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CardLayoutFieldModeEnumTypeTransformer? _instance;
}


