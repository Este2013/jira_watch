//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardFeaturesPayload {
  /// Returns a new [BoardFeaturesPayload] instance.
  BoardFeaturesPayload({
    this.boardFeatures = const {},
  });

  /// A map of board PCRIs to the list of features to enable on each board.
  Map<String, List<BoardFeaturePayload>> boardFeatures;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardFeaturesPayload &&
    _deepEquality.equals(other.boardFeatures, boardFeatures);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boardFeatures.hashCode);

  @override
  String toString() => 'BoardFeaturesPayload[boardFeatures=$boardFeatures]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'boardFeatures'] = this.boardFeatures;
    return json;
  }

  /// Returns a new [BoardFeaturesPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardFeaturesPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BoardFeaturesPayload(
        boardFeatures: json[r'boardFeatures'] == null
          ? const {}
            : BoardFeaturePayload.mapListFromJson(json[r'boardFeatures']),
      );
    }
    return null;
  }

  static List<BoardFeaturesPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardFeaturesPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardFeaturesPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardFeaturesPayload> mapFromJson(dynamic json) {
    final map = <String, BoardFeaturesPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardFeaturesPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardFeaturesPayload-objects as value to a dart map
  static Map<String, List<BoardFeaturesPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardFeaturesPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardFeaturesPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

