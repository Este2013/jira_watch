//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoveFieldAssociationsRequestItem {
  /// Returns a new [RemoveFieldAssociationsRequestItem] instance.
  RemoveFieldAssociationsRequestItem({
    this.schemeIds = const [],
  });

  /// Set of scheme IDs from which to remove field associations
  List<int> schemeIds;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoveFieldAssociationsRequestItem &&
    _deepEquality.equals(other.schemeIds, schemeIds);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (schemeIds.hashCode);

  @override
  String toString() => 'RemoveFieldAssociationsRequestItem[schemeIds=$schemeIds]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'schemeIds'] = this.schemeIds;
    return json;
  }

  /// Returns a new [RemoveFieldAssociationsRequestItem] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoveFieldAssociationsRequestItem? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'schemeIds'), 'Required key "RemoveFieldAssociationsRequestItem[schemeIds]" is missing from JSON.');
        assert(json[r'schemeIds'] != null, 'Required key "RemoveFieldAssociationsRequestItem[schemeIds]" has a null value in JSON.');
        return true;
      }());

      return RemoveFieldAssociationsRequestItem(
        schemeIds: json[r'schemeIds'] is Iterable
            ? (json[r'schemeIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<RemoveFieldAssociationsRequestItem> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoveFieldAssociationsRequestItem>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoveFieldAssociationsRequestItem.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoveFieldAssociationsRequestItem> mapFromJson(dynamic json) {
    final map = <String, RemoveFieldAssociationsRequestItem>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoveFieldAssociationsRequestItem.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoveFieldAssociationsRequestItem-objects as value to a dart map
  static Map<String, List<RemoveFieldAssociationsRequestItem>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoveFieldAssociationsRequestItem>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoveFieldAssociationsRequestItem.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'schemeIds',
  };
}

