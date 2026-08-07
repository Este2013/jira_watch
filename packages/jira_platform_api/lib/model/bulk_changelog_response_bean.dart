//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkChangelogResponseBean {
  /// Returns a new [BulkChangelogResponseBean] instance.
  BulkChangelogResponseBean({
    this.issueChangeLogs = const [],
    this.nextPageToken,
  });

  /// The list of issues changelogs.
  List<IssueChangeLog> issueChangeLogs;

  /// Continuation token to fetch the next page. If this result represents the last or the only page, this token will be null.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPageToken;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkChangelogResponseBean &&
    _deepEquality.equals(other.issueChangeLogs, issueChangeLogs) &&
    other.nextPageToken == nextPageToken;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (issueChangeLogs.hashCode) +
    (nextPageToken == null ? 0 : nextPageToken!.hashCode);

  @override
  String toString() => 'BulkChangelogResponseBean[issueChangeLogs=$issueChangeLogs, nextPageToken=$nextPageToken]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'issueChangeLogs'] = this.issueChangeLogs;
    if (this.nextPageToken != null) {
      json[r'nextPageToken'] = this.nextPageToken;
    } else {
      json[r'nextPageToken'] = null;
    }
    return json;
  }

  /// Returns a new [BulkChangelogResponseBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkChangelogResponseBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BulkChangelogResponseBean(
        issueChangeLogs: IssueChangeLog.listFromJson(json[r'issueChangeLogs']),
        nextPageToken: mapValueOfType<String>(json, r'nextPageToken'),
      );
    }
    return null;
  }

  static List<BulkChangelogResponseBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkChangelogResponseBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkChangelogResponseBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkChangelogResponseBean> mapFromJson(dynamic json) {
    final map = <String, BulkChangelogResponseBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkChangelogResponseBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkChangelogResponseBean-objects as value to a dart map
  static Map<String, List<BulkChangelogResponseBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkChangelogResponseBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkChangelogResponseBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

