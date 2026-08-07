//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SaveProjectTemplateRequest {
  /// Returns a new [SaveProjectTemplateRequest] instance.
  SaveProjectTemplateRequest({
    this.projectId,
    this.templateGenerationOptions,
    this.templateType,
  });

  /// The ID of the target project
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CustomTemplateOptions? templateGenerationOptions;

  /// The type of the template: LIVE | SNAPSHOT
  SaveProjectTemplateRequestTemplateTypeEnum? templateType;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SaveProjectTemplateRequest &&
    other.projectId == projectId &&
    other.templateGenerationOptions == templateGenerationOptions &&
    other.templateType == templateType;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (projectId == null ? 0 : projectId!.hashCode) +
    (templateGenerationOptions == null ? 0 : templateGenerationOptions!.hashCode) +
    (templateType == null ? 0 : templateType!.hashCode);

  @override
  String toString() => 'SaveProjectTemplateRequest[projectId=$projectId, templateGenerationOptions=$templateGenerationOptions, templateType=$templateType]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.projectId != null) {
      json[r'projectId'] = this.projectId;
    } else {
      json[r'projectId'] = null;
    }
    if (this.templateGenerationOptions != null) {
      json[r'templateGenerationOptions'] = this.templateGenerationOptions;
    } else {
      json[r'templateGenerationOptions'] = null;
    }
    if (this.templateType != null) {
      json[r'templateType'] = this.templateType;
    } else {
      json[r'templateType'] = null;
    }
    return json;
  }

  /// Returns a new [SaveProjectTemplateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SaveProjectTemplateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SaveProjectTemplateRequest(
        projectId: mapValueOfType<int>(json, r'projectId'),
        templateGenerationOptions: CustomTemplateOptions.fromJson(json[r'templateGenerationOptions']),
        templateType: SaveProjectTemplateRequestTemplateTypeEnum.fromJson(json[r'templateType']),
      );
    }
    return null;
  }

  static List<SaveProjectTemplateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SaveProjectTemplateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SaveProjectTemplateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SaveProjectTemplateRequest> mapFromJson(dynamic json) {
    final map = <String, SaveProjectTemplateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SaveProjectTemplateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SaveProjectTemplateRequest-objects as value to a dart map
  static Map<String, List<SaveProjectTemplateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SaveProjectTemplateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SaveProjectTemplateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The type of the template: LIVE | SNAPSHOT
enum SaveProjectTemplateRequestTemplateTypeEnum {
  LIVE._(r'LIVE'),
  SNAPSHOT._(r'SNAPSHOT'),
  ;

  /// Instantiate a new enum with the provided value.
  const SaveProjectTemplateRequestTemplateTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SaveProjectTemplateRequestTemplateTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SaveProjectTemplateRequestTemplateTypeEnum? fromJson(dynamic value) => SaveProjectTemplateRequestTemplateTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SaveProjectTemplateRequestTemplateTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SaveProjectTemplateRequestTemplateTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SaveProjectTemplateRequestTemplateTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SaveProjectTemplateRequestTemplateTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SaveProjectTemplateRequestTemplateTypeEnum] to String,
/// and [decode] dynamic data back to [SaveProjectTemplateRequestTemplateTypeEnum].
class SaveProjectTemplateRequestTemplateTypeEnumTypeTransformer {
  factory SaveProjectTemplateRequestTemplateTypeEnumTypeTransformer() => _instance ??= const SaveProjectTemplateRequestTemplateTypeEnumTypeTransformer._();

  const SaveProjectTemplateRequestTemplateTypeEnumTypeTransformer._();

  String encode(SaveProjectTemplateRequestTemplateTypeEnum data) => data._value;

  /// Returns the instance of [SaveProjectTemplateRequestTemplateTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SaveProjectTemplateRequestTemplateTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SaveProjectTemplateRequestTemplateTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'LIVE': return SaveProjectTemplateRequestTemplateTypeEnum.LIVE;
        case r'SNAPSHOT': return SaveProjectTemplateRequestTemplateTypeEnum.SNAPSHOT;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SaveProjectTemplateRequestTemplateTypeEnumTypeTransformer? _instance;
}


