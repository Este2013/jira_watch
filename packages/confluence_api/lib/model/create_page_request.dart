//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePageRequest {
  /// Returns a new [CreatePageRequest] instance.
  CreatePageRequest({
    required this.spaceId,
    this.status,
    this.title,
    this.parentId,
    this.body,
    this.subtype,
  });

  /// ID of the space.
  String spaceId;

  /// The status of the page, published or draft.
  CreatePageRequestStatusEnum? status;

  /// Title of the page, required if page status is not draft.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  /// The parent content ID of the page. If the `root-level` query parameter is set to false and a value is  not supplied for this parameter, then the space homepage's ID will be used. If the `root-level` query  parameter is set to true, then a value may not be supplied for this parameter.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? parentId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreatePageRequestBody? body;

  /// The subtype of the page. Provide the subtype live to create a live doc or no subtype to create a page.
  CreatePageRequestSubtypeEnum? subtype;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePageRequest &&
    other.spaceId == spaceId &&
    other.status == status &&
    other.title == title &&
    other.parentId == parentId &&
    other.body == body &&
    other.subtype == subtype;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (spaceId.hashCode) +
    (status == null ? 0 : status!.hashCode) +
    (title == null ? 0 : title!.hashCode) +
    (parentId == null ? 0 : parentId!.hashCode) +
    (body == null ? 0 : body!.hashCode) +
    (subtype == null ? 0 : subtype!.hashCode);

  @override
  String toString() => 'CreatePageRequest[spaceId=$spaceId, status=$status, title=$title, parentId=$parentId, body=$body, subtype=$subtype]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'spaceId'] = this.spaceId;
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    if (this.parentId != null) {
      json[r'parentId'] = this.parentId;
    } else {
      json[r'parentId'] = null;
    }
    if (this.body != null) {
      json[r'body'] = this.body;
    } else {
      json[r'body'] = null;
    }
    if (this.subtype != null) {
      json[r'subtype'] = this.subtype;
    } else {
      json[r'subtype'] = null;
    }
    return json;
  }

  /// Returns a new [CreatePageRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePageRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'spaceId'), 'Required key "CreatePageRequest[spaceId]" is missing from JSON.');
        assert(json[r'spaceId'] != null, 'Required key "CreatePageRequest[spaceId]" has a null value in JSON.');
        return true;
      }());

      return CreatePageRequest(
        spaceId: mapValueOfType<String>(json, r'spaceId')!,
        status: CreatePageRequestStatusEnum.fromJson(json[r'status']),
        title: mapValueOfType<String>(json, r'title'),
        parentId: mapValueOfType<String>(json, r'parentId'),
        body: CreatePageRequestBody.fromJson(json[r'body']),
        subtype: CreatePageRequestSubtypeEnum.fromJson(json[r'subtype']),
      );
    }
    return null;
  }

  static List<CreatePageRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePageRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePageRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePageRequest> mapFromJson(dynamic json) {
    final map = <String, CreatePageRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePageRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePageRequest-objects as value to a dart map
  static Map<String, List<CreatePageRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePageRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePageRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spaceId',
  };
}

/// The status of the page, published or draft.
enum CreatePageRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreatePageRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreatePageRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreatePageRequestStatusEnum? fromJson(dynamic value) => CreatePageRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreatePageRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreatePageRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePageRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePageRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreatePageRequestStatusEnum] to String,
/// and [decode] dynamic data back to [CreatePageRequestStatusEnum].
class CreatePageRequestStatusEnumTypeTransformer {
  factory CreatePageRequestStatusEnumTypeTransformer() => _instance ??= const CreatePageRequestStatusEnumTypeTransformer._();

  const CreatePageRequestStatusEnumTypeTransformer._();

  String encode(CreatePageRequestStatusEnum data) => data._value;

  /// Returns the instance of [CreatePageRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreatePageRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreatePageRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return CreatePageRequestStatusEnum.current;
        case r'draft': return CreatePageRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreatePageRequestStatusEnumTypeTransformer? _instance;
}


/// The subtype of the page. Provide the subtype live to create a live doc or no subtype to create a page.
enum CreatePageRequestSubtypeEnum {
  live._(r'live'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreatePageRequestSubtypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreatePageRequestSubtypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreatePageRequestSubtypeEnum? fromJson(dynamic value) => CreatePageRequestSubtypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreatePageRequestSubtypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreatePageRequestSubtypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePageRequestSubtypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePageRequestSubtypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreatePageRequestSubtypeEnum] to String,
/// and [decode] dynamic data back to [CreatePageRequestSubtypeEnum].
class CreatePageRequestSubtypeEnumTypeTransformer {
  factory CreatePageRequestSubtypeEnumTypeTransformer() => _instance ??= const CreatePageRequestSubtypeEnumTypeTransformer._();

  const CreatePageRequestSubtypeEnumTypeTransformer._();

  String encode(CreatePageRequestSubtypeEnum data) => data._value;

  /// Returns the instance of [CreatePageRequestSubtypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreatePageRequestSubtypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreatePageRequestSubtypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'live': return CreatePageRequestSubtypeEnum.live;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreatePageRequestSubtypeEnumTypeTransformer? _instance;
}


