//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ReorderIssueResolutionsRequest {
  /// Returns a new [ReorderIssueResolutionsRequest] instance.
  ReorderIssueResolutionsRequest({
    this.after,
    this.ids = const [],
    this.position,
  });

  /// The ID of the resolution. Required if `position` isn't provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? after;

  /// The list of resolution IDs to be reordered. Cannot contain duplicates nor after ID.
  List<String> ids;

  /// The position for issue resolutions to be moved to. Required if `after` isn't provided.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? position;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ReorderIssueResolutionsRequest &&
    other.after == after &&
    _deepEquality.equals(other.ids, ids) &&
    other.position == position;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (after == null ? 0 : after!.hashCode) +
    (ids.hashCode) +
    (position == null ? 0 : position!.hashCode);

  @override
  String toString() => 'ReorderIssueResolutionsRequest[after=$after, ids=$ids, position=$position]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.after != null) {
      json[r'after'] = this.after;
    } else {
      json[r'after'] = null;
    }
      json[r'ids'] = this.ids;
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    return json;
  }

  /// Returns a new [ReorderIssueResolutionsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ReorderIssueResolutionsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'ids'), 'Required key "ReorderIssueResolutionsRequest[ids]" is missing from JSON.');
        assert(json[r'ids'] != null, 'Required key "ReorderIssueResolutionsRequest[ids]" has a null value in JSON.');
        return true;
      }());

      return ReorderIssueResolutionsRequest(
        after: mapValueOfType<String>(json, r'after'),
        ids: json[r'ids'] is Iterable
            ? (json[r'ids'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        position: mapValueOfType<String>(json, r'position'),
      );
    }
    return null;
  }

  static List<ReorderIssueResolutionsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ReorderIssueResolutionsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ReorderIssueResolutionsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ReorderIssueResolutionsRequest> mapFromJson(dynamic json) {
    final map = <String, ReorderIssueResolutionsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ReorderIssueResolutionsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ReorderIssueResolutionsRequest-objects as value to a dart map
  static Map<String, List<ReorderIssueResolutionsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ReorderIssueResolutionsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ReorderIssueResolutionsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'ids',
  };
}

