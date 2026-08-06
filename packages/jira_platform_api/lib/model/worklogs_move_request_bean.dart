//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class WorklogsMoveRequestBean {
  /// Returns a new [WorklogsMoveRequestBean] instance.
  WorklogsMoveRequestBean({
    this.ids = const [],
    this.issueIdOrKey,
  });

  /// A list of worklog IDs.
  List<int> ids;

  /// The issue id or key of the destination issue
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueIdOrKey;

  @override
  bool operator ==(Object other) => identical(this, other) || other is WorklogsMoveRequestBean &&
    _deepEquality.equals(other.ids, ids) &&
    other.issueIdOrKey == issueIdOrKey;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (ids.hashCode) +
    (issueIdOrKey == null ? 0 : issueIdOrKey!.hashCode);

  @override
  String toString() => 'WorklogsMoveRequestBean[ids=$ids, issueIdOrKey=$issueIdOrKey]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'ids'] = this.ids;
    if (this.issueIdOrKey != null) {
      json[r'issueIdOrKey'] = this.issueIdOrKey;
    } else {
      json[r'issueIdOrKey'] = null;
    }
    return json;
  }

  /// Returns a new [WorklogsMoveRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static WorklogsMoveRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return WorklogsMoveRequestBean(
        ids: json[r'ids'] is Iterable
            ? (json[r'ids'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        issueIdOrKey: mapValueOfType<String>(json, r'issueIdOrKey'),
      );
    }
    return null;
  }

  static List<WorklogsMoveRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <WorklogsMoveRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = WorklogsMoveRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, WorklogsMoveRequestBean> mapFromJson(dynamic json) {
    final map = <String, WorklogsMoveRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = WorklogsMoveRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of WorklogsMoveRequestBean-objects as value to a dart map
  static Map<String, List<WorklogsMoveRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<WorklogsMoveRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = WorklogsMoveRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

