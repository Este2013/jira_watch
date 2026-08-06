//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SprintBean {
  /// Returns a new [SprintBean] instance.
  SprintBean({
    this.completeDate,
    this.createdDate,
    this.endDate,
    this.goal,
    this.id,
    this.name,
    this.originBoardId,
    this.self,
    this.startDate,
    this.state,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? completeDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? createdDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? endDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? goal;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? originBoardId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? startDate;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? state;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SprintBean &&
    other.completeDate == completeDate &&
    other.createdDate == createdDate &&
    other.endDate == endDate &&
    other.goal == goal &&
    other.id == id &&
    other.name == name &&
    other.originBoardId == originBoardId &&
    other.self == self &&
    other.startDate == startDate &&
    other.state == state;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (completeDate == null ? 0 : completeDate!.hashCode) +
    (createdDate == null ? 0 : createdDate!.hashCode) +
    (endDate == null ? 0 : endDate!.hashCode) +
    (goal == null ? 0 : goal!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (originBoardId == null ? 0 : originBoardId!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (startDate == null ? 0 : startDate!.hashCode) +
    (state == null ? 0 : state!.hashCode);

  @override
  String toString() => 'SprintBean[completeDate=$completeDate, createdDate=$createdDate, endDate=$endDate, goal=$goal, id=$id, name=$name, originBoardId=$originBoardId, self=$self, startDate=$startDate, state=$state]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.completeDate != null) {
      json[r'completeDate'] = this.completeDate;
    } else {
      json[r'completeDate'] = null;
    }
    if (this.createdDate != null) {
      json[r'createdDate'] = this.createdDate;
    } else {
      json[r'createdDate'] = null;
    }
    if (this.endDate != null) {
      json[r'endDate'] = this.endDate;
    } else {
      json[r'endDate'] = null;
    }
    if (this.goal != null) {
      json[r'goal'] = this.goal;
    } else {
      json[r'goal'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.originBoardId != null) {
      json[r'originBoardId'] = this.originBoardId;
    } else {
      json[r'originBoardId'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.startDate != null) {
      json[r'startDate'] = this.startDate;
    } else {
      json[r'startDate'] = null;
    }
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    return json;
  }

  /// Returns a new [SprintBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SprintBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SprintBean(
        completeDate: mapValueOfType<String>(json, r'completeDate'),
        createdDate: mapValueOfType<String>(json, r'createdDate'),
        endDate: mapValueOfType<String>(json, r'endDate'),
        goal: mapValueOfType<String>(json, r'goal'),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        originBoardId: mapValueOfType<int>(json, r'originBoardId'),
        self: mapValueOfType<String>(json, r'self'),
        startDate: mapValueOfType<String>(json, r'startDate'),
        state: mapValueOfType<String>(json, r'state'),
      );
    }
    return null;
  }

  static List<SprintBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SprintBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SprintBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SprintBean> mapFromJson(dynamic json) {
    final map = <String, SprintBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SprintBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SprintBean-objects as value to a dart map
  static Map<String, List<SprintBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SprintBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SprintBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

