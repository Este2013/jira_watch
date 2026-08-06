//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Watchers {
  /// Returns a new [Watchers] instance.
  Watchers({
    this.isWatching,
    this.self,
    this.watchCount,
    this.watchers = const [],
  });

  /// Whether the calling user is watching this issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isWatching;

  /// The URL of these issue watcher details.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The number of users watching this issue.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? watchCount;

  /// Details of the users watching this issue.
  List<UserDetails> watchers;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Watchers &&
    other.isWatching == isWatching &&
    other.self == self &&
    other.watchCount == watchCount &&
    _deepEquality.equals(other.watchers, watchers);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isWatching == null ? 0 : isWatching!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (watchCount == null ? 0 : watchCount!.hashCode) +
    (watchers.hashCode);

  @override
  String toString() => 'Watchers[isWatching=$isWatching, self=$self, watchCount=$watchCount, watchers=$watchers]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isWatching != null) {
      json[r'isWatching'] = this.isWatching;
    } else {
      json[r'isWatching'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.watchCount != null) {
      json[r'watchCount'] = this.watchCount;
    } else {
      json[r'watchCount'] = null;
    }
      json[r'watchers'] = this.watchers;
    return json;
  }

  /// Returns a new [Watchers] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Watchers? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Watchers(
        isWatching: mapValueOfType<bool>(json, r'isWatching'),
        self: mapValueOfType<String>(json, r'self'),
        watchCount: mapValueOfType<int>(json, r'watchCount'),
        watchers: UserDetails.listFromJson(json[r'watchers']),
      );
    }
    return null;
  }

  static List<Watchers> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Watchers>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Watchers.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Watchers> mapFromJson(dynamic json) {
    final map = <String, Watchers>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Watchers.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Watchers-objects as value to a dart map
  static Map<String, List<Watchers>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Watchers>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Watchers.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

