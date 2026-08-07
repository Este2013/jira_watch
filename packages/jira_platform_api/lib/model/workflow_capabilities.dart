//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowCapabilities {
  /// Returns a new [WorkflowCapabilities] instance.
  WorkflowCapabilities({
    this.connectRules = const [],
    this.editorScope,
    this.forgeRules = const [],
    this.projectTypes = const [],
    this.systemRules = const [],
    this.triggerRules = const [],
  });

  /// The Connect provided ecosystem rules available.
  List<AvailableWorkflowConnectRule> connectRules;

  /// The scope of the workflow capabilities. `GLOBAL` for company-managed projects and `PROJECT` for team-managed projects.
  WorkflowCapabilitiesEditorScopeEnum? editorScope;

  /// The Forge provided ecosystem rules available.
  List<AvailableWorkflowForgeRule> forgeRules;

  /// The types of projects that this capability set is available for.
  List<WorkflowCapabilitiesProjectTypesEnum> projectTypes;

  /// The Atlassian provided system rules available.
  List<AvailableWorkflowSystemRule> systemRules;

  /// The trigger rules available.
  List<AvailableWorkflowTriggers> triggerRules;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowCapabilities &&
    _deepEquality.equals(other.connectRules, connectRules) &&
    other.editorScope == editorScope &&
    _deepEquality.equals(other.forgeRules, forgeRules) &&
    _deepEquality.equals(other.projectTypes, projectTypes) &&
    _deepEquality.equals(other.systemRules, systemRules) &&
    _deepEquality.equals(other.triggerRules, triggerRules);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (connectRules.hashCode) +
    (editorScope == null ? 0 : editorScope!.hashCode) +
    (forgeRules.hashCode) +
    (projectTypes.hashCode) +
    (systemRules.hashCode) +
    (triggerRules.hashCode);

  @override
  String toString() => 'WorkflowCapabilities[connectRules=$connectRules, editorScope=$editorScope, forgeRules=$forgeRules, projectTypes=$projectTypes, systemRules=$systemRules, triggerRules=$triggerRules]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'connectRules'] = this.connectRules;
    if (this.editorScope != null) {
      json[r'editorScope'] = this.editorScope;
    } else {
      json[r'editorScope'] = null;
    }
      json[r'forgeRules'] = this.forgeRules;
      json[r'projectTypes'] = this.projectTypes;
      json[r'systemRules'] = this.systemRules;
      json[r'triggerRules'] = this.triggerRules;
    return json;
  }

  /// Returns a new [WorkflowCapabilities] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowCapabilities? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorkflowCapabilities(
        connectRules: AvailableWorkflowConnectRule.listFromJson(json[r'connectRules']),
        editorScope: WorkflowCapabilitiesEditorScopeEnum.fromJson(json[r'editorScope']),
        forgeRules: AvailableWorkflowForgeRule.listFromJson(json[r'forgeRules']),
        projectTypes: WorkflowCapabilitiesProjectTypesEnum.listFromJson(json[r'projectTypes']),
        systemRules: AvailableWorkflowSystemRule.listFromJson(json[r'systemRules']),
        triggerRules: AvailableWorkflowTriggers.listFromJson(json[r'triggerRules']),
      );
    }
    return null;
  }

  static List<WorkflowCapabilities> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCapabilities>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCapabilities.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowCapabilities> mapFromJson(dynamic json) {
    final map = <String, WorkflowCapabilities>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowCapabilities.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowCapabilities-objects as value to a dart map
  static Map<String, List<WorkflowCapabilities>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowCapabilities>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowCapabilities.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The scope of the workflow capabilities. `GLOBAL` for company-managed projects and `PROJECT` for team-managed projects.
enum WorkflowCapabilitiesEditorScopeEnum {
  PROJECT._(r'PROJECT'),
  GLOBAL._(r'GLOBAL'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowCapabilitiesEditorScopeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowCapabilitiesEditorScopeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowCapabilitiesEditorScopeEnum? fromJson(dynamic value) => WorkflowCapabilitiesEditorScopeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowCapabilitiesEditorScopeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowCapabilitiesEditorScopeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCapabilitiesEditorScopeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCapabilitiesEditorScopeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowCapabilitiesEditorScopeEnum] to String,
/// and [decode] dynamic data back to [WorkflowCapabilitiesEditorScopeEnum].
class WorkflowCapabilitiesEditorScopeEnumTypeTransformer {
  factory WorkflowCapabilitiesEditorScopeEnumTypeTransformer() => _instance ??= const WorkflowCapabilitiesEditorScopeEnumTypeTransformer._();

  const WorkflowCapabilitiesEditorScopeEnumTypeTransformer._();

  String encode(WorkflowCapabilitiesEditorScopeEnum data) => data._value;

  /// Returns the instance of [WorkflowCapabilitiesEditorScopeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowCapabilitiesEditorScopeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowCapabilitiesEditorScopeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'PROJECT': return WorkflowCapabilitiesEditorScopeEnum.PROJECT;
        case r'GLOBAL': return WorkflowCapabilitiesEditorScopeEnum.GLOBAL;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowCapabilitiesEditorScopeEnumTypeTransformer? _instance;
}



enum WorkflowCapabilitiesProjectTypesEnum {
  software._(r'software'),
  serviceDesk._(r'service_desk'),
  productDiscovery._(r'product_discovery'),
  business._(r'business'),
  unknown._(r'unknown'),
  ;

  /// Instantiate a new enum with the provided value.
  const WorkflowCapabilitiesProjectTypesEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [WorkflowCapabilitiesProjectTypesEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static WorkflowCapabilitiesProjectTypesEnum? fromJson(dynamic value) => WorkflowCapabilitiesProjectTypesEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [WorkflowCapabilitiesProjectTypesEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<WorkflowCapabilitiesProjectTypesEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowCapabilitiesProjectTypesEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowCapabilitiesProjectTypesEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [WorkflowCapabilitiesProjectTypesEnum] to String,
/// and [decode] dynamic data back to [WorkflowCapabilitiesProjectTypesEnum].
class WorkflowCapabilitiesProjectTypesEnumTypeTransformer {
  factory WorkflowCapabilitiesProjectTypesEnumTypeTransformer() => _instance ??= const WorkflowCapabilitiesProjectTypesEnumTypeTransformer._();

  const WorkflowCapabilitiesProjectTypesEnumTypeTransformer._();

  String encode(WorkflowCapabilitiesProjectTypesEnum data) => data._value;

  /// Returns the instance of [WorkflowCapabilitiesProjectTypesEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  WorkflowCapabilitiesProjectTypesEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is WorkflowCapabilitiesProjectTypesEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'software': return WorkflowCapabilitiesProjectTypesEnum.software;
        case r'service_desk': return WorkflowCapabilitiesProjectTypesEnum.serviceDesk;
        case r'product_discovery': return WorkflowCapabilitiesProjectTypesEnum.productDiscovery;
        case r'business': return WorkflowCapabilitiesProjectTypesEnum.business;
        case r'unknown': return WorkflowCapabilitiesProjectTypesEnum.unknown;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static WorkflowCapabilitiesProjectTypesEnumTypeTransformer? _instance;
}


