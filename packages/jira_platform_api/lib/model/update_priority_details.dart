//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class UpdatePriorityDetails {
  /// Returns a new [UpdatePriorityDetails] instance.
  UpdatePriorityDetails({
    this.avatarId,
    this.description,
    this.iconUrl,
    this.name,
    this.statusColor,
  });

  /// The ID for the avatar for the priority. This parameter is nullable and both iconUrl and avatarId cannot be defined.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The description of the priority.
  String? description;

  /// The URL of an icon for the priority. Accepted protocols are HTTP and HTTPS. Built in icons can also be used. Both iconUrl and avatarId cannot be defined.
  UpdatePriorityDetailsIconUrlEnum? iconUrl;

  /// The name of the priority. Must be unique.
  String? name;

  /// The status color of the priority in 3-digit or 6-digit hexadecimal format.
  String? statusColor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is UpdatePriorityDetails &&
    other.avatarId == avatarId &&
    other.description == description &&
    other.iconUrl == iconUrl &&
    other.name == name &&
    other.statusColor == statusColor;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (avatarId == null ? 0 : avatarId!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (iconUrl == null ? 0 : iconUrl!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (statusColor == null ? 0 : statusColor!.hashCode);

  @override
  String toString() => 'UpdatePriorityDetails[avatarId=$avatarId, description=$description, iconUrl=$iconUrl, name=$name, statusColor=$statusColor]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.avatarId != null) {
      json[r'avatarId'] = this.avatarId;
    } else {
      json[r'avatarId'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.iconUrl != null) {
      json[r'iconUrl'] = this.iconUrl;
    } else {
      json[r'iconUrl'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
    if (this.statusColor != null) {
      json[r'statusColor'] = this.statusColor;
    } else {
      json[r'statusColor'] = null;
    }
    return json;
  }

  /// Returns a new [UpdatePriorityDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static UpdatePriorityDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return UpdatePriorityDetails(
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        description: mapValueOfType<String>(json, r'description'),
        iconUrl: UpdatePriorityDetailsIconUrlEnum.fromJson(json[r'iconUrl']),
        name: mapValueOfType<String>(json, r'name'),
        statusColor: mapValueOfType<String>(json, r'statusColor'),
      );
    }
    return null;
  }

  static List<UpdatePriorityDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePriorityDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePriorityDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, UpdatePriorityDetails> mapFromJson(dynamic json) {
    final map = <String, UpdatePriorityDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = UpdatePriorityDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of UpdatePriorityDetails-objects as value to a dart map
  static Map<String, List<UpdatePriorityDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<UpdatePriorityDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = UpdatePriorityDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// The URL of an icon for the priority. Accepted protocols are HTTP and HTTPS. Built in icons can also be used. Both iconUrl and avatarId cannot be defined.
enum UpdatePriorityDetailsIconUrlEnum {
  slashImagesSlashIconsSlashPrioritiesSlashBlockerPeriodPng._(r'/images/icons/priorities/blocker.png'),
  slashImagesSlashIconsSlashPrioritiesSlashCriticalPeriodPng._(r'/images/icons/priorities/critical.png'),
  slashImagesSlashIconsSlashPrioritiesSlashHighPeriodPng._(r'/images/icons/priorities/high.png'),
  slashImagesSlashIconsSlashPrioritiesSlashHighestPeriodPng._(r'/images/icons/priorities/highest.png'),
  slashImagesSlashIconsSlashPrioritiesSlashLowPeriodPng._(r'/images/icons/priorities/low.png'),
  slashImagesSlashIconsSlashPrioritiesSlashLowestPeriodPng._(r'/images/icons/priorities/lowest.png'),
  slashImagesSlashIconsSlashPrioritiesSlashMajorPeriodPng._(r'/images/icons/priorities/major.png'),
  slashImagesSlashIconsSlashPrioritiesSlashMediumPeriodPng._(r'/images/icons/priorities/medium.png'),
  slashImagesSlashIconsSlashPrioritiesSlashMinorPeriodPng._(r'/images/icons/priorities/minor.png'),
  slashImagesSlashIconsSlashPrioritiesSlashTrivialPeriodPng._(r'/images/icons/priorities/trivial.png'),
  slashImagesSlashIconsSlashPrioritiesSlashBlockerNewPeriodPng._(r'/images/icons/priorities/blocker_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashCriticalNewPeriodPng._(r'/images/icons/priorities/critical_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashHighNewPeriodPng._(r'/images/icons/priorities/high_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashHighestNewPeriodPng._(r'/images/icons/priorities/highest_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashLowNewPeriodPng._(r'/images/icons/priorities/low_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashLowestNewPeriodPng._(r'/images/icons/priorities/lowest_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashMajorNewPeriodPng._(r'/images/icons/priorities/major_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashMediumNewPeriodPng._(r'/images/icons/priorities/medium_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashMinorNewPeriodPng._(r'/images/icons/priorities/minor_new.png'),
  slashImagesSlashIconsSlashPrioritiesSlashTrivialNewPeriodPng._(r'/images/icons/priorities/trivial_new.png'),
  ;

  /// Instantiate a new enum with the provided value.
  const UpdatePriorityDetailsIconUrlEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [UpdatePriorityDetailsIconUrlEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static UpdatePriorityDetailsIconUrlEnum? fromJson(dynamic value) => UpdatePriorityDetailsIconUrlEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [UpdatePriorityDetailsIconUrlEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<UpdatePriorityDetailsIconUrlEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <UpdatePriorityDetailsIconUrlEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = UpdatePriorityDetailsIconUrlEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [UpdatePriorityDetailsIconUrlEnum] to String,
/// and [decode] dynamic data back to [UpdatePriorityDetailsIconUrlEnum].
class UpdatePriorityDetailsIconUrlEnumTypeTransformer {
  factory UpdatePriorityDetailsIconUrlEnumTypeTransformer() => _instance ??= const UpdatePriorityDetailsIconUrlEnumTypeTransformer._();

  const UpdatePriorityDetailsIconUrlEnumTypeTransformer._();

  String encode(UpdatePriorityDetailsIconUrlEnum data) => data._value;

  /// Returns the instance of [UpdatePriorityDetailsIconUrlEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  UpdatePriorityDetailsIconUrlEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is UpdatePriorityDetailsIconUrlEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'/images/icons/priorities/blocker.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashBlockerPeriodPng;
        case r'/images/icons/priorities/critical.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashCriticalPeriodPng;
        case r'/images/icons/priorities/high.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighPeriodPng;
        case r'/images/icons/priorities/highest.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighestPeriodPng;
        case r'/images/icons/priorities/low.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowPeriodPng;
        case r'/images/icons/priorities/lowest.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowestPeriodPng;
        case r'/images/icons/priorities/major.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMajorPeriodPng;
        case r'/images/icons/priorities/medium.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMediumPeriodPng;
        case r'/images/icons/priorities/minor.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMinorPeriodPng;
        case r'/images/icons/priorities/trivial.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashTrivialPeriodPng;
        case r'/images/icons/priorities/blocker_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashBlockerNewPeriodPng;
        case r'/images/icons/priorities/critical_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashCriticalNewPeriodPng;
        case r'/images/icons/priorities/high_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighNewPeriodPng;
        case r'/images/icons/priorities/highest_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighestNewPeriodPng;
        case r'/images/icons/priorities/low_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowNewPeriodPng;
        case r'/images/icons/priorities/lowest_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowestNewPeriodPng;
        case r'/images/icons/priorities/major_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMajorNewPeriodPng;
        case r'/images/icons/priorities/medium_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMediumNewPeriodPng;
        case r'/images/icons/priorities/minor_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMinorNewPeriodPng;
        case r'/images/icons/priorities/trivial_new.png': return UpdatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashTrivialNewPeriodPng;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static UpdatePriorityDetailsIconUrlEnumTypeTransformer? _instance;
}


