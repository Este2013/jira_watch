//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class NotificationScheme {
  /// Returns a new [NotificationScheme] instance.
  NotificationScheme({
    this.description,
    this.expand,
    this.id,
    this.name,
    this.notificationSchemeEvents = const [],
    this.projects = const [],
    this.scope,
    this.self,
  });

  /// The description of the notification scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? description;

  /// Expand options that include additional notification scheme details in the response.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? expand;

  /// The ID of the notification scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? id;

  /// The name of the notification scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? name;

  /// The notification events and associated recipients.
  List<NotificationSchemeEvent> notificationSchemeEvents;

  /// The list of project IDs associated with the notification scheme.
  List<int> projects;

  /// The scope of the notification scheme.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Scope? scope;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  @override
  bool operator ==(Object other) => identical(this, other) || other is NotificationScheme &&
    other.description == description &&
    other.expand == expand &&
    other.id == id &&
    other.name == name &&
    _deepEquality.equals(other.notificationSchemeEvents, notificationSchemeEvents) &&
    _deepEquality.equals(other.projects, projects) &&
    other.scope == scope &&
    other.self == self;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (description == null ? 0 : description!.hashCode) +
    (expand == null ? 0 : expand!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (name == null ? 0 : name!.hashCode) +
    (notificationSchemeEvents.hashCode) +
    (projects.hashCode) +
    (scope == null ? 0 : scope!.hashCode) +
    (self == null ? 0 : self!.hashCode);

  @override
  String toString() => 'NotificationScheme[description=$description, expand=$expand, id=$id, name=$name, notificationSchemeEvents=$notificationSchemeEvents, projects=$projects, scope=$scope, self=$self]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.description != null) {
      json[r'description'] = this.description;
    } else {
      json[r'description'] = null;
    }
    if (this.expand != null) {
      json[r'expand'] = this.expand;
    } else {
      json[r'expand'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
    if (this.name != null) {
      json[r'name'] = this.name;
    } else {
      json[r'name'] = null;
    }
      json[r'notificationSchemeEvents'] = this.notificationSchemeEvents;
      json[r'projects'] = this.projects;
    if (this.scope != null) {
      json[r'scope'] = this.scope;
    } else {
      json[r'scope'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    return json;
  }

  /// Returns a new [NotificationScheme] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static NotificationScheme? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return NotificationScheme(
        description: mapValueOfType<String>(json, r'description'),
        expand: mapValueOfType<String>(json, r'expand'),
        id: mapValueOfType<int>(json, r'id'),
        name: mapValueOfType<String>(json, r'name'),
        notificationSchemeEvents: NotificationSchemeEvent.listFromJson(json[r'notificationSchemeEvents']),
        projects: json[r'projects'] is Iterable
            ? (json[r'projects'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        scope: Scope.fromJson(json[r'scope']),
        self: mapValueOfType<String>(json, r'self'),
      );
    }
    return null;
  }

  static List<NotificationScheme> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <NotificationScheme>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = NotificationScheme.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, NotificationScheme> mapFromJson(dynamic json) {
    final map = <String, NotificationScheme>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = NotificationScheme.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of NotificationScheme-objects as value to a dart map
  static Map<String, List<NotificationScheme>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<NotificationScheme>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = NotificationScheme.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

