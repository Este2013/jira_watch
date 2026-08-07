//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusUpdate {
  /// Returns a new [StatusUpdate] instance.
  StatusUpdate({
    this.description,
    required this.id,
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

  /// The ID of the status.
  String id;

  /// The name of the status.
  String name;

  /// The category of the status.
  StatusUpdateStatusCategoryEnum statusCategory;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusUpdate &&
    other.description == description &&
    other.id == id &&
    other.name == name &&
    other.statusCategory == statusCategory;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (name.hashCode) +
    (statusCategory.hashCode);

  @override
  String toString() => 'StatusUpdate[description=$description, id=$id, name=$name, statusCategory=$statusCategory]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'statusCategory'] = this.statusCategory;
    return json;
  }

  /// Returns a new [StatusUpdate] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusUpdate? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "StatusUpdate[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "StatusUpdate[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "StatusUpdate[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "StatusUpdate[name]" has a null value in JSON.');
        assert(json.containsKey(r'statusCategory'), 'Required key "StatusUpdate[statusCategory]" is missing from JSON.');
        assert(json[r'statusCategory'] != null, 'Required key "StatusUpdate[statusCategory]" has a null value in JSON.');
        return true;
      }());

      return StatusUpdate(
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        statusCategory: StatusUpdateStatusCategoryEnum.fromJson(json[r'statusCategory'])!,
      );
    }
    return null;
  }

  static List<StatusUpdate> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusUpdate>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusUpdate.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusUpdate> mapFromJson(dynamic json) {
    final map = <String, StatusUpdate>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusUpdate.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusUpdate-objects as value to a dart map
  static Map<String, List<StatusUpdate>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusUpdate>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusUpdate.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'statusCategory',
  };
}

/// The category of the status.
enum StatusUpdateStatusCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const StatusUpdateStatusCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [StatusUpdateStatusCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static StatusUpdateStatusCategoryEnum? fromJson(dynamic value) => StatusUpdateStatusCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [StatusUpdateStatusCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<StatusUpdateStatusCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusUpdateStatusCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusUpdateStatusCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusUpdateStatusCategoryEnum] to String,
/// and [decode] dynamic data back to [StatusUpdateStatusCategoryEnum].
class StatusUpdateStatusCategoryEnumTypeTransformer {
  factory StatusUpdateStatusCategoryEnumTypeTransformer() => _instance ??= const StatusUpdateStatusCategoryEnumTypeTransformer._();

  const StatusUpdateStatusCategoryEnumTypeTransformer._();

  String encode(StatusUpdateStatusCategoryEnum data) => data._value;

  /// Returns the instance of [StatusUpdateStatusCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusUpdateStatusCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is StatusUpdateStatusCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return StatusUpdateStatusCategoryEnum.TODO;
        case r'IN_PROGRESS': return StatusUpdateStatusCategoryEnum.IN_PROGRESS;
        case r'DONE': return StatusUpdateStatusCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static StatusUpdateStatusCategoryEnumTypeTransformer? _instance;
}


