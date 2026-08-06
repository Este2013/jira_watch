//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardsPayload {
  /// Returns a new [BoardsPayload] instance.
  BoardsPayload({
    this.boards = const [],
  });

  /// The boards to be associated with the project.
  List<BoardPayload> boards;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardsPayload &&
    _deepEquality.equals(other.boards, boards);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (boards.hashCode);

  @override
  String toString() => 'BoardsPayload[boards=$boards]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'boards'] = this.boards;
    return json;
  }

  /// Returns a new [BoardsPayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardsPayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BoardsPayload(
        boards: BoardPayload.listFromJson(json[r'boards']),
      );
    }
    return null;
  }

  static List<BoardsPayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardsPayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardsPayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardsPayload> mapFromJson(dynamic json) {
    final map = <String, BoardsPayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardsPayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardsPayload-objects as value to a dart map
  static Map<String, List<BoardsPayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardsPayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardsPayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

