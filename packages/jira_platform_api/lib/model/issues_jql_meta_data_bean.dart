//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssuesJqlMetaDataBean {
  /// Returns a new [IssuesJqlMetaDataBean] instance.
  IssuesJqlMetaDataBean({
    required this.count,
    required this.maxResults,
    required this.startAt,
    required this.totalCount,
    this.validationWarnings = const [],
  });

  /// The number of issues that were loaded in this evaluation.
  int count;

  /// The maximum number of issues that could be loaded in this evaluation.
  int maxResults;

  /// The index of the first issue.
  int startAt;

  /// The total number of issues the JQL returned.
  int totalCount;

  /// Any warnings related to the JQL query. Present only if the validation mode was set to `warn`.
  List<String> validationWarnings;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssuesJqlMetaDataBean &&
    other.count == count &&
    other.maxResults == maxResults &&
    other.startAt == startAt &&
    other.totalCount == totalCount &&
    _deepEquality.equals(other.validationWarnings, validationWarnings);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (count.hashCode) +
    (maxResults.hashCode) +
    (startAt.hashCode) +
    (totalCount.hashCode) +
    (validationWarnings.hashCode);

  @override
  String toString() => 'IssuesJqlMetaDataBean[count=$count, maxResults=$maxResults, startAt=$startAt, totalCount=$totalCount, validationWarnings=$validationWarnings]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'count'] = this.count;
      json[r'maxResults'] = this.maxResults;
      json[r'startAt'] = this.startAt;
      json[r'totalCount'] = this.totalCount;
      json[r'validationWarnings'] = this.validationWarnings;
    return json;
  }

  /// Returns a new [IssuesJqlMetaDataBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssuesJqlMetaDataBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'count'), 'Required key "IssuesJqlMetaDataBean[count]" is missing from JSON.');
        assert(json[r'count'] != null, 'Required key "IssuesJqlMetaDataBean[count]" has a null value in JSON.');
        assert(json.containsKey(r'maxResults'), 'Required key "IssuesJqlMetaDataBean[maxResults]" is missing from JSON.');
        assert(json[r'maxResults'] != null, 'Required key "IssuesJqlMetaDataBean[maxResults]" has a null value in JSON.');
        assert(json.containsKey(r'startAt'), 'Required key "IssuesJqlMetaDataBean[startAt]" is missing from JSON.');
        assert(json[r'startAt'] != null, 'Required key "IssuesJqlMetaDataBean[startAt]" has a null value in JSON.');
        assert(json.containsKey(r'totalCount'), 'Required key "IssuesJqlMetaDataBean[totalCount]" is missing from JSON.');
        assert(json[r'totalCount'] != null, 'Required key "IssuesJqlMetaDataBean[totalCount]" has a null value in JSON.');
        return true;
      }());

      return IssuesJqlMetaDataBean(
        count: mapValueOfType<int>(json, r'count')!,
        maxResults: mapValueOfType<int>(json, r'maxResults')!,
        startAt: mapValueOfType<int>(json, r'startAt')!,
        totalCount: mapValueOfType<int>(json, r'totalCount')!,
        validationWarnings: json[r'validationWarnings'] is Iterable
            ? (json[r'validationWarnings'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<IssuesJqlMetaDataBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssuesJqlMetaDataBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssuesJqlMetaDataBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssuesJqlMetaDataBean> mapFromJson(dynamic json) {
    final map = <String, IssuesJqlMetaDataBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssuesJqlMetaDataBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssuesJqlMetaDataBean-objects as value to a dart map
  static Map<String, List<IssuesJqlMetaDataBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssuesJqlMetaDataBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssuesJqlMetaDataBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'count',
    'maxResults',
    'startAt',
    'totalCount',
  };
}

