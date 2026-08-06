//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ChangedValueBean {
  /// Returns a new [ChangedValueBean] instance.
  ChangedValueBean({
    this.changedFrom,
    this.changedTo,
    this.fieldName,
  });

  /// The value of the field before the change.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? changedFrom;

  /// The value of the field after the change.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? changedTo;

  /// The name of the field changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? fieldName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ChangedValueBean &&
    other.changedFrom == changedFrom &&
    other.changedTo == changedTo &&
    other.fieldName == fieldName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (changedFrom == null ? 0 : changedFrom!.hashCode) +
    (changedTo == null ? 0 : changedTo!.hashCode) +
    (fieldName == null ? 0 : fieldName!.hashCode);

  @override
  String toString() => 'ChangedValueBean[changedFrom=$changedFrom, changedTo=$changedTo, fieldName=$fieldName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.changedFrom != null) {
      json[r'changedFrom'] = this.changedFrom;
    } else {
      json[r'changedFrom'] = null;
    }
    if (this.changedTo != null) {
      json[r'changedTo'] = this.changedTo;
    } else {
      json[r'changedTo'] = null;
    }
    if (this.fieldName != null) {
      json[r'fieldName'] = this.fieldName;
    } else {
      json[r'fieldName'] = null;
    }
    return json;
  }

  /// Returns a new [ChangedValueBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ChangedValueBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ChangedValueBean(
        changedFrom: mapValueOfType<String>(json, r'changedFrom'),
        changedTo: mapValueOfType<String>(json, r'changedTo'),
        fieldName: mapValueOfType<String>(json, r'fieldName'),
      );
    }
    return null;
  }

  static List<ChangedValueBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ChangedValueBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ChangedValueBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ChangedValueBean> mapFromJson(dynamic json) {
    final map = <String, ChangedValueBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ChangedValueBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ChangedValueBean-objects as value to a dart map
  static Map<String, List<ChangedValueBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ChangedValueBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ChangedValueBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

