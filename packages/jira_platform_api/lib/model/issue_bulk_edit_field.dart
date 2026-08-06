//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueBulkEditField {
  /// Returns a new [IssueBulkEditField] instance.
  IssueBulkEditField({
    this.description,
    this.fieldOptions = const [],
    this.id,
    this.isRequired,
    this.multiSelectFieldOptions = const [],
    this.name,
    this.searchUrl,
    this.type,
    this.unavailableMessage,
  });

  /// Description of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// A list of options related to the field, applicable in contexts where multiple selections are allowed.
  List<Object> fieldOptions;

  /// The unique ID of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// Indicates whether the field is mandatory for the operation.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isRequired;

  /// Specifies supported actions (like add, replace, remove) on multi-select fields via an enum.
  List<IssueBulkEditFieldMultiSelectFieldOptionsEnum> multiSelectFieldOptions;

  /// The display name of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// A URL to fetch additional data for the field
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? searchUrl;

  /// The type of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  /// A message indicating why the field is unavailable for editing.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? unavailableMessage;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueBulkEditField &&
    other.description == description &&
    _deepEquality.equals(other.fieldOptions, fieldOptions) &&
    other.id == id &&
    other.isRequired == isRequired &&
    _deepEquality.equals(other.multiSelectFieldOptions, multiSelectFieldOptions) &&
    other.name == name &&
    other.searchUrl == searchUrl &&
    other.type == type &&
    other.unavailableMessage == unavailableMessage;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (fieldOptions.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (isRequired == null ? 0 : isRequired!.hashCode) +
    (multiSelectFieldOptions.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (searchUrl == null ? 0 : searchUrl!.hashCode) +
    (type == null ? 0 : type!.hashCode) +
    (unavailableMessage == null ? 0 : unavailableMessage!.hashCode);

  @override
  String toString() => 'IssueBulkEditField[description=$description, fieldOptions=$fieldOptions, id=$id, isRequired=$isRequired, multiSelectFieldOptions=$multiSelectFieldOptions, name=$name, searchUrl=$searchUrl, type=$type, unavailableMessage=$unavailableMessage]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'fieldOptions'] = this.fieldOptions;
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.isRequired != null) {
      json[r'isRequired'] = this.isRequired;
    } else {
      json[r'isRequired'] = null;
    }
      json[r'multiSelectFieldOptions'] = this.multiSelectFieldOptions;
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.searchUrl != null) {
      json[r'searchUrl'] = this.searchUrl;
    } else {
      json[r'searchUrl'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    if (this.unavailableMessage != null) {
      json[r'unavailableMessage'] = this.unavailableMessage;
    } else {
      json[r'unavailableMessage'] = null;
    }
    return json;
  }

  /// Returns a new [IssueBulkEditField] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueBulkEditField? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueBulkEditField(
        description: mapValueOfType<String>(json, r'description'),
        fieldOptions: json[r'fieldOptions'] is Iterable
            ? (json[r'fieldOptions'] as Iterable).cast<Object>().toList(growable: false)
            : const [],
        id: mapValueOfType<String>(json, r'id'),
        isRequired: mapValueOfType<bool>(json, r'isRequired'),
        multiSelectFieldOptions: IssueBulkEditFieldMultiSelectFieldOptionsEnum.listFromJson(json[r'multiSelectFieldOptions']),
        name: mapValueOfType<String>(json, r'name'),
        searchUrl: mapValueOfType<String>(json, r'searchUrl'),
        type: mapValueOfType<String>(json, r'type'),
        unavailableMessage: mapValueOfType<String>(json, r'unavailableMessage'),
      );
    }
    return null;
  }

  static List<IssueBulkEditField> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkEditField>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkEditField.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueBulkEditField> mapFromJson(dynamic json) {
    final map = <String, IssueBulkEditField>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueBulkEditField.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueBulkEditField-objects as value to a dart map
  static Map<String, List<IssueBulkEditField>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueBulkEditField>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueBulkEditField.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum IssueBulkEditFieldMultiSelectFieldOptionsEnum {
  ADD._(r'ADD'),
  REMOVE._(r'REMOVE'),
  REPLACE._(r'REPLACE'),
  REMOVE_ALL._(r'REMOVE_ALL'),
  ;

  /// Instantiate a new enum with the provided value.
  const IssueBulkEditFieldMultiSelectFieldOptionsEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [IssueBulkEditFieldMultiSelectFieldOptionsEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static IssueBulkEditFieldMultiSelectFieldOptionsEnum? fromJson(dynamic value) => IssueBulkEditFieldMultiSelectFieldOptionsEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [IssueBulkEditFieldMultiSelectFieldOptionsEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<IssueBulkEditFieldMultiSelectFieldOptionsEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueBulkEditFieldMultiSelectFieldOptionsEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueBulkEditFieldMultiSelectFieldOptionsEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [IssueBulkEditFieldMultiSelectFieldOptionsEnum] to String,
/// and [decode] dynamic data back to [IssueBulkEditFieldMultiSelectFieldOptionsEnum].
class IssueBulkEditFieldMultiSelectFieldOptionsEnumTypeTransformer {
  factory IssueBulkEditFieldMultiSelectFieldOptionsEnumTypeTransformer() => _instance ??= const IssueBulkEditFieldMultiSelectFieldOptionsEnumTypeTransformer._();

  const IssueBulkEditFieldMultiSelectFieldOptionsEnumTypeTransformer._();

  String encode(IssueBulkEditFieldMultiSelectFieldOptionsEnum data) => data._value;

  /// Returns the instance of [IssueBulkEditFieldMultiSelectFieldOptionsEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  IssueBulkEditFieldMultiSelectFieldOptionsEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is IssueBulkEditFieldMultiSelectFieldOptionsEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ADD': return IssueBulkEditFieldMultiSelectFieldOptionsEnum.ADD;
        case r'REMOVE': return IssueBulkEditFieldMultiSelectFieldOptionsEnum.REMOVE;
        case r'REPLACE': return IssueBulkEditFieldMultiSelectFieldOptionsEnum.REPLACE;
        case r'REMOVE_ALL': return IssueBulkEditFieldMultiSelectFieldOptionsEnum.REMOVE_ALL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static IssueBulkEditFieldMultiSelectFieldOptionsEnumTypeTransformer? _instance;
}


