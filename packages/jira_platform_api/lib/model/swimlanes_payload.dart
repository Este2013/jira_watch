//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SwimlanesPayload {
  /// Returns a new [SwimlanesPayload] instance.
  SwimlanesPayload({
    this.customSwimlanes = const [],
    this.defaultCustomSwimlaneName,
    this.swimlaneStrategy,
  });

  /// The custom swimlane definitions.
  List<SwimlanePayload> customSwimlanes;

  /// The name of the custom swimlane to use for work items that don't match any other swimlanes.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? defaultCustomSwimlaneName;

  /// The swimlane strategy for the board.
  SwimlanesPayloadSwimlaneStrategyEnum? swimlaneStrategy;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SwimlanesPayload &&
    _deepEquality.equals(other.customSwimlanes, customSwimlanes) &&
    other.defaultCustomSwimlaneName == defaultCustomSwimlaneName &&
    other.swimlaneStrategy == swimlaneStrategy;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (customSwimlanes.hashCode) +
    (defaultCustomSwimlaneName == null ? 0 : defaultCustomSwimlaneName!.hashCode) +
    (swimlaneStrategy == null ? 0 : swimlaneStrategy!.hashCode);

  @override
  String toString() => 'SwimlanesPayload[customSwimlanes=$customSwimlanes, defaultCustomSwimlaneName=$defaultCustomSwimlaneName, swimlaneStrategy=$swimlaneStrategy]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'customSwimlanes'] = this.customSwimlanes;
    if (this.defaultCustomSwimlaneName != null) {
      json[r'defaultCustomSwimlaneName'] = this.defaultCustomSwimlaneName;
    } else {
      json[r'defaultCustomSwimlaneName'] = null;
    }
    if (this.swimlaneStrategy != null) {
      json[r'swimlaneStrategy'] = this.swimlaneStrategy;
    } else {
      json[r'swimlaneStrategy'] = null;
    }
    return json;
  }

  /// Returns a new [SwimlanesPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SwimlanesPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SwimlanesPayload(
        customSwimlanes: SwimlanePayload.listFromJson(json[r'customSwimlanes']),
        defaultCustomSwimlaneName: mapValueOfType<String>(json, r'defaultCustomSwimlaneName'),
        swimlaneStrategy: SwimlanesPayloadSwimlaneStrategyEnum.fromJson(json[r'swimlaneStrategy']),
      );
    }
    return null;
  }

  static List<SwimlanesPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SwimlanesPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SwimlanesPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SwimlanesPayload> mapFromJson(dynamic json) {
    final map = <String, SwimlanesPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SwimlanesPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SwimlanesPayload-objects as value to a dart map
  static Map<String, List<SwimlanesPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SwimlanesPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SwimlanesPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The swimlane strategy for the board.
enum SwimlanesPayloadSwimlaneStrategyEnum {
  none._(r'none'),
  custom._(r'custom'),
  parentChild._(r'parentChild'),
  assignee._(r'assignee'),
  assigneeUnassignedFirst._(r'assigneeUnassignedFirst'),
  epic._(r'epic'),
  project._(r'project'),
  issueparent._(r'issueparent'),
  issuechildren._(r'issuechildren'),
  requestType._(r'request_type'),
  ;

  /// Instantiate a new enum with the provided value.
  const SwimlanesPayloadSwimlaneStrategyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SwimlanesPayloadSwimlaneStrategyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SwimlanesPayloadSwimlaneStrategyEnum? fromJson(dynamic value) => SwimlanesPayloadSwimlaneStrategyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SwimlanesPayloadSwimlaneStrategyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SwimlanesPayloadSwimlaneStrategyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SwimlanesPayloadSwimlaneStrategyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SwimlanesPayloadSwimlaneStrategyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SwimlanesPayloadSwimlaneStrategyEnum] to String,
/// and [decode] dynamic data back to [SwimlanesPayloadSwimlaneStrategyEnum].
class SwimlanesPayloadSwimlaneStrategyEnumTypeTransformer {
  factory SwimlanesPayloadSwimlaneStrategyEnumTypeTransformer() => _instance ??= const SwimlanesPayloadSwimlaneStrategyEnumTypeTransformer._();

  const SwimlanesPayloadSwimlaneStrategyEnumTypeTransformer._();

  String encode(SwimlanesPayloadSwimlaneStrategyEnum data) => data._value;

  /// Returns the instance of [SwimlanesPayloadSwimlaneStrategyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SwimlanesPayloadSwimlaneStrategyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SwimlanesPayloadSwimlaneStrategyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'none': return SwimlanesPayloadSwimlaneStrategyEnum.none;
        case r'custom': return SwimlanesPayloadSwimlaneStrategyEnum.custom;
        case r'parentChild': return SwimlanesPayloadSwimlaneStrategyEnum.parentChild;
        case r'assignee': return SwimlanesPayloadSwimlaneStrategyEnum.assignee;
        case r'assigneeUnassignedFirst': return SwimlanesPayloadSwimlaneStrategyEnum.assigneeUnassignedFirst;
        case r'epic': return SwimlanesPayloadSwimlaneStrategyEnum.epic;
        case r'project': return SwimlanesPayloadSwimlaneStrategyEnum.project;
        case r'issueparent': return SwimlanesPayloadSwimlaneStrategyEnum.issueparent;
        case r'issuechildren': return SwimlanesPayloadSwimlaneStrategyEnum.issuechildren;
        case r'request_type': return SwimlanesPayloadSwimlaneStrategyEnum.requestType;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SwimlanesPayloadSwimlaneStrategyEnumTypeTransformer? _instance;
}


