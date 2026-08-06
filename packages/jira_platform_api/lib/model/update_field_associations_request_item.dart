//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateFieldAssociationsRequestItem {
  /// Returns a new [UpdateFieldAssociationsRequestItem] instance.
  UpdateFieldAssociationsRequestItem({
    this.restrictedToWorkTypes = const [],
    this.schemeIds = const [],
  });

  /// (optional) Work types to restrict field to. Replaces any existing work type associations for the field. If not provided, the field is associated to any work types.
  List<int> restrictedToWorkTypes;

  /// Scheme IDs to associate field with
  List<int> schemeIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateFieldAssociationsRequestItem &&
    _deepEquality.equals(other.restrictedToWorkTypes, restrictedToWorkTypes) &&
    _deepEquality.equals(other.schemeIds, schemeIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (restrictedToWorkTypes.hashCode) +
    (schemeIds.hashCode);

  @override
  String toString() => 'UpdateFieldAssociationsRequestItem[restrictedToWorkTypes=$restrictedToWorkTypes, schemeIds=$schemeIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'restrictedToWorkTypes'] = this.restrictedToWorkTypes;
      json[r'schemeIds'] = this.schemeIds;
    return json;
  }

  /// Returns a new [UpdateFieldAssociationsRequestItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateFieldAssociationsRequestItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemeIds'), 'Required key "UpdateFieldAssociationsRequestItem[schemeIds]" is missing from JSON.');
        assert(json[r'schemeIds'] != null, 'Required key "UpdateFieldAssociationsRequestItem[schemeIds]" has a null value in JSON.');
        return true;
      }());

      return UpdateFieldAssociationsRequestItem(
        restrictedToWorkTypes: json[r'restrictedToWorkTypes'] is Iterable
            ? (json[r'restrictedToWorkTypes'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        schemeIds: json[r'schemeIds'] is Iterable
            ? (json[r'schemeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<UpdateFieldAssociationsRequestItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateFieldAssociationsRequestItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateFieldAssociationsRequestItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateFieldAssociationsRequestItem> mapFromJson(dynamic json) {
    final map = <String, UpdateFieldAssociationsRequestItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateFieldAssociationsRequestItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateFieldAssociationsRequestItem-objects as value to a dart map
  static Map<String, List<UpdateFieldAssociationsRequestItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateFieldAssociationsRequestItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateFieldAssociationsRequestItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'schemeIds',
  };
}

