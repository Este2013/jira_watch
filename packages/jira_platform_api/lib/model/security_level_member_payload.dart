//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SecurityLevelMemberPayload {
  /// Returns a new [SecurityLevelMemberPayload] instance.
  SecurityLevelMemberPayload({
    this.parameter,
    this.type,
  });

  /// Defines the value associated with the type. For reporter this would be \\{\"null\"\\}; for users this would be the names of specific users); for group this would be group names like \\{\"administrators\", \"jira-administrators\", \"jira-users\"\\}
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parameter;

  /// The type of the security level member
  SecurityLevelMemberPayloadTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SecurityLevelMemberPayload &&
    other.parameter == parameter &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (parameter == null ? 0 : parameter!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'SecurityLevelMemberPayload[parameter=$parameter, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.parameter != null) {
      json[r'parameter'] = this.parameter;
    } else {
      json[r'parameter'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [SecurityLevelMemberPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SecurityLevelMemberPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SecurityLevelMemberPayload(
        parameter: mapValueOfType<String>(json, r'parameter'),
        type: SecurityLevelMemberPayloadTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<SecurityLevelMemberPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecurityLevelMemberPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityLevelMemberPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SecurityLevelMemberPayload> mapFromJson(dynamic json) {
    final map = <String, SecurityLevelMemberPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SecurityLevelMemberPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SecurityLevelMemberPayload-objects as value to a dart map
  static Map<String, List<SecurityLevelMemberPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SecurityLevelMemberPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SecurityLevelMemberPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of the security level member
enum SecurityLevelMemberPayloadTypeEnum {
  group._(r'group'),
  reporter._(r'reporter'),
  users._(r'users'),
  ;

  /// Instantiate a new enum with the provided value.
  const SecurityLevelMemberPayloadTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SecurityLevelMemberPayloadTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SecurityLevelMemberPayloadTypeEnum? fromJson(dynamic value) => SecurityLevelMemberPayloadTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SecurityLevelMemberPayloadTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SecurityLevelMemberPayloadTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SecurityLevelMemberPayloadTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SecurityLevelMemberPayloadTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SecurityLevelMemberPayloadTypeEnum] to String,
/// and [decode] dynamic data back to [SecurityLevelMemberPayloadTypeEnum].
class SecurityLevelMemberPayloadTypeEnumTypeTransformer {
  factory SecurityLevelMemberPayloadTypeEnumTypeTransformer() => _instance ??= const SecurityLevelMemberPayloadTypeEnumTypeTransformer._();

  const SecurityLevelMemberPayloadTypeEnumTypeTransformer._();

  String encode(SecurityLevelMemberPayloadTypeEnum data) => data._value;

  /// Returns the instance of [SecurityLevelMemberPayloadTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SecurityLevelMemberPayloadTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SecurityLevelMemberPayloadTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'group': return SecurityLevelMemberPayloadTypeEnum.group;
        case r'reporter': return SecurityLevelMemberPayloadTypeEnum.reporter;
        case r'users': return SecurityLevelMemberPayloadTypeEnum.users;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SecurityLevelMemberPayloadTypeEnumTypeTransformer? _instance;
}


