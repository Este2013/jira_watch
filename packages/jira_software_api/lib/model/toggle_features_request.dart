//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ToggleFeaturesRequest {
  /// Returns a new [ToggleFeaturesRequest] instance.
  ToggleFeaturesRequest({
    this.boardId,
    this.enabling,
    this.feature,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? boardId;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? enabling;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? feature;

  @override
  bool operator ==(Object other) => identical(this, other) || other is ToggleFeaturesRequest &&
    other.boardId == boardId &&
    other.enabling == enabling &&
    other.feature == feature;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boardId == null ? 0 : boardId!.hashCode) +
    (enabling == null ? 0 : enabling!.hashCode) +
    (feature == null ? 0 : feature!.hashCode);

  @override
  String toString() => 'ToggleFeaturesRequest[boardId=$boardId, enabling=$enabling, feature=$feature]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.boardId != null) {
      json[r'boardId'] = this.boardId;
    } else {
      json[r'boardId'] = null;
    }
    if (this.enabling != null) {
      json[r'enabling'] = this.enabling;
    } else {
      json[r'enabling'] = null;
    }
    if (this.feature != null) {
      json[r'feature'] = this.feature;
    } else {
      json[r'feature'] = null;
    }
    return json;
  }

  /// Returns a new [ToggleFeaturesRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static ToggleFeaturesRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return ToggleFeaturesRequest(
        boardId: mapValueOfType<int>(json, r'boardId'),
        enabling: mapValueOfType<bool>(json, r'enabling'),
        feature: mapValueOfType<String>(json, r'feature'),
      );
    }
    return null;
  }

  static List<ToggleFeaturesRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <ToggleFeaturesRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = ToggleFeaturesRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, ToggleFeaturesRequest> mapFromJson(dynamic json) {
    final map = <String, ToggleFeaturesRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = ToggleFeaturesRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of ToggleFeaturesRequest-objects as value to a dart map
  static Map<String, List<ToggleFeaturesRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<ToggleFeaturesRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = ToggleFeaturesRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

