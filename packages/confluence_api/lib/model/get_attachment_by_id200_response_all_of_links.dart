//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class GetAttachmentById200ResponseAllOfLinks {
  /// Returns a new [GetAttachmentById200ResponseAllOfLinks] instance.
  GetAttachmentById200ResponseAllOfLinks({
    this.base_,
  });

  /// Base url of the Confluence site.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? base_;

  @override
  bool operator ==(Object other) => identical(this, other) || other is GetAttachmentById200ResponseAllOfLinks &&
    other.base_ == base_;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (base_ == null ? 0 : base_!.hashCode);

  @override
  String toString() => 'GetAttachmentById200ResponseAllOfLinks[base_=$base_]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.base_ != null) {
      json[r'base'] = this.base_;
    } else {
      json[r'base'] = null;
    }
    return json;
  }

  /// Returns a new [GetAttachmentById200ResponseAllOfLinks] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static GetAttachmentById200ResponseAllOfLinks? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return GetAttachmentById200ResponseAllOfLinks(
        base_: mapValueOfType<String>(json, r'base'),
      );
    }
    return null;
  }

  static List<GetAttachmentById200ResponseAllOfLinks> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <GetAttachmentById200ResponseAllOfLinks>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = GetAttachmentById200ResponseAllOfLinks.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, GetAttachmentById200ResponseAllOfLinks> mapFromJson(dynamic json) {
    final map = <String, GetAttachmentById200ResponseAllOfLinks>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = GetAttachmentById200ResponseAllOfLinks.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of GetAttachmentById200ResponseAllOfLinks-objects as value to a dart map
  static Map<String, List<GetAttachmentById200ResponseAllOfLinks>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<GetAttachmentById200ResponseAllOfLinks>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = GetAttachmentById200ResponseAllOfLinks.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

