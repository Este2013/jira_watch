//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class HistoryMetadata {
  /// Returns a new [HistoryMetadata] instance.
  HistoryMetadata({
    this.activityDescription,
    this.activityDescriptionKey,
    this.actor,
    this.cause,
    this.description,
    this.descriptionKey,
    this.emailDescription,
    this.emailDescriptionKey,
    this.extraData = const {},
    this.generator,
    this.type,
  });

  /// The activity described in the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? activityDescription;

  /// The key of the activity described in the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? activityDescriptionKey;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ChangelogHistoryMetadataAllOfActor? actor;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ChangelogHistoryMetadataAllOfCause? cause;

  /// The description of the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The description key of the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? descriptionKey;

  /// The description of the email address associated the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailDescription;

  /// The description key of the email address associated the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? emailDescriptionKey;

  /// Additional arbitrary information about the history record.
  Map<String, String> extraData;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  ChangelogHistoryMetadataAllOfGenerator? generator;

  /// The type of the history record.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? type;

  @override
  bool operator ==(Object other) => identical(this, other) || other is HistoryMetadata &&
    other.activityDescription == activityDescription &&
    other.activityDescriptionKey == activityDescriptionKey &&
    other.actor == actor &&
    other.cause == cause &&
    other.description == description &&
    other.descriptionKey == descriptionKey &&
    other.emailDescription == emailDescription &&
    other.emailDescriptionKey == emailDescriptionKey &&
    _deepEquality.equals(other.extraData, extraData) &&
    other.generator == generator &&
    other.type == type;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (activityDescription == null ? 0 : activityDescription!.hashCode) +
    (activityDescriptionKey == null ? 0 : activityDescriptionKey!.hashCode) +
    (actor == null ? 0 : actor!.hashCode) +
    (cause == null ? 0 : cause!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (descriptionKey == null ? 0 : descriptionKey!.hashCode) +
    (emailDescription == null ? 0 : emailDescription!.hashCode) +
    (emailDescriptionKey == null ? 0 : emailDescriptionKey!.hashCode) +
    (extraData.hashCode) +
    (generator == null ? 0 : generator!.hashCode) +
    (type == null ? 0 : type!.hashCode);

  @override
  String toString() => 'HistoryMetadata[activityDescription=$activityDescription, activityDescriptionKey=$activityDescriptionKey, actor=$actor, cause=$cause, description=$description, descriptionKey=$descriptionKey, emailDescription=$emailDescription, emailDescriptionKey=$emailDescriptionKey, extraData=$extraData, generator=$generator, type=$type]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.activityDescription != null) {
      json[r'activityDescription'] = this.activityDescription;
    } else {
      json[r'activityDescription'] = null;
    }
    if (this.activityDescriptionKey != null) {
      json[r'activityDescriptionKey'] = this.activityDescriptionKey;
    } else {
      json[r'activityDescriptionKey'] = null;
    }
    if (this.actor != null) {
      json[r'actor'] = this.actor;
    } else {
      json[r'actor'] = null;
    }
    if (this.cause != null) {
      json[r'cause'] = this.cause;
    } else {
      json[r'cause'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.descriptionKey != null) {
      json[r'descriptionKey'] = this.descriptionKey;
    } else {
      json[r'descriptionKey'] = null;
    }
    if (this.emailDescription != null) {
      json[r'emailDescription'] = this.emailDescription;
    } else {
      json[r'emailDescription'] = null;
    }
    if (this.emailDescriptionKey != null) {
      json[r'emailDescriptionKey'] = this.emailDescriptionKey;
    } else {
      json[r'emailDescriptionKey'] = null;
    }
      json[r'extraData'] = this.extraData;
    if (this.generator != null) {
      json[r'generator'] = this.generator;
    } else {
      json[r'generator'] = null;
    }
    if (this.type != null) {
      json[r'type'] = this.type;
    } else {
      json[r'type'] = null;
    }
    return json;
  }

  /// Returns a new [HistoryMetadata] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static HistoryMetadata? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return HistoryMetadata(
        activityDescription: mapValueOfType<String>(json, r'activityDescription'),
        activityDescriptionKey: mapValueOfType<String>(json, r'activityDescriptionKey'),
        actor: ChangelogHistoryMetadataAllOfActor.fromJson(json[r'actor']),
        cause: ChangelogHistoryMetadataAllOfCause.fromJson(json[r'cause']),
        description: mapValueOfType<String>(json, r'description'),
        descriptionKey: mapValueOfType<String>(json, r'descriptionKey'),
        emailDescription: mapValueOfType<String>(json, r'emailDescription'),
        emailDescriptionKey: mapValueOfType<String>(json, r'emailDescriptionKey'),
        extraData: mapCastOfType<String, String>(json, r'extraData') ?? const {},
        generator: ChangelogHistoryMetadataAllOfGenerator.fromJson(json[r'generator']),
        type: mapValueOfType<String>(json, r'type'),
      );
    }
    return null;
  }

  static List<HistoryMetadata> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <HistoryMetadata>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = HistoryMetadata.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, HistoryMetadata> mapFromJson(dynamic json) {
    final map = <String, HistoryMetadata>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = HistoryMetadata.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of HistoryMetadata-objects as value to a dart map
  static Map<String, List<HistoryMetadata>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<HistoryMetadata>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = HistoryMetadata.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

