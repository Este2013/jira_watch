//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PageBeanFieldProjectAssociation {
  /// Returns a new [PageBeanFieldProjectAssociation] instance.
  PageBeanFieldProjectAssociation({
    this.isLast,
    this.maxResults,
    this.nextPage,
    this.self,
    this.startAt,
    this.total,
    this.values = const [],
  });

  /// Whether this is the last page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? isLast;

  /// The maximum number of items that could be returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// If there is another page of results, the URL of the next page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? nextPage;

  /// The URL of the page.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? self;

  /// The index of the first item returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startAt;

  /// The number of items returned.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? total;

  /// The list of items.
  List<FieldProjectAssociation> values;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PageBeanFieldProjectAssociation &&
    other.isLast == isLast &&
    other.maxResults == maxResults &&
    other.nextPage == nextPage &&
    other.self == self &&
    other.startAt == startAt &&
    other.total == total &&
    _deepEquality.equals(other.values, values);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (isLast == null ? 0 : isLast!.hashCode) +
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (nextPage == null ? 0 : nextPage!.hashCode) +
    (self == null ? 0 : self!.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (total == null ? 0 : total!.hashCode) +
    (values.hashCode);

  @override
  String toString() => 'PageBeanFieldProjectAssociation[isLast=$isLast, maxResults=$maxResults, nextPage=$nextPage, self=$self, startAt=$startAt, total=$total, values=$values]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.isLast != null) {
      json[r'isLast'] = this.isLast;
    } else {
      json[r'isLast'] = null;
    }
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
    if (this.nextPage != null) {
      json[r'nextPage'] = this.nextPage;
    } else {
      json[r'nextPage'] = null;
    }
    if (this.self != null) {
      json[r'self'] = this.self;
    } else {
      json[r'self'] = null;
    }
    if (this.startAt != null) {
      json[r'startAt'] = this.startAt;
    } else {
      json[r'startAt'] = null;
    }
    if (this.total != null) {
      json[r'total'] = this.total;
    } else {
      json[r'total'] = null;
    }
      json[r'values'] = this.values;
    return json;
  }

  /// Returns a new [PageBeanFieldProjectAssociation] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PageBeanFieldProjectAssociation? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PageBeanFieldProjectAssociation(
        isLast: mapValueOfType<bool>(json, r'isLast'),
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        nextPage: mapValueOfType<String>(json, r'nextPage'),
        self: mapValueOfType<String>(json, r'self'),
        startAt: mapValueOfType<int>(json, r'startAt'),
        total: mapValueOfType<int>(json, r'total'),
        values: FieldProjectAssociation.listFromJson(json[r'values']),
      );
    }
    return null;
  }

  static List<PageBeanFieldProjectAssociation> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PageBeanFieldProjectAssociation>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PageBeanFieldProjectAssociation.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PageBeanFieldProjectAssociation> mapFromJson(dynamic json) {
    final map = <String, PageBeanFieldProjectAssociation>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PageBeanFieldProjectAssociation.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PageBeanFieldProjectAssociation-objects as value to a dart map
  static Map<String, List<PageBeanFieldProjectAssociation>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PageBeanFieldProjectAssociation>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PageBeanFieldProjectAssociation.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

