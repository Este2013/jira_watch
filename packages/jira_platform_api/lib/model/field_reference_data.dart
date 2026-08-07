//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldReferenceData {
  /// Returns a new [FieldReferenceData] instance.
  FieldReferenceData({
    this.auto,
    this.cfid,
    this.deprecated,
    this.deprecatedSearcherKey,
    this.displayName,
    this.operators = const [],
    this.orderable,
    this.searchable,
    this.types = const [],
    this.value,
  });

  /// Whether the field provide auto-complete suggestions.
  FieldReferenceDataAutoEnum? auto;

  /// If the item is a custom field, the ID of the custom field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? cfid;

  /// Whether this field has been deprecated.
  FieldReferenceDataDeprecatedEnum? deprecated;

  /// The searcher key of the field, only passed when the field is deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? deprecatedSearcherKey;

  /// The display name contains the following:   *  for system fields, the field name. For example, `Summary`.  *  for collapsed custom fields, the field name followed by a hyphen and then the field name and field type. For example, `Component - Component[Dropdown]`.  *  for other custom fields, the field name followed by a hyphen and then the custom field ID. For example, `Component - cf[10061]`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? displayName;

  /// The valid search operators for the field.
  List<String> operators;

  /// Whether the field can be used in a query's `ORDER BY` clause.
  FieldReferenceDataOrderableEnum? orderable;

  /// Whether the content of this field can be searched.
  FieldReferenceDataSearchableEnum? searchable;

  /// The data types of items in the field.
  List<String> types;

  /// The field identifier.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? value;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldReferenceData &&
    other.auto == auto &&
    other.cfid == cfid &&
    other.deprecated == deprecated &&
    other.deprecatedSearcherKey == deprecatedSearcherKey &&
    other.displayName == displayName &&
    _deepEquality.equals(other.operators, operators) &&
    other.orderable == orderable &&
    other.searchable == searchable &&
    _deepEquality.equals(other.types, types) &&
    other.value == value;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (auto == null ? 0 : auto!.hashCode) +
    (cfid == null ? 0 : cfid!.hashCode) +
    (deprecated == null ? 0 : deprecated!.hashCode) +
    (deprecatedSearcherKey == null ? 0 : deprecatedSearcherKey!.hashCode) +
    (displayName == null ? 0 : displayName!.hashCode) +
    (operators.hashCode) +
    (orderable == null ? 0 : orderable!.hashCode) +
    (searchable == null ? 0 : searchable!.hashCode) +
    (types.hashCode) +
    (value == null ? 0 : value!.hashCode);

  @override
  String toString() => 'FieldReferenceData[auto=$auto, cfid=$cfid, deprecated=$deprecated, deprecatedSearcherKey=$deprecatedSearcherKey, displayName=$displayName, operators=$operators, orderable=$orderable, searchable=$searchable, types=$types, value=$value]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.auto != null) {
      json[r'auto'] = this.auto;
    } else {
      json[r'auto'] = null;
    }
    if (this.cfid != null) {
      json[r'cfid'] = this.cfid;
    } else {
      json[r'cfid'] = null;
    }
    if (this.deprecated != null) {
      json[r'deprecated'] = this.deprecated;
    } else {
      json[r'deprecated'] = null;
    }
    if (this.deprecatedSearcherKey != null) {
      json[r'deprecatedSearcherKey'] = this.deprecatedSearcherKey;
    } else {
      json[r'deprecatedSearcherKey'] = null;
    }
    if (this.displayName != null) {
      json[r'displayName'] = this.displayName;
    } else {
      json[r'displayName'] = null;
    }
      json[r'operators'] = this.operators;
    if (this.orderable != null) {
      json[r'orderable'] = this.orderable;
    } else {
      json[r'orderable'] = null;
    }
    if (this.searchable != null) {
      json[r'searchable'] = this.searchable;
    } else {
      json[r'searchable'] = null;
    }
      json[r'types'] = this.types;
    if (this.value != null) {
      json[r'value'] = this.value;
    } else {
      json[r'value'] = null;
    }
    return json;
  }

  /// Returns a new [FieldReferenceData] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldReferenceData? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldReferenceData(
        auto: FieldReferenceDataAutoEnum.fromJson(json[r'auto']),
        cfid: mapValueOfType<String>(json, r'cfid'),
        deprecated: FieldReferenceDataDeprecatedEnum.fromJson(json[r'deprecated']),
        deprecatedSearcherKey: mapValueOfType<String>(json, r'deprecatedSearcherKey'),
        displayName: mapValueOfType<String>(json, r'displayName'),
        operators: json[r'operators'] is Iterable
            ? (json[r'operators'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        orderable: FieldReferenceDataOrderableEnum.fromJson(json[r'orderable']),
        searchable: FieldReferenceDataSearchableEnum.fromJson(json[r'searchable']),
        types: json[r'types'] is Iterable
            ? (json[r'types'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        value: mapValueOfType<String>(json, r'value'),
      );
    }
    return null;
  }

  static List<FieldReferenceData> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldReferenceData>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldReferenceData.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldReferenceData> mapFromJson(dynamic json) {
    final map = <String, FieldReferenceData>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldReferenceData.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldReferenceData-objects as value to a dart map
  static Map<String, List<FieldReferenceData>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldReferenceData>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldReferenceData.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Whether the field provide auto-complete suggestions.
enum FieldReferenceDataAutoEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldReferenceDataAutoEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldReferenceDataAutoEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldReferenceDataAutoEnum? fromJson(dynamic value) => FieldReferenceDataAutoEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldReferenceDataAutoEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldReferenceDataAutoEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldReferenceDataAutoEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldReferenceDataAutoEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldReferenceDataAutoEnum] to String,
/// and [decode] dynamic data back to [FieldReferenceDataAutoEnum].
class FieldReferenceDataAutoEnumTypeTransformer {
  factory FieldReferenceDataAutoEnumTypeTransformer() => _instance ??= const FieldReferenceDataAutoEnumTypeTransformer._();

  const FieldReferenceDataAutoEnumTypeTransformer._();

  String encode(FieldReferenceDataAutoEnum data) => data._value;

  /// Returns the instance of [FieldReferenceDataAutoEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldReferenceDataAutoEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldReferenceDataAutoEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return FieldReferenceDataAutoEnum.true_;
        case r'false': return FieldReferenceDataAutoEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldReferenceDataAutoEnumTypeTransformer? _instance;
}


/// Whether this field has been deprecated.
enum FieldReferenceDataDeprecatedEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldReferenceDataDeprecatedEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldReferenceDataDeprecatedEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldReferenceDataDeprecatedEnum? fromJson(dynamic value) => FieldReferenceDataDeprecatedEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldReferenceDataDeprecatedEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldReferenceDataDeprecatedEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldReferenceDataDeprecatedEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldReferenceDataDeprecatedEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldReferenceDataDeprecatedEnum] to String,
/// and [decode] dynamic data back to [FieldReferenceDataDeprecatedEnum].
class FieldReferenceDataDeprecatedEnumTypeTransformer {
  factory FieldReferenceDataDeprecatedEnumTypeTransformer() => _instance ??= const FieldReferenceDataDeprecatedEnumTypeTransformer._();

  const FieldReferenceDataDeprecatedEnumTypeTransformer._();

  String encode(FieldReferenceDataDeprecatedEnum data) => data._value;

  /// Returns the instance of [FieldReferenceDataDeprecatedEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldReferenceDataDeprecatedEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldReferenceDataDeprecatedEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return FieldReferenceDataDeprecatedEnum.true_;
        case r'false': return FieldReferenceDataDeprecatedEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldReferenceDataDeprecatedEnumTypeTransformer? _instance;
}


/// Whether the field can be used in a query's `ORDER BY` clause.
enum FieldReferenceDataOrderableEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldReferenceDataOrderableEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldReferenceDataOrderableEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldReferenceDataOrderableEnum? fromJson(dynamic value) => FieldReferenceDataOrderableEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldReferenceDataOrderableEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldReferenceDataOrderableEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldReferenceDataOrderableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldReferenceDataOrderableEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldReferenceDataOrderableEnum] to String,
/// and [decode] dynamic data back to [FieldReferenceDataOrderableEnum].
class FieldReferenceDataOrderableEnumTypeTransformer {
  factory FieldReferenceDataOrderableEnumTypeTransformer() => _instance ??= const FieldReferenceDataOrderableEnumTypeTransformer._();

  const FieldReferenceDataOrderableEnumTypeTransformer._();

  String encode(FieldReferenceDataOrderableEnum data) => data._value;

  /// Returns the instance of [FieldReferenceDataOrderableEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldReferenceDataOrderableEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldReferenceDataOrderableEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return FieldReferenceDataOrderableEnum.true_;
        case r'false': return FieldReferenceDataOrderableEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldReferenceDataOrderableEnumTypeTransformer? _instance;
}


/// Whether the content of this field can be searched.
enum FieldReferenceDataSearchableEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldReferenceDataSearchableEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldReferenceDataSearchableEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldReferenceDataSearchableEnum? fromJson(dynamic value) => FieldReferenceDataSearchableEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldReferenceDataSearchableEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldReferenceDataSearchableEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldReferenceDataSearchableEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldReferenceDataSearchableEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldReferenceDataSearchableEnum] to String,
/// and [decode] dynamic data back to [FieldReferenceDataSearchableEnum].
class FieldReferenceDataSearchableEnumTypeTransformer {
  factory FieldReferenceDataSearchableEnumTypeTransformer() => _instance ??= const FieldReferenceDataSearchableEnumTypeTransformer._();

  const FieldReferenceDataSearchableEnumTypeTransformer._();

  String encode(FieldReferenceDataSearchableEnum data) => data._value;

  /// Returns the instance of [FieldReferenceDataSearchableEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldReferenceDataSearchableEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldReferenceDataSearchableEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return FieldReferenceDataSearchableEnum.true_;
        case r'false': return FieldReferenceDataSearchableEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldReferenceDataSearchableEnumTypeTransformer? _instance;
}


