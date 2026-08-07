//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionRoleAssignment {
  /// Returns a new [BulkTransitionRoleAssignment] instance.
  BulkTransitionRoleAssignment({
    required this.permissionCombinationId,
    this.principalTypeAssignments = const [],
  });

  /// The ID of the permission combination.
  String permissionCombinationId;

  /// List of principal type assignments.
  List<BulkTransitionPrincipalTypeAssignment> principalTypeAssignments;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionRoleAssignment &&
    other.permissionCombinationId == permissionCombinationId &&
    _deepEquality.equals(other.principalTypeAssignments, principalTypeAssignments);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (permissionCombinationId.hashCode) +
    (principalTypeAssignments.hashCode);

  @override
  String toString() => 'BulkTransitionRoleAssignment[permissionCombinationId=$permissionCombinationId, principalTypeAssignments=$principalTypeAssignments]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'permissionCombinationId'] = this.permissionCombinationId;
      json[r'principalTypeAssignments'] = this.principalTypeAssignments;
    return json;
  }

  /// Returns a new [BulkTransitionRoleAssignment] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionRoleAssignment? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'permissionCombinationId'), 'Required key "BulkTransitionRoleAssignment[permissionCombinationId]" is missing from JSON.');
        assert(json[r'permissionCombinationId'] != null, 'Required key "BulkTransitionRoleAssignment[permissionCombinationId]" has a null value in JSON.');
        assert(json.containsKey(r'principalTypeAssignments'), 'Required key "BulkTransitionRoleAssignment[principalTypeAssignments]" is missing from JSON.');
        assert(json[r'principalTypeAssignments'] != null, 'Required key "BulkTransitionRoleAssignment[principalTypeAssignments]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionRoleAssignment(
        permissionCombinationId: mapValueOfType<String>(json, r'permissionCombinationId')!,
        principalTypeAssignments: BulkTransitionPrincipalTypeAssignment.listFromJson(json[r'principalTypeAssignments']),
      );
    }
    return null;
  }

  static List<BulkTransitionRoleAssignment> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionRoleAssignment>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionRoleAssignment.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionRoleAssignment> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionRoleAssignment>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionRoleAssignment.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionRoleAssignment-objects as value to a dart map
  static Map<String, List<BulkTransitionRoleAssignment>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionRoleAssignment>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionRoleAssignment.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'permissionCombinationId',
    'principalTypeAssignments',
  };
}

