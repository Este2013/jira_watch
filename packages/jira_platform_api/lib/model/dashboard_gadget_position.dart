//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class DashboardGadgetPosition {
  /// Returns a new [DashboardGadgetPosition] instance.
  DashboardGadgetPosition({
    required this.theColumnPositionOfTheGadgetPeriod,
    required this.theRowPositionOfTheGadgetPeriod,
  });

  int theColumnPositionOfTheGadgetPeriod;

  int theRowPositionOfTheGadgetPeriod;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DashboardGadgetPosition &&
    other.theColumnPositionOfTheGadgetPeriod == theColumnPositionOfTheGadgetPeriod &&
    other.theRowPositionOfTheGadgetPeriod == theRowPositionOfTheGadgetPeriod;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (theColumnPositionOfTheGadgetPeriod.hashCode) +
    (theRowPositionOfTheGadgetPeriod.hashCode);

  @override
  String toString() => 'DashboardGadgetPosition[theColumnPositionOfTheGadgetPeriod=$theColumnPositionOfTheGadgetPeriod, theRowPositionOfTheGadgetPeriod=$theRowPositionOfTheGadgetPeriod]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'The column position of the gadget.'] = this.theColumnPositionOfTheGadgetPeriod;
      json[r'The row position of the gadget.'] = this.theRowPositionOfTheGadgetPeriod;
    return json;
  }

  /// Returns a new [DashboardGadgetPosition] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static DashboardGadgetPosition? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'The column position of the gadget.'), 'Required key "DashboardGadgetPosition[The column position of the gadget.]" is missing from JSON.');
        assert(json[r'The column position of the gadget.'] != null, 'Required key "DashboardGadgetPosition[The column position of the gadget.]" has a null value in JSON.');
        assert(json.containsKey(r'The row position of the gadget.'), 'Required key "DashboardGadgetPosition[The row position of the gadget.]" is missing from JSON.');
        assert(json[r'The row position of the gadget.'] != null, 'Required key "DashboardGadgetPosition[The row position of the gadget.]" has a null value in JSON.');
        return true;
      }());

      return DashboardGadgetPosition(
        theColumnPositionOfTheGadgetPeriod: mapValueOfType<int>(json, r'The column position of the gadget.')!,
        theRowPositionOfTheGadgetPeriod: mapValueOfType<int>(json, r'The row position of the gadget.')!,
      );
    }
    return null;
  }

  static List<DashboardGadgetPosition> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <DashboardGadgetPosition>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = DashboardGadgetPosition.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, DashboardGadgetPosition> mapFromJson(dynamic json) {
    final map = <String, DashboardGadgetPosition>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = DashboardGadgetPosition.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of DashboardGadgetPosition-objects as value to a dart map
  static Map<String, List<DashboardGadgetPosition>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<DashboardGadgetPosition>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = DashboardGadgetPosition.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'The column position of the gadget.',
    'The row position of the gadget.',
  };
}

