//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BoardFeaturePayload {
  /// Returns a new [BoardFeaturePayload] instance.
  BoardFeaturePayload({
    this.featureKey,
    this.state,
  });

  /// The key of the feature
  BoardFeaturePayloadFeatureKeyEnum? featureKey;

  /// Whether the feature should be turned on or off
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? state;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BoardFeaturePayload &&
    other.featureKey == featureKey &&
    other.state == state;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (featureKey == null ? 0 : featureKey!.hashCode) +
    (state == null ? 0 : state!.hashCode);

  @override
  String toString() => 'BoardFeaturePayload[featureKey=$featureKey, state=$state]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.featureKey != null) {
      json[r'featureKey'] = this.featureKey;
    } else {
      json[r'featureKey'] = null;
    }
    if (this.state != null) {
      json[r'state'] = this.state;
    } else {
      json[r'state'] = null;
    }
    return json;
  }

  /// Returns a new [BoardFeaturePayload] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BoardFeaturePayload? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return BoardFeaturePayload(
        featureKey: BoardFeaturePayloadFeatureKeyEnum.fromJson(json[r'featureKey']),
        state: mapValueOfType<bool>(json, r'state'),
      );
    }
    return null;
  }

  static List<BoardFeaturePayload> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardFeaturePayload>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardFeaturePayload.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BoardFeaturePayload> mapFromJson(dynamic json) {
    final map = <String, BoardFeaturePayload>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BoardFeaturePayload.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BoardFeaturePayload-objects as value to a dart map
  static Map<String, List<BoardFeaturePayload>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BoardFeaturePayload>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BoardFeaturePayload.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The key of the feature
enum BoardFeaturePayloadFeatureKeyEnum {
  ESTIMATION._(r'ESTIMATION'),
  SPRINTS._(r'SPRINTS'),
  ;

  /// Instantiate a new enum with the provided value.
  const BoardFeaturePayloadFeatureKeyEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BoardFeaturePayloadFeatureKeyEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BoardFeaturePayloadFeatureKeyEnum? fromJson(dynamic value) => BoardFeaturePayloadFeatureKeyEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BoardFeaturePayloadFeatureKeyEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BoardFeaturePayloadFeatureKeyEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BoardFeaturePayloadFeatureKeyEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BoardFeaturePayloadFeatureKeyEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BoardFeaturePayloadFeatureKeyEnum] to String,
/// and [decode] dynamic data back to [BoardFeaturePayloadFeatureKeyEnum].
class BoardFeaturePayloadFeatureKeyEnumTypeTransformer {
  factory BoardFeaturePayloadFeatureKeyEnumTypeTransformer() => _instance ??= const BoardFeaturePayloadFeatureKeyEnumTypeTransformer._();

  const BoardFeaturePayloadFeatureKeyEnumTypeTransformer._();

  String encode(BoardFeaturePayloadFeatureKeyEnum data) => data._value;

  /// Returns the instance of [BoardFeaturePayloadFeatureKeyEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BoardFeaturePayloadFeatureKeyEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BoardFeaturePayloadFeatureKeyEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ESTIMATION': return BoardFeaturePayloadFeatureKeyEnum.ESTIMATION;
        case r'SPRINTS': return BoardFeaturePayloadFeatureKeyEnum.SPRINTS;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BoardFeaturePayloadFeatureKeyEnumTypeTransformer? _instance;
}


