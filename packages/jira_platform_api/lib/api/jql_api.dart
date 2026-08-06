//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class JQLApi {
  JQLApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get field reference data (GET)
  ///
  /// Returns reference data for JQL searches. This is a downloadable version of the documentation provided in [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ) and [Advanced searching - functions reference](https://confluence.atlassian.com/x/hgORLQ), along with a list of JQL-reserved words. Use this information to assist with the programmatic creation of JQL queries or the validation of queries built in a custom query builder.  To filter visible field details by project or collapse non-unique fields by field type then [Get field reference data (POST)](#api-rest-api-3-jql-autocompletedata-post) can be used.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getAutoCompleteWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/autocompletedata';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get field reference data (GET)
  ///
  /// Returns reference data for JQL searches. This is a downloadable version of the documentation provided in [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ) and [Advanced searching - functions reference](https://confluence.atlassian.com/x/hgORLQ), along with a list of JQL-reserved words. Use this information to assist with the programmatic creation of JQL queries or the validation of queries built in a custom query builder.  To filter visible field details by project or collapse non-unique fields by field type then [Get field reference data (POST)](#api-rest-api-3-jql-autocompletedata-post) can be used.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  Future<JQLReferenceData?> getAutoComplete({ Future<void>? abortTrigger, }) async {
    final response = await getAutoCompleteWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'JQLReferenceData',) as JQLReferenceData;
    
    }
    return null;
  }

  /// Get field reference data (POST)
  ///
  /// Returns reference data for JQL searches. This is a downloadable version of the documentation provided in [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ) and [Advanced searching - functions reference](https://confluence.atlassian.com/x/hgORLQ), along with a list of JQL-reserved words. Use this information to assist with the programmatic creation of JQL queries or the validation of queries built in a custom query builder.  This operation can filter the custom fields returned by project. Invalid project IDs in `projectIds` are ignored. System fields are always returned.  It can also return the collapsed field for custom fields. Collapsed fields enable searches to be performed across all fields with the same name and of the same field type. For example, the collapsed field `Component - Component[Dropdown]` enables dropdown fields `Component - cf[10061]` and `Component - cf[10062]` to be searched simultaneously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SearchAutoCompleteFilter] searchAutoCompleteFilter (required):
  Future<Response> getAutoCompletePostWithHttpInfo(SearchAutoCompleteFilter searchAutoCompleteFilter, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/autocompletedata';

    // ignore: prefer_final_locals
    Object? postBody = searchAutoCompleteFilter;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get field reference data (POST)
  ///
  /// Returns reference data for JQL searches. This is a downloadable version of the documentation provided in [Advanced searching - fields reference](https://confluence.atlassian.com/x/gwORLQ) and [Advanced searching - functions reference](https://confluence.atlassian.com/x/hgORLQ), along with a list of JQL-reserved words. Use this information to assist with the programmatic creation of JQL queries or the validation of queries built in a custom query builder.  This operation can filter the custom fields returned by project. Invalid project IDs in `projectIds` are ignored. System fields are always returned.  It can also return the collapsed field for custom fields. Collapsed fields enable searches to be performed across all fields with the same name and of the same field type. For example, the collapsed field `Component - Component[Dropdown]` enables dropdown fields `Component - cf[10061]` and `Component - cf[10062]` to be searched simultaneously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [SearchAutoCompleteFilter] searchAutoCompleteFilter (required):
  Future<JQLReferenceData?> getAutoCompletePost(SearchAutoCompleteFilter searchAutoCompleteFilter, { Future<void>? abortTrigger, }) async {
    final response = await getAutoCompletePostWithHttpInfo(searchAutoCompleteFilter, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'JQLReferenceData',) as JQLReferenceData;
    
    }
    return null;
  }

  /// Get field auto complete suggestions
  ///
  /// Returns the JQL search auto complete suggestions for a field.  Suggestions can be obtained by providing:   *  `fieldName` to get a list of all values for the field.  *  `fieldName` and `fieldValue` to get a list of values containing the text in `fieldValue`.  *  `fieldName` and `predicateName` to get a list of all predicate values for the field.  *  `fieldName`, `predicateName`, and `predicateValue` to get a list of predicate values containing the text in `predicateValue`.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] fieldName:
  ///   The name of the field.
  ///
  /// * [String] fieldValue:
  ///   The partial field item name entered by the user.
  ///
  /// * [String] predicateName:
  ///   The name of the [ CHANGED operator predicate](https://confluence.atlassian.com/x/hQORLQ#Advancedsearching-operatorsreference-CHANGEDCHANGED) for which the suggestions are generated. The valid predicate operators are *by*, *from*, and *to*.
  ///
  /// * [String] predicateValue:
  ///   The partial predicate item name entered by the user.
  Future<Response> getFieldAutoCompleteForQueryStringWithHttpInfo({ String? fieldName, String? fieldValue, String? predicateName, String? predicateValue, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/autocompletedata/suggestions';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (fieldName != null) {
      queryParams.addAll(_queryParams('', 'fieldName', fieldName));
    }
    if (fieldValue != null) {
      queryParams.addAll(_queryParams('', 'fieldValue', fieldValue));
    }
    if (predicateName != null) {
      queryParams.addAll(_queryParams('', 'predicateName', predicateName));
    }
    if (predicateValue != null) {
      queryParams.addAll(_queryParams('', 'predicateValue', predicateValue));
    }

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Get field auto complete suggestions
  ///
  /// Returns the JQL search auto complete suggestions for a field.  Suggestions can be obtained by providing:   *  `fieldName` to get a list of all values for the field.  *  `fieldName` and `fieldValue` to get a list of values containing the text in `fieldValue`.  *  `fieldName` and `predicateName` to get a list of all predicate values for the field.  *  `fieldName`, `predicateName`, and `predicateValue` to get a list of predicate values containing the text in `predicateValue`.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [String] fieldName:
  ///   The name of the field.
  ///
  /// * [String] fieldValue:
  ///   The partial field item name entered by the user.
  ///
  /// * [String] predicateName:
  ///   The name of the [ CHANGED operator predicate](https://confluence.atlassian.com/x/hQORLQ#Advancedsearching-operatorsreference-CHANGEDCHANGED) for which the suggestions are generated. The valid predicate operators are *by*, *from*, and *to*.
  ///
  /// * [String] predicateValue:
  ///   The partial predicate item name entered by the user.
  Future<AutoCompleteSuggestions?> getFieldAutoCompleteForQueryString({ String? fieldName, String? fieldValue, String? predicateName, String? predicateValue, Future<void>? abortTrigger, }) async {
    final response = await getFieldAutoCompleteForQueryStringWithHttpInfo(fieldName: fieldName, fieldValue: fieldValue, predicateName: predicateName, predicateValue: predicateValue, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AutoCompleteSuggestions',) as AutoCompleteSuggestions;
    
    }
    return null;
  }

  /// Convert user identifiers to account IDs in JQL queries
  ///
  /// Converts one or more JQL queries with user identifiers (username or user key) to equivalent JQL queries with account IDs.  You may wish to use this operation if your system stores JQL queries and you want to make them GDPR-compliant. For more information about GDPR-related changes, see the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/).  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [JQLPersonalDataMigrationRequest] jQLPersonalDataMigrationRequest (required):
  Future<Response> migrateQueriesWithHttpInfo(JQLPersonalDataMigrationRequest jQLPersonalDataMigrationRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/pdcleaner';

    // ignore: prefer_final_locals
    Object? postBody = jQLPersonalDataMigrationRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Convert user identifiers to account IDs in JQL queries
  ///
  /// Converts one or more JQL queries with user identifiers (username or user key) to equivalent JQL queries with account IDs.  You may wish to use this operation if your system stores JQL queries and you want to make them GDPR-compliant. For more information about GDPR-related changes, see the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/).  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [JQLPersonalDataMigrationRequest] jQLPersonalDataMigrationRequest (required):
  Future<ConvertedJQLQueries?> migrateQueries(JQLPersonalDataMigrationRequest jQLPersonalDataMigrationRequest, { Future<void>? abortTrigger, }) async {
    final response = await migrateQueriesWithHttpInfo(jQLPersonalDataMigrationRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ConvertedJQLQueries',) as ConvertedJQLQueries;
    
    }
    return null;
  }

  /// Parse JQL query
  ///
  /// Parses and validates JQL queries.  Validation is performed in context of the current user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] validation (required):
  ///   How to validate the JQL query and treat the validation results. Validation options include:   *  `strict` Returns all errors. If validation fails, the query structure is not returned.  *  `warn` Returns all errors. If validation fails but the JQL query is correctly formed, the query structure is returned.  *  `none` No validation is performed. If JQL query is correctly formed, the query structure is returned.
  ///
  /// * [JqlQueriesToParse] jqlQueriesToParse (required):
  Future<Response> parseJqlQueriesWithHttpInfo(String validation, JqlQueriesToParse jqlQueriesToParse, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/parse';

    // ignore: prefer_final_locals
    Object? postBody = jqlQueriesToParse;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'validation', validation));

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Parse JQL query
  ///
  /// Parses and validates JQL queries.  Validation is performed in context of the current user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [String] validation (required):
  ///   How to validate the JQL query and treat the validation results. Validation options include:   *  `strict` Returns all errors. If validation fails, the query structure is not returned.  *  `warn` Returns all errors. If validation fails but the JQL query is correctly formed, the query structure is returned.  *  `none` No validation is performed. If JQL query is correctly formed, the query structure is returned.
  ///
  /// * [JqlQueriesToParse] jqlQueriesToParse (required):
  Future<ParsedJqlQueries?> parseJqlQueries(String validation, JqlQueriesToParse jqlQueriesToParse, { Future<void>? abortTrigger, }) async {
    final response = await parseJqlQueriesWithHttpInfo(validation, jqlQueriesToParse, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ParsedJqlQueries',) as ParsedJqlQueries;
    
    }
    return null;
  }

  /// Sanitize JQL queries
  ///
  /// Sanitizes one or more JQL queries by converting readable details into IDs where a user doesn't have permission to view the entity.  For example, if the query contains the clause *project = 'Secret project'*, and a user does not have browse permission for the project \"Secret project\", the sanitized query replaces the clause with *project = 12345\"* (where 12345 is the ID of the project). If a user has the required permission, the clause is not sanitized. If the account ID is null, sanitizing is performed for an anonymous user.  Note that sanitization doesn't make the queries GDPR-compliant, because it doesn't remove user identifiers (username or user key). If you need to make queries GDPR-compliant, use [Convert user identifiers to account IDs in JQL queries](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-jql/#api-rest-api-3-jql-sanitize-post).  Before sanitization each JQL query is parsed. The queries are returned in the same order that they were passed.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [JqlQueriesToSanitize] jqlQueriesToSanitize (required):
  Future<Response> sanitiseJqlQueriesWithHttpInfo(JqlQueriesToSanitize jqlQueriesToSanitize, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/jql/sanitize';

    // ignore: prefer_final_locals
    Object? postBody = jqlQueriesToSanitize;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Sanitize JQL queries
  ///
  /// Sanitizes one or more JQL queries by converting readable details into IDs where a user doesn't have permission to view the entity.  For example, if the query contains the clause *project = 'Secret project'*, and a user does not have browse permission for the project \"Secret project\", the sanitized query replaces the clause with *project = 12345\"* (where 12345 is the ID of the project). If a user has the required permission, the clause is not sanitized. If the account ID is null, sanitizing is performed for an anonymous user.  Note that sanitization doesn't make the queries GDPR-compliant, because it doesn't remove user identifiers (username or user key). If you need to make queries GDPR-compliant, use [Convert user identifiers to account IDs in JQL queries](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-jql/#api-rest-api-3-jql-sanitize-post).  Before sanitization each JQL query is parsed. The queries are returned in the same order that they were passed.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [JqlQueriesToSanitize] jqlQueriesToSanitize (required):
  Future<SanitizedJqlQueries?> sanitiseJqlQueries(JqlQueriesToSanitize jqlQueriesToSanitize, { Future<void>? abortTrigger, }) async {
    final response = await sanitiseJqlQueriesWithHttpInfo(jqlQueriesToSanitize, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SanitizedJqlQueries',) as SanitizedJqlQueries;
    
    }
    return null;
  }
}
