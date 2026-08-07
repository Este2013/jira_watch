//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JiraStatus {
  /// Returns a new [JiraStatus] instance.
  JiraStatus({
    this.description,
    this.id,
    this.name,
    this.scope,
    this.statusCategory,
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

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  StatusScope? scope;

  /// The category of the status.
  JiraStatusStatusCategoryEnum? statusCategory;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JiraStatus &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.scope == scope &&
    other.statusCategory == statusCategory;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (statusCategory == null ? 0 : statusCategory!.hashCode);

  @override
  String toString() => 'JiraStatus[description=$description, id=$id, name=$name, scope=$scope, statusCategory=$statusCategory]';

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
    return json;
  }

  /// Returns a new [JiraStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JiraStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JiraStatus(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        scope: StatusScope.fromJson(json[r'scope']),
        statusCategory: JiraStatusStatusCategoryEnum.fromJson(json[r'statusCategory']),
      );
    }
    return null;
  }

  static List<JiraStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JiraStatus> mapFromJson(dynamic json) {
    final map = <String, JiraStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JiraStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JiraStatus-objects as value to a dart map
  static Map<String, List<JiraStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JiraStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JiraStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The category of the status.
enum JiraStatusStatusCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const JiraStatusStatusCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JiraStatusStatusCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JiraStatusStatusCategoryEnum? fromJson(dynamic value) => JiraStatusStatusCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JiraStatusStatusCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JiraStatusStatusCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JiraStatusStatusCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JiraStatusStatusCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JiraStatusStatusCategoryEnum] to String,
/// and [decode] dynamic data back to [JiraStatusStatusCategoryEnum].
class JiraStatusStatusCategoryEnumTypeTransformer {
  factory JiraStatusStatusCategoryEnumTypeTransformer() => _instance ??= const JiraStatusStatusCategoryEnumTypeTransformer._();

  const JiraStatusStatusCategoryEnumTypeTransformer._();

  String encode(JiraStatusStatusCategoryEnum data) => data._value;

  /// Returns the instance of [JiraStatusStatusCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JiraStatusStatusCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JiraStatusStatusCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return JiraStatusStatusCategoryEnum.TODO;
        case r'IN_PROGRESS': return JiraStatusStatusCategoryEnum.IN_PROGRESS;
        case r'DONE': return JiraStatusStatusCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JiraStatusStatusCategoryEnumTypeTransformer? _instance;
}


