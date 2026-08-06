//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusScope {
  /// Returns a new [StatusScope] instance.
  StatusScope({
    this.project,
    required this.type,
  });

  ProjectId? project;

  /// The scope of the status. `GLOBAL` for company-managed projects and `PROJECT` for team-managed projects.
  StatusScopeTypeEnum type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusScope &&
    other.project == project &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (project == null ? 0 : project!.hashCode) +
    (type.hashCode);

  @override
  String toString() => 'StatusScope[project=$project, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.project != null) {
      json[r'project'] = this.project;
    } else {
      json[r'project'] = null;
    }
      json[r'type'] = this.type;
    return json;
  }

  /// Returns a new [StatusScope] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusScope? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'type'), 'Required key "StatusScope[type]" is missing from JSON.');
        assert(json[r'type'] != null, 'Required key "StatusScope[type]" has a null value in JSON.');
        return true;
      }());

      return StatusScope(
        project: ProjectId.fromJson(json[r'project']),
        type: StatusScopeTypeEnum.fromJson(json[r'type'])!,
      );
    }
    return null;
  }

  static List<StatusScope> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusScope>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusScope.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusScope> mapFromJson(dynamic json) {
    final map = <String, StatusScope>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusScope.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusScope-objects as value to a dart map
  static Map<String, List<StatusScope>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusScope>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusScope.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'type',
  };
}

/// The scope of the status. `GLOBAL` for company-managed projects and `PROJECT` for team-managed projects.
enum StatusScopeTypeEnum {
  PROJECT._(r'PROJECT'),
  GLOBAL._(r'GLOBAL'),
  ;

  /// Instantiate a new enum with the provided value.
  const StatusScopeTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [StatusScopeTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static StatusScopeTypeEnum? fromJson(dynamic value) => StatusScopeTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [StatusScopeTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<StatusScopeTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusScopeTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusScopeTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusScopeTypeEnum] to String,
/// and [decode] dynamic data back to [StatusScopeTypeEnum].
class StatusScopeTypeEnumTypeTransformer {
  factory StatusScopeTypeEnumTypeTransformer() => _instance ??= const StatusScopeTypeEnumTypeTransformer._();

  const StatusScopeTypeEnumTypeTransformer._();

  String encode(StatusScopeTypeEnum data) => data._value;

  /// Returns the instance of [StatusScopeTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusScopeTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is StatusScopeTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT': return StatusScopeTypeEnum.PROJECT;
        case r'GLOBAL': return StatusScopeTypeEnum.GLOBAL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static StatusScopeTypeEnumTypeTransformer? _instance;
}


