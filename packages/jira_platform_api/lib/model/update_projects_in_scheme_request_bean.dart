//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdateProjectsInSchemeRequestBean {
  /// Returns a new [UpdateProjectsInSchemeRequestBean] instance.
  UpdateProjectsInSchemeRequestBean({
    this.add,
    this.remove,
  });

  /// Projects to add to a scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PrioritySchemeChangesWithoutMappings? add;

  /// Projects to remove from a scheme
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  PrioritySchemeChangesWithoutMappings? remove;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdateProjectsInSchemeRequestBean &&
    other.add == add &&
    other.remove == remove;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (add == null ? 0 : add!.hashCode) +
    (remove == null ? 0 : remove!.hashCode);

  @override
  String toString() => 'UpdateProjectsInSchemeRequestBean[add=$add, remove=$remove]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.add != null) {
      json[r'add'] = this.add;
    } else {
      json[r'add'] = null;
    }
    if (this.remove != null) {
      json[r'remove'] = this.remove;
    } else {
      json[r'remove'] = null;
    }
    return json;
  }

  /// Returns a new [UpdateProjectsInSchemeRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdateProjectsInSchemeRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdateProjectsInSchemeRequestBean(
        add: PrioritySchemeChangesWithoutMappings.fromJson(json[r'add']),
        remove: PrioritySchemeChangesWithoutMappings.fromJson(json[r'remove']),
      );
    }
    return null;
  }

  static List<UpdateProjectsInSchemeRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdateProjectsInSchemeRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdateProjectsInSchemeRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdateProjectsInSchemeRequestBean> mapFromJson(dynamic json) {
    final map = <String, UpdateProjectsInSchemeRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdateProjectsInSchemeRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdateProjectsInSchemeRequestBean-objects as value to a dart map
  static Map<String, List<UpdateProjectsInSchemeRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdateProjectsInSchemeRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdateProjectsInSchemeRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

