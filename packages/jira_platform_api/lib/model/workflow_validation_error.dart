//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowValidationError {
  /// Returns a new [WorkflowValidationError] instance.
  WorkflowValidationError({
    this.additionalDetails,
    this.code,
    this.elementReference,
    this.level,
    this.message,
    this.type,
  });

  /// Additional details about the validation error.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? additionalDetails;

  /// An error code.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? code;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  WorkflowElementReference? elementReference;

  /// The validation error level.
  WorkflowValidationErrorLevelEnum? level;

  /// An error message.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// The type of element the error or warning references.
  WorkflowValidationErrorTypeEnum? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowValidationError &&
    other.additionalDetails == additionalDetails &&
    other.code == code &&
    other.elementReference == elementReference &&
    other.level == level &&
    other.message == message &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (additionalDetails == null ? 0 : additionalDetails!.hashCode) +
    (code == null ? 0 : code!.hashCode) +
    (elementReference == null ? 0 : elementReference!.hashCode) +
    (level == null ? 0 : level!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'WorkflowValidationError[additionalDetails=$additionalDetails, code=$code, elementReference=$elementReference, level=$level, message=$message, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.additionalDetails != null) {
      json[r'additionalDetails'] = this.additionalDetails;
    } else {
      json[r'additionalDetails'] = null;
    }
    if (this.code != null) {
      json[r'code'] = this.code;
    } else {
      json[r'code'] = null;
    }
    if (this.elementReference != null) {
      json[r'elementReference'] = this.elementReference;
    } else {
      json[r'elementReference'] = null;
    }
    if (this.level != null) {
      json[r'level'] = this.level;
    } else {
      json[r'level'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowValidationError] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowValidationError? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowValidationError(
        additionalDetails: mapValueOfType<String>(json, r'additionalDetails'),
        code: mapValueOfType<String>(json, r'code'),
        elementReference: WorkflowElementReference.fromJson(json[r'elementReference']),
        level: WorkflowValidationErrorLevelEnum.fromJson(json[r'level']),
        message: mapValueOfType<String>(json, r'message'),
        type: WorkflowValidationErrorTypeEnum.fromJson(json[r'type']),
      );
    }
    return null;
  }

  static List<WorkflowValidationError> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowValidationError>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowValidationError.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowValidationError> mapFromJson(dynamic json) {
    final map = <String, WorkflowValidationError>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowValidationError.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowValidationError-objects as value to a dart map
  static Map<String, List<WorkflowValidationError>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowValidationError>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowValidationError.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The validation error level.
enum WorkflowValidationErrorLevelEnum {
  WARNING._(r'WARNING'),
  ERROR._(r'ERROR'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowValidationErrorLevelEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowValidationErrorLevelEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowValidationErrorLevelEnum? fromJson(dynamic value) => WorkflowValidationErrorLevelEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowValidationErrorLevelEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowValidationErrorLevelEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowValidationErrorLevelEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowValidationErrorLevelEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowValidationErrorLevelEnum] to String,
/// and [decode] dynamic data back to [WorkflowValidationErrorLevelEnum].
class WorkflowValidationErrorLevelEnumTypeTransformer {
  factory WorkflowValidationErrorLevelEnumTypeTransformer() => _instance ??= const WorkflowValidationErrorLevelEnumTypeTransformer._();

  const WorkflowValidationErrorLevelEnumTypeTransformer._();

  String encode(WorkflowValidationErrorLevelEnum data) => data._value;

  /// Returns the instance of [WorkflowValidationErrorLevelEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowValidationErrorLevelEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowValidationErrorLevelEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'WARNING': return WorkflowValidationErrorLevelEnum.WARNING;
        case r'ERROR': return WorkflowValidationErrorLevelEnum.ERROR;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowValidationErrorLevelEnumTypeTransformer? _instance;
}


/// The type of element the error or warning references.
enum WorkflowValidationErrorTypeEnum {
  RULE._(r'RULE'),
  STATUS._(r'STATUS'),
  STATUS_LAYOUT._(r'STATUS_LAYOUT'),
  STATUS_PROPERTY._(r'STATUS_PROPERTY'),
  WORKFLOW._(r'WORKFLOW'),
  TRANSITION._(r'TRANSITION'),
  TRANSITION_PROPERTY._(r'TRANSITION_PROPERTY'),
  SCOPE._(r'SCOPE'),
  STATUS_MAPPING._(r'STATUS_MAPPING'),
  TRIGGER._(r'TRIGGER'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowValidationErrorTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowValidationErrorTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowValidationErrorTypeEnum? fromJson(dynamic value) => WorkflowValidationErrorTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowValidationErrorTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowValidationErrorTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowValidationErrorTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowValidationErrorTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowValidationErrorTypeEnum] to String,
/// and [decode] dynamic data back to [WorkflowValidationErrorTypeEnum].
class WorkflowValidationErrorTypeEnumTypeTransformer {
  factory WorkflowValidationErrorTypeEnumTypeTransformer() => _instance ??= const WorkflowValidationErrorTypeEnumTypeTransformer._();

  const WorkflowValidationErrorTypeEnumTypeTransformer._();

  String encode(WorkflowValidationErrorTypeEnum data) => data._value;

  /// Returns the instance of [WorkflowValidationErrorTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowValidationErrorTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowValidationErrorTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'RULE': return WorkflowValidationErrorTypeEnum.RULE;
        case r'STATUS': return WorkflowValidationErrorTypeEnum.STATUS;
        case r'STATUS_LAYOUT': return WorkflowValidationErrorTypeEnum.STATUS_LAYOUT;
        case r'STATUS_PROPERTY': return WorkflowValidationErrorTypeEnum.STATUS_PROPERTY;
        case r'WORKFLOW': return WorkflowValidationErrorTypeEnum.WORKFLOW;
        case r'TRANSITION': return WorkflowValidationErrorTypeEnum.TRANSITION;
        case r'TRANSITION_PROPERTY': return WorkflowValidationErrorTypeEnum.TRANSITION_PROPERTY;
        case r'SCOPE': return WorkflowValidationErrorTypeEnum.SCOPE;
        case r'STATUS_MAPPING': return WorkflowValidationErrorTypeEnum.STATUS_MAPPING;
        case r'TRIGGER': return WorkflowValidationErrorTypeEnum.TRIGGER;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowValidationErrorTypeEnumTypeTransformer? _instance;
}


