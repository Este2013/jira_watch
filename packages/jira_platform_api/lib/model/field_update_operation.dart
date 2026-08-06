//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FieldUpdateOperation {
  /// Returns a new [FieldUpdateOperation] instance.
  FieldUpdateOperation({
    this.add,
    this.copy,
    this.edit,
    this.remove,
    this.set_,
  });

  /// The value to add to the field.
  Object? add;

  /// The field value to copy from another issue.
  Object? copy;

  /// The value to edit in the field.
  Object? edit;

  /// The value to removed from the field.
  Object? remove;

  /// The value to set in the field.
  Object? set_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FieldUpdateOperation &&
    other.add == add &&
    other.copy == copy &&
    other.edit == edit &&
    other.remove == remove &&
    other.set_ == set_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (add == null ? 0 : add!.hashCode) +
    (copy == null ? 0 : copy!.hashCode) +
    (edit == null ? 0 : edit!.hashCode) +
    (remove == null ? 0 : remove!.hashCode) +
    (set_ == null ? 0 : set_!.hashCode);

  @override
  String toString() => 'FieldUpdateOperation[add=$add, copy=$copy, edit=$edit, remove=$remove, set_=$set_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.add != null) {
      json[r'add'] = this.add;
    } else {
      json[r'add'] = null;
    }
    if (this.copy != null) {
      json[r'copy'] = this.copy;
    } else {
      json[r'copy'] = null;
    }
    if (this.edit != null) {
      json[r'edit'] = this.edit;
    } else {
      json[r'edit'] = null;
    }
    if (this.remove != null) {
      json[r'remove'] = this.remove;
    } else {
      json[r'remove'] = null;
    }
    if (this.set_ != null) {
      json[r'set'] = this.set_;
    } else {
      json[r'set'] = null;
    }
    return json;
  }

  /// Returns a new [FieldUpdateOperation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FieldUpdateOperation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FieldUpdateOperation(
        add: mapValueOfType<Object>(json, r'add'),
        copy: mapValueOfType<Object>(json, r'copy'),
        edit: mapValueOfType<Object>(json, r'edit'),
        remove: mapValueOfType<Object>(json, r'remove'),
        set_: mapValueOfType<Object>(json, r'set'),
      );
    }
    return null;
  }

  static List<FieldUpdateOperation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FieldUpdateOperation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FieldUpdateOperation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FieldUpdateOperation> mapFromJson(dynamic json) {
    final map = <String, FieldUpdateOperation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FieldUpdateOperation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FieldUpdateOperation-objects as value to a dart map
  static Map<String, List<FieldUpdateOperation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FieldUpdateOperation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FieldUpdateOperation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

