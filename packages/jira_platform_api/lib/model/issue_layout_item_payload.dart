//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueLayoutItemPayload {
  /// Returns a new [IssueLayoutItemPayload] instance.
  IssueLayoutItemPayload({
    this.itemKey,
    this.properties = const {},
    this.sectionType,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? itemKey;

  /// Additional properties for this item. This field is only used when the type is FIELD.
  Map<String, Object> properties;

  /// The item section type
  IssueLayoutItemPayloadSectionTypeEnum? sectionType;

  /// The item type. Currently only support FIELD
  IssueLayoutItemPayloadTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueLayoutItemPayload &&
    other.itemKey == itemKey &&
    _deepEquality.equals(other.properties, properties) &&
    other.sectionType == sectionType &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (itemKey == null ? 0 : itemKey!.hashCode) +
    (properties.hashCode) +
    (sectionType == null ? 0 : sectionType!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'IssueLayoutItemPayload[itemKey=$itemKey, properties=$properties, sectionType=$sectionType, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.itemKey != null) {
      json[r'itemKey'] = this.itemKey;
    } else {
      json[r'itemKey'] = null;
    }
      json[r'properties'] = this.properties;
    if (this.sectionType != null) {
      json[r'sectionType'] = this.sectionType;
    } else {
      json[r'sectionType'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [IssueLayoutItemPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueLayoutItemPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueLayoutItemPayload(
        itemKey: ProjectCreateResourceIdentifier.fromJson(json[r'itemKey']),
        properties: mapCastOfType<String, Object>(json, r'properties') ?? const {},
        sectionType: IssueLayoutItemPayloadSectionTypeEnum.fromJson(json[r'sectionType']),
        type: IssueLayoutItemPayloadTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<IssueLayoutItemPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLayoutItemPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLayoutItemPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueLayoutItemPayload> mapFromJson(dynamic json) {
    final map = <String, IssueLayoutItemPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueLayoutItemPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueLayoutItemPayload-objects as value to a dart map
  static Map<String, List<IssueLayoutItemPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueLayoutItemPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueLayoutItemPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The item section type
enum IssueLayoutItemPayloadSectionTypeEnum {
  content._(r'content'),
  primaryContext._(r'primaryContext'),
  secondaryContext._(r'secondaryContext'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueLayoutItemPayloadSectionTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueLayoutItemPayloadSectionTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueLayoutItemPayloadSectionTypeEnum? fromJson(dynamic value) => IssueLayoutItemPayloadSectionTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueLayoutItemPayloadSectionTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueLayoutItemPayloadSectionTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLayoutItemPayloadSectionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLayoutItemPayloadSectionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueLayoutItemPayloadSectionTypeEnum] to String,
/// and [decode] dynamic data back to [IssueLayoutItemPayloadSectionTypeEnum].
class IssueLayoutItemPayloadSectionTypeEnumTypeTransformer {
  factory IssueLayoutItemPayloadSectionTypeEnumTypeTransformer() => _instance ??= const IssueLayoutItemPayloadSectionTypeEnumTypeTransformer._();

  const IssueLayoutItemPayloadSectionTypeEnumTypeTransformer._();

  String encode(IssueLayoutItemPayloadSectionTypeEnum data) => data._value;

  /// Returns the instance of [IssueLayoutItemPayloadSectionTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueLayoutItemPayloadSectionTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueLayoutItemPayloadSectionTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'content': return IssueLayoutItemPayloadSectionTypeEnum.content;
        case r'primaryContext': return IssueLayoutItemPayloadSectionTypeEnum.primaryContext;
        case r'secondaryContext': return IssueLayoutItemPayloadSectionTypeEnum.secondaryContext;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueLayoutItemPayloadSectionTypeEnumTypeTransformer? _instance;
}


/// The item type. Currently only support FIELD
enum IssueLayoutItemPayloadTypeEnum {
  FIELD._(r'FIELD'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueLayoutItemPayloadTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueLayoutItemPayloadTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueLayoutItemPayloadTypeEnum? fromJson(dynamic value) => IssueLayoutItemPayloadTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueLayoutItemPayloadTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueLayoutItemPayloadTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLayoutItemPayloadTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLayoutItemPayloadTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueLayoutItemPayloadTypeEnum] to String,
/// and [decode] dynamic data back to [IssueLayoutItemPayloadTypeEnum].
class IssueLayoutItemPayloadTypeEnumTypeTransformer {
  factory IssueLayoutItemPayloadTypeEnumTypeTransformer() => _instance ??= const IssueLayoutItemPayloadTypeEnumTypeTransformer._();

  const IssueLayoutItemPayloadTypeEnumTypeTransformer._();

  String encode(IssueLayoutItemPayloadTypeEnum data) => data._value;

  /// Returns the instance of [IssueLayoutItemPayloadTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueLayoutItemPayloadTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueLayoutItemPayloadTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FIELD': return IssueLayoutItemPayloadTypeEnum.FIELD;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueLayoutItemPayloadTypeEnumTypeTransformer? _instance;
}


