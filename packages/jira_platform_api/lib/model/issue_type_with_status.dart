//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueTypeWithStatus {
  /// Returns a new [IssueTypeWithStatus] instance.
  IssueTypeWithStatus({
    required this.id,
    required this.name,
    required this.self,
    this.statuses = const [],
    required this.subtask,
  });

  /// The ID of the issue type.
  String id;

  /// The name of the issue type.
  String name;

  /// The URL of the issue type's status details.
  String self;

  /// List of status details for the issue type.
  List<StatusDetails> statuses;

  /// Whether this issue type represents subtasks.
  bool subtask;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueTypeWithStatus &&
    other.id == id &&
    other.name == name &&
    other.self == self &&
    _deepEquality.equals(other.statuses, statuses) &&
    other.subtask == subtask;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (id.hashCode) +
    (name.hashCode) +
    (self.hashCode) +
    (statuses.hashCode) +
    (subtask.hashCode);

  @override
  String toString() => 'IssueTypeWithStatus[id=$id, name=$name, self=$self, statuses=$statuses, subtask=$subtask]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'id'] = this.id;
      json[r'name'] = this.name;
      json[r'self'] = this.self;
      json[r'statuses'] = this.statuses;
      json[r'subtask'] = this.subtask;
    return json;
  }

  /// Returns a new [IssueTypeWithStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueTypeWithStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "IssueTypeWithStatus[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "IssueTypeWithStatus[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "IssueTypeWithStatus[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "IssueTypeWithStatus[name]" has a null value in JSON.');
        assert(json.containsKey(r'self'), 'Required key "IssueTypeWithStatus[self]" is missing from JSON.');
        assert(json[r'self'] != null, 'Required key "IssueTypeWithStatus[self]" has a null value in JSON.');
        assert(json.containsKey(r'statuses'), 'Required key "IssueTypeWithStatus[statuses]" is missing from JSON.');
        assert(json[r'statuses'] != null, 'Required key "IssueTypeWithStatus[statuses]" has a null value in JSON.');
        assert(json.containsKey(r'subtask'), 'Required key "IssueTypeWithStatus[subtask]" is missing from JSON.');
        assert(json[r'subtask'] != null, 'Required key "IssueTypeWithStatus[subtask]" has a null value in JSON.');
        return true;
      }());

      return IssueTypeWithStatus(
        id: mapValueOfType<String>(json, r'id')!,
        name: mapValueOfType<String>(json, r'name')!,
        self: mapValueOfType<String>(json, r'self')!,
        statuses: StatusDetails.listFromJson(json[r'statuses']),
        subtask: mapValueOfType<bool>(json, r'subtask')!,
      );
    }
    return null;
  }

  static List<IssueTypeWithStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueTypeWithStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueTypeWithStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueTypeWithStatus> mapFromJson(dynamic json) {
    final map = <String, IssueTypeWithStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueTypeWithStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueTypeWithStatus-objects as value to a dart map
  static Map<String, List<IssueTypeWithStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueTypeWithStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueTypeWithStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'self',
    'statuses',
    'subtask',
  };
}

