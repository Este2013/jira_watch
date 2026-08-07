//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Field {
  /// Returns a new [Field] instance.
  Field({
    this.contextsCount,
    this.description,
    required this.id,
    this.isLocked,
    this.isUnscreenable,
    this.key,
    this.lastUsed,
    required this.name,
    this.projectsCount,
    required this.schema,
    this.screensCount,
    this.searcherKey,
    this.stableId,
    this.translatedDescription,
    this.translatedName,
    this.typeDisplayName,
  });

  /// Number of contexts where the field is used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? contextsCount;

  /// The description of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// The ID of the field.
  String id;

  /// Whether the field is locked.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isLocked;

  /// Whether the field is shown on screen or not.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isUnscreenable;

  /// The key of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? key;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  FieldLastUsed? lastUsed;

  /// The name of the field.
  String name;

  /// Number of projects where the field is used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? projectsCount;

  JsonTypeBean schema;

  /// Number of screens where the field is used.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? screensCount;

  /// The searcher key of the field. Returned for custom fields.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? searcherKey;

  /// The stable ID of the field.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? stableId;

  /// The translated (i18n) description of the field for the current locale. Returned for custom fields.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? translatedDescription;

  /// The translated (i18n) name of the field for the current locale. Returned for custom fields.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? translatedName;

  /// The display name of the field type
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? typeDisplayName;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Field &&
    other.contextsCount == contextsCount &&
    other.description == description &&
    other.id == id &&
    other.isLocked == isLocked &&
    other.isUnscreenable == isUnscreenable &&
    other.key == key &&
    other.lastUsed == lastUsed &&
    other.name == name &&
    other.projectsCount == projectsCount &&
    other.schema == schema &&
    other.screensCount == screensCount &&
    other.searcherKey == searcherKey &&
    other.stableId == stableId &&
    other.translatedDescription == translatedDescription &&
    other.translatedName == translatedName &&
    other.typeDisplayName == typeDisplayName;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (contextsCount == null ? 0 : contextsCount!.hashCode) +
    (description == null ? 0 : description!.hashCode) +
    (id.hashCode) +
    (isLocked == null ? 0 : isLocked!.hashCode) +
    (isUnscreenable == null ? 0 : isUnscreenable!.hashCode) +
    (key == null ? 0 : key!.hashCode) +
    (lastUsed == null ? 0 : lastUsed!.hashCode) +
    (name.hashCode) +
    (projectsCount == null ? 0 : projectsCount!.hashCode) +
    (schema.hashCode) +
    (screensCount == null ? 0 : screensCount!.hashCode) +
    (searcherKey == null ? 0 : searcherKey!.hashCode) +
    (stableId == null ? 0 : stableId!.hashCode) +
    (translatedDescription == null ? 0 : translatedDescription!.hashCode) +
    (translatedName == null ? 0 : translatedName!.hashCode) +
    (typeDisplayName == null ? 0 : typeDisplayName!.hashCode);

  @override
  String toString() => 'Field[contextsCount=$contextsCount, description=$description, id=$id, isLocked=$isLocked, isUnscreenable=$isUnscreenable, key=$key, lastUsed=$lastUsed, name=$name, projectsCount=$projectsCount, schema=$schema, screensCount=$screensCount, searcherKey=$searcherKey, stableId=$stableId, translatedDescription=$translatedDescription, translatedName=$translatedName, typeDisplayName=$typeDisplayName]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.contextsCount != null) {
      json[r'contextsCount'] = this.contextsCount;
    } else {
      json[r'contextsCount'] = null;
    }
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
      json[r'id'] = this.id;
    if (this.isLocked != null) {
      json[r'isLocked'] = this.isLocked;
    } else {
      json[r'isLocked'] = null;
    }
    if (this.isUnscreenable != null) {
      json[r'isUnscreenable'] = this.isUnscreenable;
    } else {
      json[r'isUnscreenable'] = null;
    }
    if (this.key != null) {
      json[r'key'] = this.key;
    } else {
      json[r'key'] = null;
    }
    if (this.lastUsed != null) {
      json[r'lastUsed'] = this.lastUsed;
    } else {
      json[r'lastUsed'] = null;
    }
      json[r'name'] = this.name;
    if (this.projectsCount != null) {
      json[r'projectsCount'] = this.projectsCount;
    } else {
      json[r'projectsCount'] = null;
    }
      json[r'schema'] = this.schema;
    if (this.screensCount != null) {
      json[r'screensCount'] = this.screensCount;
    } else {
      json[r'screensCount'] = null;
    }
    if (this.searcherKey != null) {
      json[r'searcherKey'] = this.searcherKey;
    } else {
      json[r'searcherKey'] = null;
    }
    if (this.stableId != null) {
      json[r'stableId'] = this.stableId;
    } else {
      json[r'stableId'] = null;
    }
    if (this.translatedDescription != null) {
      json[r'translatedDescription'] = this.translatedDescription;
    } else {
      json[r'translatedDescription'] = null;
    }
    if (this.translatedName != null) {
      json[r'translatedName'] = this.translatedName;
    } else {
      json[r'translatedName'] = null;
    }
    if (this.typeDisplayName != null) {
      json[r'typeDisplayName'] = this.typeDisplayName;
    } else {
      json[r'typeDisplayName'] = null;
    }
    return json;
  }

  /// Returns a new [Field] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Field? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'id'), 'Required key "Field[id]" is missing from JSON.');
        assert(json[r'id'] != null, 'Required key "Field[id]" has a null value in JSON.');
        assert(json.containsKey(r'name'), 'Required key "Field[name]" is missing from JSON.');
        assert(json[r'name'] != null, 'Required key "Field[name]" has a null value in JSON.');
        assert(json.containsKey(r'schema'), 'Required key "Field[schema]" is missing from JSON.');
        assert(json[r'schema'] != null, 'Required key "Field[schema]" has a null value in JSON.');
        return true;
      }());

      return Field(
        contextsCount: mapValueOfType<int>(json, r'contextsCount'),
        description: mapValueOfType<String>(json, r'description'),
        id: mapValueOfType<String>(json, r'id')!,
        isLocked: mapValueOfType<bool>(json, r'isLocked'),
        isUnscreenable: mapValueOfType<bool>(json, r'isUnscreenable'),
        key: mapValueOfType<String>(json, r'key'),
        lastUsed: FieldLastUsed.fromJson(json[r'lastUsed']),
        name: mapValueOfType<String>(json, r'name')!,
        projectsCount: mapValueOfType<int>(json, r'projectsCount'),
        schema: JsonTypeBean.fromJson(json[r'schema'])!,
        screensCount: mapValueOfType<int>(json, r'screensCount'),
        searcherKey: mapValueOfType<String>(json, r'searcherKey'),
        stableId: mapValueOfType<String>(json, r'stableId'),
        translatedDescription: mapValueOfType<String>(json, r'translatedDescription'),
        translatedName: mapValueOfType<String>(json, r'translatedName'),
        typeDisplayName: mapValueOfType<String>(json, r'typeDisplayName'),
      );
    }
    return null;
  }

  static List<Field> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Field>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Field.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Field> mapFromJson(dynamic json) {
    final map = <String, Field>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Field.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Field-objects as value to a dart map
  static Map<String, List<Field>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Field>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Field.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'id',
    'name',
    'schema',
  };
}

