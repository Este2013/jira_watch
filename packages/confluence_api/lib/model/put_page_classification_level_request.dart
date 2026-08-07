//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PutPageClassificationLevelRequest {
  /// Returns a new [PutPageClassificationLevelRequest] instance.
  PutPageClassificationLevelRequest({
    required this.id,
    required this.status,
  });

  /// The ID of the classification level.
  String id;

  /// Status of the content.
  PutPageClassificationLevelRequestStatusEnum status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PutPageClassificationLevelRequest &&
    other.id == id &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (status.hashCode);

  @override
  String toString() => 'PutPageClassificationLevelRequest[id=$id, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'status'] = this.status;
    return json;
  }

  /// Returns a new [PutPageClassificationLevelRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PutPageClassificationLevelRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "PutPageClassificationLevelRequest[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "PutPageClassificationLevelRequest[id]" has a null value in JSON.');
        assert(json.containsKey(r'status'), 'Required key "PutPageClassificationLevelRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "PutPageClassificationLevelRequest[status]" has a null value in JSON.');
        return true;
      }());

      return PutPageClassificationLevelRequest(
        id: mapValueOfType<String>(json, r'id')!,
        status: PutPageClassificationLevelRequestStatusEnum.fromJson(json[r'status'])!,
      );
    }
    return null;
  }

  static List<PutPageClassificationLevelRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PutPageClassificationLevelRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PutPageClassificationLevelRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PutPageClassificationLevelRequest> mapFromJson(dynamic json) {
    final map = <String, PutPageClassificationLevelRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PutPageClassificationLevelRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PutPageClassificationLevelRequest-objects as value to a dart map
  static Map<String, List<PutPageClassificationLevelRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PutPageClassificationLevelRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PutPageClassificationLevelRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'status',
  };
}

/// Status of the content.
enum PutPageClassificationLevelRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const PutPageClassificationLevelRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [PutPageClassificationLevelRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static PutPageClassificationLevelRequestStatusEnum? fromJson(dynamic value) => PutPageClassificationLevelRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [PutPageClassificationLevelRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<PutPageClassificationLevelRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PutPageClassificationLevelRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PutPageClassificationLevelRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [PutPageClassificationLevelRequestStatusEnum] to String,
/// and [decode] dynamic data back to [PutPageClassificationLevelRequestStatusEnum].
class PutPageClassificationLevelRequestStatusEnumTypeTransformer {
  factory PutPageClassificationLevelRequestStatusEnumTypeTransformer() => _instance ??= const PutPageClassificationLevelRequestStatusEnumTypeTransformer._();

  const PutPageClassificationLevelRequestStatusEnumTypeTransformer._();

  String encode(PutPageClassificationLevelRequestStatusEnum data) => data._value;

  /// Returns the instance of [PutPageClassificationLevelRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  PutPageClassificationLevelRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is PutPageClassificationLevelRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return PutPageClassificationLevelRequestStatusEnum.current;
        case r'draft': return PutPageClassificationLevelRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static PutPageClassificationLevelRequestStatusEnumTypeTransformer? _instance;
}


