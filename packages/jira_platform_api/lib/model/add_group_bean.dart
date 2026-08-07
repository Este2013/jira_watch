//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AddGroupBean {
  /// Returns a new [AddGroupBean] instance.
  AddGroupBean({
    required this.name,
  });

  /// The name of the group.
  String name;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AddGroupBean &&
    other.name == name;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (name.hashCode);

  @override
  String toString() => 'AddGroupBean[name=$name]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'name'] = this.name;
    return json;
  }

  /// Returns a new [AddGroupBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AddGroupBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "AddGroupBean[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "AddGroupBean[name]" has a null value in JSON.');
        return true;
      }());

      return AddGroupBean(
        name: mapValueOfType<String>(json, r'name')!,
      );
    }
    return null;
  }

  static List<AddGroupBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AddGroupBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AddGroupBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AddGroupBean> mapFromJson(dynamic json) {
    final map = <String, AddGroupBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AddGroupBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AddGroupBean-objects as value to a dart map
  static Map<String, List<AddGroupBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AddGroupBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AddGroupBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
  };
}

