//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class AnnouncementBannerConfiguration {
  /// Returns a new [AnnouncementBannerConfiguration] instance.
  AnnouncementBannerConfiguration({
    this.hashId,
    this.isDismissible,
    this.isEnabled,
    this.message,
    this.visibility,
  });

  /// Hash of the banner data. The client detects updates by comparing hash IDs.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? hashId;

  /// Flag indicating if the announcement banner can be dismissed by the user.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isDismissible;

  /// Flag indicating if the announcement banner is enabled or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isEnabled;

  /// The text on the announcement banner.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? message;

  /// Visibility of the announcement banner.
  AnnouncementBannerConfigurationVisibilityEnum? visibility;

  @override
  bool operator ==(Object other) => identical(this, other) || other is AnnouncementBannerConfiguration &&
    other.hashId == hashId &&
    other.isDismissible == isDismissible &&
    other.isEnabled == isEnabled &&
    other.message == message &&
    other.visibility == visibility;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (hashId == null ? 0 : hashId!.hashCode) +
    (isDismissible == null ? 0 : isDismissible!.hashCode) +
    (isEnabled == null ? 0 : isEnabled!.hashCode) +
    (message == null ? 0 : message!.hashCode) +
    (visibility == null ? 0 : visibility!.hashCode);

  @override
  String toString() => 'AnnouncementBannerConfiguration[hashId=$hashId, isDismissible=$isDismissible, isEnabled=$isEnabled, message=$message, visibility=$visibility]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.hashId != null) {
      json[r'hashId'] = this.hashId;
    } else {
      json[r'hashId'] = null;
    }
    if (this.isDismissible != null) {
      json[r'isDismissible'] = this.isDismissible;
    } else {
      json[r'isDismissible'] = null;
    }
    if (this.isEnabled != null) {
      json[r'isEnabled'] = this.isEnabled;
    } else {
      json[r'isEnabled'] = null;
    }
    if (this.message != null) {
      json[r'message'] = this.message;
    } else {
      json[r'message'] = null;
    }
    if (this.visibility != null) {
      json[r'visibility'] = this.visibility;
    } else {
      json[r'visibility'] = null;
    }
    return json;
  }

  /// Returns a new [AnnouncementBannerConfiguration] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static AnnouncementBannerConfiguration? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return AnnouncementBannerConfiguration(
        hashId: mapValueOfType<String>(json, r'hashId'),
        isDismissible: mapValueOfType<bool>(json, r'isDismissible'),
        isEnabled: mapValueOfType<bool>(json, r'isEnabled'),
        message: mapValueOfType<String>(json, r'message'),
        visibility: AnnouncementBannerConfigurationVisibilityEnum.fromJson(json[r'visibility']),
      );
    }
    return null;
  }

  static List<AnnouncementBannerConfiguration> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AnnouncementBannerConfiguration>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AnnouncementBannerConfiguration.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, AnnouncementBannerConfiguration> mapFromJson(dynamic json) {
    final map = <String, AnnouncementBannerConfiguration>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = AnnouncementBannerConfiguration.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of AnnouncementBannerConfiguration-objects as value to a dart map
  static Map<String, List<AnnouncementBannerConfiguration>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<AnnouncementBannerConfiguration>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = AnnouncementBannerConfiguration.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Visibility of the announcement banner.
enum AnnouncementBannerConfigurationVisibilityEnum {
  public._(r'public'),
  private._(r'private'),
  ;

  /// Instantiate a new enum with the provided value.
  const AnnouncementBannerConfigurationVisibilityEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [AnnouncementBannerConfigurationVisibilityEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static AnnouncementBannerConfigurationVisibilityEnum? fromJson(dynamic value) => AnnouncementBannerConfigurationVisibilityEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [AnnouncementBannerConfigurationVisibilityEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<AnnouncementBannerConfigurationVisibilityEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <AnnouncementBannerConfigurationVisibilityEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = AnnouncementBannerConfigurationVisibilityEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [AnnouncementBannerConfigurationVisibilityEnum] to String,
/// and [decode] dynamic data back to [AnnouncementBannerConfigurationVisibilityEnum].
class AnnouncementBannerConfigurationVisibilityEnumTypeTransformer {
  factory AnnouncementBannerConfigurationVisibilityEnumTypeTransformer() => _instance ??= const AnnouncementBannerConfigurationVisibilityEnumTypeTransformer._();

  const AnnouncementBannerConfigurationVisibilityEnumTypeTransformer._();

  String encode(AnnouncementBannerConfigurationVisibilityEnum data) => data._value;

  /// Returns the instance of [AnnouncementBannerConfigurationVisibilityEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  AnnouncementBannerConfigurationVisibilityEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is AnnouncementBannerConfigurationVisibilityEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'public': return AnnouncementBannerConfigurationVisibilityEnum.public;
        case r'private': return AnnouncementBannerConfigurationVisibilityEnum.private;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static AnnouncementBannerConfigurationVisibilityEnumTypeTransformer? _instance;
}


