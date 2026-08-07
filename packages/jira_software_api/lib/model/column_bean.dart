//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ColumnBean {
  /// Returns a new [ColumnBean] instance.
  ColumnBean({
    this.max,
    this.min,
    this.name,
    this.statuses = const [],
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? max;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? min;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  List<GetConfiguration200ResponseColumnConfigColumnsInnerStatusesInner> statuses;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ColumnBean &&
    other.max == max &&
    other.min == min &&
    other.name == name &&
    _deepEquality.equals(other.statuses, statuses);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (max == null ? 0 : max!.hashCode) +
    (min == null ? 0 : min!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (statuses.hashCode);

  @override
  String toString() => 'ColumnBean[max=$max, min=$min, name=$name, statuses=$statuses]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.max != null) {
      json[r'max'] = this.max;
    } else {
      json[r'max'] = null;
    }
    if (this.min != null) {
      json[r'min'] = this.min;
    } else {
      json[r'min'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'statuses'] = this.statuses;
    return json;
  }

  /// Returns a new [ColumnBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ColumnBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ColumnBean(
        max: mapValueOfType<int>(json, r'max'),
        min: mapValueOfType<int>(json, r'min'),
        name: mapValueOfType<String>(json, r'name'),
        statuses: GetConfiguration200ResponseColumnConfigColumnsInnerStatusesInner.listFromJson(json[r'statuses']),
      );
    }
    return null;
  }

  static List<ColumnBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ColumnBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ColumnBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ColumnBean> mapFromJson(dynamic json) {
    final map = <String, ColumnBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ColumnBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ColumnBean-objects as value to a dart map
  static Map<String, List<ColumnBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ColumnBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ColumnBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

