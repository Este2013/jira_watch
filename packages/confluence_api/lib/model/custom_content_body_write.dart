//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomContentBodyWrite {
  /// Returns a new [CustomContentBodyWrite] instance.
  CustomContentBodyWrite({
    this.representation,
    this.value,
  });

  /// Type of content representation used for the value field.
  CustomContentBodyWriteRepresentationEnum? representation;

  /// Body of the custom content, in the format found in the representation field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomContentBodyWrite &&
    other.representation == representation &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (representation == null ? 0 : representation!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'CustomContentBodyWrite[representation=$representation, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.representation != null) {
      json[r'representation'] = this.representation;
    } else {
      json[r'representation'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [CustomContentBodyWrite] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomContentBodyWrite? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomContentBodyWrite(
        representation: CustomContentBodyWriteRepresentationEnum.fromJson(json[r'representation']),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<CustomContentBodyWrite> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomContentBodyWrite>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomContentBodyWrite.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomContentBodyWrite> mapFromJson(dynamic json) {
    final map = <String, CustomContentBodyWrite>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomContentBodyWrite.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomContentBodyWrite-objects as value to a dart map
  static Map<String, List<CustomContentBodyWrite>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomContentBodyWrite>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomContentBodyWrite.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Type of content representation used for the value field.
enum CustomContentBodyWriteRepresentationEnum {
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  raw._(r'raw'),
  ;

  /// Instantiate a new enum with the provided value.
  const CustomContentBodyWriteRepresentationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomContentBodyWriteRepresentationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomContentBodyWriteRepresentationEnum? fromJson(dynamic value) => CustomContentBodyWriteRepresentationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomContentBodyWriteRepresentationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomContentBodyWriteRepresentationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomContentBodyWriteRepresentationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomContentBodyWriteRepresentationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomContentBodyWriteRepresentationEnum] to String,
/// and [decode] dynamic data back to [CustomContentBodyWriteRepresentationEnum].
class CustomContentBodyWriteRepresentationEnumTypeTransformer {
  factory CustomContentBodyWriteRepresentationEnumTypeTransformer() => _instance ??= const CustomContentBodyWriteRepresentationEnumTypeTransformer._();

  const CustomContentBodyWriteRepresentationEnumTypeTransformer._();

  String encode(CustomContentBodyWriteRepresentationEnum data) => data._value;

  /// Returns the instance of [CustomContentBodyWriteRepresentationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomContentBodyWriteRepresentationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomContentBodyWriteRepresentationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'storage': return CustomContentBodyWriteRepresentationEnum.storage;
        case r'atlas_doc_format': return CustomContentBodyWriteRepresentationEnum.atlasDocFormat;
        case r'raw': return CustomContentBodyWriteRepresentationEnum.raw;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomContentBodyWriteRepresentationEnumTypeTransformer? _instance;
}


