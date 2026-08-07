//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeHierarchyPayload {
  /// Returns a new [IssueTypeHierarchyPayload] instance.
  IssueTypeHierarchyPayload({
    this.hierarchyLevel,
    this.name,
    this.onConflict,
    this.pcri,
  });

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
  IssueTypeHierarchyPayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeHierarchyPayload &&
    other.hierarchyLevel == hierarchyLevel &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (hierarchyLevel == null ? 0 : hierarchyLevel!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode);

  @override
  String toString() => 'IssueTypeHierarchyPayload[hierarchyLevel=$hierarchyLevel, name=$name, onConflict=$onConflict, pcri=$pcri]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
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

  /// Returns a new [IssueTypeHierarchyPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeHierarchyPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueTypeHierarchyPayload(
        hierarchyLevel: mapValueOfType<int>(json, r'hierarchyLevel'),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: IssueTypeHierarchyPayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
      );
    }
    return null;
  }

  static List<IssueTypeHierarchyPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeHierarchyPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeHierarchyPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeHierarchyPayload> mapFromJson(dynamic json) {
    final map = <String, IssueTypeHierarchyPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeHierarchyPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeHierarchyPayload-objects as value to a dart map
  static Map<String, List<IssueTypeHierarchyPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeHierarchyPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeHierarchyPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The conflict strategy to use when the issue type already exists. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters
enum IssueTypeHierarchyPayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueTypeHierarchyPayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueTypeHierarchyPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueTypeHierarchyPayloadOnConflictEnum? fromJson(dynamic value) => IssueTypeHierarchyPayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueTypeHierarchyPayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueTypeHierarchyPayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeHierarchyPayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeHierarchyPayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueTypeHierarchyPayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [IssueTypeHierarchyPayloadOnConflictEnum].
class IssueTypeHierarchyPayloadOnConflictEnumTypeTransformer {
  factory IssueTypeHierarchyPayloadOnConflictEnumTypeTransformer() => _instance ??= const IssueTypeHierarchyPayloadOnConflictEnumTypeTransformer._();

  const IssueTypeHierarchyPayloadOnConflictEnumTypeTransformer._();

  String encode(IssueTypeHierarchyPayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [IssueTypeHierarchyPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueTypeHierarchyPayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueTypeHierarchyPayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return IssueTypeHierarchyPayloadOnConflictEnum.FAIL;
        case r'USE': return IssueTypeHierarchyPayloadOnConflictEnum.USE;
        case r'NEW': return IssueTypeHierarchyPayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueTypeHierarchyPayloadOnConflictEnumTypeTransformer? _instance;
}


