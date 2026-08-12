//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkRemoveAccessRequest {
  /// Returns a new [BulkRemoveAccessRequest] instance.
  BulkRemoveAccessRequest({
    this.permissionCombinationIds = const [],
    required this.spaceSelection,
  });

  /// List of permission combination IDs to remove access for.
  List<String> permissionCombinationIds;

  BulkTransitionSpaceSelection spaceSelection;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkRemoveAccessRequest &&
    _deepEquality.equals(other.permissionCombinationIds, permissionCombinationIds) &&
    other.spaceSelection == spaceSelection;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (permissionCombinationIds.hashCode) +
    (spaceSelection.hashCode);

  @override
  String toString() => 'BulkRemoveAccessRequest[permissionCombinationIds=$permissionCombinationIds, spaceSelection=$spaceSelection]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'permissionCombinationIds'] = this.permissionCombinationIds;
      json[r'spaceSelection'] = this.spaceSelection;
    return json;
  }

  /// Returns a new [BulkRemoveAccessRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkRemoveAccessRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'permissionCombinationIds'), 'Required key "BulkRemoveAccessRequest[permissionCombinationIds]" is missing from JSON.');
        assert(json[r'permissionCombinationIds'] != null, 'Required key "BulkRemoveAccessRequest[permissionCombinationIds]" has a null value in JSON.');
        assert(json.containsKey(r'spaceSelection'), 'Required key "BulkRemoveAccessRequest[spaceSelection]" is missing from JSON.');
        assert(json[r'spaceSelection'] != null, 'Required key "BulkRemoveAccessRequest[spaceSelection]" has a null value in JSON.');
        return true;
      }());

      return BulkRemoveAccessRequest(
        permissionCombinationIds: json[r'permissionCombinationIds'] is Iterable
            ? (json[r'permissionCombinationIds'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        spaceSelection: BulkTransitionSpaceSelection.fromJson(json[r'spaceSelection'])!,
      );
    }
    return null;
  }

  static List<BulkRemoveAccessRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkRemoveAccessRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkRemoveAccessRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkRemoveAccessRequest> mapFromJson(dynamic json) {
    final map = <String, BulkRemoveAccessRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkRemoveAccessRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkRemoveAccessRequest-objects as value to a dart map
  static Map<String, List<BulkRemoveAccessRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkRemoveAccessRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkRemoveAccessRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'permissionCombinationIds',
    'spaceSelection',
  };
}

