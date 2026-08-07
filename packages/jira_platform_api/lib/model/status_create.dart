//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusCreate {
  /// Returns a new [StatusCreate] instance.
  StatusCreate({
    this.description,
    required this.name,
    required this.statusCategory,
  });

  /// The description of the status.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the status.
  String name;

  /// The category of the status.
  StatusCreateStatusCategoryEnum statusCategory;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusCreate &&
    other.description == description &&
    other.name == name &&
    other.statusCategory == statusCategory;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name.hashCode) +
    (statusCategory.hashCode);

  @override
  String toString() => 'StatusCreate[description=$description, name=$name, statusCategory=$statusCategory]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'name'] = this.name;
      json[r'statusCategory'] = this.statusCategory;
    return json;
  }

  /// Returns a new [StatusCreate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusCreate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "StatusCreate[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "StatusCreate[name]" has a null value in JSON.');
        assert(json.containsKey(r'statusCategory'), 'Required key "StatusCreate[statusCategory]" is missing from JSON.');
        assert(json[r'statusCategory'] != null, 'Required key "StatusCreate[statusCategory]" has a null value in JSON.');
        return true;
      }());

      return StatusCreate(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name')!,
        statusCategory: StatusCreateStatusCategoryEnum.fromJson(json[r'statusCategory'])!,
      );
    }
    return null;
  }

  static List<StatusCreate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusCreate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusCreate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusCreate> mapFromJson(dynamic json) {
    final map = <String, StatusCreate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusCreate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusCreate-objects as value to a dart map
  static Map<String, List<StatusCreate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusCreate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusCreate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'statusCategory',
  };
}

/// The category of the status.
enum StatusCreateStatusCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const StatusCreateStatusCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [StatusCreateStatusCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static StatusCreateStatusCategoryEnum? fromJson(dynamic value) => StatusCreateStatusCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [StatusCreateStatusCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<StatusCreateStatusCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusCreateStatusCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusCreateStatusCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusCreateStatusCategoryEnum] to String,
/// and [decode] dynamic data back to [StatusCreateStatusCategoryEnum].
class StatusCreateStatusCategoryEnumTypeTransformer {
  factory StatusCreateStatusCategoryEnumTypeTransformer() => _instance ??= const StatusCreateStatusCategoryEnumTypeTransformer._();

  const StatusCreateStatusCategoryEnumTypeTransformer._();

  String encode(StatusCreateStatusCategoryEnum data) => data._value;

  /// Returns the instance of [StatusCreateStatusCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusCreateStatusCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is StatusCreateStatusCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return StatusCreateStatusCategoryEnum.TODO;
        case r'IN_PROGRESS': return StatusCreateStatusCategoryEnum.IN_PROGRESS;
        case r'DONE': return StatusCreateStatusCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static StatusCreateStatusCategoryEnumTypeTransformer? _instance;
}


