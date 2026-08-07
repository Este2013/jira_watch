//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetSchedulingResponse {
  /// Returns a new [GetSchedulingResponse] instance.
  GetSchedulingResponse({
    required this.dependencies,
    required this.endDate,
    required this.estimation,
    required this.inferredDates,
    required this.startDate,
  });

  /// The dependencies for the plan. This is \"Sequential\" or \"Concurrent\".
  GetSchedulingResponseDependenciesEnum dependencies;

  /// The end date field for the plan.
  GetDateFieldResponse endDate;

  /// The estimation unit for the plan. This is \"StoryPoints\", \"Days\" or \"Hours\".
  GetSchedulingResponseEstimationEnum estimation;

  /// The inferred dates for the plan. This is \"None\", \"SprintDates\" or \"ReleaseDates\".
  GetSchedulingResponseInferredDatesEnum inferredDates;

  /// The start date field for the plan.
  GetDateFieldResponse startDate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetSchedulingResponse &&
    other.dependencies == dependencies &&
    other.endDate == endDate &&
    other.estimation == estimation &&
    other.inferredDates == inferredDates &&
    other.startDate == startDate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dependencies.hashCode) +
    (endDate.hashCode) +
    (estimation.hashCode) +
    (inferredDates.hashCode) +
    (startDate.hashCode);

  @override
  String toString() => 'GetSchedulingResponse[dependencies=$dependencies, endDate=$endDate, estimation=$estimation, inferredDates=$inferredDates, startDate=$startDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'dependencies'] = this.dependencies;
      json[r'endDate'] = this.endDate;
      json[r'estimation'] = this.estimation;
      json[r'inferredDates'] = this.inferredDates;
      json[r'startDate'] = this.startDate;
    return json;
  }

  /// Returns a new [GetSchedulingResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetSchedulingResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'dependencies'), 'Required key "GetSchedulingResponse[dependencies]" is missing from JSON.');
        assert(json[r'dependencies'] != null, 'Required key "GetSchedulingResponse[dependencies]" has a null value in JSON.');
        assert(json.containsKey(r'endDate'), 'Required key "GetSchedulingResponse[endDate]" is missing from JSON.');
        assert(json[r'endDate'] != null, 'Required key "GetSchedulingResponse[endDate]" has a null value in JSON.');
        assert(json.containsKey(r'estimation'), 'Required key "GetSchedulingResponse[estimation]" is missing from JSON.');
        assert(json[r'estimation'] != null, 'Required key "GetSchedulingResponse[estimation]" has a null value in JSON.');
        assert(json.containsKey(r'inferredDates'), 'Required key "GetSchedulingResponse[inferredDates]" is missing from JSON.');
        assert(json[r'inferredDates'] != null, 'Required key "GetSchedulingResponse[inferredDates]" has a null value in JSON.');
        assert(json.containsKey(r'startDate'), 'Required key "GetSchedulingResponse[startDate]" is missing from JSON.');
        assert(json[r'startDate'] != null, 'Required key "GetSchedulingResponse[startDate]" has a null value in JSON.');
        return true;
      }());

      return GetSchedulingResponse(
        dependencies: GetSchedulingResponseDependenciesEnum.fromJson(json[r'dependencies'])!,
        endDate: GetDateFieldResponse.fromJson(json[r'endDate'])!,
        estimation: GetSchedulingResponseEstimationEnum.fromJson(json[r'estimation'])!,
        inferredDates: GetSchedulingResponseInferredDatesEnum.fromJson(json[r'inferredDates'])!,
        startDate: GetDateFieldResponse.fromJson(json[r'startDate'])!,
      );
    }
    return null;
  }

  static List<GetSchedulingResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSchedulingResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSchedulingResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetSchedulingResponse> mapFromJson(dynamic json) {
    final map = <String, GetSchedulingResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetSchedulingResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetSchedulingResponse-objects as value to a dart map
  static Map<String, List<GetSchedulingResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetSchedulingResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetSchedulingResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'dependencies',
    'endDate',
    'estimation',
    'inferredDates',
    'startDate',
  };
}

/// The dependencies for the plan. This is \"Sequential\" or \"Concurrent\".
enum GetSchedulingResponseDependenciesEnum {
  sequential._(r'Sequential'),
  concurrent._(r'Concurrent'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetSchedulingResponseDependenciesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetSchedulingResponseDependenciesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetSchedulingResponseDependenciesEnum? fromJson(dynamic value) => GetSchedulingResponseDependenciesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetSchedulingResponseDependenciesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetSchedulingResponseDependenciesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSchedulingResponseDependenciesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSchedulingResponseDependenciesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetSchedulingResponseDependenciesEnum] to String,
/// and [decode] dynamic data back to [GetSchedulingResponseDependenciesEnum].
class GetSchedulingResponseDependenciesEnumTypeTransformer {
  factory GetSchedulingResponseDependenciesEnumTypeTransformer() => _instance ??= const GetSchedulingResponseDependenciesEnumTypeTransformer._();

  const GetSchedulingResponseDependenciesEnumTypeTransformer._();

  String encode(GetSchedulingResponseDependenciesEnum data) => data._value;

  /// Returns the instance of [GetSchedulingResponseDependenciesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetSchedulingResponseDependenciesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetSchedulingResponseDependenciesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Sequential': return GetSchedulingResponseDependenciesEnum.sequential;
        case r'Concurrent': return GetSchedulingResponseDependenciesEnum.concurrent;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetSchedulingResponseDependenciesEnumTypeTransformer? _instance;
}


/// The estimation unit for the plan. This is \"StoryPoints\", \"Days\" or \"Hours\".
enum GetSchedulingResponseEstimationEnum {
  storyPoints._(r'StoryPoints'),
  days._(r'Days'),
  hours._(r'Hours'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetSchedulingResponseEstimationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetSchedulingResponseEstimationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetSchedulingResponseEstimationEnum? fromJson(dynamic value) => GetSchedulingResponseEstimationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetSchedulingResponseEstimationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetSchedulingResponseEstimationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSchedulingResponseEstimationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSchedulingResponseEstimationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetSchedulingResponseEstimationEnum] to String,
/// and [decode] dynamic data back to [GetSchedulingResponseEstimationEnum].
class GetSchedulingResponseEstimationEnumTypeTransformer {
  factory GetSchedulingResponseEstimationEnumTypeTransformer() => _instance ??= const GetSchedulingResponseEstimationEnumTypeTransformer._();

  const GetSchedulingResponseEstimationEnumTypeTransformer._();

  String encode(GetSchedulingResponseEstimationEnum data) => data._value;

  /// Returns the instance of [GetSchedulingResponseEstimationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetSchedulingResponseEstimationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetSchedulingResponseEstimationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'StoryPoints': return GetSchedulingResponseEstimationEnum.storyPoints;
        case r'Days': return GetSchedulingResponseEstimationEnum.days;
        case r'Hours': return GetSchedulingResponseEstimationEnum.hours;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetSchedulingResponseEstimationEnumTypeTransformer? _instance;
}


/// The inferred dates for the plan. This is \"None\", \"SprintDates\" or \"ReleaseDates\".
enum GetSchedulingResponseInferredDatesEnum {
  none._(r'None'),
  sprintDates._(r'SprintDates'),
  releaseDates._(r'ReleaseDates'),
  ;

  /// Instantiate a new enum with the provided value.
  const GetSchedulingResponseInferredDatesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [GetSchedulingResponseInferredDatesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static GetSchedulingResponseInferredDatesEnum? fromJson(dynamic value) => GetSchedulingResponseInferredDatesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [GetSchedulingResponseInferredDatesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<GetSchedulingResponseInferredDatesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetSchedulingResponseInferredDatesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetSchedulingResponseInferredDatesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [GetSchedulingResponseInferredDatesEnum] to String,
/// and [decode] dynamic data back to [GetSchedulingResponseInferredDatesEnum].
class GetSchedulingResponseInferredDatesEnumTypeTransformer {
  factory GetSchedulingResponseInferredDatesEnumTypeTransformer() => _instance ??= const GetSchedulingResponseInferredDatesEnumTypeTransformer._();

  const GetSchedulingResponseInferredDatesEnumTypeTransformer._();

  String encode(GetSchedulingResponseInferredDatesEnum data) => data._value;

  /// Returns the instance of [GetSchedulingResponseInferredDatesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  GetSchedulingResponseInferredDatesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is GetSchedulingResponseInferredDatesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'None': return GetSchedulingResponseInferredDatesEnum.none;
        case r'SprintDates': return GetSchedulingResponseInferredDatesEnum.sprintDates;
        case r'ReleaseDates': return GetSchedulingResponseInferredDatesEnum.releaseDates;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static GetSchedulingResponseInferredDatesEnumTypeTransformer? _instance;
}


