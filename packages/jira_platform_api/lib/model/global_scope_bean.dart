//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GlobalScopeBean {
  /// Returns a new [GlobalScopeBean] instance.
  GlobalScopeBean({
    this.attributes = const [],
  });

  /// Defines the behavior of the option in the global context.If notSelectable is set, the option cannot be set as the field's value. This is useful for archiving an option that has previously been selected but shouldn't be used anymore.If defaultValue is set, the option is selected by default.
  List<GlobalScopeBeanAttributesEnum> attributes;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GlobalScopeBean &&
    _deepEquality.equals(other.attributes, attributes);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (attributes.hashCode);

  @override
  String toString() => 'GlobalScopeBean[attributes=$attributes]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'attributes'] = this.attributes;
    return json;
  }

  /// Returns a new [GlobalScopeBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GlobalScopeBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GlobalScopeBean(
        attributes: GlobalScopeBeanAttributesEnum.listFromJson(json[r'attributes']),
      );
    }
    return null;
  }

  static List<GlobalScopeBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GlobalScopeBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GlobalScopeBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GlobalScopeBean> mapFromJson(dynamic json) {
    final map = <String, GlobalScopeBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GlobalScopeBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GlobalScopeBean-objects as value to a dart map
  static Map<String, List<GlobalScopeBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GlobalScopeBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GlobalScopeBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum GlobalScopeBeanAttributesEnum {
  notSelectable._(r'notSelectable'),
  defaultValue._(r'defaultValue'),
  ;

  /// Instantiate a new enum with the provided value.
  const GlobalScopeBeanAttributesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GlobalScopeBeanAttributesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GlobalScopeBeanAttributesEnum? fromJson(dynamic value) => GlobalScopeBeanAttributesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GlobalScopeBeanAttributesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GlobalScopeBeanAttributesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GlobalScopeBeanAttributesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GlobalScopeBeanAttributesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GlobalScopeBeanAttributesEnum] to String,
/// and [decode] dynamic data back to [GlobalScopeBeanAttributesEnum].
class GlobalScopeBeanAttributesEnumTypeTransformer {
  factory GlobalScopeBeanAttributesEnumTypeTransformer() => _instance ??= const GlobalScopeBeanAttributesEnumTypeTransformer._();

  const GlobalScopeBeanAttributesEnumTypeTransformer._();

  String encode(GlobalScopeBeanAttributesEnum data) => data._value;

  /// Returns the instance of [GlobalScopeBeanAttributesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GlobalScopeBeanAttributesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GlobalScopeBeanAttributesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'notSelectable': return GlobalScopeBeanAttributesEnum.notSelectable;
        case r'defaultValue': return GlobalScopeBeanAttributesEnum.defaultValue;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GlobalScopeBeanAttributesEnumTypeTransformer? _instance;
}


