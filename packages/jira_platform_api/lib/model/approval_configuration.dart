//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApprovalConfiguration {
  /// Returns a new [ApprovalConfiguration] instance.
  ApprovalConfiguration({
    required this.active,
    required this.conditionType,
    required this.conditionValue,
    this.exclude = const [],
    required this.fieldId,
    this.prePopulatedFieldId,
    required this.transitionApproved,
    required this.transitionRejected,
  });

  /// Whether the approval configuration is active.
  ApprovalConfigurationActiveEnum active;

  /// How the required approval count is calculated. It may be configured to require a specific number of approvals, or approval by a percentage of approvers. If the approvers source field is Approver groups, you can configure how many approvals per group are required for the request to be approved. The number will be the same across all groups.
  ApprovalConfigurationConditionTypeEnum conditionType;

  /// The number or percentage of approvals required for a request to be approved. If `conditionType` is `number`, the value must be 20 or less. If `conditionType` is `percent`, the value must be 100 or less.
  String conditionValue;

  /// A list of roles that should be excluded as possible approvers.
  List<ApprovalConfigurationExcludeEnum?>? exclude;

  /// The custom field ID of the \"Approvers\" or \"Approver Groups\" field.
  String fieldId;

  /// The custom field ID of the field used to pre-populate the Approver field. Only supports the \"Affected Services\" field.
  String? prePopulatedFieldId;

  /// The numeric ID of the transition to be executed if the request is approved.
  String transitionApproved;

  /// The numeric ID of the transition to be executed if the request is declined.
  String transitionRejected;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApprovalConfiguration &&
    other.active == active &&
    other.conditionType == conditionType &&
    other.conditionValue == conditionValue &&
    _deepEquality.equals(other.exclude, exclude) &&
    other.fieldId == fieldId &&
    other.prePopulatedFieldId == prePopulatedFieldId &&
    other.transitionApproved == transitionApproved &&
    other.transitionRejected == transitionRejected;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (active.hashCode) +
    (conditionType.hashCode) +
    (conditionValue.hashCode) +
    (exclude == null ? 0 : exclude!.hashCode) +
    (fieldId.hashCode) +
    (prePopulatedFieldId == null ? 0 : prePopulatedFieldId!.hashCode) +
    (transitionApproved.hashCode) +
    (transitionRejected.hashCode);

  @override
  String toString() => 'ApprovalConfiguration[active=$active, conditionType=$conditionType, conditionValue=$conditionValue, exclude=$exclude, fieldId=$fieldId, prePopulatedFieldId=$prePopulatedFieldId, transitionApproved=$transitionApproved, transitionRejected=$transitionRejected]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'active'] = this.active;
      json[r'conditionType'] = this.conditionType;
      json[r'conditionValue'] = this.conditionValue;
    if (this.exclude != null) {
      json[r'exclude'] = this.exclude;
    } else {
      json[r'exclude'] = null;
    }
      json[r'fieldId'] = this.fieldId;
    if (this.prePopulatedFieldId != null) {
      json[r'prePopulatedFieldId'] = this.prePopulatedFieldId;
    } else {
      json[r'prePopulatedFieldId'] = null;
    }
      json[r'transitionApproved'] = this.transitionApproved;
      json[r'transitionRejected'] = this.transitionRejected;
    return json;
  }

  /// Returns a new [ApprovalConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApprovalConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'active'), 'Required key "ApprovalConfiguration[active]" is missing from JSON.');
        assert(json[r'active'] != null, 'Required key "ApprovalConfiguration[active]" has a null value in JSON.');
        assert(json.containsKey(r'conditionType'), 'Required key "ApprovalConfiguration[conditionType]" is missing from JSON.');
        assert(json[r'conditionType'] != null, 'Required key "ApprovalConfiguration[conditionType]" has a null value in JSON.');
        assert(json.containsKey(r'conditionValue'), 'Required key "ApprovalConfiguration[conditionValue]" is missing from JSON.');
        assert(json[r'conditionValue'] != null, 'Required key "ApprovalConfiguration[conditionValue]" has a null value in JSON.');
        assert(json.containsKey(r'fieldId'), 'Required key "ApprovalConfiguration[fieldId]" is missing from JSON.');
        assert(json[r'fieldId'] != null, 'Required key "ApprovalConfiguration[fieldId]" has a null value in JSON.');
        assert(json.containsKey(r'transitionApproved'), 'Required key "ApprovalConfiguration[transitionApproved]" is missing from JSON.');
        assert(json[r'transitionApproved'] != null, 'Required key "ApprovalConfiguration[transitionApproved]" has a null value in JSON.');
        assert(json.containsKey(r'transitionRejected'), 'Required key "ApprovalConfiguration[transitionRejected]" is missing from JSON.');
        assert(json[r'transitionRejected'] != null, 'Required key "ApprovalConfiguration[transitionRejected]" has a null value in JSON.');
        return true;
      }());

      return ApprovalConfiguration(
        active: ApprovalConfigurationActiveEnum.fromJson(json[r'active'])!,
        conditionType: ApprovalConfigurationConditionTypeEnum.fromJson(json[r'conditionType'])!,
        conditionValue: mapValueOfType<String>(json, r'conditionValue')!,
        exclude: ApprovalConfigurationExcludeEnum.listFromJson(json[r'exclude']),
        fieldId: mapValueOfType<String>(json, r'fieldId')!,
        prePopulatedFieldId: mapValueOfType<String>(json, r'prePopulatedFieldId'),
        transitionApproved: mapValueOfType<String>(json, r'transitionApproved')!,
        transitionRejected: mapValueOfType<String>(json, r'transitionRejected')!,
      );
    }
    return null;
  }

  static List<ApprovalConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApprovalConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApprovalConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApprovalConfiguration> mapFromJson(dynamic json) {
    final map = <String, ApprovalConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApprovalConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApprovalConfiguration-objects as value to a dart map
  static Map<String, List<ApprovalConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ApprovalConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApprovalConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'active',
    'conditionType',
    'conditionValue',
    'fieldId',
    'transitionApproved',
    'transitionRejected',
  };
}

/// Whether the approval configuration is active.
enum ApprovalConfigurationActiveEnum {
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const ApprovalConfigurationActiveEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ApprovalConfigurationActiveEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ApprovalConfigurationActiveEnum? fromJson(dynamic value) => ApprovalConfigurationActiveEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ApprovalConfigurationActiveEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ApprovalConfigurationActiveEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApprovalConfigurationActiveEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApprovalConfigurationActiveEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ApprovalConfigurationActiveEnum] to String,
/// and [decode] dynamic data back to [ApprovalConfigurationActiveEnum].
class ApprovalConfigurationActiveEnumTypeTransformer {
  factory ApprovalConfigurationActiveEnumTypeTransformer() => _instance ??= const ApprovalConfigurationActiveEnumTypeTransformer._();

  const ApprovalConfigurationActiveEnumTypeTransformer._();

  String encode(ApprovalConfigurationActiveEnum data) => data._value;

  /// Returns the instance of [ApprovalConfigurationActiveEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ApprovalConfigurationActiveEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ApprovalConfigurationActiveEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'true': return ApprovalConfigurationActiveEnum.true_;
        case r'false': return ApprovalConfigurationActiveEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ApprovalConfigurationActiveEnumTypeTransformer? _instance;
}


/// How the required approval count is calculated. It may be configured to require a specific number of approvals, or approval by a percentage of approvers. If the approvers source field is Approver groups, you can configure how many approvals per group are required for the request to be approved. The number will be the same across all groups.
enum ApprovalConfigurationConditionTypeEnum {
  number._(r'number'),
  percent._(r'percent'),
  numberPerPrincipal._(r'numberPerPrincipal'),
  ;

  /// Instantiate a new enum with the provided value.
  const ApprovalConfigurationConditionTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ApprovalConfigurationConditionTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ApprovalConfigurationConditionTypeEnum? fromJson(dynamic value) => ApprovalConfigurationConditionTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ApprovalConfigurationConditionTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ApprovalConfigurationConditionTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApprovalConfigurationConditionTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApprovalConfigurationConditionTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ApprovalConfigurationConditionTypeEnum] to String,
/// and [decode] dynamic data back to [ApprovalConfigurationConditionTypeEnum].
class ApprovalConfigurationConditionTypeEnumTypeTransformer {
  factory ApprovalConfigurationConditionTypeEnumTypeTransformer() => _instance ??= const ApprovalConfigurationConditionTypeEnumTypeTransformer._();

  const ApprovalConfigurationConditionTypeEnumTypeTransformer._();

  String encode(ApprovalConfigurationConditionTypeEnum data) => data._value;

  /// Returns the instance of [ApprovalConfigurationConditionTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ApprovalConfigurationConditionTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ApprovalConfigurationConditionTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'number': return ApprovalConfigurationConditionTypeEnum.number;
        case r'percent': return ApprovalConfigurationConditionTypeEnum.percent;
        case r'numberPerPrincipal': return ApprovalConfigurationConditionTypeEnum.numberPerPrincipal;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ApprovalConfigurationConditionTypeEnumTypeTransformer? _instance;
}


/// A list of roles that should be excluded as possible approvers.
enum ApprovalConfigurationExcludeEnum {
  assignee._(r'assignee'),
  reporter._(r'reporter'),
  ;

  /// Instantiate a new enum with the provided value.
  const ApprovalConfigurationExcludeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [ApprovalConfigurationExcludeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static ApprovalConfigurationExcludeEnum? fromJson(dynamic value) => ApprovalConfigurationExcludeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [ApprovalConfigurationExcludeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<ApprovalConfigurationExcludeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApprovalConfigurationExcludeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApprovalConfigurationExcludeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [ApprovalConfigurationExcludeEnum] to String,
/// and [decode] dynamic data back to [ApprovalConfigurationExcludeEnum].
class ApprovalConfigurationExcludeEnumTypeTransformer {
  factory ApprovalConfigurationExcludeEnumTypeTransformer() => _instance ??= const ApprovalConfigurationExcludeEnumTypeTransformer._();

  const ApprovalConfigurationExcludeEnumTypeTransformer._();

  String encode(ApprovalConfigurationExcludeEnum data) => data._value;

  /// Returns the instance of [ApprovalConfigurationExcludeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  ApprovalConfigurationExcludeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is ApprovalConfigurationExcludeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'assignee': return ApprovalConfigurationExcludeEnum.assignee;
        case r'reporter': return ApprovalConfigurationExcludeEnum.reporter;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static ApprovalConfigurationExcludeEnumTypeTransformer? _instance;
}


