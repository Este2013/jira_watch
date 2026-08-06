//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeCreateBean {
  /// Returns a new [IssueTypeCreateBean] instance.
  IssueTypeCreateBean({
    this.description,
    this.hierarchyLevel,
    required this.name,
    this.type,
  });

  /// The description of the issue type.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The hierarchy level of the issue type. Use:   *  `-1` for Subtask.  *  `0` for Base.  Defaults to `0`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hierarchyLevel;

  /// The unique name for the issue type. The maximum length is 60 characters.
  String name;

  /// Deprecated. Use `hierarchyLevel` instead. See the [deprecation notice](https://community.developer.atlassian.com/t/deprecation-of-the-epic-link-parent-link-and-other-related-fields-in-rest-apis-and-webhooks/54048) for details.  Whether the issue type is `subtype` or `standard`. Defaults to `standard`.
  IssueTypeCreateBeanTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeCreateBean &&
    other.description == description &&
    other.hierarchyLevel == hierarchyLevel &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (hierarchyLevel == null ? 0 : hierarchyLevel!.hashCode) +
    (name.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'IssueTypeCreateBean[description=$description, hierarchyLevel=$hierarchyLevel, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.hierarchyLevel != null) {
      json[r'hierarchyLevel'] = this.hierarchyLevel;
    } else {
      json[r'hierarchyLevel'] = null;
    }
      json[r'name'] = this.name;
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [IssueTypeCreateBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeCreateBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "IssueTypeCreateBean[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "IssueTypeCreateBean[name]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeCreateBean(
        description: mapValueOfType<String>(json, r'description'),
        hierarchyLevel: mapValueOfType<int>(json, r'hierarchyLevel'),
        name: mapValueOfType<String>(json, r'name')!,
        type: IssueTypeCreateBeanTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<IssueTypeCreateBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeCreateBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeCreateBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeCreateBean> mapFromJson(dynamic json) {
    final map = <String, IssueTypeCreateBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeCreateBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeCreateBean-objects as value to a dart map
  static Map<String, List<IssueTypeCreateBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeCreateBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeCreateBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

/// Deprecated. Use `hierarchyLevel` instead. See the [deprecation notice](https://community.developer.atlassian.com/t/deprecation-of-the-epic-link-parent-link-and-other-related-fields-in-rest-apis-and-webhooks/54048) for details.  Whether the issue type is `subtype` or `standard`. Defaults to `standard`.
enum IssueTypeCreateBeanTypeEnum {
  subtask._(r'subtask'),
  standard._(r'standard'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueTypeCreateBeanTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueTypeCreateBeanTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueTypeCreateBeanTypeEnum? fromJson(dynamic value) => IssueTypeCreateBeanTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueTypeCreateBeanTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueTypeCreateBeanTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeCreateBeanTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeCreateBeanTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueTypeCreateBeanTypeEnum] to String,
/// and [decode] dynamic data back to [IssueTypeCreateBeanTypeEnum].
class IssueTypeCreateBeanTypeEnumTypeTransformer {
  factory IssueTypeCreateBeanTypeEnumTypeTransformer() => _instance ??= const IssueTypeCreateBeanTypeEnumTypeTransformer._();

  const IssueTypeCreateBeanTypeEnumTypeTransformer._();

  String encode(IssueTypeCreateBeanTypeEnum data) => data._value;

  /// Returns the instance of [IssueTypeCreateBeanTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueTypeCreateBeanTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueTypeCreateBeanTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'subtask': return IssueTypeCreateBeanTypeEnum.subtask;
        case r'standard': return IssueTypeCreateBeanTypeEnum.standard;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueTypeCreateBeanTypeEnumTypeTransformer? _instance;
}


