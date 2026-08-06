//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RankEpicsRequest {
  /// Returns a new [RankEpicsRequest] instance.
  RankEpicsRequest({
    this.rankAfterEpic,
    this.rankBeforeEpic,
    this.rankCustomFieldId,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankAfterEpic;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? rankBeforeEpic;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? rankCustomFieldId;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RankEpicsRequest &&
    other.rankAfterEpic == rankAfterEpic &&
    other.rankBeforeEpic == rankBeforeEpic &&
    other.rankCustomFieldId == rankCustomFieldId;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (rankAfterEpic == null ? 0 : rankAfterEpic!.hashCode) +
    (rankBeforeEpic == null ? 0 : rankBeforeEpic!.hashCode) +
    (rankCustomFieldId == null ? 0 : rankCustomFieldId!.hashCode);

  @override
  String toString() => 'RankEpicsRequest[rankAfterEpic=$rankAfterEpic, rankBeforeEpic=$rankBeforeEpic, rankCustomFieldId=$rankCustomFieldId]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.rankAfterEpic != null) {
      json[r'rankAfterEpic'] = this.rankAfterEpic;
    } else {
      json[r'rankAfterEpic'] = null;
    }
    if (this.rankBeforeEpic != null) {
      json[r'rankBeforeEpic'] = this.rankBeforeEpic;
    } else {
      json[r'rankBeforeEpic'] = null;
    }
    if (this.rankCustomFieldId != null) {
      json[r'rankCustomFieldId'] = this.rankCustomFieldId;
    } else {
      json[r'rankCustomFieldId'] = null;
    }
    return json;
  }

  /// Returns a new [RankEpicsRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RankEpicsRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return RankEpicsRequest(
        rankAfterEpic: mapValueOfType<String>(json, r'rankAfterEpic'),
        rankBeforeEpic: mapValueOfType<String>(json, r'rankBeforeEpic'),
        rankCustomFieldId: mapValueOfType<int>(json, r'rankCustomFieldId'),
      );
    }
    return null;
  }

  static List<RankEpicsRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RankEpicsRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RankEpicsRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RankEpicsRequest> mapFromJson(dynamic json) {
    final map = <String, RankEpicsRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RankEpicsRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RankEpicsRequest-objects as value to a dart map
  static Map<String, List<RankEpicsRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RankEpicsRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RankEpicsRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

