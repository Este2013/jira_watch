//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApprovalConfigurationPreview {
  /// Returns a new [ApprovalConfigurationPreview] instance.
  ApprovalConfigurationPreview({
    this.active,
    this.transitionApproved,
    this.transitionRejected,
  });

  /// The active approval configuration.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? active;

  /// The transition ID for approved state.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transitionApproved;

  /// The transition ID for rejected state.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? transitionRejected;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ApprovalConfigurationPreview &&
    other.active == active &&
    other.transitionApproved == transitionApproved &&
    other.transitionRejected == transitionRejected;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (active == null ? 0 : active!.hashCode) +
    (transitionApproved == null ? 0 : transitionApproved!.hashCode) +
    (transitionRejected == null ? 0 : transitionRejected!.hashCode);

  @override
  String toString() => 'ApprovalConfigurationPreview[active=$active, transitionApproved=$transitionApproved, transitionRejected=$transitionRejected]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.active != null) {
      json[r'active'] = this.active;
    } else {
      json[r'active'] = null;
    }
    if (this.transitionApproved != null) {
      json[r'transitionApproved'] = this.transitionApproved;
    } else {
      json[r'transitionApproved'] = null;
    }
    if (this.transitionRejected != null) {
      json[r'transitionRejected'] = this.transitionRejected;
    } else {
      json[r'transitionRejected'] = null;
    }
    return json;
  }

  /// Returns a new [ApprovalConfigurationPreview] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ApprovalConfigurationPreview? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ApprovalConfigurationPreview(
        active: mapValueOfType<String>(json, r'active'),
        transitionApproved: mapValueOfType<String>(json, r'transitionApproved'),
        transitionRejected: mapValueOfType<String>(json, r'transitionRejected'),
      );
    }
    return null;
  }

  static List<ApprovalConfigurationPreview> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ApprovalConfigurationPreview>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ApprovalConfigurationPreview.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ApprovalConfigurationPreview> mapFromJson(dynamic json) {
    final map = <String, ApprovalConfigurationPreview>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ApprovalConfigurationPreview.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ApprovalConfigurationPreview-objects as value to a dart map
  static Map<String, List<ApprovalConfigurationPreview>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ApprovalConfigurationPreview>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ApprovalConfigurationPreview.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

