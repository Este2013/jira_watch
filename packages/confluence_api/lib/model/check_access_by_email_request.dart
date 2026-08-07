//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class CheckAccessByEmailRequest {
  /// Returns a new [CheckAccessByEmailRequest] instance.
  CheckAccessByEmailRequest({
    this.emails = const [],
  });

  /// List of emails to check access to site.
  List<String> emails;

  @override
  bool operator ==(Object other) => identical(this, other) || other is CheckAccessByEmailRequest &&
    _deepEquality.equals(other.emails, emails);

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (emails.hashCode);

  @override
  String toString() => 'CheckAccessByEmailRequest[emails=$emails]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'emails'] = this.emails;
    return json;
  }

  /// Returns a new [CheckAccessByEmailRequest] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static CheckAccessByEmailRequest? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        assert(json.containsKey(r'emails'), 'Required key "CheckAccessByEmailRequest[emails]" is missing from JSON.');
        assert(json[r'emails'] != null, 'Required key "CheckAccessByEmailRequest[emails]" has a null value in JSON.');
        return true;
      }());

      return CheckAccessByEmailRequest(
        emails: json[r'emails'] is Iterable
            ? (json[r'emails'] as Iterable).cast<String>().toList(growable: false)
            : const [],
      );
    }
    return null;
  }

  static List<CheckAccessByEmailRequest> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <CheckAccessByEmailRequest>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = CheckAccessByEmailRequest.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, CheckAccessByEmailRequest> mapFromJson(dynamic json) {
    final map = <String, CheckAccessByEmailRequest>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = CheckAccessByEmailRequest.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of CheckAccessByEmailRequest-objects as value to a dart map
  static Map<String, List<CheckAccessByEmailRequest>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<CheckAccessByEmailRequest>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = CheckAccessByEmailRequest.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
    'emails',
  };
}

