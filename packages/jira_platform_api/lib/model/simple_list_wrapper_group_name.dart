//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SimpleListWrapperGroupName {
  /// Returns a new [SimpleListWrapperGroupName] instance.
  SimpleListWrapperGroupName({
    this.callback,
    this.items = const [],
    this.maxResults,
    this.pagingCallback,
    this.size,
  });

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? callback;

  List<GroupName> items;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  Object? pagingCallback;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? size;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SimpleListWrapperGroupName &&
    other.callback == callback &&
    _deepEquality.equals(other.items, items) &&
    other.maxResults == maxResults &&
    other.pagingCallback == pagingCallback &&
    other.size == size;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (callback == null ? 0 : callback!.hashCode) +
    (items.hashCode) +
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (pagingCallback == null ? 0 : pagingCallback!.hashCode) +
    (size == null ? 0 : size!.hashCode);

  @override
  String toString() => 'SimpleListWrapperGroupName[callback=$callback, items=$items, maxResults=$maxResults, pagingCallback=$pagingCallback, size=$size]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.callback != null) {
      json[r'callback'] = this.callback;
    } else {
      json[r'callback'] = null;
    }
      json[r'items'] = this.items;
    if (this.maxResults != null) {
      json[r'max-results'] = this.maxResults;
    } else {
      json[r'max-results'] = null;
    }
    if (this.pagingCallback != null) {
      json[r'pagingCallback'] = this.pagingCallback;
    } else {
      json[r'pagingCallback'] = null;
    }
    if (this.size != null) {
      json[r'size'] = this.size;
    } else {
      json[r'size'] = null;
    }
    return json;
  }

  /// Returns a new [SimpleListWrapperGroupName] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SimpleListWrapperGroupName? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SimpleListWrapperGroupName(
        callback: mapValueOfType<Object>(json, r'callback'),
        items: GroupName.listFromJson(json[r'items']),
        maxResults: mapValueOfType<int>(json, r'max-results'),
        pagingCallback: mapValueOfType<Object>(json, r'pagingCallback'),
        size: mapValueOfType<int>(json, r'size'),
      );
    }
    return null;
  }

  static List<SimpleListWrapperGroupName> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SimpleListWrapperGroupName>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SimpleListWrapperGroupName.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SimpleListWrapperGroupName> mapFromJson(dynamic json) {
    final map = <String, SimpleListWrapperGroupName>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SimpleListWrapperGroupName.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SimpleListWrapperGroupName-objects as value to a dart map
  static Map<String, List<SimpleListWrapperGroupName>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SimpleListWrapperGroupName>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SimpleListWrapperGroupName.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

