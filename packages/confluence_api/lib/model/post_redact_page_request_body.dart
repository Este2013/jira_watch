//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class PostRedactPageRequestBody {
  /// Returns a new [PostRedactPageRequestBody] instance.
  PostRedactPageRequestBody({
    this.redactions = const [],
  });

  List<RedactionPointer> redactions;

  @override
  bool operator ==(Object other) => identical(this, other) || other is PostRedactPageRequestBody &&
    _deepEquality.equals(other.redactions, redactions);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (redactions.hashCode);

  @override
  String toString() => 'PostRedactPageRequestBody[redactions=$redactions]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'redactions'] = this.redactions;
    return json;
  }

  /// Returns a new [PostRedactPageRequestBody] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static PostRedactPageRequestBody? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return PostRedactPageRequestBody(
        redactions: RedactionPointer.listFromJson(json[r'redactions']),
      );
    }
    return null;
  }

  static List<PostRedactPageRequestBody> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <PostRedactPageRequestBody>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = PostRedactPageRequestBody.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, PostRedactPageRequestBody> mapFromJson(dynamic json) {
    final map = <String, PostRedactPageRequestBody>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = PostRedactPageRequestBody.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of PostRedactPageRequestBody-objects as value to a dart map
  static Map<String, List<PostRedactPageRequestBody>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<PostRedactPageRequestBody>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = PostRedactPageRequestBody.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

