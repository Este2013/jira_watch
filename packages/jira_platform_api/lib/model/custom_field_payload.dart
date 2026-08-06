//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CustomFieldPayload {
  /// Returns a new [CustomFieldPayload] instance.
  CustomFieldPayload({
    this.cfType,
    this.description,
    this.name,
    this.onConflict,
    this.pcri,
    this.scope,
    this.searcherKey,
  });

  /// The type of the custom field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cfType;

  /// The description of the custom field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the custom field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The strategy to use when there is a conflict with an existing custom field. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
  CustomFieldPayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  /// Allows an overwrite to declare the new Custom Field to be created as a GLOBAL-scoped field. Leave this as empty or null to use the project's default scope.
  CustomFieldPayloadScopeEnum? scope;

  /// The searcher key of the custom field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? searcherKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomFieldPayload &&
    other.cfType == cfType &&
    other.description == description &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri &&
    other.scope == scope &&
    other.searcherKey == searcherKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (cfType == null ? 0 : cfType!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (searcherKey == null ? 0 : searcherKey!.hashCode);

  @override
  String toString() => 'CustomFieldPayload[cfType=$cfType, description=$description, name=$name, onConflict=$onConflict, pcri=$pcri, scope=$scope, searcherKey=$searcherKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.cfType != null) {
      json[r'cfType'] = this.cfType;
    } else {
      json[r'cfType'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
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
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.searcherKey != null) {
      json[r'searcherKey'] = this.searcherKey;
    } else {
      json[r'searcherKey'] = null;
    }
    return json;
  }

  /// Returns a new [CustomFieldPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CustomFieldPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CustomFieldPayload(
        cfType: mapValueOfType<String>(json, r'cfType'),
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: CustomFieldPayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        scope: CustomFieldPayloadScopeEnum.fromJson(json[r'scope']),
        searcherKey: mapValueOfType<String>(json, r'searcherKey'),
      );
    }
    return null;
  }

  static List<CustomFieldPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CustomFieldPayload> mapFromJson(dynamic json) {
    final map = <String, CustomFieldPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CustomFieldPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CustomFieldPayload-objects as value to a dart map
  static Map<String, List<CustomFieldPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CustomFieldPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CustomFieldPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The strategy to use when there is a conflict with an existing custom field. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
enum CustomFieldPayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const CustomFieldPayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomFieldPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomFieldPayloadOnConflictEnum? fromJson(dynamic value) => CustomFieldPayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomFieldPayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomFieldPayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldPayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldPayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomFieldPayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [CustomFieldPayloadOnConflictEnum].
class CustomFieldPayloadOnConflictEnumTypeTransformer {
  factory CustomFieldPayloadOnConflictEnumTypeTransformer() => _instance ??= const CustomFieldPayloadOnConflictEnumTypeTransformer._();

  const CustomFieldPayloadOnConflictEnumTypeTransformer._();

  String encode(CustomFieldPayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [CustomFieldPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomFieldPayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomFieldPayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return CustomFieldPayloadOnConflictEnum.FAIL;
        case r'USE': return CustomFieldPayloadOnConflictEnum.USE;
        case r'NEW': return CustomFieldPayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomFieldPayloadOnConflictEnumTypeTransformer? _instance;
}


/// Allows an overwrite to declare the new Custom Field to be created as a GLOBAL-scoped field. Leave this as empty or null to use the project's default scope.
enum CustomFieldPayloadScopeEnum {
  GLOBAL._(r'GLOBAL'),
  TEMPLATE._(r'TEMPLATE'),
  PROJECT._(r'PROJECT'),
  ;

  /// Instantiate a new enum with the provided value.
  const CustomFieldPayloadScopeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CustomFieldPayloadScopeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CustomFieldPayloadScopeEnum? fromJson(dynamic value) => CustomFieldPayloadScopeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CustomFieldPayloadScopeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CustomFieldPayloadScopeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CustomFieldPayloadScopeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CustomFieldPayloadScopeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CustomFieldPayloadScopeEnum] to String,
/// and [decode] dynamic data back to [CustomFieldPayloadScopeEnum].
class CustomFieldPayloadScopeEnumTypeTransformer {
  factory CustomFieldPayloadScopeEnumTypeTransformer() => _instance ??= const CustomFieldPayloadScopeEnumTypeTransformer._();

  const CustomFieldPayloadScopeEnumTypeTransformer._();

  String encode(CustomFieldPayloadScopeEnum data) => data._value;

  /// Returns the instance of [CustomFieldPayloadScopeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CustomFieldPayloadScopeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CustomFieldPayloadScopeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'GLOBAL': return CustomFieldPayloadScopeEnum.GLOBAL;
        case r'TEMPLATE': return CustomFieldPayloadScopeEnum.TEMPLATE;
        case r'PROJECT': return CustomFieldPayloadScopeEnum.PROJECT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CustomFieldPayloadScopeEnumTypeTransformer? _instance;
}


