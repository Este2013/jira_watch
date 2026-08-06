//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JqlQueryFieldEntityProperty {
  /// Returns a new [JqlQueryFieldEntityProperty] instance.
  JqlQueryFieldEntityProperty({
    required this.entity,
    required this.key,
    required this.path,
    this.type,
  });

  /// The object on which the property is set.
  String entity;

  /// The key of the property.
  String key;

  /// The path in the property value to query.
  String path;

  /// The type of the property value extraction. Not available if the extraction for the property is not registered on the instance with the [Entity property](https://developer.atlassian.com/cloud/jira/platform/modules/entity-property/) module.
  JqlQueryFieldEntityPropertyTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JqlQueryFieldEntityProperty &&
    other.entity == entity &&
    other.key == key &&
    other.path == path &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entity.hashCode) +
    (key.hashCode) +
    (path.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'JqlQueryFieldEntityProperty[entity=$entity, key=$key, path=$path, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entity'] = this.entity;
      json[r'key'] = this.key;
      json[r'path'] = this.path;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [JqlQueryFieldEntityProperty] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JqlQueryFieldEntityProperty? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'entity'), 'Required key "JqlQueryFieldEntityProperty[entity]" is missing from JSON.');
        assert(json[r'entity'] != null, 'Required key "JqlQueryFieldEntityProperty[entity]" has a null value in JSON.');
        assert(json.containsKey(r'key'), 'Required key "JqlQueryFieldEntityProperty[key]" is missing from JSON.');
        assert(json[r'key'] != null, 'Required key "JqlQueryFieldEntityProperty[key]" has a null value in JSON.');
        assert(json.containsKey(r'path'), 'Required key "JqlQueryFieldEntityProperty[path]" is missing from JSON.');
        assert(json[r'path'] != null, 'Required key "JqlQueryFieldEntityProperty[path]" has a null value in JSON.');
        return true;
      }());

      return JqlQueryFieldEntityProperty(
        entity: mapValueOfType<String>(json, r'entity')!,
        key: mapValueOfType<String>(json, r'key')!,
        path: mapValueOfType<String>(json, r'path')!,
        type: JqlQueryFieldEntityPropertyTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<JqlQueryFieldEntityProperty> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryFieldEntityProperty>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryFieldEntityProperty.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JqlQueryFieldEntityProperty> mapFromJson(dynamic json) {
    final map = <String, JqlQueryFieldEntityProperty>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JqlQueryFieldEntityProperty.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JqlQueryFieldEntityProperty-objects as value to a dart map
  static Map<String, List<JqlQueryFieldEntityProperty>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JqlQueryFieldEntityProperty>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JqlQueryFieldEntityProperty.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'entity',
    'key',
    'path',
  };
}

/// The type of the property value extraction. Not available if the extraction for the property is not registered on the instance with the [Entity property](https://developer.atlassian.com/cloud/jira/platform/modules/entity-property/) module.
enum JqlQueryFieldEntityPropertyTypeEnum {
  number._(r'number'),
  string._(r'string'),
  text._(r'text'),
  date._(r'date'),
  user._(r'user'),
  ;

  /// Instantiate a new enum with the provided value.
  const JqlQueryFieldEntityPropertyTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JqlQueryFieldEntityPropertyTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JqlQueryFieldEntityPropertyTypeEnum? fromJson(dynamic value) => JqlQueryFieldEntityPropertyTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JqlQueryFieldEntityPropertyTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JqlQueryFieldEntityPropertyTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JqlQueryFieldEntityPropertyTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JqlQueryFieldEntityPropertyTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JqlQueryFieldEntityPropertyTypeEnum] to String,
/// and [decode] dynamic data back to [JqlQueryFieldEntityPropertyTypeEnum].
class JqlQueryFieldEntityPropertyTypeEnumTypeTransformer {
  factory JqlQueryFieldEntityPropertyTypeEnumTypeTransformer() => _instance ??= const JqlQueryFieldEntityPropertyTypeEnumTypeTransformer._();

  const JqlQueryFieldEntityPropertyTypeEnumTypeTransformer._();

  String encode(JqlQueryFieldEntityPropertyTypeEnum data) => data._value;

  /// Returns the instance of [JqlQueryFieldEntityPropertyTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JqlQueryFieldEntityPropertyTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JqlQueryFieldEntityPropertyTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'number': return JqlQueryFieldEntityPropertyTypeEnum.number;
        case r'string': return JqlQueryFieldEntityPropertyTypeEnum.string;
        case r'text': return JqlQueryFieldEntityPropertyTypeEnum.text;
        case r'date': return JqlQueryFieldEntityPropertyTypeEnum.date;
        case r'user': return JqlQueryFieldEntityPropertyTypeEnum.user;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JqlQueryFieldEntityPropertyTypeEnumTypeTransformer? _instance;
}


