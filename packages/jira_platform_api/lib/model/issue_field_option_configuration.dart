//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueFieldOptionConfiguration {
  /// Returns a new [IssueFieldOptionConfiguration] instance.
  IssueFieldOptionConfiguration({
    this.attributes = const [],
    this.scope,
  });

  /// DEPRECATED
  List<IssueFieldOptionConfigurationAttributesEnum> attributes;

  /// Defines the projects that the option is available in. If the scope is not defined, then the option is available in all projects.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  IssueFieldOptionScopeBean? scope;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueFieldOptionConfiguration &&
    _deepEquality.equals(other.attributes, attributes) &&
    other.scope == scope;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (attributes.hashCode) +
    (scope == null ? 0 : scope!.hashCode);

  @override
  String toString() => 'IssueFieldOptionConfiguration[attributes=$attributes, scope=$scope]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'attributes'] = this.attributes;
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    return json;
  }

  /// Returns a new [IssueFieldOptionConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueFieldOptionConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueFieldOptionConfiguration(
        attributes: IssueFieldOptionConfigurationAttributesEnum.listFromJson(json[r'attributes']),
        scope: IssueFieldOptionScopeBean.fromJson(json[r'scope']),
      );
    }
    return null;
  }

  static List<IssueFieldOptionConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueFieldOptionConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueFieldOptionConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueFieldOptionConfiguration> mapFromJson(dynamic json) {
    final map = <String, IssueFieldOptionConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueFieldOptionConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueFieldOptionConfiguration-objects as value to a dart map
  static Map<String, List<IssueFieldOptionConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueFieldOptionConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueFieldOptionConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum IssueFieldOptionConfigurationAttributesEnum {
  notSelectable._(r'notSelectable'),
  defaultValue._(r'defaultValue'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueFieldOptionConfigurationAttributesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueFieldOptionConfigurationAttributesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueFieldOptionConfigurationAttributesEnum? fromJson(dynamic value) => IssueFieldOptionConfigurationAttributesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueFieldOptionConfigurationAttributesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueFieldOptionConfigurationAttributesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueFieldOptionConfigurationAttributesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueFieldOptionConfigurationAttributesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueFieldOptionConfigurationAttributesEnum] to String,
/// and [decode] dynamic data back to [IssueFieldOptionConfigurationAttributesEnum].
class IssueFieldOptionConfigurationAttributesEnumTypeTransformer {
  factory IssueFieldOptionConfigurationAttributesEnumTypeTransformer() => _instance ??= const IssueFieldOptionConfigurationAttributesEnumTypeTransformer._();

  const IssueFieldOptionConfigurationAttributesEnumTypeTransformer._();

  String encode(IssueFieldOptionConfigurationAttributesEnum data) => data._value;

  /// Returns the instance of [IssueFieldOptionConfigurationAttributesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueFieldOptionConfigurationAttributesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueFieldOptionConfigurationAttributesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'notSelectable': return IssueFieldOptionConfigurationAttributesEnum.notSelectable;
        case r'defaultValue': return IssueFieldOptionConfigurationAttributesEnum.defaultValue;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueFieldOptionConfigurationAttributesEnumTypeTransformer? _instance;
}


