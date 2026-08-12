//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class BulkTransitionSpaceSelection {
  /// Returns a new [BulkTransitionSpaceSelection] instance.
  BulkTransitionSpaceSelection({
    required this.spaceType,
    this.selectedSpaces = const [],
  });

  /// The space selection type.
  BulkTransitionSpaceSelectionSpaceTypeEnum spaceType;

  /// List of specific spaces. Required when spaceType is SPECIFIC or ALL_EXCEPT_SPECIFIC.
  List<BulkTransitionSpaceTarget> selectedSpaces;

  @override
  bool operator ==(Object other) => identical(this, other) || other is BulkTransitionSpaceSelection &&
    other.spaceType == spaceType &&
    _deepEquality.equals(other.selectedSpaces, selectedSpaces);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (spaceType.hashCode) +
    (selectedSpaces.hashCode);

  @override
  String toString() => 'BulkTransitionSpaceSelection[spaceType=$spaceType, selectedSpaces=$selectedSpaces]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'spaceType'] = this.spaceType;
      json[r'selectedSpaces'] = this.selectedSpaces;
    return json;
  }

  /// Returns a new [BulkTransitionSpaceSelection] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static BulkTransitionSpaceSelection? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'spaceType'), 'Required key "BulkTransitionSpaceSelection[spaceType]" is missing from JSON.');
        assert(json[r'spaceType'] != null, 'Required key "BulkTransitionSpaceSelection[spaceType]" has a null value in JSON.');
        return true;
      }());

      return BulkTransitionSpaceSelection(
        spaceType: BulkTransitionSpaceSelectionSpaceTypeEnum.fromJson(json[r'spaceType'])!,
        selectedSpaces: BulkTransitionSpaceTarget.listFromJson(json[r'selectedSpaces']),
      );
    }
    return null;
  }

  static List<BulkTransitionSpaceSelection> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionSpaceSelection>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionSpaceSelection.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, BulkTransitionSpaceSelection> mapFromJson(dynamic json) {
    final map = <String, BulkTransitionSpaceSelection>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = BulkTransitionSpaceSelection.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of BulkTransitionSpaceSelection-objects as value to a dart map
  static Map<String, List<BulkTransitionSpaceSelection>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<BulkTransitionSpaceSelection>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = BulkTransitionSpaceSelection.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'spaceType',
  };
}

/// The space selection type.
enum BulkTransitionSpaceSelectionSpaceTypeEnum {
  ALL._(r'ALL'),
  ALL_EXCEPT_PERSONAL._(r'ALL_EXCEPT_PERSONAL'),
  ALL_EXCEPT_SPECIFIC._(r'ALL_EXCEPT_SPECIFIC'),
  PERSONAL._(r'PERSONAL'),
  SPECIFIC._(r'SPECIFIC'),
  ;

  /// Instantiate a new enum with the provided value.
  const BulkTransitionSpaceSelectionSpaceTypeEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [BulkTransitionSpaceSelectionSpaceTypeEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static BulkTransitionSpaceSelectionSpaceTypeEnum? fromJson(dynamic value) => BulkTransitionSpaceSelectionSpaceTypeEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [BulkTransitionSpaceSelectionSpaceTypeEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<BulkTransitionSpaceSelectionSpaceTypeEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <BulkTransitionSpaceSelectionSpaceTypeEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = BulkTransitionSpaceSelectionSpaceTypeEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [BulkTransitionSpaceSelectionSpaceTypeEnum] to String,
/// and [decode] dynamic data back to [BulkTransitionSpaceSelectionSpaceTypeEnum].
class BulkTransitionSpaceSelectionSpaceTypeEnumTypeTransformer {
  factory BulkTransitionSpaceSelectionSpaceTypeEnumTypeTransformer() => _instance ??= const BulkTransitionSpaceSelectionSpaceTypeEnumTypeTransformer._();

  const BulkTransitionSpaceSelectionSpaceTypeEnumTypeTransformer._();

  String encode(BulkTransitionSpaceSelectionSpaceTypeEnum data) => data._value;

  /// Returns the instance of [BulkTransitionSpaceSelectionSpaceTypeEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  BulkTransitionSpaceSelectionSpaceTypeEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is BulkTransitionSpaceSelectionSpaceTypeEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'ALL': return BulkTransitionSpaceSelectionSpaceTypeEnum.ALL;
        case r'ALL_EXCEPT_PERSONAL': return BulkTransitionSpaceSelectionSpaceTypeEnum.ALL_EXCEPT_PERSONAL;
        case r'ALL_EXCEPT_SPECIFIC': return BulkTransitionSpaceSelectionSpaceTypeEnum.ALL_EXCEPT_SPECIFIC;
        case r'PERSONAL': return BulkTransitionSpaceSelectionSpaceTypeEnum.PERSONAL;
        case r'SPECIFIC': return BulkTransitionSpaceSelectionSpaceTypeEnum.SPECIFIC;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static BulkTransitionSpaceSelectionSpaceTypeEnumTypeTransformer? _instance;
}


