//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkAssignRolesRequest {
  /// Returns a new [BulkAssignRolesRequest] instance.
  BulkAssignRolesRequest({
    this.assignments = const [],
    required this.spaceSelection,
  });

  /// List of role assignments to apply.
  List<BulkTransitionRoleAssignment> assignments;

  BulkTransitionSpaceSelection spaceSelection;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkAssignRolesRequest &&
    _deepEquality.equals(other.assignments, assignments) &&
    other.spaceSelection == spaceSelection;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (assignments.hashCode) +
    (spaceSelection.hashCode);

  @override
  String toString() => 'BulkAssignRolesRequest[assignments=$assignments, spaceSelection=$spaceSelection]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'assignments'] = this.assignments;
      json[r'spaceSelection'] = this.spaceSelection;
    return json;
  }

  /// Returns a new [BulkAssignRolesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkAssignRolesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'assignments'), 'Required key "BulkAssignRolesRequest[assignments]" is missing from JSON.');
        assert(json[r'assignments'] != null, 'Required key "BulkAssignRolesRequest[assignments]" has a null value in JSON.');
        assert(json.containsKey(r'spaceSelection'), 'Required key "BulkAssignRolesRequest[spaceSelection]" is missing from JSON.');
        assert(json[r'spaceSelection'] != null, 'Required key "BulkAssignRolesRequest[spaceSelection]" has a null value in JSON.');
        return true;
      }());

      return BulkAssignRolesRequest(
        assignments: BulkTransitionRoleAssignment.listFromJson(json[r'assignments']),
        spaceSelection: BulkTransitionSpaceSelection.fromJson(json[r'spaceSelection'])!,
      );
    }
    return null;
  }

  static List<BulkAssignRolesRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkAssignRolesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkAssignRolesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkAssignRolesRequest> mapFromJson(dynamic json) {
    final map = <String, BulkAssignRolesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkAssignRolesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkAssignRolesRequest-objects as value to a dart map
  static Map<String, List<BulkAssignRolesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkAssignRolesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkAssignRolesRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'assignments',
    'spaceSelection',
  };
}

