//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdatePageTitleRequest {
  /// Returns a new [UpdatePageTitleRequest] instance.
  UpdatePageTitleRequest({
    required this.status,
    required this.title,
  });

  /// The status of the page, current or draft.
  UpdatePageTitleRequestStatusEnum status;

  /// The updated title for the page
  String title;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdatePageTitleRequest &&
    other.status == status &&
    other.title == title;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (status.hashCode) +
    (title.hashCode);

  @override
  String toString() => 'UpdatePageTitleRequest[status=$status, title=$title]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'status'] = this.status;
      json[r'title'] = this.title;
    return json;
  }

  /// Returns a new [UpdatePageTitleRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdatePageTitleRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'status'), 'Required key "UpdatePageTitleRequest[status]" is missing from JSON.');
        assert(json[r'status'] != null, 'Required key "UpdatePageTitleRequest[status]" has a null value in JSON.');
        assert(json.containsKey(r'title'), 'Required key "UpdatePageTitleRequest[title]" is missing from JSON.');
        assert(json[r'title'] != null, 'Required key "UpdatePageTitleRequest[title]" has a null value in JSON.');
        return true;
      }());

      return UpdatePageTitleRequest(
        status: UpdatePageTitleRequestStatusEnum.fromJson(json[r'status'])!,
        title: mapValueOfType<String>(json, r'title')!,
      );
    }
    return null;
  }

  static List<UpdatePageTitleRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePageTitleRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePageTitleRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdatePageTitleRequest> mapFromJson(dynamic json) {
    final map = <String, UpdatePageTitleRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdatePageTitleRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdatePageTitleRequest-objects as value to a dart map
  static Map<String, List<UpdatePageTitleRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdatePageTitleRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdatePageTitleRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'status',
    'title',
  };
}

/// The status of the page, current or draft.
enum UpdatePageTitleRequestStatusEnum {
  current._(r'current'),
  draft._(r'draft'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdatePageTitleRequestStatusEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdatePageTitleRequestStatusEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdatePageTitleRequestStatusEnum? fromJson(dynamic value) => UpdatePageTitleRequestStatusEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdatePageTitleRequestStatusEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdatePageTitleRequestStatusEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePageTitleRequestStatusEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePageTitleRequestStatusEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdatePageTitleRequestStatusEnum] to String,
/// and [decode] dynamic data back to [UpdatePageTitleRequestStatusEnum].
class UpdatePageTitleRequestStatusEnumTypeTransformer {
  factory UpdatePageTitleRequestStatusEnumTypeTransformer() => _instance ??= const UpdatePageTitleRequestStatusEnumTypeTransformer._();

  const UpdatePageTitleRequestStatusEnumTypeTransformer._();

  String encode(UpdatePageTitleRequestStatusEnum data) => data._value;

  /// Returns the instance of [UpdatePageTitleRequestStatusEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdatePageTitleRequestStatusEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdatePageTitleRequestStatusEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'current': return UpdatePageTitleRequestStatusEnum.current;
        case r'draft': return UpdatePageTitleRequestStatusEnum.draft;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdatePageTitleRequestStatusEnumTypeTransformer? _instance;
}


