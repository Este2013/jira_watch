//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DefaultShareScope {
  /// Returns a new [DefaultShareScope] instance.
  DefaultShareScope({
    required this.scope,
  });

  /// The scope of the default sharing for new filters and dashboards:   *  `AUTHENTICATED` Shared with all logged-in users.  *  `GLOBAL` Shared with all logged-in users. This shows as `AUTHENTICATED` in the response.  *  `PRIVATE` Not shared with any users.
  DefaultShareScopeScopeEnum scope;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DefaultShareScope &&
    other.scope == scope;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (scope.hashCode);

  @override
  String toString() => 'DefaultShareScope[scope=$scope]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'scope'] = this.scope;
    return json;
  }

  /// Returns a new [DefaultShareScope] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DefaultShareScope? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'scope'), 'Required key "DefaultShareScope[scope]" is missing from JSON.');
        assert(json[r'scope'] != null, 'Required key "DefaultShareScope[scope]" has a null value in JSON.');
        return true;
      }());

      return DefaultShareScope(
        scope: DefaultShareScopeScopeEnum.fromJson(json[r'scope'])!,
      );
    }
    return null;
  }

  static List<DefaultShareScope> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DefaultShareScope>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DefaultShareScope.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DefaultShareScope> mapFromJson(dynamic json) {
    final map = <String, DefaultShareScope>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DefaultShareScope.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DefaultShareScope-objects as value to a dart map
  static Map<String, List<DefaultShareScope>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DefaultShareScope>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DefaultShareScope.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'scope',
  };
}

/// The scope of the default sharing for new filters and dashboards:   *  `AUTHENTICATED` Shared with all logged-in users.  *  `GLOBAL` Shared with all logged-in users. This shows as `AUTHENTICATED` in the response.  *  `PRIVATE` Not shared with any users.
enum DefaultShareScopeScopeEnum {
  GLOBAL._(r'GLOBAL'),
  AUTHENTICATED._(r'AUTHENTICATED'),
  PRIVATE._(r'PRIVATE'),
  ;

  /// Instantiate a new enum with the provided value.
  const DefaultShareScopeScopeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [DefaultShareScopeScopeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static DefaultShareScopeScopeEnum? fromJson(dynamic value) => DefaultShareScopeScopeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [DefaultShareScopeScopeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<DefaultShareScopeScopeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DefaultShareScopeScopeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DefaultShareScopeScopeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [DefaultShareScopeScopeEnum] to String,
/// and [decode] dynamic data back to [DefaultShareScopeScopeEnum].
class DefaultShareScopeScopeEnumTypeTransformer {
  factory DefaultShareScopeScopeEnumTypeTransformer() => _instance ??= const DefaultShareScopeScopeEnumTypeTransformer._();

  const DefaultShareScopeScopeEnumTypeTransformer._();

  String encode(DefaultShareScopeScopeEnum data) => data._value;

  /// Returns the instance of [DefaultShareScopeScopeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  DefaultShareScopeScopeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is DefaultShareScopeScopeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'GLOBAL': return DefaultShareScopeScopeEnum.GLOBAL;
        case r'AUTHENTICATED': return DefaultShareScopeScopeEnum.AUTHENTICATED;
        case r'PRIVATE': return DefaultShareScopeScopeEnum.PRIVATE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static DefaultShareScopeScopeEnumTypeTransformer? _instance;
}


