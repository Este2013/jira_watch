//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class Changelog {
  /// Returns a new [Changelog] instance.
  Changelog({
    this.author,
    this.created,
    this.historyMetadata,
    this.id,
    this.items = const [],
  });

  /// The user who made the change.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  UserDetails? author;

  /// The date on which the change took place.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  DateTime? created;

  /// The history metadata associated with the changed.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  HistoryMetadata? historyMetadata;

  /// The ID of the changelog.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? id;

  /// The list of items changed.
  List<ChangeDetails> items;

  @override
  bool operator ==(Object other) => identical(this, other) || other is Changelog &&
    other.author == author &&
    other.created == created &&
    other.historyMetadata == historyMetadata &&
    other.id == id &&
    _deepEquality.equals(other.items, items);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (author == null ? 0 : author!.hashCode) +
    (created == null ? 0 : created!.hashCode) +
    (historyMetadata == null ? 0 : historyMetadata!.hashCode) +
    (id == null ? 0 : id!.hashCode) +
    (items.hashCode);

  @override
  String toString() => 'Changelog[author=$author, created=$created, historyMetadata=$historyMetadata, id=$id, items=$items]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.author != null) {
      json[r'author'] = this.author;
    } else {
      json[r'author'] = null;
    }
    if (this.created != null) {
      json[r'created'] = this.created!.toUtc().toIso8601String();
    } else {
      json[r'created'] = null;
    }
    if (this.historyMetadata != null) {
      json[r'historyMetadata'] = this.historyMetadata;
    } else {
      json[r'historyMetadata'] = null;
    }
    if (this.id != null) {
      json[r'id'] = this.id;
    } else {
      json[r'id'] = null;
    }
      json[r'items'] = this.items;
    return json;
  }

  /// Returns a new [Changelog] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static Changelog? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return Changelog(
        author: UserDetails.fromJson(json[r'author']),
        created: mapDateTime(json, r'created', r''),
        historyMetadata: HistoryMetadata.fromJson(json[r'historyMetadata']),
        id: mapValueOfType<String>(json, r'id'),
        items: ChangeDetails.listFromJson(json[r'items']),
      );
    }
    return null;
  }

  static List<Changelog> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <Changelog>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = Changelog.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, Changelog> mapFromJson(dynamic json) {
    final map = <String, Changelog>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = Changelog.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of Changelog-objects as value to a dart map
  static Map<String, List<Changelog>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<Changelog>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = Changelog.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

