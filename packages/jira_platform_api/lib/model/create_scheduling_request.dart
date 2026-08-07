//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreateSchedulingRequest {
  /// Returns a new [CreateSchedulingRequest] instance.
  CreateSchedulingRequest({
    this.dependencies,
    this.endDate,
    required this.estimation,
    this.inferredDates,
    this.startDate,
  });

  /// The dependencies for the plan. This must be \"Sequential\" or \"Concurrent\".
  CreateSchedulingRequestDependenciesEnum? dependencies;

  /// The end date field for the plan.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateDateFieldRequest? endDate;

  /// The estimation unit for the plan. This must be \"StoryPoints\", \"Days\" or \"Hours\".
  CreateSchedulingRequestEstimationEnum estimation;

  /// The inferred dates for the plan. This must be \"None\", \"SprintDates\" or \"ReleaseDates\".
  CreateSchedulingRequestInferredDatesEnum? inferredDates;

  /// The start date field for the plan.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  CreateDateFieldRequest? startDate;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreateSchedulingRequest &&
    other.dependencies == dependencies &&
    other.endDate == endDate &&
    other.estimation == estimation &&
    other.inferredDates == inferredDates &&
    other.startDate == startDate;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (dependencies == null ? 0 : dependencies!.hashCode) +
    (endDate == null ? 0 : endDate!.hashCode) +
    (estimation.hashCode) +
    (inferredDates == null ? 0 : inferredDates!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode);

  @override
  String toString() => 'CreateSchedulingRequest[dependencies=$dependencies, endDate=$endDate, estimation=$estimation, inferredDates=$inferredDates, startDate=$startDate]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.dependencies != null) {
      json[r'dependencies'] = this.dependencies;
    } else {
      json[r'dependencies'] = null;
    }
    if (this.endDate != null) {
      json[r'endDate'] = this.endDate;
    } else {
      json[r'endDate'] = null;
    }
      json[r'estimation'] = this.estimation;
    if (this.inferredDates != null) {
      json[r'inferredDates'] = this.inferredDates;
    } else {
      json[r'inferredDates'] = null;
    }
    if (this.startDate != null) {
      json[r'startDate'] = this.startDate;
    } else {
      json[r'startDate'] = null;
    }
    return json;
  }

  /// Returns a new [CreateSchedulingRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreateSchedulingRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'estimation'), 'Required key "CreateSchedulingRequest[estimation]" is missing from JSON.');
        assert(json[r'estimation'] != null, 'Required key "CreateSchedulingRequest[estimation]" has a null value in JSON.');
        return true;
      }());

      return CreateSchedulingRequest(
        dependencies: CreateSchedulingRequestDependenciesEnum.fromJson(json[r'dependencies']),
        endDate: CreateDateFieldRequest.fromJson(json[r'endDate']),
        estimation: CreateSchedulingRequestEstimationEnum.fromJson(json[r'estimation'])!,
        inferredDates: CreateSchedulingRequestInferredDatesEnum.fromJson(json[r'inferredDates']),
        startDate: CreateDateFieldRequest.fromJson(json[r'startDate']),
      );
    }
    return null;
  }

  static List<CreateSchedulingRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSchedulingRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSchedulingRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreateSchedulingRequest> mapFromJson(dynamic json) {
    final map = <String, CreateSchedulingRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreateSchedulingRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreateSchedulingRequest-objects as value to a dart map
  static Map<String, List<CreateSchedulingRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreateSchedulingRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreateSchedulingRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'estimation',
  };
}

/// The dependencies for the plan. This must be \"Sequential\" or \"Concurrent\".
enum CreateSchedulingRequestDependenciesEnum {
  sequential._(r'Sequential'),
  concurrent._(r'Concurrent'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateSchedulingRequestDependenciesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateSchedulingRequestDependenciesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateSchedulingRequestDependenciesEnum? fromJson(dynamic value) => CreateSchedulingRequestDependenciesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateSchedulingRequestDependenciesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateSchedulingRequestDependenciesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSchedulingRequestDependenciesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSchedulingRequestDependenciesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateSchedulingRequestDependenciesEnum] to String,
/// and [decode] dynamic data back to [CreateSchedulingRequestDependenciesEnum].
class CreateSchedulingRequestDependenciesEnumTypeTransformer {
  factory CreateSchedulingRequestDependenciesEnumTypeTransformer() => _instance ??= const CreateSchedulingRequestDependenciesEnumTypeTransformer._();

  const CreateSchedulingRequestDependenciesEnumTypeTransformer._();

  String encode(CreateSchedulingRequestDependenciesEnum data) => data._value;

  /// Returns the instance of [CreateSchedulingRequestDependenciesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateSchedulingRequestDependenciesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateSchedulingRequestDependenciesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'Sequential': return CreateSchedulingRequestDependenciesEnum.sequential;
        case r'Concurrent': return CreateSchedulingRequestDependenciesEnum.concurrent;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateSchedulingRequestDependenciesEnumTypeTransformer? _instance;
}


/// The estimation unit for the plan. This must be \"StoryPoints\", \"Days\" or \"Hours\".
enum CreateSchedulingRequestEstimationEnum {
  storyPoints._(r'StoryPoints'),
  days._(r'Days'),
  hours._(r'Hours'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateSchedulingRequestEstimationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateSchedulingRequestEstimationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateSchedulingRequestEstimationEnum? fromJson(dynamic value) => CreateSchedulingRequestEstimationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateSchedulingRequestEstimationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateSchedulingRequestEstimationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSchedulingRequestEstimationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSchedulingRequestEstimationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateSchedulingRequestEstimationEnum] to String,
/// and [decode] dynamic data back to [CreateSchedulingRequestEstimationEnum].
class CreateSchedulingRequestEstimationEnumTypeTransformer {
  factory CreateSchedulingRequestEstimationEnumTypeTransformer() => _instance ??= const CreateSchedulingRequestEstimationEnumTypeTransformer._();

  const CreateSchedulingRequestEstimationEnumTypeTransformer._();

  String encode(CreateSchedulingRequestEstimationEnum data) => data._value;

  /// Returns the instance of [CreateSchedulingRequestEstimationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateSchedulingRequestEstimationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateSchedulingRequestEstimationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'StoryPoints': return CreateSchedulingRequestEstimationEnum.storyPoints;
        case r'Days': return CreateSchedulingRequestEstimationEnum.days;
        case r'Hours': return CreateSchedulingRequestEstimationEnum.hours;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateSchedulingRequestEstimationEnumTypeTransformer? _instance;
}


/// The inferred dates for the plan. This must be \"None\", \"SprintDates\" or \"ReleaseDates\".
enum CreateSchedulingRequestInferredDatesEnum {
  none._(r'None'),
  sprintDates._(r'SprintDates'),
  releaseDates._(r'ReleaseDates'),
  ;

  /// Instantiate a new enum with the provided value.
  const CreateSchedulingRequestInferredDatesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreateSchedulingRequestInferredDatesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreateSchedulingRequestInferredDatesEnum? fromJson(dynamic value) => CreateSchedulingRequestInferredDatesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreateSchedulingRequestInferredDatesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreateSchedulingRequestInferredDatesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreateSchedulingRequestInferredDatesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreateSchedulingRequestInferredDatesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreateSchedulingRequestInferredDatesEnum] to String,
/// and [decode] dynamic data back to [CreateSchedulingRequestInferredDatesEnum].
class CreateSchedulingRequestInferredDatesEnumTypeTransformer {
  factory CreateSchedulingRequestInferredDatesEnumTypeTransformer() => _instance ??= const CreateSchedulingRequestInferredDatesEnumTypeTransformer._();

  const CreateSchedulingRequestInferredDatesEnumTypeTransformer._();

  String encode(CreateSchedulingRequestInferredDatesEnum data) => data._value;

  /// Returns the instance of [CreateSchedulingRequestInferredDatesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreateSchedulingRequestInferredDatesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreateSchedulingRequestInferredDatesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'None': return CreateSchedulingRequestInferredDatesEnum.none;
        case r'SprintDates': return CreateSchedulingRequestInferredDatesEnum.sprintDates;
        case r'ReleaseDates': return CreateSchedulingRequestInferredDatesEnum.releaseDates;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreateSchedulingRequestInferredDatesEnumTypeTransformer? _instance;
}


