//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ScopePayload {
  /// Returns a new [ScopePayload] instance.
  ScopePayload({
    this.type,
  });

  /// The type of the scope. Use `GLOBAL` or empty for company-managed project, and `PROJECT` for team-managed project
  ScopePayloadTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ScopePayload &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ScopePayload[type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ScopePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ScopePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ScopePayload(
        type: ScopePayloadTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<ScopePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScopePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScopePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ScopePayload> mapFromJson(dynamic json) {
    final map = <String, ScopePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ScopePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ScopePayload-objects as value to a dart map
  static Map<String, List<ScopePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ScopePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ScopePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of the scope. Use `GLOBAL` or empty for company-managed project, and `PROJECT` for team-managed project
enum ScopePayloadTypeEnum {
  GLOBAL._(r'GLOBAL'),
  PROJECT._(r'PROJECT'),
  ;

  /// Instantiate a new enum with the provided value.
  const ScopePayloadTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ScopePayloadTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ScopePayloadTypeEnum? fromJson(dynamic value) => ScopePayloadTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ScopePayloadTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ScopePayloadTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ScopePayloadTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ScopePayloadTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ScopePayloadTypeEnum] to String,
/// and [decode] dynamic data back to [ScopePayloadTypeEnum].
class ScopePayloadTypeEnumTypeTransformer {
  factory ScopePayloadTypeEnumTypeTransformer() => _instance ??= const ScopePayloadTypeEnumTypeTransformer._();

  const ScopePayloadTypeEnumTypeTransformer._();

  String encode(ScopePayloadTypeEnum data) => data._value;

  /// Returns the instance of [ScopePayloadTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ScopePayloadTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ScopePayloadTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'GLOBAL': return ScopePayloadTypeEnum.GLOBAL;
        case r'PROJECT': return ScopePayloadTypeEnum.PROJECT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ScopePayloadTypeEnumTypeTransformer? _instance;
}


