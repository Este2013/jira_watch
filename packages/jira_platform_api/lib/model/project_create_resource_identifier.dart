//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ProjectCreateResourceIdentifier {
  /// Returns a new [ProjectCreateResourceIdentifier] instance.
  ProjectCreateResourceIdentifier({
    this.anID,
    this.areference,
    this.entityId,
    this.entityType,
    this.id,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? anID;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? areference;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? entityId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? entityType;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  ProjectCreateResourceIdentifierTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ProjectCreateResourceIdentifier &&
    other.anID == anID &&
    other.areference == areference &&
    other.entityId == entityId &&
    other.entityType == entityType &&
    other.id == id &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (anID == null ? 0 : anID!.hashCode) +
    (areference == null ? 0 : areference!.hashCode) +
    (entityId == null ? 0 : entityId!.hashCode) +
    (entityType == null ? 0 : entityType!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'ProjectCreateResourceIdentifier[anID=$anID, areference=$areference, entityId=$entityId, entityType=$entityType, id=$id, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.anID != null) {
      json[r'anID'] = this.anID;
    } else {
      json[r'anID'] = null;
    }
    if (this.areference != null) {
      json[r'areference'] = this.areference;
    } else {
      json[r'areference'] = null;
    }
    if (this.entityId != null) {
      json[r'entityId'] = this.entityId;
    } else {
      json[r'entityId'] = null;
    }
    if (this.entityType != null) {
      json[r'entityType'] = this.entityType;
    } else {
      json[r'entityType'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [ProjectCreateResourceIdentifier] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ProjectCreateResourceIdentifier? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ProjectCreateResourceIdentifier(
        anID: mapValueOfType<bool>(json, r'anID'),
        areference: mapValueOfType<bool>(json, r'areference'),
        entityId: mapValueOfType<String>(json, r'entityId'),
        entityType: mapValueOfType<String>(json, r'entityType'),
        id: mapValueOfType<String>(json, r'id'),
        type: ProjectCreateResourceIdentifierTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<ProjectCreateResourceIdentifier> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectCreateResourceIdentifier>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectCreateResourceIdentifier.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ProjectCreateResourceIdentifier> mapFromJson(dynamic json) {
    final map = <String, ProjectCreateResourceIdentifier>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ProjectCreateResourceIdentifier.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ProjectCreateResourceIdentifier-objects as value to a dart map
  static Map<String, List<ProjectCreateResourceIdentifier>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ProjectCreateResourceIdentifier>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ProjectCreateResourceIdentifier.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum ProjectCreateResourceIdentifierTypeEnum {
  id._(r'id'),
  ref._(r'ref'),
  ;

  /// Instantiate a new enum with the provided value.
  const ProjectCreateResourceIdentifierTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ProjectCreateResourceIdentifierTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ProjectCreateResourceIdentifierTypeEnum? fromJson(dynamic value) => ProjectCreateResourceIdentifierTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ProjectCreateResourceIdentifierTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ProjectCreateResourceIdentifierTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ProjectCreateResourceIdentifierTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ProjectCreateResourceIdentifierTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ProjectCreateResourceIdentifierTypeEnum] to String,
/// and [decode] dynamic data back to [ProjectCreateResourceIdentifierTypeEnum].
class ProjectCreateResourceIdentifierTypeEnumTypeTransformer {
  factory ProjectCreateResourceIdentifierTypeEnumTypeTransformer() => _instance ??= const ProjectCreateResourceIdentifierTypeEnumTypeTransformer._();

  const ProjectCreateResourceIdentifierTypeEnumTypeTransformer._();

  String encode(ProjectCreateResourceIdentifierTypeEnum data) => data._value;

  /// Returns the instance of [ProjectCreateResourceIdentifierTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ProjectCreateResourceIdentifierTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ProjectCreateResourceIdentifierTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'id': return ProjectCreateResourceIdentifierTypeEnum.id;
        case r'ref': return ProjectCreateResourceIdentifierTypeEnum.ref;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ProjectCreateResourceIdentifierTypeEnumTypeTransformer? _instance;
}


