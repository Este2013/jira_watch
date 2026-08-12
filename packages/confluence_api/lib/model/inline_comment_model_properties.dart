//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class InlineCommentModelProperties {
  /// Returns a new [InlineCommentModelProperties] instance.
  InlineCommentModelProperties({
    this.results = const [],
    this.meta,
    this.links,
    this.inlineMarkerRef,
    this.inlineOriginalSelection,
  });

  List<ContentProperty> results;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  OptionalFieldMeta? meta;

  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  OptionalFieldLinks? links;

  /// Property value used to reference the highlighted element in DOM.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? inlineMarkerRef;

  /// Text that is highlighted.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? inlineOriginalSelection;

  @override
  bool operator ==(Object other) => identical(this, other) || other is InlineCommentModelProperties &&
    _deepEquality.equals(other.results, results) &&
    other.meta == meta &&
    other.links == links &&
    other.inlineMarkerRef == inlineMarkerRef &&
    other.inlineOriginalSelection == inlineOriginalSelection;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (results.hashCode) +
    (meta == null ? 0 : meta!.hashCode) +
    (links == null ? 0 : links!.hashCode) +
    (inlineMarkerRef == null ? 0 : inlineMarkerRef!.hashCode) +
    (inlineOriginalSelection == null ? 0 : inlineOriginalSelection!.hashCode);

  @override
  String toString() => 'InlineCommentModelProperties[results=$results, meta=$meta, links=$links, inlineMarkerRef=$inlineMarkerRef, inlineOriginalSelection=$inlineOriginalSelection]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'results'] = this.results;
    if (this.meta != null) {
      json[r'meta'] = this.meta;
    } else {
      json[r'meta'] = null;
    }
    if (this.links != null) {
      json[r'_links'] = this.links;
    } else {
      json[r'_links'] = null;
    }
    if (this.inlineMarkerRef != null) {
      json[r'inlineMarkerRef'] = this.inlineMarkerRef;
    } else {
      json[r'inlineMarkerRef'] = null;
    }
    if (this.inlineOriginalSelection != null) {
      json[r'inlineOriginalSelection'] = this.inlineOriginalSelection;
    } else {
      json[r'inlineOriginalSelection'] = null;
    }
    return json;
  }

  /// Returns a new [InlineCommentModelProperties] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static InlineCommentModelProperties? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return InlineCommentModelProperties(
        results: ContentProperty.listFromJson(json[r'results']),
        meta: OptionalFieldMeta.fromJson(json[r'meta']),
        links: OptionalFieldLinks.fromJson(json[r'_links']),
        inlineMarkerRef: mapValueOfType<String>(json, r'inlineMarkerRef'),
        inlineOriginalSelection: mapValueOfType<String>(json, r'inlineOriginalSelection'),
      );
    }
    return null;
  }

  static List<InlineCommentModelProperties> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <InlineCommentModelProperties>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = InlineCommentModelProperties.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, InlineCommentModelProperties> mapFromJson(dynamic json) {
    final map = <String, InlineCommentModelProperties>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = InlineCommentModelProperties.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of InlineCommentModelProperties-objects as value to a dart map
  static Map<String, List<InlineCommentModelProperties>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<InlineCommentModelProperties>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = InlineCommentModelProperties.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

