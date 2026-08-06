//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkWorklogKeyRequestBean {
  /// Returns a new [BulkWorklogKeyRequestBean] instance.
  BulkWorklogKeyRequestBean({
    this.requests = const [],
  });

  /// A list of issue and worklog ID pairs.
  List<WorklogCompositeKey> requests;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkWorklogKeyRequestBean &&
    _deepEquality.equals(other.requests, requests);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (requests.hashCode);

  @override
  String toString() => 'BulkWorklogKeyRequestBean[requests=$requests]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'requests'] = this.requests;
    return json;
  }

  /// Returns a new [BulkWorklogKeyRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkWorklogKeyRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkWorklogKeyRequestBean(
        requests: WorklogCompositeKey.listFromJson(json[r'requests']),
      );
    }
    return null;
  }

  static List<BulkWorklogKeyRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkWorklogKeyRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkWorklogKeyRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkWorklogKeyRequestBean> mapFromJson(dynamic json) {
    final map = <String, BulkWorklogKeyRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkWorklogKeyRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkWorklogKeyRequestBean-objects as value to a dart map
  static Map<String, List<BulkWorklogKeyRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkWorklogKeyRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkWorklogKeyRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

