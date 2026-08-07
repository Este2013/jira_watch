//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkWorklogKeyResponseBean {
  /// Returns a new [BulkWorklogKeyResponseBean] instance.
  BulkWorklogKeyResponseBean({
    this.worklogs = const [],
  });

  /// A list of successfully retrieved worklogs with their issue and worklog IDs.
  List<WorklogKeyResult> worklogs;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkWorklogKeyResponseBean &&
    _deepEquality.equals(other.worklogs, worklogs);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (worklogs.hashCode);

  @override
  String toString() => 'BulkWorklogKeyResponseBean[worklogs=$worklogs]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'worklogs'] = this.worklogs;
    return json;
  }

  /// Returns a new [BulkWorklogKeyResponseBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkWorklogKeyResponseBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkWorklogKeyResponseBean(
        worklogs: WorklogKeyResult.listFromJson(json[r'worklogs']),
      );
    }
    return null;
  }

  static List<BulkWorklogKeyResponseBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkWorklogKeyResponseBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkWorklogKeyResponseBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkWorklogKeyResponseBean> mapFromJson(dynamic json) {
    final map = <String, BulkWorklogKeyResponseBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkWorklogKeyResponseBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkWorklogKeyResponseBean-objects as value to a dart map
  static Map<String, List<BulkWorklogKeyResponseBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkWorklogKeyResponseBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkWorklogKeyResponseBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

