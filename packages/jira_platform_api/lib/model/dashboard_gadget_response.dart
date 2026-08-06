//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardGadgetResponse {
  /// Returns a new [DashboardGadgetResponse] instance.
  DashboardGadgetResponse({
    this.gadgets = const [],
  });

  /// The list of gadgets.
  List<DashboardGadget> gadgets;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardGadgetResponse &&
    _deepEquality.equals(other.gadgets, gadgets);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (gadgets.hashCode);

  @override
  String toString() => 'DashboardGadgetResponse[gadgets=$gadgets]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'gadgets'] = this.gadgets;
    return json;
  }

  /// Returns a new [DashboardGadgetResponse] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardGadgetResponse? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'gadgets'), 'Required key "DashboardGadgetResponse[gadgets]" is missing from JSON.');
        assert(json[r'gadgets'] != null, 'Required key "DashboardGadgetResponse[gadgets]" has a null value in JSON.');
        return true;
      }());

      return DashboardGadgetResponse(
        gadgets: DashboardGadget.listFromJson(json[r'gadgets']),
      );
    }
    return null;
  }

  static List<DashboardGadgetResponse> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardGadgetResponse>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardGadgetResponse.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardGadgetResponse> mapFromJson(dynamic json) {
    final map = <String, DashboardGadgetResponse>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardGadgetResponse.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardGadgetResponse-objects as value to a dart map
  static Map<String, List<DashboardGadgetResponse>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardGadgetResponse>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardGadgetResponse.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'gadgets',
  };
}

