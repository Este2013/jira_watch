//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateBoardRequest {
  /// Returns a new [CreateBoardRequest] instance.
  CreateBoardRequest({
    this.filterId,
    this.location,
    this.name,
    this.type,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? filterId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateBoardRequestLocation? location;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  CreateBoardRequestTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateBoardRequest &&
    other.filterId == filterId &&
    other.location == location &&
    other.name == name &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (filterId == null ? 0 : filterId!.hashCode) +
    (location == null ? 0 : location!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'CreateBoardRequest[filterId=$filterId, location=$location, name=$name, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.filterId != null) {
      json[r'filterId'] = this.filterId;
    } else {
      json[r'filterId'] = null;
    }
    if (this.location != null) {
      json[r'location'] = this.location;
    } else {
      json[r'location'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [CreateBoardRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateBoardRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CreateBoardRequest(
        filterId: mapValueOfType<int>(json, r'filterId'),
        location: CreateBoardRequestLocation.fromJson(json[r'location']),
        name: mapValueOfType<String>(json, r'name'),
        type: CreateBoardRequestTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<CreateBoardRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBoardRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBoardRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateBoardRequest> mapFromJson(dynamic json) {
    final map = <String, CreateBoardRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateBoardRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateBoardRequest-objects as value to a dart map
  static Map<String, List<CreateBoardRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateBoardRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateBoardRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}


enum CreateBoardRequestTypeEnum {
  kanban._(r'kanban'),
  scrum._(r'scrum'),
  agility._(r'agility'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateBoardRequestTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateBoardRequestTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateBoardRequestTypeEnum? fromJson(dynamic value) => CreateBoardRequestTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateBoardRequestTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateBoardRequestTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateBoardRequestTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateBoardRequestTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateBoardRequestTypeEnum] to String,
/// and [decode] dynamic data back to [CreateBoardRequestTypeEnum].
class CreateBoardRequestTypeEnumTypeTransformer {
  factory CreateBoardRequestTypeEnumTypeTransformer() => _instance ??= const CreateBoardRequestTypeEnumTypeTransformer._();

  const CreateBoardRequestTypeEnumTypeTransformer._();

  String encode(CreateBoardRequestTypeEnum data) => data._value;

  /// Returns the instance of [CreateBoardRequestTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateBoardRequestTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateBoardRequestTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'kanban': return CreateBoardRequestTypeEnum.kanban;
        case r'scrum': return CreateBoardRequestTypeEnum.scrum;
        case r'agility': return CreateBoardRequestTypeEnum.agility;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateBoardRequestTypeEnumTypeTransformer? _instance;
}


