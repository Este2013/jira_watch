//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class IssueEntityProperties {
  /// Returns a new [IssueEntityProperties] instance.
  IssueEntityProperties({
    this.entitiesIds = const [],
    this.properties = const {},
  });

  /// A list of entity property IDs.
  List<int> entitiesIds;

  /// A list of entity property keys and values.
  Map<String, JsonNode> properties;

  @override
  bool operator ==(Object other) => identical(this, other) || other is IssueEntityProperties &&
    _deepEquality.equals(other.entitiesIds, entitiesIds) &&
    _deepEquality.equals(other.properties, properties);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (entitiesIds.hashCode) +
    (properties.hashCode);

  @override
  String toString() => 'IssueEntityProperties[entitiesIds=$entitiesIds, properties=$properties]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'entitiesIds'] = this.entitiesIds;
      json[r'properties'] = this.properties;
    return json;
  }

  /// Returns a new [IssueEntityProperties] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static IssueEntityProperties? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return IssueEntityProperties(
        entitiesIds: json[r'entitiesIds'] is Iterable
            ? (json[r'entitiesIds'] as Iterable).cast<int>().toList(growable: false)
            : const [],
        properties: JsonNode.mapFromJson(json[r'properties']),
      );
    }
    return null;
  }

  static List<IssueEntityProperties> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <IssueEntityProperties>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = IssueEntityProperties.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, IssueEntityProperties> mapFromJson(dynamic json) {
    final map = <String, IssueEntityProperties>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = IssueEntityProperties.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of IssueEntityProperties-objects as value to a dart map
  static Map<String, List<IssueEntityProperties>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<IssueEntityProperties>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = IssueEntityProperties.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

