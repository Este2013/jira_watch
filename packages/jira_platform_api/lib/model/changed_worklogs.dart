//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangedWorklogs {
  /// Returns a new [ChangedWorklogs] instance.
  ChangedWorklogs({
    this.lastPage,
    this.nextPage,
    this.self,
    this.since,
    this.until,
    this.values = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? lastPage;

  /// The URL of the next list of changed worklogs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPage;

  /// The URL of this changed worklogs list.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The datetime of the first worklog item in the list.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? since;

  /// The datetime of the last worklog item in the list.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? until;

  /// Changed worklog list.
  List<ChangedWorklog> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangedWorklogs &&
    other.lastPage == lastPage &&
    other.nextPage == nextPage &&
    other.self == self &&
    other.since == since &&
    other.until == until &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (lastPage == null ? 0 : lastPage!.hashCode) +
    (nextPage == null ? 0 : nextPage!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (since == null ? 0 : since!.hashCode) +
    (until == null ? 0 : until!.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'ChangedWorklogs[lastPage=$lastPage, nextPage=$nextPage, self=$self, since=$since, until=$until, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.lastPage != null) {
      json[r'lastPage'] = this.lastPage;
    } else {
      json[r'lastPage'] = null;
    }
    if (this.nextPage != null) {
      json[r'nextPage'] = this.nextPage;
    } else {
      json[r'nextPage'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.since != null) {
      json[r'since'] = this.since;
    } else {
      json[r'since'] = null;
    }
    if (this.until != null) {
      json[r'until'] = this.until;
    } else {
      json[r'until'] = null;
    }
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [ChangedWorklogs] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangedWorklogs? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChangedWorklogs(
        lastPage: mapValueOfType<bool>(json, r'lastPage'),
        nextPage: mapValueOfType<String>(json, r'nextPage'),
        self: mapValueOfType<String>(json, r'self'),
        since: mapValueOfType<int>(json, r'since'),
        until: mapValueOfType<int>(json, r'until'),
        values: ChangedWorklog.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<ChangedWorklogs> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangedWorklogs>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangedWorklogs.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangedWorklogs> mapFromJson(dynamic json) {
    final map = <String, ChangedWorklogs>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangedWorklogs.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangedWorklogs-objects as value to a dart map
  static Map<String, List<ChangedWorklogs>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangedWorklogs>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangedWorklogs.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

