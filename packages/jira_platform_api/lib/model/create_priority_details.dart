//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CreatePriorityDetails {
  /// Returns a new [CreatePriorityDetails] instance.
  CreatePriorityDetails({
    this.avatarId,
    this.description,
    this.iconUrl,
    required this.name,
    required this.statusColor,
  });

  /// The ID for the avatar for the priority. Either the iconUrl or avatarId must be defined, but not both. This parameter is nullable and will become mandatory once the iconUrl parameter is deprecated.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? avatarId;

  /// The description of the priority.
  String? description;

  /// The URL of an icon for the priority. Accepted protocols are HTTP and HTTPS. Built in icons can also be used. Either the iconUrl or avatarId must be defined, but not both.
  CreatePriorityDetailsIconUrlEnum? iconUrl;

  /// The name of the priority. Must be unique.
  String name;

  /// The status color of the priority in 3-digit or 6-digit hexadecimal format.
  String statusColor;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CreatePriorityDetails &&
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
    (name.hashCode) +
    (statusColor.hashCode);

  @override
  String toString() => 'CreatePriorityDetails[avatarId=$avatarId, description=$description, iconUrl=$iconUrl, name=$name, statusColor=$statusColor]';

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
      json[r'name'] = this.name;
      json[r'statusColor'] = this.statusColor;
    return json;
  }

  /// Returns a new [CreatePriorityDetails] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CreatePriorityDetails? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'name'), 'Required key "CreatePriorityDetails[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "CreatePriorityDetails[name]" has a null value in JSON.');
        assert(json.containsKey(r'statusColor'), 'Required key "CreatePriorityDetails[statusColor]" is missing from JSON.');
        assert(json[r'statusColor'] != null, 'Required key "CreatePriorityDetails[statusColor]" has a null value in JSON.');
        return true;
      }());

      return CreatePriorityDetails(
        avatarId: mapValueOfType<int>(json, r'avatarId'),
        description: mapValueOfType<String>(json, r'description'),
        iconUrl: CreatePriorityDetailsIconUrlEnum.fromJson(json[r'iconUrl']),
        name: mapValueOfType<String>(json, r'name')!,
        statusColor: mapValueOfType<String>(json, r'statusColor')!,
      );
    }
    return null;
  }

  static List<CreatePriorityDetails> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePriorityDetails>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePriorityDetails.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CreatePriorityDetails> mapFromJson(dynamic json) {
    final map = <String, CreatePriorityDetails>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CreatePriorityDetails.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CreatePriorityDetails-objects as value to a dart map
  static Map<String, List<CreatePriorityDetails>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CreatePriorityDetails>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CreatePriorityDetails.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'name',
    'statusColor',
  };
}

/// The URL of an icon for the priority. Accepted protocols are HTTP and HTTPS. Built in icons can also be used. Either the iconUrl or avatarId must be defined, but not both.
enum CreatePriorityDetailsIconUrlEnum {
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
  const CreatePriorityDetailsIconUrlEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [CreatePriorityDetailsIconUrlEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static CreatePriorityDetailsIconUrlEnum? fromJson(dynamic value) => CreatePriorityDetailsIconUrlEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [CreatePriorityDetailsIconUrlEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<CreatePriorityDetailsIconUrlEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CreatePriorityDetailsIconUrlEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CreatePriorityDetailsIconUrlEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [CreatePriorityDetailsIconUrlEnum] to String,
/// and [decode] dynamic data back to [CreatePriorityDetailsIconUrlEnum].
class CreatePriorityDetailsIconUrlEnumTypeTransformer {
  factory CreatePriorityDetailsIconUrlEnumTypeTransformer() => _instance ??= const CreatePriorityDetailsIconUrlEnumTypeTransformer._();

  const CreatePriorityDetailsIconUrlEnumTypeTransformer._();

  String encode(CreatePriorityDetailsIconUrlEnum data) => data._value;

  /// Returns the instance of [CreatePriorityDetailsIconUrlEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  CreatePriorityDetailsIconUrlEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is CreatePriorityDetailsIconUrlEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'/images/icons/priorities/blocker.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashBlockerPeriodPng;
        case r'/images/icons/priorities/critical.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashCriticalPeriodPng;
        case r'/images/icons/priorities/high.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighPeriodPng;
        case r'/images/icons/priorities/highest.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighestPeriodPng;
        case r'/images/icons/priorities/low.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowPeriodPng;
        case r'/images/icons/priorities/lowest.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowestPeriodPng;
        case r'/images/icons/priorities/major.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMajorPeriodPng;
        case r'/images/icons/priorities/medium.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMediumPeriodPng;
        case r'/images/icons/priorities/minor.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMinorPeriodPng;
        case r'/images/icons/priorities/trivial.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashTrivialPeriodPng;
        case r'/images/icons/priorities/blocker_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashBlockerNewPeriodPng;
        case r'/images/icons/priorities/critical_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashCriticalNewPeriodPng;
        case r'/images/icons/priorities/high_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighNewPeriodPng;
        case r'/images/icons/priorities/highest_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashHighestNewPeriodPng;
        case r'/images/icons/priorities/low_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowNewPeriodPng;
        case r'/images/icons/priorities/lowest_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashLowestNewPeriodPng;
        case r'/images/icons/priorities/major_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMajorNewPeriodPng;
        case r'/images/icons/priorities/medium_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMediumNewPeriodPng;
        case r'/images/icons/priorities/minor_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashMinorNewPeriodPng;
        case r'/images/icons/priorities/trivial_new.png': return CreatePriorityDetailsIconUrlEnum.slashImagesSlashIconsSlashPrioritiesSlashTrivialNewPeriodPng;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static CreatePriorityDetailsIconUrlEnumTypeTransformer? _instance;
}


