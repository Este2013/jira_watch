//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ContainerOfWorkflowSchemeAssociations {
  /// Returns a new [ContainerOfWorkflowSchemeAssociations] instance.
  ContainerOfWorkflowSchemeAssociations({
    this.values = const [],
  });

  /// A list of workflow schemes together with projects they are associated with.
  List<WorkflowSchemeAssociations> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ContainerOfWorkflowSchemeAssociations &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (values.hashCode);

  @override
  String toString() => 'ContainerOfWorkflowSchemeAssociations[values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [ContainerOfWorkflowSchemeAssociations] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ContainerOfWorkflowSchemeAssociations? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'values'), 'Required key "ContainerOfWorkflowSchemeAssociations[values]" is missing from JSON.');
        assert(json[r'values'] != null, 'Required key "ContainerOfWorkflowSchemeAssociations[values]" has a null value in JSON.');
        return true;
      }());

      return ContainerOfWorkflowSchemeAssociations(
        values: WorkflowSchemeAssociations.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<ContainerOfWorkflowSchemeAssociations> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ContainerOfWorkflowSchemeAssociations>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ContainerOfWorkflowSchemeAssociations.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ContainerOfWorkflowSchemeAssociations> mapFromJson(dynamic json) {
    final map = <String, ContainerOfWorkflowSchemeAssociations>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ContainerOfWorkflowSchemeAssociations.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ContainerOfWorkflowSchemeAssociations-objects as value to a dart map
  static Map<String, List<ContainerOfWorkflowSchemeAssociations>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ContainerOfWorkflowSchemeAssociations>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ContainerOfWorkflowSchemeAssociations.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'values',
  };
}

