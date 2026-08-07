//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorkflowUpdateValidateRequestBean {
  /// Returns a new [WorkflowUpdateValidateRequestBean] instance.
  WorkflowUpdateValidateRequestBean({
    required this.payload,
    this.validationOptions,
  });

  WorkflowUpdateRequest payload;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ValidationOptionsForUpdate? validationOptions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorkflowUpdateValidateRequestBean &&
    other.payload == payload &&
    other.validationOptions == validationOptions;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (payload.hashCode) +
    (validationOptions == null ? 0 : validationOptions!.hashCode);

  @override
  String toString() => 'WorkflowUpdateValidateRequestBean[payload=$payload, validationOptions=$validationOptions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'payload'] = this.payload;
    if (this.validationOptions != null) {
      json[r'validationOptions'] = this.validationOptions;
    } else {
      json[r'validationOptions'] = null;
    }
    return json;
  }

  /// Returns a new [WorkflowUpdateValidateRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorkflowUpdateValidateRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'payload'), 'Required key "WorkflowUpdateValidateRequestBean[payload]" is missing from JSON.');
        assert(json[r'payload'] != null, 'Required key "WorkflowUpdateValidateRequestBean[payload]" has a null value in JSON.');
        return true;
      }());

      return WorkflowUpdateValidateRequestBean(
        payload: WorkflowUpdateRequest.fromJson(json[r'payload'])!,
        validationOptions: ValidationOptionsForUpdate.fromJson(json[r'validationOptions']),
      );
    }
    return null;
  }

  static List<WorkflowUpdateValidateRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorkflowUpdateValidateRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorkflowUpdateValidateRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorkflowUpdateValidateRequestBean> mapFromJson(dynamic json) {
    final map = <String, WorkflowUpdateValidateRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorkflowUpdateValidateRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorkflowUpdateValidateRequestBean-objects as value to a dart map
  static Map<String, List<WorkflowUpdateValidateRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorkflowUpdateValidateRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorkflowUpdateValidateRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'payload',
  };
}

