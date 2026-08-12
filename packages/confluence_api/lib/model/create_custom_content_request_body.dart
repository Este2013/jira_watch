//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateCustomContentRequestBody {
  /// Returns a new [CreateCustomContentRequestBody] instance.
  CreateCustomContentRequestBody({
    this.representation,
    this.value,
    this.storage,
    this.atlasDocFormat,
    this.raw,
  });

  /// Type of content representation used for the value field.
  CreateCustomContentRequestBodyRepresentationEnum? representation;

  /// Body of the custom content, in the format found in the representation field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomContentBodyWrite? storage;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomContentBodyWrite? atlasDocFormat;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomContentBodyWrite? raw;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateCustomContentRequestBody &&
    other.representation == representation &&
    other.value == value &&
    other.storage == storage &&
    other.atlasDocFormat == atlasDocFormat &&
    other.raw == raw;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (representation == null ? 0 : representation!.hashCode) +
    (value == null ? 0 : value!.hashCode) +
    (storage == null ? 0 : storage!.hashCode) +
    (atlasDocFormat == null ? 0 : atlasDocFormat!.hashCode) +
    (raw == null ? 0 : raw!.hashCode);

  @override
  String toString() => 'CreateCustomContentRequestBody[representation=$representation, value=$value, storage=$storage, atlasDocFormat=$atlasDocFormat, raw=$raw]';

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
    if (this.storage != null) {
      json[r'storage'] = this.storage;
    } else {
      json[r'storage'] = null;
    }
    if (this.atlasDocFormat != null) {
      json[r'atlas_doc_format'] = this.atlasDocFormat;
    } else {
      json[r'atlas_doc_format'] = null;
    }
    if (this.raw != null) {
      json[r'raw'] = this.raw;
    } else {
      json[r'raw'] = null;
    }
    return json;
  }

  /// Returns a new [CreateCustomContentRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateCustomContentRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateCustomContentRequestBody(
        representation: CreateCustomContentRequestBodyRepresentationEnum.fromJson(json[r'representation']),
        value: mapValueOfType<String>(json, r'value'),
        storage: CustomContentBodyWrite.fromJson(json[r'storage']),
        atlasDocFormat: CustomContentBodyWrite.fromJson(json[r'atlas_doc_format']),
        raw: CustomContentBodyWrite.fromJson(json[r'raw']),
      );
    }
    return null;
  }

  static List<CreateCustomContentRequestBody> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateCustomContentRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateCustomContentRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateCustomContentRequestBody> mapFromJson(dynamic json) {
    final map = <String, CreateCustomContentRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateCustomContentRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateCustomContentRequestBody-objects as value to a dart map
  static Map<String, List<CreateCustomContentRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateCustomContentRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateCustomContentRequestBody.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Type of content representation used for the value field.
enum CreateCustomContentRequestBodyRepresentationEnum {
  storage._(r'storage'),
  atlasDocFormat._(r'atlas_doc_format'),
  raw._(r'raw'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateCustomContentRequestBodyRepresentationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateCustomContentRequestBodyRepresentationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateCustomContentRequestBodyRepresentationEnum? fromJson(dynamic value) => CreateCustomContentRequestBodyRepresentationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateCustomContentRequestBodyRepresentationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateCustomContentRequestBodyRepresentationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateCustomContentRequestBodyRepresentationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateCustomContentRequestBodyRepresentationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateCustomContentRequestBodyRepresentationEnum] to String,
/// and [decode] dynamic data back to [CreateCustomContentRequestBodyRepresentationEnum].
class CreateCustomContentRequestBodyRepresentationEnumTypeTransformer {
  factory CreateCustomContentRequestBodyRepresentationEnumTypeTransformer() => _instance ??= const CreateCustomContentRequestBodyRepresentationEnumTypeTransformer._();

  const CreateCustomContentRequestBodyRepresentationEnumTypeTransformer._();

  String encode(CreateCustomContentRequestBodyRepresentationEnum data) => data._value;

  /// Returns the instance of [CreateCustomContentRequestBodyRepresentationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateCustomContentRequestBodyRepresentationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateCustomContentRequestBodyRepresentationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'storage': return CreateCustomContentRequestBodyRepresentationEnum.storage;
        case r'atlas_doc_format': return CreateCustomContentRequestBodyRepresentationEnum.atlasDocFormat;
        case r'raw': return CreateCustomContentRequestBodyRepresentationEnum.raw;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateCustomContentRequestBodyRepresentationEnumTypeTransformer? _instance;
}


