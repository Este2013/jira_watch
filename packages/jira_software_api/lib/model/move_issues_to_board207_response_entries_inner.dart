//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class MoveIssuesToBoard207ResponseEntriesInner {
  /// Returns a new [MoveIssuesToBoard207ResponseEntriesInner] instance.
  MoveIssuesToBoard207ResponseEntriesInner({
    this.errors = const [],
    this.issueId,
    this.issueKey,
    this.status,
  });

  List<String> errors;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? issueId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? issueKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? status;

  @override
  bool operator ==(Object other) => identical(this, other) || other is MoveIssuesToBoard207ResponseEntriesInner &&
    _deepEquality.equals(other.errors, errors) &&
    other.issueId == issueId &&
    other.issueKey == issueKey &&
    other.status == status;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (errors.hashCode) +
    (issueId == null ? 0 : issueId!.hashCode) +
    (issueKey == null ? 0 : issueKey!.hashCode) +
    (status == null ? 0 : status!.hashCode);

  @override
  String toString() => 'MoveIssuesToBoard207ResponseEntriesInner[errors=$errors, issueId=$issueId, issueKey=$issueKey, status=$status]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'errors'] = this.errors;
    if (this.issueId != null) {
      json[r'issueId'] = this.issueId;
    } else {
      json[r'issueId'] = null;
    }
    if (this.issueKey != null) {
      json[r'issueKey'] = this.issueKey;
    } else {
      json[r'issueKey'] = null;
    }
    if (this.status != null) {
      json[r'status'] = this.status;
    } else {
      json[r'status'] = null;
    }
    return json;
  }

  /// Returns a new [MoveIssuesToBoard207ResponseEntriesInner] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static MoveIssuesToBoard207ResponseEntriesInner? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return MoveIssuesToBoard207ResponseEntriesInner(
        errors: json[r'errors'] is Iterable
            ? (json[r'errors'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        issueId: mapValueOfType<int>(json, r'issueId'),
        issueKey: mapValueOfType<String>(json, r'issueKey'),
        status: mapValueOfType<int>(json, r'status'),
      );
    }
    return null;
  }

  static List<MoveIssuesToBoard207ResponseEntriesInner> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <MoveIssuesToBoard207ResponseEntriesInner>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = MoveIssuesToBoard207ResponseEntriesInner.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, MoveIssuesToBoard207ResponseEntriesInner> mapFromJson(dynamic json) {
    final map = <String, MoveIssuesToBoard207ResponseEntriesInner>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = MoveIssuesToBoard207ResponseEntriesInner.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of MoveIssuesToBoard207ResponseEntriesInner-objects as value to a dart map
  static Map<String, List<MoveIssuesToBoard207ResponseEntriesInner>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<MoveIssuesToBoard207ResponseEntriesInner>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = MoveIssuesToBoard207ResponseEntriesInner.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

