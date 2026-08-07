//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class JexpJqlIssues {
  /// Returns a new [JexpJqlIssues] instance.
  JexpJqlIssues({
    this.maxResults,
    this.query,
    this.startAt,
    this.validation,
  });

  /// The maximum number of issues to return from the JQL query. Inspect `meta.issues.jql.maxResults` in the response to ensure the maximum value has not been exceeded.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? maxResults;

  /// The JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? query;

  /// The index of the first issue to return from the JQL query.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startAt;

  /// Determines how to validate the JQL query and treat the validation results.
  JexpJqlIssuesValidationEnum? validation;

  @override
  bool operator ==(Object other) => identical(this, other) || other is JexpJqlIssues &&
    other.maxResults == maxResults &&
    other.query == query &&
    other.startAt == startAt &&
    other.validation == validation;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (maxResults == null ? 0 : maxResults!.hashCode) +
    (query == null ? 0 : query!.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (validation == null ? 0 : validation!.hashCode);

  @override
  String toString() => 'JexpJqlIssues[maxResults=$maxResults, query=$query, startAt=$startAt, validation=$validation]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    if (this.maxResults != null) {
      json[r'maxResults'] = this.maxResults;
    } else {
      json[r'maxResults'] = null;
    }
    if (this.query != null) {
      json[r'query'] = this.query;
    } else {
      json[r'query'] = null;
    }
    if (this.startAt != null) {
      json[r'startAt'] = this.startAt;
    } else {
      json[r'startAt'] = null;
    }
    if (this.validation != null) {
      json[r'validation'] = this.validation;
    } else {
      json[r'validation'] = null;
    }
    return json;
  }

  /// Returns a new [JexpJqlIssues] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static JexpJqlIssues? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return JexpJqlIssues(
        maxResults: mapValueOfType<int>(json, r'maxResults'),
        query: mapValueOfType<String>(json, r'query'),
        startAt: mapValueOfType<int>(json, r'startAt'),
        validation: JexpJqlIssuesValidationEnum.fromJson(json[r'validation']),
      );
    }
    return null;
  }

  static List<JexpJqlIssues> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JexpJqlIssues>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JexpJqlIssues.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, JexpJqlIssues> mapFromJson(dynamic json) {
    final map = <String, JexpJqlIssues>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = JexpJqlIssues.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of JexpJqlIssues-objects as value to a dart map
  static Map<String, List<JexpJqlIssues>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<JexpJqlIssues>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = JexpJqlIssues.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Determines how to validate the JQL query and treat the validation results.
enum JexpJqlIssuesValidationEnum {
  strict._(r'strict'),
  warn._(r'warn'),
  none._(r'none'),
  ;

  /// Instantiate a new enum with the provided value.
  const JexpJqlIssuesValidationEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [JexpJqlIssuesValidationEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static JexpJqlIssuesValidationEnum? fromJson(dynamic value) => JexpJqlIssuesValidationEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [JexpJqlIssuesValidationEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<JexpJqlIssuesValidationEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <JexpJqlIssuesValidationEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = JexpJqlIssuesValidationEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [JexpJqlIssuesValidationEnum] to String,
/// and [decode] dynamic data back to [JexpJqlIssuesValidationEnum].
class JexpJqlIssuesValidationEnumTypeTransformer {
  factory JexpJqlIssuesValidationEnumTypeTransformer() => _instance ??= const JexpJqlIssuesValidationEnumTypeTransformer._();

  const JexpJqlIssuesValidationEnumTypeTransformer._();

  String encode(JexpJqlIssuesValidationEnum data) => data._value;

  /// Returns the instance of [JexpJqlIssuesValidationEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  JexpJqlIssuesValidationEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is JexpJqlIssuesValidationEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'strict': return JexpJqlIssuesValidationEnum.strict;
        case r'warn': return JexpJqlIssuesValidationEnum.warn;
        case r'none': return JexpJqlIssuesValidationEnum.none;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static JexpJqlIssuesValidationEnumTypeTransformer? _instance;
}


