//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class EpicApi {
  EpicApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get epic
  ///
  /// Returns the epic for a given epic ID. This epic will only be returned if the user has permission to view it. **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the requested epic.
  Future<Response> getEpicWithHttpInfo(String epicIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/{epicIdOrKey}'
      .replaceAll('{epicIdOrKey}', epicIdOrKey);

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

  /// Get epic
  ///
  /// Returns the epic for a given epic ID. This epic will only be returned if the user has permission to view it. **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the requested epic.
  Future<void> getEpic(String epicIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await getEpicWithHttpInfo(epicIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issues for epic
  ///
  /// Returns all issues that belong to the epic, for the given epic ID. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a next-gen project, do not use this operation. Instead, search for issues that belong to an epic by using the [Search for issues using JQL](https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-search-get) operation in the Jira platform REST API. Build your JQL query using the `parent` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic that contains the requested issues.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. Default: 50. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.   Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Agile fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<Response> getIssuesForEpicWithHttpInfo(String epicIdOrKey, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/{epicIdOrKey}/issue'
      .replaceAll('{epicIdOrKey}', epicIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
    }
    if (validateQuery != null) {
      queryParams.addAll(_queryParams('', 'validateQuery', validateQuery));
    }
    if (fields != null) {
      queryParams.addAll(_queryParams('multi', 'fields', fields));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Get issues for epic
  ///
  /// Returns all issues that belong to the epic, for the given epic ID. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a next-gen project, do not use this operation. Instead, search for issues that belong to an epic by using the [Search for issues using JQL](https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-search-get) operation in the Jira platform REST API. Build your JQL query using the `parent` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic that contains the requested issues.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. Default: 50. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.   Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Agile fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<void> getIssuesForEpic(String epicIdOrKey, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForEpicWithHttpInfo(epicIdOrKey, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issues for epic (enhanced)
  ///
  /// Returns all issues that belong to the epic, for the given epic ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a Team Managed project, do not use this operation. Instead, search for issues that belong to an epic by using the [Search for issues using JQL enhanced search](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/#api-rest-api-3-search-jql-get) operation in the Jira platform REST API. Build your JQL query using the `parent` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The ID or key of the epic that contains the requested issues.
  ///
  /// * [String] nextPageToken:
  ///   The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.  Note: The `nextPageToken` field is **not included** in the response for the last page, indicating there is no next page.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page. To manage page size, the API may return fewer items per page where there is a large number of fields or properties returned. It returns max 5000 issues.
  ///
  /// * [List<int>] reconcileIssues:
  ///   Strong consistency issue IDs to be reconciled with search results. Accepts max 50 IDs. This list of IDs should be consistent with each paginated request across different pages.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.   Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Software project fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<Response> getIssuesForEpicJSISWithHttpInfo(String epicIdOrKey, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/epic/{epicIdOrKey}/issue'
      .replaceAll('{epicIdOrKey}', epicIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (nextPageToken != null) {
      queryParams.addAll(_queryParams('', 'nextPageToken', nextPageToken));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (reconcileIssues != null) {
      queryParams.addAll(_queryParams('multi', 'reconcileIssues', reconcileIssues));
    }
    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
    }
    if (validateQuery != null) {
      queryParams.addAll(_queryParams('', 'validateQuery', validateQuery));
    }
    if (fields != null) {
      queryParams.addAll(_queryParams('multi', 'fields', fields));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Get issues for epic (enhanced)
  ///
  /// Returns all issues that belong to the epic, for the given epic ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a Team Managed project, do not use this operation. Instead, search for issues that belong to an epic by using the [Search for issues using JQL enhanced search](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/#api-rest-api-3-search-jql-get) operation in the Jira platform REST API. Build your JQL query using the `parent` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The ID or key of the epic that contains the requested issues.
  ///
  /// * [String] nextPageToken:
  ///   The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.  Note: The `nextPageToken` field is **not included** in the response for the last page, indicating there is no next page.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page. To manage page size, the API may return fewer items per page where there is a large number of fields or properties returned. It returns max 5000 issues.
  ///
  /// * [List<int>] reconcileIssues:
  ///   Strong consistency issue IDs to be reconciled with search results. Accepts max 50 IDs. This list of IDs should be consistent with each paginated request across different pages.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.   Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Software project fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<SoftwareIssueResults?> getIssuesForEpicJSIS(String epicIdOrKey, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForEpicJSISWithHttpInfo(epicIdOrKey, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SoftwareIssueResults',) as SoftwareIssueResults;
    
    }
    return null;
  }

  /// Get issues without epic
  ///
  /// Returns all issues that do not belong to any epic. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a next-gen project, do not use this operation. Instead, search for issues that don't belong to an epic by using the [Search for issues using JQL](https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-search-get) operation in the Jira platform REST API. Build your JQL query using the `parent is empty` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Agile fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<Response> getIssuesWithoutEpicWithHttpInfo({ int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/none/issue';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
    }
    if (validateQuery != null) {
      queryParams.addAll(_queryParams('', 'validateQuery', validateQuery));
    }
    if (fields != null) {
      queryParams.addAll(_queryParams('multi', 'fields', fields));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Get issues without epic
  ///
  /// Returns all issues that do not belong to any epic. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a next-gen project, do not use this operation. Instead, search for issues that don't belong to an epic by using the [Search for issues using JQL](https://developer.atlassian.com/cloud/jira/platform/rest/v2/#api-rest-api-2-search-get) operation in the Jira platform REST API. Build your JQL query using the `parent is empty` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Agile fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<void> getIssuesWithoutEpic({ int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesWithoutEpicWithHttpInfo(startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issues without epic (enhanced)
  ///
  /// Returns all issues that do not belong to any epic. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a Team Managed project, do not use this operation. Instead, search for issues that don't belong to an epic by using the [Search for issues using JQL enhanced search](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/#api-rest-api-3-search-jql-get) operation in the Jira platform REST API. Build your JQL query using the `parent is empty` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] nextPageToken:
  ///   The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.  Note: The `nextPageToken` field is **not included** in the response for the last page, indicating there is no next page.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page. To manage page size, the API may return fewer items per page where there is a large number of fields or properties returned. It returns max 5000 issues.
  ///
  /// * [List<int>] reconcileIssues:
  ///   Strong consistency issue IDs to be reconciled with search results. Accepts max 50 IDs. This list of IDs should be consistent with each paginated request across different pages.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.   Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Software project fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<Response> getIssuesWithoutEpicJSISWithHttpInfo({ String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/epic/none/issue';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (nextPageToken != null) {
      queryParams.addAll(_queryParams('', 'nextPageToken', nextPageToken));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (reconcileIssues != null) {
      queryParams.addAll(_queryParams('multi', 'reconcileIssues', reconcileIssues));
    }
    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
    }
    if (validateQuery != null) {
      queryParams.addAll(_queryParams('', 'validateQuery', validateQuery));
    }
    if (fields != null) {
      queryParams.addAll(_queryParams('multi', 'fields', fields));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Get issues without epic (enhanced)
  ///
  /// Returns all issues that do not belong to any epic. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank. **Note:** If you are querying a Team Managed project, do not use this operation. Instead, search for issues that don't belong to an epic by using the [Search for issues using JQL enhanced search](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-issue-search/#api-rest-api-3-search-jql-get) operation in the Jira platform REST API. Build your JQL query using the `parent is empty` clause. For more information on the `parent` JQL field, see [Advanced searching](https://confluence.atlassian.com/x/dAiiLQ#Advancedsearching-fieldsreference-Parent).
  ///
  /// Parameters:
  ///
  /// * [String] nextPageToken:
  ///   The token for a page to fetch that is not the first page. The first page has a `nextPageToken` of `null`. Use the `nextPageToken` to fetch the next page of issues.  Note: The `nextPageToken` field is **not included** in the response for the last page, indicating there is no next page.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page. To manage page size, the API may return fewer items per page where there is a large number of fields or properties returned. It returns max 5000 issues.
  ///
  /// * [List<int>] reconcileIssues:
  ///   Strong consistency issue IDs to be reconciled with search results. Accepts max 50 IDs. This list of IDs should be consistent with each paginated request across different pages.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. If you define an order in your JQL query, it will override the default order of the returned issues.   Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  ///
  /// * [bool] validateQuery:
  ///   Specifies whether to validate the JQL query or not. Default: true.
  ///
  /// * [List<Object>] fields:
  ///   The list of fields to return for each issue. By default, all navigable and Software project fields are returned.
  ///
  /// * [String] expand:
  ///   A comma-separated list of the parameters to expand.
  Future<SoftwareIssueResults?> getIssuesWithoutEpicJSIS({ String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesWithoutEpicJSISWithHttpInfo(nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SoftwareIssueResults',) as SoftwareIssueResults;
    
    }
    return null;
  }

  /// Move issues to epic
  ///
  /// Moves issues to an epic, for a given epic id. Issues can be only in a single epic at the same time. That means that already assigned issues to an epic, will not be assigned to the previous epic anymore. The user needs to have the edit issue permission for all issue they want to move and to the epic. The maximum number of issues that can be moved in one operation is 50. **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic that you want to assign issues to.
  ///
  /// * [MoveIssuesToBacklogRequest] moveIssuesToBacklogRequest (required):
  Future<Response> moveIssuesToEpicWithHttpInfo(String epicIdOrKey, MoveIssuesToBacklogRequest moveIssuesToBacklogRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/{epicIdOrKey}/issue'
      .replaceAll('{epicIdOrKey}', epicIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = moveIssuesToBacklogRequest;

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

  /// Move issues to epic
  ///
  /// Moves issues to an epic, for a given epic id. Issues can be only in a single epic at the same time. That means that already assigned issues to an epic, will not be assigned to the previous epic anymore. The user needs to have the edit issue permission for all issue they want to move and to the epic. The maximum number of issues that can be moved in one operation is 50. **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic that you want to assign issues to.
  ///
  /// * [MoveIssuesToBacklogRequest] moveIssuesToBacklogRequest (required):
  Future<void> moveIssuesToEpic(String epicIdOrKey, MoveIssuesToBacklogRequest moveIssuesToBacklogRequest, { Future<void>? abortTrigger, }) async {
    final response = await moveIssuesToEpicWithHttpInfo(epicIdOrKey, moveIssuesToBacklogRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Partially update epic
  ///
  /// Performs a partial update of the epic. A partial update means that fields not present in the request JSON will not be updated. Valid values for color are `color_1` to `color_9`. **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic to update.
  ///
  /// * [PartiallyUpdateEpicRequest] partiallyUpdateEpicRequest (required):
  Future<Response> partiallyUpdateEpicWithHttpInfo(String epicIdOrKey, PartiallyUpdateEpicRequest partiallyUpdateEpicRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/{epicIdOrKey}'
      .replaceAll('{epicIdOrKey}', epicIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = partiallyUpdateEpicRequest;

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

  /// Partially update epic
  ///
  /// Performs a partial update of the epic. A partial update means that fields not present in the request JSON will not be updated. Valid values for color are `color_1` to `color_9`. **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic to update.
  ///
  /// * [PartiallyUpdateEpicRequest] partiallyUpdateEpicRequest (required):
  Future<void> partiallyUpdateEpic(String epicIdOrKey, PartiallyUpdateEpicRequest partiallyUpdateEpicRequest, { Future<void>? abortTrigger, }) async {
    final response = await partiallyUpdateEpicWithHttpInfo(epicIdOrKey, partiallyUpdateEpicRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Rank epics
  ///
  /// Moves (ranks) an epic before or after a given epic.  If rankCustomFieldId is not defined, the default rank field will be used.  **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic to rank.
  ///
  /// * [RankEpicsRequest] rankEpicsRequest (required):
  ///   bean which contains the information where the given epic should be ranked.
  Future<Response> rankEpicsWithHttpInfo(String epicIdOrKey, RankEpicsRequest rankEpicsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/{epicIdOrKey}/rank'
      .replaceAll('{epicIdOrKey}', epicIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = rankEpicsRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Rank epics
  ///
  /// Moves (ranks) an epic before or after a given epic.  If rankCustomFieldId is not defined, the default rank field will be used.  **Note:** This operation does not work for epics in next-gen projects.
  ///
  /// Parameters:
  ///
  /// * [String] epicIdOrKey (required):
  ///   The id or key of the epic to rank.
  ///
  /// * [RankEpicsRequest] rankEpicsRequest (required):
  ///   bean which contains the information where the given epic should be ranked.
  Future<void> rankEpics(String epicIdOrKey, RankEpicsRequest rankEpicsRequest, { Future<void>? abortTrigger, }) async {
    final response = await rankEpicsWithHttpInfo(epicIdOrKey, rankEpicsRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Remove issues from epic
  ///
  /// Removes issues from epics. The user needs to have the edit issue permission for all issue they want to remove from epics. The maximum number of issues that can be moved in one operation is 50. **Note:** This operation does not work for epics in next-gen projects. Instead, update the issue using `\\{ fields: \\{ parent: \\{\\} \\} \\}`
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [MoveIssuesToBacklogRequest] moveIssuesToBacklogRequest (required):
  Future<Response> removeIssuesFromEpicWithHttpInfo(MoveIssuesToBacklogRequest moveIssuesToBacklogRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/epic/none/issue';

    // ignore: prefer_final_locals
    Object? postBody = moveIssuesToBacklogRequest;

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

  /// Remove issues from epic
  ///
  /// Removes issues from epics. The user needs to have the edit issue permission for all issue they want to remove from epics. The maximum number of issues that can be moved in one operation is 50. **Note:** This operation does not work for epics in next-gen projects. Instead, update the issue using `\\{ fields: \\{ parent: \\{\\} \\} \\}`
  ///
  /// Parameters:
  ///
  /// * [MoveIssuesToBacklogRequest] moveIssuesToBacklogRequest (required):
  Future<void> removeIssuesFromEpic(MoveIssuesToBacklogRequest moveIssuesToBacklogRequest, { Future<void>? abortTrigger, }) async {
    final response = await removeIssuesFromEpicWithHttpInfo(moveIssuesToBacklogRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
