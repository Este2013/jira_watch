//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class SearchRequestBean {
  /// Returns a new [SearchRequestBean] instance.
  SearchRequestBean({
    this.expand = const [],
    this.fields = const [],
    this.fieldsByKeys,
    this.jql,
    this.maxResults = 50,
    this.properties = const [],
    this.startAt,
    this.validateQuery,
  });

  /// Use [expand](#expansion) to include additional information about issues in the response. Note that, unlike the majority of instances where `expand` is specified, `expand` is defined as a list of values. The expand options are:   *  `renderedFields` Returns field values rendered in HTML format.  *  `names` Returns the display name of each field.  *  `schema` Returns the schema describing a field type.  *  `transitions` Returns all possible transitions for the issue.  *  `operations` Returns all possible operations for the issue.  *  `editmeta` Returns information about how each field can be edited.  *  `changelog` Returns a list of recent updates to an issue, sorted by date, starting from the most recent.  *  `versionedRepresentations` Instead of `fields`, returns `versionedRepresentations` a JSON array containing each version of a field's value, with the highest numbered item representing the most recent version.
  List<String> expand;

  /// A list of fields to return for each issue, use it to retrieve a subset of fields. This parameter accepts a comma-separated list. Expand options include:   *  `*all` Returns all fields.  *  `*navigable` Returns navigable fields.  *  Any issue field, prefixed with a minus to exclude.  The default is `*navigable`.  Examples:   *  `summary,comment` Returns the summary and comments fields only.  *  `-description` Returns all navigable (default) fields except description.  *  `*all,-comment` Returns all fields except comments.  Multiple `fields` parameters can be included in a request.  Note: All navigable fields are returned by default. This differs from [GET issue](#api-rest-api-3-issue-issueIdOrKey-get) where the default is all fields.
  List<String> fields;

  /// Reference fields by their key (rather than ID). The default is `false`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  bool? fieldsByKeys;

  /// A [JQL](https://confluence.atlassian.com/x/egORLQ) expression.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  String? jql;

  /// The maximum number of items to return per page.
  int maxResults;

  /// A list of up to 5 issue properties to include in the results. This parameter accepts a comma-separated list.
  List<String> properties;

  /// The index of the first item to return in the page of results (page offset). The base index is `0`.
  ///
  /// Please note: This property should have been non-nullable! Since the specification file
  /// does not include a default value (using the "default:" property), however, the generated
  /// source code must fall back to having a nullable type.
  /// Consider adding a "default:" property in the specification file to hide this note.
  ///
  int? startAt;

  /// Determines how to validate the JQL query and treat the validation results. Supported values:   *  `strict` Returns a 400 response code if any errors are found, along with a list of all errors (and warnings).  *  `warn` Returns all errors as warnings.  *  `none` No validation is performed.  *  `true` *Deprecated* A legacy synonym for `strict`.  *  `false` *Deprecated* A legacy synonym for `warn`.  The default is `strict`.  Note: If the JQL is not correctly formed a 400 response code is returned, regardless of the `validateQuery` value.
  SearchRequestBeanValidateQueryEnum? validateQuery;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchRequestBean &&
    _deepEquality.equals(other.expand, expand) &&
    _deepEquality.equals(other.fields, fields) &&
    other.fieldsByKeys == fieldsByKeys &&
    other.jql == jql &&
    other.maxResults == maxResults &&
    _deepEquality.equals(other.properties, properties) &&
    other.startAt == startAt &&
    other.validateQuery == validateQuery;

  @override
  int get hashCode =>
    // ignore: unnecessary_parenthesis
    (expand.hashCode) +
    (fields.hashCode) +
    (fieldsByKeys == null ? 0 : fieldsByKeys!.hashCode) +
    (jql == null ? 0 : jql!.hashCode) +
    (maxResults.hashCode) +
    (properties.hashCode) +
    (startAt == null ? 0 : startAt!.hashCode) +
    (validateQuery == null ? 0 : validateQuery!.hashCode);

  @override
  String toString() => 'SearchRequestBean[expand=$expand, fields=$fields, fieldsByKeys=$fieldsByKeys, jql=$jql, maxResults=$maxResults, properties=$properties, startAt=$startAt, validateQuery=$validateQuery]';

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
      json[r'expand'] = this.expand;
      json[r'fields'] = this.fields;
    if (this.fieldsByKeys != null) {
      json[r'fieldsByKeys'] = this.fieldsByKeys;
    } else {
      json[r'fieldsByKeys'] = null;
    }
    if (this.jql != null) {
      json[r'jql'] = this.jql;
    } else {
      json[r'jql'] = null;
    }
      json[r'maxResults'] = this.maxResults;
      json[r'properties'] = this.properties;
    if (this.startAt != null) {
      json[r'startAt'] = this.startAt;
    } else {
      json[r'startAt'] = null;
    }
    if (this.validateQuery != null) {
      json[r'validateQuery'] = this.validateQuery;
    } else {
      json[r'validateQuery'] = null;
    }
    return json;
  }

  /// Returns a new [SearchRequestBean] instance and imports its values from
  /// [value] if it's a [Map], null otherwise.
  // ignore: prefer_constructors_over_static_methods
  static SearchRequestBean? fromJson(dynamic value) {
    if (value is Map) {
      final json = value.cast<String, dynamic>();

      // Ensure that the map contains the required keys.
      // Note 1: the values aren't checked for validity beyond being non-null.
      // Note 2: this code is stripped in release mode!
      assert(() {
        return true;
      }());

      return SearchRequestBean(
        expand: json[r'expand'] is Iterable
            ? (json[r'expand'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        fields: json[r'fields'] is Iterable
            ? (json[r'fields'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        fieldsByKeys: mapValueOfType<bool>(json, r'fieldsByKeys'),
        jql: mapValueOfType<String>(json, r'jql'),
        maxResults: mapValueOfType<int>(json, r'maxResults') ?? 50,
        properties: json[r'properties'] is Iterable
            ? (json[r'properties'] as Iterable).cast<String>().toList(growable: false)
            : const [],
        startAt: mapValueOfType<int>(json, r'startAt'),
        validateQuery: SearchRequestBeanValidateQueryEnum.fromJson(json[r'validateQuery']),
      );
    }
    return null;
  }

  static List<SearchRequestBean> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchRequestBean>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchRequestBean.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }

  static Map<String, SearchRequestBean> mapFromJson(dynamic json) {
    final map = <String, SearchRequestBean>{};
    if (json is Map && json.isNotEmpty) {
      json = json.cast<String, dynamic>(); // ignore: parameter_assignments
      for (final entry in json.entries) {
        final value = SearchRequestBean.fromJson(entry.value);
        if (value != null) {
          map[entry.key] = value;
        }
      }
    }
    return map;
  }

  // maps a json object with a list of SearchRequestBean-objects as value to a dart map
  static Map<String, List<SearchRequestBean>> mapListFromJson(dynamic json, {bool growable = false,}) {
    final map = <String, List<SearchRequestBean>>{};
    if (json is Map && json.isNotEmpty) {
      // ignore: parameter_assignments
      json = json.cast<String, dynamic>();
      for (final entry in json.entries) {
        map[entry.key] = SearchRequestBean.listFromJson(entry.value, growable: growable,);
      }
    }
    return map;
  }

  /// The list of required keys that must be present in a JSON.
  static const requiredKeys = <String>{
  };
}

/// Determines how to validate the JQL query and treat the validation results. Supported values:   *  `strict` Returns a 400 response code if any errors are found, along with a list of all errors (and warnings).  *  `warn` Returns all errors as warnings.  *  `none` No validation is performed.  *  `true` *Deprecated* A legacy synonym for `strict`.  *  `false` *Deprecated* A legacy synonym for `warn`.  The default is `strict`.  Note: If the JQL is not correctly formed a 400 response code is returned, regardless of the `validateQuery` value.
enum SearchRequestBeanValidateQueryEnum {
  strict._(r'strict'),
  warn._(r'warn'),
  none._(r'none'),
  true_._(r'true'),
  false_._(r'false'),
  ;

  /// Instantiate a new enum with the provided value.
  const SearchRequestBeanValidateQueryEnum._(this._value);

  /// The underlying value of this enum member.
  final String _value;

  @override
  String toString() => _value;

  /// Encodes this enum as a value suitable for JSON.
  String toJson() => _value;

  /// Returns the instance of [SearchRequestBeanValidateQueryEnum] that was successfully decoded
  /// from the passed [value] on success, null otherwise.
  static SearchRequestBeanValidateQueryEnum? fromJson(dynamic value) => SearchRequestBeanValidateQueryEnumTypeTransformer().decode(value);

  /// Returns a [List] containing instances of [SearchRequestBeanValidateQueryEnum]
  /// that were successfully decoded from the passed [JSON][json].
  static List<SearchRequestBeanValidateQueryEnum> listFromJson(dynamic json, {bool growable = false,}) {
    final result = <SearchRequestBeanValidateQueryEnum>[];
    if (json is List && json.isNotEmpty) {
      for (final row in json) {
        final value = SearchRequestBeanValidateQueryEnum.fromJson(row);
        if (value != null) {
          result.add(value);
        }
      }
    }
    return result.toList(growable: growable);
  }
}

/// Transformation class that can [encode] an instance of [SearchRequestBeanValidateQueryEnum] to String,
/// and [decode] dynamic data back to [SearchRequestBeanValidateQueryEnum].
class SearchRequestBeanValidateQueryEnumTypeTransformer {
  factory SearchRequestBeanValidateQueryEnumTypeTransformer() => _instance ??= const SearchRequestBeanValidateQueryEnumTypeTransformer._();

  const SearchRequestBeanValidateQueryEnumTypeTransformer._();

  String encode(SearchRequestBeanValidateQueryEnum data) => data._value;

  /// Returns the instance of [SearchRequestBeanValidateQueryEnum] that was successfully decoded
  /// from the passed [data] value on success, null otherwise.
  ///
  /// If [allowNull] is true and the [dynamic value][data] cannot be decoded successfully,
  /// then null is returned. However, if [allowNull] is false and the [dynamic value][data]
  /// cannot be decoded successfully, then an [UnimplementedError] is thrown.
  ///
  /// The [allowNull] is very handy when an API changes and a new enum value is added or removed,
  /// and users are still using an old app with the old code.
  SearchRequestBeanValidateQueryEnum? decode(dynamic data, {bool allowNull = true}) {
    if (data is SearchRequestBeanValidateQueryEnum) {
      return data;
    }
    if (data != null) {
      switch (data) {
        case r'strict': return SearchRequestBeanValidateQueryEnum.strict;
        case r'warn': return SearchRequestBeanValidateQueryEnum.warn;
        case r'none': return SearchRequestBeanValidateQueryEnum.none;
        case r'true': return SearchRequestBeanValidateQueryEnum.true_;
        case r'false': return SearchRequestBeanValidateQueryEnum.false_;
        default:
          if (!allowNull) {
            throw ArgumentError('Unknown enum value to decode: $data');
          }
      }
    }
    return null;
  }

  /// The singleton instance of this transformer.
  static SearchRequestBeanValidateQueryEnumTypeTransformer? _instance;
}


