//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class StatusMetadata {
  /// Returns a new [StatusMetadata] instance.
  StatusMetadata({
    this.category,
    this.id,
    this.name,
  });

  /// The category of the status.
  StatusMetadataCategoryEnum? category;

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

  @override
  bool operator ==(Object other) => identical(this, other) || other is StatusMetadata &&
    other.category == category &&
    other.id == id &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (category == null ? 0 : category!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode);

  @override
  String toString() => 'StatusMetadata[category=$category, id=$id, name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.category != null) {
      json[r'category'] = this.category;
    } else {
      json[r'category'] = null;
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
    return json;
  }

  /// Returns a new [StatusMetadata] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static StatusMetadata? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return StatusMetadata(
        category: StatusMetadataCategoryEnum.fromJson(json[r'category']),
        id: mapValueOfType<String>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
      );
    }
    return null;
  }

  static List<StatusMetadata> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMetadata>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMetadata.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, StatusMetadata> mapFromJson(dynamic json) {
    final map = <String, StatusMetadata>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = StatusMetadata.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of StatusMetadata-objects as value to a dart map
  static Map<String, List<StatusMetadata>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<StatusMetadata>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = StatusMetadata.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The category of the status.
enum StatusMetadataCategoryEnum {
  TODO._(r'TODO'),
  IN_PROGRESS._(r'IN_PROGRESS'),
  DONE._(r'DONE'),
  ;

  /// Instantiate a new enum with the provided value.
  const StatusMetadataCategoryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [StatusMetadataCategoryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static StatusMetadataCategoryEnum? fromJson(dynamic value) => StatusMetadataCategoryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [StatusMetadataCategoryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<StatusMetadataCategoryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <StatusMetadataCategoryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = StatusMetadataCategoryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [StatusMetadataCategoryEnum] to String,
/// and [decode] dynamic data back to [StatusMetadataCategoryEnum].
class StatusMetadataCategoryEnumTypeTransformer {
  factory StatusMetadataCategoryEnumTypeTransformer() => _instance ??= const StatusMetadataCategoryEnumTypeTransformer._();

  const StatusMetadataCategoryEnumTypeTransformer._();

  String encode(StatusMetadataCategoryEnum data) => data._value;

  /// Returns the instance of [StatusMetadataCategoryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  StatusMetadataCategoryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is StatusMetadataCategoryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'TODO': return StatusMetadataCategoryEnum.TODO;
        case r'IN_PROGRESS': return StatusMetadataCategoryEnum.IN_PROGRESS;
        case r'DONE': return StatusMetadataCategoryEnum.DONE;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static StatusMetadataCategoryEnumTypeTransformer? _instance;
}


