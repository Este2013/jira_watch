//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PriorityMapping {
  /// Returns a new [PriorityMapping] instance.
  PriorityMapping({
    this.in_ = const {},
    this.out_ = const {},
  });

  /// The mapping of priorities for issues being migrated **into** this priority scheme. Key is the old priority ID, value is the new priority ID (must exist in this priority scheme).  E.g. The current priority scheme has priority ID `10001`. Issues with priority ID `10000` are being migrated into this priority scheme will need mapping to new priorities. The `in` mapping would be `{\"10000\": 10001}`.
  Map<String, int> in_;

  /// The mapping of priorities for issues being migrated **out of** this priority scheme. Key is the old priority ID (must exist in this priority scheme), value is the new priority ID (must exist in the default priority scheme). Required for updating an existing priority scheme. Not used when creating a new priority scheme.  E.g. The current priority scheme has priority ID `10001`. Issues with priority ID `10001` are being migrated out of this priority scheme will need mapping to new priorities. The `out` mapping would be `{\"10001\": 10000}`.
  Map<String, int> out_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PriorityMapping &&
    _deepEquality.equals(other.in_, in_) &&
    _deepEquality.equals(other.out_, out_);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (in_.hashCode) +
    (out_.hashCode);

  @override
  String toString() => 'PriorityMapping[in_=$in_, out_=$out_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'in'] = this.in_;
      json[r'out'] = this.out_;
    return json;
  }

  /// Returns a new [PriorityMapping] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PriorityMapping? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PriorityMapping(
        in_: mapCastOfType<String, int>(json, r'in') ?? const {},
        out_: mapCastOfType<String, int>(json, r'out') ?? const {},
      );
    }
    return null;
  }

  static List<PriorityMapping> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PriorityMapping>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PriorityMapping.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PriorityMapping> mapFromJson(dynamic json) {
    final map = <String, PriorityMapping>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PriorityMapping.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PriorityMapping-objects as value to a dart map
  static Map<String, List<PriorityMapping>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PriorityMapping>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PriorityMapping.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

