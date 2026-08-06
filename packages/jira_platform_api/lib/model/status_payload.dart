//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusPayload {
  /// Returns a new [StatusPayload] instance.
  StatusPayload({
    this.description,
    this.name,
    this.onConflict,
    this.pcri,
    this.statusCategory,
  });

  /// The description of the status
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The name of the status
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The conflict strategy for the status already exists. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters; NEW - Create a new entity
  StatusPayloadOnConflictEnum? onConflict;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ProjectCreateResourceIdentifier? pcri;

  /// The status category of the status. The value is case-sensitive.
  StatusPayloadStatusCategoryEnum? statusCategory;

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusPayload &&
    other.description == description &&
    other.name == name &&
    other.onConflict == onConflict &&
    other.pcri == pcri &&
    other.statusCategory == statusCategory;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (onConflict == null ? 0 : onConflict!.hashCode) +
    (pcri == null ? 0 : pcri!.hashCode) +
    (statusCategory == null ? 0 : statusCategory!.hashCode);

  @override
  String toString() => 'StatusPayload[description=$description, name=$name, onConflict=$onConflict, pcri=$pcri, statusCategory=$statusCategory]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
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
    if (this.statusCategory != null) {
      json[r'statusCategory'] = this.statusCategory;
    } else {
      json[r'statusCategory'] = null;
    }
    return json;
  }

  /// Returns a new [StatusPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return StatusPayload(
        description: mapValueOfType<String>(json, r'description'),
        name: mapValueOfType<String>(json, r'name'),
        onConflict: StatusPayloadOnConflictEnum.fromJson(json[r'onConflict']),
        pcri: ProjectCreateResourceIdentifier.fromJson(json[r'pcri']),
        statusCategory: StatusPayloadStatusCategoryEnum.fromJson(json[r'statusCategory']),
      );
    }
    return null;
  }

  static List<StatusPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusPayload> mapFromJson(dynamic json) {
    final map = <String, StatusPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusPayload-objects as value to a dart map
  static Map<String, List<StatusPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The conflict strategy for the status already exists. FAIL - Fail execution, this always needs to be unique; USE - Use the existing entity and ignore new entity parameters; NEW - Create a new entity
enum StatusPayloadOnConflictEnum {
  FAIL._(r'FAIL'),
  USE._(r'USE'),
  NEW._(r'NEW'),
  ;

  /// Instantiate a new enum with the provided value.
  const StatusPayloadOnConflictEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [StatusPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static StatusPayloadOnConflictEnum? fromJson(dynamic value) => StatusPayloadOnConflictEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [StatusPayloadOnConflictEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<StatusPayloadOnConflictEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusPayloadOnConflictEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusPayloadOnConflictEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusPayloadOnConflictEnum] to String,
/// and [decode] dynamic data back to [StatusPayloadOnConflictEnum].
class StatusPayloadOnConflictEnumTypeTransformer {
  factory StatusPayloadOnConflictEnumTypeTransformer() => _instance ??= const StatusPayloadOnConflictEnumTypeTransformer._();

  const StatusPayloadOnConflictEnumTypeTransformer._();

  String encode(StatusPayloadOnConflictEnum data) => data._value;

  /// Returns the instance of [StatusPayloadOnConflictEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusPayloadOnConflictEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is StatusPayloadOnConflictEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'FAIL': return StatusPayloadOnConflictEnum.FAIL;
        case r'USE': return StatusPayloadOnConflictEnum.USE;
        case r'NEW': return StatusPayloadOnConflictEnum.NEW;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static StatusPayloadOnConflictEnumTypeTransformer? _instance;
}


/// The status category of the status. The value is case-sensitive.
enum StatusPayloadStatusCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const StatusPayloadStatusCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [StatusPayloadStatusCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static StatusPayloadStatusCategoryEnum? fromJson(dynamic value) => StatusPayloadStatusCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [StatusPayloadStatusCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<StatusPayloadStatusCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusPayloadStatusCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusPayloadStatusCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusPayloadStatusCategoryEnum] to String,
/// and [decode] dynamic data back to [StatusPayloadStatusCategoryEnum].
class StatusPayloadStatusCategoryEnumTypeTransformer {
  factory StatusPayloadStatusCategoryEnumTypeTransformer() => _instance ??= const StatusPayloadStatusCategoryEnumTypeTransformer._();

  const StatusPayloadStatusCategoryEnumTypeTransformer._();

  String encode(StatusPayloadStatusCategoryEnum data) => data._value;

  /// Returns the instance of [StatusPayloadStatusCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusPayloadStatusCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is StatusPayloadStatusCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return StatusPayloadStatusCategoryEnum.TODO;
        case r'IN_PROGRESS': return StatusPayloadStatusCategoryEnum.IN_PROGRESS;
        case r'DONE': return StatusPayloadStatusCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static StatusPayloadStatusCategoryEnumTypeTransformer? _instance;
}


