//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraWorkflowPreviewStatus {
  /// Returns a new [JiraWorkflowPreviewStatus] instance.
  JiraWorkflowPreviewStatus({
    this.description,
    this.id,
    this.name,
    this.rawName,
    this.scope,
    this.statusCategory,
    this.statusReference,
  });

  /// The description of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The name of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The raw name of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rawName;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowPreviewScope? scope;

  /// The category of the status.
  JiraWorkflowPreviewStatusStatusCategoryEnum? statusCategory;

  /// The reference of the status. Unique within this response but not guaranteed to be stable across requests.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? statusReference;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraWorkflowPreviewStatus &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.rawName == rawName &&
    other.scope == scope &&
    other.statusCategory == statusCategory &&
    other.statusReference == statusReference;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (rawName == null ? 0 : rawName!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (statusCategory == null ? 0 : statusCategory!.hashCode) +
    (statusReference == null ? 0 : statusReference!.hashCode);

  @override
  String toString() => 'JiraWorkflowPreviewStatus[description=$description, id=$id, name=$name, rawName=$rawName, scope=$scope, statusCategory=$statusCategory, statusReference=$statusReference]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.rawName != null) {
      json[r'rawName'] = this.rawName;
    } else {
      json[r'rawName'] = null;
    }
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.statusCategory != null) {
      json[r'statusCategory'] = this.statusCategory;
    } else {
      json[r'statusCategory'] = null;
    }
    if (this.statusReference != null) {
      json[r'statusReference'] = this.statusReference;
    } else {
      json[r'statusReference'] = null;
    }
    return json;
  }

  /// Returns a new [JiraWorkflowPreviewStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraWorkflowPreviewStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JiraWorkflowPreviewStatus(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        rawName: mapValueOfType<String>(json, r'rawName'),
        scope: WorkflowPreviewScope.fromJson(json[r'scope']),
        statusCategory: JiraWorkflowPreviewStatusStatusCategoryEnum.fromJson(json[r'statusCategory']),
        statusReference: mapValueOfType<String>(json, r'statusReference'),
      );
    }
    return null;
  }

  static List<JiraWorkflowPreviewStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraWorkflowPreviewStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraWorkflowPreviewStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraWorkflowPreviewStatus> mapFromJson(dynamic json) {
    final map = <String, JiraWorkflowPreviewStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraWorkflowPreviewStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraWorkflowPreviewStatus-objects as value to a dart map
  static Map<String, List<JiraWorkflowPreviewStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraWorkflowPreviewStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraWorkflowPreviewStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The category of the status.
enum JiraWorkflowPreviewStatusStatusCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const JiraWorkflowPreviewStatusStatusCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JiraWorkflowPreviewStatusStatusCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JiraWorkflowPreviewStatusStatusCategoryEnum? fromJson(dynamic value) => JiraWorkflowPreviewStatusStatusCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JiraWorkflowPreviewStatusStatusCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JiraWorkflowPreviewStatusStatusCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraWorkflowPreviewStatusStatusCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraWorkflowPreviewStatusStatusCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JiraWorkflowPreviewStatusStatusCategoryEnum] to String,
/// and [decode] dynamic data back to [JiraWorkflowPreviewStatusStatusCategoryEnum].
class JiraWorkflowPreviewStatusStatusCategoryEnumTypeTransformer {
  factory JiraWorkflowPreviewStatusStatusCategoryEnumTypeTransformer() => _instance ??= const JiraWorkflowPreviewStatusStatusCategoryEnumTypeTransformer._();

  const JiraWorkflowPreviewStatusStatusCategoryEnumTypeTransformer._();

  String encode(JiraWorkflowPreviewStatusStatusCategoryEnum data) => data._value;

  /// Returns the instance of [JiraWorkflowPreviewStatusStatusCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JiraWorkflowPreviewStatusStatusCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JiraWorkflowPreviewStatusStatusCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return JiraWorkflowPreviewStatusStatusCategoryEnum.TODO;
        case r'IN_PROGRESS': return JiraWorkflowPreviewStatusStatusCategoryEnum.IN_PROGRESS;
        case r'DONE': return JiraWorkflowPreviewStatusStatusCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JiraWorkflowPreviewStatusStatusCategoryEnumTypeTransformer? _instance;
}


