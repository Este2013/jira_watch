//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class FilterSubscriptionsList {
  /// Returns a new [FilterSubscriptionsList] instance.
  FilterSubscriptionsList({
    this.endIndex,
    this.items = const [],
    this.maxResults,
    this.size,
    this.startIndex,
  });

  /// The index of the last item returned on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? endIndex;

  /// The list of items.
  List<FilterSubscription> items;

  /// The maximum number of results that could be on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The number of items on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  /// The index of the first item returned on the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startIndex;

  @override
  bool operator ==(Object other) => identical(this, other) || other is FilterSubscriptionsList &&
    other.endIndex == endIndex &&
    _deepEquality.equals(other.items, items) &&
    other.maxResults == maxResults &&
    other.size == size &&
    other.startIndex == startIndex;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (endIndex == null ? 0 : endIndex!.hashCode) +
    (items.hashCode) +
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (size == null ? 0 : size!.hashCode) +
    (startIndex == null ? 0 : startIndex!.hashCode);

  @override
  String toString() => 'FilterSubscriptionsList[endIndex=$endIndex, items=$items, maxResults=$maxResults, size=$size, startIndex=$startIndex]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.endIndex != null) {
      json[r'end-index'] = this.endIndex;
    } else {
      json[r'end-index'] = null;
    }
      json[r'items'] = this.items;
    if (this.maxResults != null) {
      json[r'max-results'] = this.maxResults;
    } else {
      json[r'max-results'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    if (this.startIndex != null) {
      json[r'start-index'] = this.startIndex;
    } else {
      json[r'start-index'] = null;
    }
    return json;
  }

  /// Returns a new [FilterSubscriptionsList] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static FilterSubscriptionsList? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return FilterSubscriptionsList(
        endIndex: mapValueOfType<int>(json, r'end-index'),
        items: FilterSubscription.listFromJson(json[r'items']),
        maxResults: mapValueOfType<int>(json, r'max-results'),
        size: mapValueOfType<int>(json, r'size'),
        startIndex: mapValueOfType<int>(json, r'start-index'),
      );
    }
    return null;
  }

  static List<FilterSubscriptionsList> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <FilterSubscriptionsList>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = FilterSubscriptionsList.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, FilterSubscriptionsList> mapFromJson(dynamic json) {
    final map = <String, FilterSubscriptionsList>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = FilterSubscriptionsList.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of FilterSubscriptionsList-objects as value to a dart map
  static Map<String, List<FilterSubscriptionsList>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<FilterSubscriptionsList>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = FilterSubscriptionsList.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

