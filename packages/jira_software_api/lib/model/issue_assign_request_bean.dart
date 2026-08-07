//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueAssignRequestBean {
  /// Returns a new [IssueAssignRequestBean] instance.
  IssueAssignRequestBean({
    this.issues = const [],
  });

  List<String> issues;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueAssignRequestBean &&
    _deepEquality.equals(other.issues, issues);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issues.hashCode);

  @override
  String toString() => 'IssueAssignRequestBean[issues=$issues]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issues'] = this.issues;
    return json;
  }

  /// Returns a new [IssueAssignRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueAssignRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueAssignRequestBean(
        issues: json[r'issues'] is Iterable
            ? (json[r'issues'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssueAssignRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueAssignRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueAssignRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueAssignRequestBean> mapFromJson(dynamic json) {
    final map = <String, IssueAssignRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueAssignRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueAssignRequestBean-objects as value to a dart map
  static Map<String, List<IssueAssignRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueAssignRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueAssignRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

