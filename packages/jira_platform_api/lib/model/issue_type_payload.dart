//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypePayload {
  /// Returns a new [IssueTypePayload] instance.
  IssueTypePayload({
    this.avatarId,
    this.description,
    this.hierarchyLevel,
    this.name,
    this.onConflict,
    this.pcri,
  });

  /// The avatar ID of the issue type. Go to https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-avatars/\\#api-rest-api-3-avatar-type-system-get to choose an avatarId existing in Jira
  int? avatarId;

  /// The description of the issue type
  String? description;

  /// The hierarchy level of the issue type. 0, 1, 2, 3 .. n; Negative values for subtasks
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? hierarchyLevel;

  /// The name of the issue type
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The conflict strategy to use when the issue type already exists. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
  IssueTypePayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypePayload &&
    other.avatarId == avatarId &&
    other.description == description &&
    other.hierarchyLevel == hierarchyLevel &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (hierarchyLevel == null ? 0 : hierarchyLevel!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'IssueTypePayload[avatarId=$avatarId, description=$description, hierarchyLevel=$hierarchyLevel, name=$name, onConflict=$onConflict, pcri=$pcri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarId != null) {
      json[r'avatarId'] = this.avatarId;
    } else {
      json[r'avatarId'] = null;
    }
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
    return json;
  }

  /// Returns a new [IssueTypePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypePayload(
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        description: mapValueOfType<String>(json, r'description'),
        hierarchyLevel: mapValueOfType<int>(json, r'hierarchyLevel'),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: IssueTypePayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<IssueTypePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypePayload> mapFromJson(dynamic json) {
    final map = <String, IssueTypePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypePayload-objects as value to a dart map
  static Map<String, List<IssueTypePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The conflict strategy to use when the issue type already exists. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
enum IssueTypePayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueTypePayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueTypePayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueTypePayloadOnConflictEnum? fromJson(dynamic value) => IssueTypePayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueTypePayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueTypePayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypePayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypePayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueTypePayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [IssueTypePayloadOnConflictEnum].
class IssueTypePayloadOnConflictEnumTypeTransformer {
  factory IssueTypePayloadOnConflictEnumTypeTransformer() => _instance ??= const IssueTypePayloadOnConflictEnumTypeTransformer._();

  const IssueTypePayloadOnConflictEnumTypeTransformer._();

  String encode(IssueTypePayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [IssueTypePayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueTypePayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueTypePayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return IssueTypePayloadOnConflictEnum.FAIL;
        case r'USE': return IssueTypePayloadOnConflictEnum.USE;
        case r'NEW': return IssueTypePayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueTypePayloadOnConflictEnumTypeTransformer? _instance;
}


