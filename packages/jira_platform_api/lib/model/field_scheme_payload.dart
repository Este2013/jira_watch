//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldSchemePayload {
  /// Returns a new [FieldSchemePayload] instance.
  FieldSchemePayload({
    this.description,
    this.items = const [],
    this.name,
    this.onConflict,
    this.pcri,
  });

  /// The description of the field scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The field association items for this field scheme.
  List<FieldAssociationItemPayload> items;

  /// The name of the field scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The strategy to use when there is a conflict with an existing field scheme. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
  FieldSchemePayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldSchemePayload &&
    other.description == description &&
    _deepEquality.equals(other.items, items) &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (items.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'FieldSchemePayload[description=$description, items=$items, name=$name, onConflict=$onConflict, pcri=$pcri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'items'] = this.items;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.onConflict != null) {
      json[r'onConflict'] = this.onConflict;
    } else {
      json[r'onConflict'] = null;
    }
    if (this.pcri != null) {
      json[r'pcri'] = this.pcri;
    } else {
      json[r'pcri'] = null;
    }
    return json;
  }

  /// Returns a new [FieldSchemePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldSchemePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldSchemePayload(
        description: mapValueOfType<String>(json, r'description'),
        items: FieldAssociationItemPayload.listFromJson(json[r'items']),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: FieldSchemePayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<FieldSchemePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldSchemePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldSchemePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldSchemePayload> mapFromJson(dynamic json) {
    final map = <String, FieldSchemePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldSchemePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldSchemePayload-objects as value to a dart map
  static Map<String, List<FieldSchemePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldSchemePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldSchemePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The strategy to use when there is a conflict with an existing field scheme. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
enum FieldSchemePayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldSchemePayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldSchemePayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldSchemePayloadOnConflictEnum? fromJson(dynamic value) => FieldSchemePayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldSchemePayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldSchemePayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldSchemePayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldSchemePayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldSchemePayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [FieldSchemePayloadOnConflictEnum].
class FieldSchemePayloadOnConflictEnumTypeTransformer {
  factory FieldSchemePayloadOnConflictEnumTypeTransformer() => _instance ??= const FieldSchemePayloadOnConflictEnumTypeTransformer._();

  const FieldSchemePayloadOnConflictEnumTypeTransformer._();

  String encode(FieldSchemePayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [FieldSchemePayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldSchemePayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldSchemePayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return FieldSchemePayloadOnConflictEnum.FAIL;
        case r'USE': return FieldSchemePayloadOnConflictEnum.USE;
        case r'NEW': return FieldSchemePayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldSchemePayloadOnConflictEnumTypeTransformer? _instance;
}


