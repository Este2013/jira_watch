//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ListSpacePermissionCombinationsResponse {
  /// Returns a new [ListSpacePermissionCombinationsResponse] instance.
  ListSpacePermissionCombinationsResponse({
    this.results = const [],
    this.generatedAt,
    this.cursor,
  });

  /// One page of unassigned permission combinations, sorted by principalCount descending.
  List<BulkTransitionCombinationEntry> results;

  /// ISO-8601 timestamp of the last audit run that populated the combinations table. Absent if the audit task has never run on this tenant.
  String? generatedAt;

  /// Opaque cursor for the next page. Absent when no further results exist.
  String? cursor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ListSpacePermissionCombinationsResponse &&
    _deepEquality.equals(other.results, results) &&
    other.generatedAt == generatedAt &&
    other.cursor == cursor;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode) +
    (generatedAt == null ? 0 : generatedAt!.hashCode) +
    (cursor == null ? 0 : cursor!.hashCode);

  @override
  String toString() => 'ListSpacePermissionCombinationsResponse[results=$results, generatedAt=$generatedAt, cursor=$cursor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    if (this.generatedAt != null) {
      json[r'generatedAt'] = this.generatedAt;
    } else {
      json[r'generatedAt'] = null;
    }
    if (this.cursor != null) {
      json[r'cursor'] = this.cursor;
    } else {
      json[r'cursor'] = null;
    }
    return json;
  }

  /// Returns a new [ListSpacePermissionCombinationsResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ListSpacePermissionCombinationsResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'results'), 'Required key "ListSpacePermissionCombinationsResponse[results]" is missing from JSON.');
        assert(json[r'results'] != null, 'Required key "ListSpacePermissionCombinationsResponse[results]" has a null value in JSON.');
        return true;
      }());

      return ListSpacePermissionCombinationsResponse(
        results: BulkTransitionCombinationEntry.listFromJson(json[r'results']),
        generatedAt: mapValueOfType<String>(json, r'generatedAt'),
        cursor: mapValueOfType<String>(json, r'cursor'),
      );
    }
    return null;
  }

  static List<ListSpacePermissionCombinationsResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ListSpacePermissionCombinationsResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ListSpacePermissionCombinationsResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ListSpacePermissionCombinationsResponse> mapFromJson(dynamic json) {
    final map = <String, ListSpacePermissionCombinationsResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ListSpacePermissionCombinationsResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ListSpacePermissionCombinationsResponse-objects as value to a dart map
  static Map<String, List<ListSpacePermissionCombinationsResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ListSpacePermissionCombinationsResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ListSpacePermissionCombinationsResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'results',
  };
}

