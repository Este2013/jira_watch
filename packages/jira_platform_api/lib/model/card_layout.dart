//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CardLayout {
  /// Returns a new [CardLayout] instance.
  CardLayout({
    this.showDaysInColumn,
  });

  /// Whether to show days in column
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? showDaysInColumn;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CardLayout &&
    other.showDaysInColumn == showDaysInColumn;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (showDaysInColumn == null ? 0 : showDaysInColumn!.hashCode);

  @override
  String toString() => 'CardLayout[showDaysInColumn=$showDaysInColumn]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.showDaysInColumn != null) {
      json[r'showDaysInColumn'] = this.showDaysInColumn;
    } else {
      json[r'showDaysInColumn'] = null;
    }
    return json;
  }

  /// Returns a new [CardLayout] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CardLayout? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return CardLayout(
        showDaysInColumn: mapValueOfType<bool>(json, r'showDaysInColumn'),
      );
    }
    return null;
  }

  static List<CardLayout> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CardLayout>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CardLayout.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CardLayout> mapFromJson(dynamic json) {
    final map = <String, CardLayout>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CardLayout.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CardLayout-objects as value to a dart map
  static Map<String, List<CardLayout>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CardLayout>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CardLayout.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

