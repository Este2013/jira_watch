//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardGadgetUpdateRequest {
  /// Returns a new [DashboardGadgetUpdateRequest] instance.
  DashboardGadgetUpdateRequest({
    this.color,
    this.position,
    this.title,
  });

  /// The color of the gadget. Should be one of `blue`, `red`, `yellow`, `green`, `cyan`, `purple`, `gray`, or `white`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? color;

  /// The position of the gadget.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DashboardGadgetPosition? position;

  /// The title of the gadget.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? title;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardGadgetUpdateRequest &&
    other.color == color &&
    other.position == position &&
    other.title == title;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (color == null ? 0 : color!.hashCode) +
    (position == null ? 0 : position!.hashCode) +
    (title == null ? 0 : title!.hashCode);

  @override
  String toString() => 'DashboardGadgetUpdateRequest[color=$color, position=$position, title=$title]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.color != null) {
      json[r'color'] = this.color;
    } else {
      json[r'color'] = null;
    }
    if (this.position != null) {
      json[r'position'] = this.position;
    } else {
      json[r'position'] = null;
    }
    if (this.title != null) {
      json[r'title'] = this.title;
    } else {
      json[r'title'] = null;
    }
    return json;
  }

  /// Returns a new [DashboardGadgetUpdateRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardGadgetUpdateRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return DashboardGadgetUpdateRequest(
        color: mapValueOfType<String>(json, r'color'),
        position: DashboardGadgetPosition.fromJson(json[r'position']),
        title: mapValueOfType<String>(json, r'title'),
      );
    }
    return null;
  }

  static List<DashboardGadgetUpdateRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardGadgetUpdateRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardGadgetUpdateRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardGadgetUpdateRequest> mapFromJson(dynamic json) {
    final map = <String, DashboardGadgetUpdateRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardGadgetUpdateRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardGadgetUpdateRequest-objects as value to a dart map
  static Map<String, List<DashboardGadgetUpdateRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardGadgetUpdateRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardGadgetUpdateRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

