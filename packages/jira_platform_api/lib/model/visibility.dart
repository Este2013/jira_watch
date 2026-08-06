//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Visibility {
  /// Returns a new [Visibility] instance.
  Visibility({
    this.identifier,
    this.type,
    this.value,
  });

  /// The ID of the group or the name of the role that visibility of this item is restricted to.
  String? identifier;

  /// Whether visibility of this item is restricted to a group or role.
  VisibilityTypeEnum? type;

  /// The name of the group or role that visibility of this item is restricted to. Please note that the name of a group is mutable, to reliably identify a group use `identifier`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Visibility &&
    other.identifier == identifier &&
    other.type == type &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (identifier == null ? 0 : identifier!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'Visibility[identifier=$identifier, type=$type, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.identifier != null) {
      json[r'identifier'] = this.identifier;
    } else {
      json[r'identifier'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [Visibility] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Visibility? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Visibility(
        identifier: mapValueOfType<String>(json, r'identifier'),
        type: VisibilityTypeEnum.fromJson(json[r'type']),
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<Visibility> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Visibility>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Visibility.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Visibility> mapFromJson(dynamic json) {
    final map = <String, Visibility>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Visibility.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Visibility-objects as value to a dart map
  static Map<String, List<Visibility>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Visibility>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Visibility.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Whether visibility of this item is restricted to a group or role.
enum VisibilityTypeEnum {
  group._(r'group'),
  role._(r'role'),
  ;

  /// Instantiate a new enum with the provided value.
  const VisibilityTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [VisibilityTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static VisibilityTypeEnum? fromJson(dynamic value) => VisibilityTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [VisibilityTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<VisibilityTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <VisibilityTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = VisibilityTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [VisibilityTypeEnum] to String,
/// and [decode] dynamic data back to [VisibilityTypeEnum].
class VisibilityTypeEnumTypeTransformer {
  factory VisibilityTypeEnumTypeTransformer() => _instance ??= const VisibilityTypeEnumTypeTransformer._();

  const VisibilityTypeEnumTypeTransformer._();

  String encode(VisibilityTypeEnum data) => data._value;

  /// Returns the instance of [VisibilityTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  VisibilityTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is VisibilityTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'group': return VisibilityTypeEnum.group;
        case r'role': return VisibilityTypeEnum.role;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static VisibilityTypeEnumTypeTransformer? _instance;
}


