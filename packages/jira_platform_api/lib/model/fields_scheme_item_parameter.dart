//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldsSchemeItemParameter {
  /// Returns a new [FieldsSchemeItemParameter] instance.
  FieldsSchemeItemParameter({
    this.description,
    this.isRequired,
    this.rendererType,
  });

  /// The custom description for the field, null to preserve current description
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Whether the field is required, null to preserve current requirement setting
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isRequired;

  /// The renderer type for the field, null to preserve current renderer type
  FieldsSchemeItemParameterRendererTypeEnum? rendererType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldsSchemeItemParameter &&
    other.description == description &&
    other.isRequired == isRequired &&
    other.rendererType == rendererType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (rendererType == null ? 0 : rendererType!.hashCode);

  @override
  String toString() => 'FieldsSchemeItemParameter[description=$description, isRequired=$isRequired, rendererType=$rendererType]';

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
    return json;
  }

  /// Returns a new [FieldsSchemeItemParameter] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldsSchemeItemParameter? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldsSchemeItemParameter(
        description: mapValueOfType<String>(json, r'description'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        rendererType: FieldsSchemeItemParameterRendererTypeEnum.fromJson(json[r'rendererType']),
      );
    }
    return null;
  }

  static List<FieldsSchemeItemParameter> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldsSchemeItemParameter>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldsSchemeItemParameter.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldsSchemeItemParameter> mapFromJson(dynamic json) {
    final map = <String, FieldsSchemeItemParameter>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldsSchemeItemParameter.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldsSchemeItemParameter-objects as value to a dart map
  static Map<String, List<FieldsSchemeItemParameter>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldsSchemeItemParameter>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldsSchemeItemParameter.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The renderer type for the field, null to preserve current renderer type
enum FieldsSchemeItemParameterRendererTypeEnum {
  jiraTextRenderer._(r'jira-text-renderer'),
  atlassianWikiRenderer._(r'atlassian-wiki-renderer'),
  ;

  /// Instantiate a new enum with the provided value.
  const FieldsSchemeItemParameterRendererTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [FieldsSchemeItemParameterRendererTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static FieldsSchemeItemParameterRendererTypeEnum? fromJson(dynamic value) => FieldsSchemeItemParameterRendererTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [FieldsSchemeItemParameterRendererTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<FieldsSchemeItemParameterRendererTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldsSchemeItemParameterRendererTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldsSchemeItemParameterRendererTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [FieldsSchemeItemParameterRendererTypeEnum] to String,
/// and [decode] dynamic data back to [FieldsSchemeItemParameterRendererTypeEnum].
class FieldsSchemeItemParameterRendererTypeEnumTypeTransformer {
  factory FieldsSchemeItemParameterRendererTypeEnumTypeTransformer() => _instance ??= const FieldsSchemeItemParameterRendererTypeEnumTypeTransformer._();

  const FieldsSchemeItemParameterRendererTypeEnumTypeTransformer._();

  String encode(FieldsSchemeItemParameterRendererTypeEnum data) => data._value;

  /// Returns the instance of [FieldsSchemeItemParameterRendererTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  FieldsSchemeItemParameterRendererTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is FieldsSchemeItemParameterRendererTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'jira-text-renderer': return FieldsSchemeItemParameterRendererTypeEnum.jiraTextRenderer;
        case r'atlassian-wiki-renderer': return FieldsSchemeItemParameterRendererTypeEnum.atlassianWikiRenderer;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static FieldsSchemeItemParameterRendererTypeEnumTypeTransformer? _instance;
}


