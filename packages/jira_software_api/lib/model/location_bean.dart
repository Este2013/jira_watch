//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class LocationBean {
  /// Returns a new [LocationBean] instance.
  LocationBean({
    this.projectKeyOrId,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? projectKeyOrId;

  LocationBeanTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is LocationBean &&
    other.projectKeyOrId == projectKeyOrId &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectKeyOrId == null ? 0 : projectKeyOrId!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'LocationBean[projectKeyOrId=$projectKeyOrId, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectKeyOrId != null) {
      json[r'projectKeyOrId'] = this.projectKeyOrId;
    } else {
      json[r'projectKeyOrId'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [LocationBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static LocationBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return LocationBean(
        projectKeyOrId: mapValueOfType<String>(json, r'projectKeyOrId'),
        type: LocationBeanTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<LocationBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LocationBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LocationBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, LocationBean> mapFromJson(dynamic json) {
    final map = <String, LocationBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = LocationBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of LocationBean-objects as value to a dart map
  static Map<String, List<LocationBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<LocationBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = LocationBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum LocationBeanTypeEnum {
  project._(r'project'),
  user._(r'user'),
  ;

  /// Instantiate a new enum with the provided value.
  const LocationBeanTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [LocationBeanTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static LocationBeanTypeEnum? fromJson(dynamic value) => LocationBeanTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [LocationBeanTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<LocationBeanTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <LocationBeanTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = LocationBeanTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [LocationBeanTypeEnum] to String,
/// and [decode] dynamic data back to [LocationBeanTypeEnum].
class LocationBeanTypeEnumTypeTransformer {
  factory LocationBeanTypeEnumTypeTransformer() => _instance ??= const LocationBeanTypeEnumTypeTransformer._();

  const LocationBeanTypeEnumTypeTransformer._();

  String encode(LocationBeanTypeEnum data) => data._value;

  /// Returns the instance of [LocationBeanTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  LocationBeanTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is LocationBeanTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'project': return LocationBeanTypeEnum.project;
        case r'user': return LocationBeanTypeEnum.user;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static LocationBeanTypeEnumTypeTransformer? _instance;
}


