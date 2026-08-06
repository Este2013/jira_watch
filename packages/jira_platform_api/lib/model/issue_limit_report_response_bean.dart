//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueLimitReportResponseBean {
  /// Returns a new [IssueLimitReportResponseBean] instance.
  IssueLimitReportResponseBean({
    this.issuesApproachingLimit = const {},
    this.issuesBreachingLimit = const {},
    this.limits = const {},
  });

  /// A list of ids of issues approaching the limit and their field count
  Map<String, Object> issuesApproachingLimit;

  /// A list of ids of issues breaching the limit and their field count
  Map<String, Object> issuesBreachingLimit;

  /// The fields and their defined limits
  Map<String, int> limits;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueLimitReportResponseBean &&
    _deepEquality.equals(other.issuesApproachingLimit, issuesApproachingLimit) &&
    _deepEquality.equals(other.issuesBreachingLimit, issuesBreachingLimit) &&
    _deepEquality.equals(other.limits, limits);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issuesApproachingLimit.hashCode) +
    (issuesBreachingLimit.hashCode) +
    (limits.hashCode);

  @override
  String toString() => 'IssueLimitReportResponseBean[issuesApproachingLimit=$issuesApproachingLimit, issuesBreachingLimit=$issuesBreachingLimit, limits=$limits]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issuesApproachingLimit'] = this.issuesApproachingLimit;
      json[r'issuesBreachingLimit'] = this.issuesBreachingLimit;
      json[r'limits'] = this.limits;
    return json;
  }

  /// Returns a new [IssueLimitReportResponseBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueLimitReportResponseBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueLimitReportResponseBean(
        issuesApproachingLimit: mapCastOfType<String, Object>(json, r'issuesApproachingLimit') ?? const {},
        issuesBreachingLimit: mapCastOfType<String, Object>(json, r'issuesBreachingLimit') ?? const {},
        limits: mapCastOfType<String, int>(json, r'limits') ?? const {},
      );
    }
    return null;
  }

  static List<IssueLimitReportResponseBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueLimitReportResponseBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueLimitReportResponseBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueLimitReportResponseBean> mapFromJson(dynamic json) {
    final map = <String, IssueLimitReportResponseBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueLimitReportResponseBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueLimitReportResponseBean-objects as value to a dart map
  static Map<String, List<IssueLimitReportResponseBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueLimitReportResponseBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueLimitReportResponseBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

