//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class RemoteLinkStatus {
  /// Returns a new [RemoteLinkStatus] instance.
  RemoteLinkStatus({
    required this.appearance,
    required this.label,
  });

  /// Appearance is a fixed set of appearance types affecting the colour of the status lozenge in the UI. The colours they correspond to are equivalent to atlaskit's [Lozenge](https://atlaskit.atlassian.com/packages/core/lozenge) component. 
  RemoteLinkStatusAppearanceEnum appearance;

  /// The human-readable description for the Remote Link status.  Will be shown in the UI. 
  String label;

  @override
  bool operator ==(Object other) => identical(this, other) || other is RemoteLinkStatus &&
    other.appearance == appearance &&
    other.label == label;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (appearance.hashCode) +
    (label.hashCode);

  @override
  String toString() => 'RemoteLinkStatus[appearance=$appearance, label=$label]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'appearance'] = this.appearance;
      json[r'label'] = this.label;
    return json;
  }

  /// Returns a new [RemoteLinkStatus] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static RemoteLinkStatus? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'appearance'), 'Required key "RemoteLinkStatus[appearance]" is missing from JSON.');
        assert(json[r'appearance'] != null, 'Required key "RemoteLinkStatus[appearance]" has a null value in JSON.');
        assert(json.containsKey(r'label'), 'Required key "RemoteLinkStatus[label]" is missing from JSON.');
        assert(json[r'label'] != null, 'Required key "RemoteLinkStatus[label]" has a null value in JSON.');
        return true;
      }());

      return RemoteLinkStatus(
        appearance: RemoteLinkStatusAppearanceEnum.fromJson(json[r'appearance'])!,
        label: mapValueOfType<String>(json, r'label')!,
      );
    }
    return null;
  }

  static List<RemoteLinkStatus> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteLinkStatus>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteLinkStatus.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, RemoteLinkStatus> mapFromJson(dynamic json) {
    final map = <String, RemoteLinkStatus>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = RemoteLinkStatus.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of RemoteLinkStatus-objects as value to a dart map
  static Map<String, List<RemoteLinkStatus>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<RemoteLinkStatus>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = RemoteLinkStatus.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'appearance',
    'label',
  };
}

/// Appearance is a fixed set of appearance types affecting the colour of the status lozenge in the UI. The colours they correspond to are equivalent to atlaskit's [Lozenge](https://atlaskit.atlassian.com/packages/core/lozenge) component. 
enum RemoteLinkStatusAppearanceEnum {
  default_._(r'default'),
  inprogress._(r'inprogress'),
  moved._(r'moved'),
  new_._(r'new'),
  removed._(r'removed'),
  prototype._(r'prototype'),
  success._(r'success'),
  ;

  /// Instantiate a new enum with the provided value.
  const RemoteLinkStatusAppearanceEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [RemoteLinkStatusAppearanceEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static RemoteLinkStatusAppearanceEnum? fromJson(dynamic value) => RemoteLinkStatusAppearanceEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [RemoteLinkStatusAppearanceEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<RemoteLinkStatusAppearanceEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <RemoteLinkStatusAppearanceEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = RemoteLinkStatusAppearanceEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [RemoteLinkStatusAppearanceEnum] to String,
/// and [decode] dynamic data back to [RemoteLinkStatusAppearanceEnum].
class RemoteLinkStatusAppearanceEnumTypeTransformer {
  factory RemoteLinkStatusAppearanceEnumTypeTransformer() => _instance ??= const RemoteLinkStatusAppearanceEnumTypeTransformer._();

  const RemoteLinkStatusAppearanceEnumTypeTransformer._();

  String encode(RemoteLinkStatusAppearanceEnum data) => data._value;

  /// Returns the instance of [RemoteLinkStatusAppearanceEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  RemoteLinkStatusAppearanceEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is RemoteLinkStatusAppearanceEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'default': return RemoteLinkStatusAppearanceEnum.default_;
        case r'inprogress': return RemoteLinkStatusAppearanceEnum.inprogress;
        case r'moved': return RemoteLinkStatusAppearanceEnum.moved;
        case r'new': return RemoteLinkStatusAppearanceEnum.new_;
        case r'removed': return RemoteLinkStatusAppearanceEnum.removed;
        case r'prototype': return RemoteLinkStatusAppearanceEnum.prototype;
        case r'success': return RemoteLinkStatusAppearanceEnum.success;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static RemoteLinkStatusAppearanceEnumTypeTransformer? _instance;
}


