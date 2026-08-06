//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldsSchemeItemWorkTypeParameter {
  /// Returns a new [FieldsSchemeItemWorkTypeParameter] instance.
  FieldsSchemeItemWorkTypeParameter({
    this.description,
    this.isRequired,
    this.rendererType,
    this.workTypeId,
  });

  /// The custom description for the field for this work type, null to use default or preserve current
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Whether the field is required for this work type, null to use default or preserve current
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isRequired;

  /// The renderer type for the field for this work type, null to use default or preserve current
  FieldsSchemeItemWorkTypeParameterRendererTypeEnum? rendererType;

  /// The ID of the work type (issue type) for which these parameters apply
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? workTypeId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldsSchemeItemWorkTypeParameter &&
    other.description == description &&
    other.isRequired == isRequired &&
    other.rendererType == rendererType &&
    other.workTypeId == workTypeId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (rendererType == null ? 0 : rendererType!.hashCode) +
    (workTypeId == null ? 0 : workTypeId!.hashCode);

  @override
  String toString() => 'FieldsSchemeItemWorkTypeParameter[description=$description, isRequired=$isRequired, rendererType=$rendererType, workTypeId=$workTypeId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.isRequired != null) {
      json[r'isRequired'] = this.isRequired;
    } else {
      json[r'isRequired'] = null;
    }
    if (this.rendererType != null) {
      json[r'rendererType'] = this.rendererType;
    } else {
      json[r'rendererType'] = null;
    }
    if (this.workTypeId != null) {
      json[r'workTypeId'] = this.workTypeId;
    } else {
      json[r'workTypeId'] = null;
    }
    return json;
  }

  /// Returns a new [FieldsSchemeItemWorkTypeParameter] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldsSchemeItemWorkTypeParameter? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldsSchemeItemWorkTypeParameter(
        description: mapValueOfType<String>(json, r'description'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        rendererType: FieldsSchemeItemWorkTypeParameterRendererTypeEnum.fromJson(json[r'rendererType']),
        workTypeId: mapValueOfType<int>(json, r'workTypeId'),
      );
    }
    return null;
  }

  static List<FieldsSchemeItemWorkTypeParameter> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldsSchemeItemWorkTypeParameter>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldsSchemeItemWorkTypeParameter.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldsSchemeItemWorkTypeParameter> mapFromJson(dynamic json) {
    final map = <String, FieldsSchemeItemWorkTypeParameter>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldsSchemeItemWorkTypeParameter.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldsSchemeItemWorkTypeParameter-objects as value to a dart map
  static Map<String, List<FieldsSchemeItemWorkTypeParameter>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldsSchemeItemWorkTypeParameter>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldsSchemeItemWorkTypeParameter.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The renderer type for the field for this work type, null to use default or preserve current
enum FieldsSchemeItemWorkTypeParameterRendererTypeEnum {
  jiraTextRenderer._(r'jira-text-renderer'),
  atlassianWikiRenderer._(r'atlassian-wiki-renderer'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldsSchemeItemWorkTypeParameterRendererTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldsSchemeItemWorkTypeParameterRendererTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldsSchemeItemWorkTypeParameterRendererTypeEnum? fromJson(dynamic value) => FieldsSchemeItemWorkTypeParameterRendererTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldsSchemeItemWorkTypeParameterRendererTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldsSchemeItemWorkTypeParameterRendererTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldsSchemeItemWorkTypeParameterRendererTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldsSchemeItemWorkTypeParameterRendererTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldsSchemeItemWorkTypeParameterRendererTypeEnum] to String,
/// and [decode] dynamic data back to [FieldsSchemeItemWorkTypeParameterRendererTypeEnum].
class FieldsSchemeItemWorkTypeParameterRendererTypeEnumTypeTransformer {
  factory FieldsSchemeItemWorkTypeParameterRendererTypeEnumTypeTransformer() => _instance ??= const FieldsSchemeItemWorkTypeParameterRendererTypeEnumTypeTransformer._();

  const FieldsSchemeItemWorkTypeParameterRendererTypeEnumTypeTransformer._();

  String encode(FieldsSchemeItemWorkTypeParameterRendererTypeEnum data) => data._value;

  /// Returns the instance of [FieldsSchemeItemWorkTypeParameterRendererTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldsSchemeItemWorkTypeParameterRendererTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldsSchemeItemWorkTypeParameterRendererTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'jira-text-renderer': return FieldsSchemeItemWorkTypeParameterRendererTypeEnum.jiraTextRenderer;
        case r'atlassian-wiki-renderer': return FieldsSchemeItemWorkTypeParameterRendererTypeEnum.atlassianWikiRenderer;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldsSchemeItemWorkTypeParameterRendererTypeEnumTypeTransformer? _instance;
}


