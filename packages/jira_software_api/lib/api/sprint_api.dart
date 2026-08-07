//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SprintApi {
  SprintApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create sprint
  ///
  /// Creates a future sprint. Sprint name and origin board id are required. Start date, end date, and goal are optional.  Note that the sprint name is trimmed. Also, when starting sprints from the UI, the \"endDate\" set through this call is ignored and instead the last sprint's duration is used to fill the form.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSprintRequest] createSprintRequest (required):
  Future<Response> createSprintWithHttpInfo(CreateSprintRequest createSprintRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint';

    // ignore: prefer_final_locals
    Object? postBody = createSprintRequest;

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

  /// Create sprint
  ///
  /// Creates a future sprint. Sprint name and origin board id are required. Start date, end date, and goal are optional.  Note that the sprint name is trimmed. Also, when starting sprints from the UI, the \"endDate\" set through this call is ignored and instead the last sprint's duration is used to fill the form.
  ///
  /// Parameters:
  ///
  /// * [CreateSprintRequest] createSprintRequest (required):
  Future<void> createSprint(CreateSprintRequest createSprintRequest, { Future<void>? abortTrigger, }) async {
    final response = await createSprintWithHttpInfo(createSprintRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete property
  ///
  /// Removes the property from the sprint identified by the id. Ths user removing the property is required to have permissions to modify the sprint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint from which the property will be removed.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to remove.
  Future<Response> deletePropertyWithHttpInfo(String sprintId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/properties/{propertyKey}'
      .replaceAll('{sprintId}', sprintId)
      .replaceAll('{propertyKey}', propertyKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Delete property
  ///
  /// Removes the property from the sprint identified by the id. Ths user removing the property is required to have permissions to modify the sprint.
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint from which the property will be removed.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to remove.
  Future<void> deleteProperty(String sprintId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deletePropertyWithHttpInfo(sprintId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete sprint
  ///
  /// Deletes a sprint. Once a sprint is deleted, all open issues in the sprint will be moved to the backlog.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint to delete.
  Future<Response> deleteSprintWithHttpInfo(int sprintId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}'
      .replaceAll('{sprintId}', sprintId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
      abortTrigger: abortTrigger,
    );
  }

  /// Delete sprint
  ///
  /// Deletes a sprint. Once a sprint is deleted, all open issues in the sprint will be moved to the backlog.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint to delete.
  Future<void> deleteSprint(int sprintId, { Future<void>? abortTrigger, }) async {
    final response = await deleteSprintWithHttpInfo(sprintId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issues for sprint
  ///
  /// Returns all issues in a sprint, for a given sprint ID. This only includes issues that the user has permission to view. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that contains the requested issues.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
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
  Future<Response> getIssuesForSprintWithHttpInfo(int sprintId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/issue'
      .replaceAll('{sprintId}', sprintId.toString());

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

  /// Get issues for sprint
  ///
  /// Returns all issues in a sprint, for a given sprint ID. This only includes issues that the user has permission to view. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that contains the requested issues.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
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
  Future<void> getIssuesForSprint(int sprintId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForSprintWithHttpInfo(sprintId, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issues for sprint (enhanced)
  ///
  /// Returns all issues in a sprint, for a given sprint ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that contains the requested issues.
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
  Future<Response> getIssuesForSprintJSISWithHttpInfo(int sprintId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/sprint/{sprintId}/issue'
      .replaceAll('{sprintId}', sprintId.toString());

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

  /// Get issues for sprint (enhanced)
  ///
  /// Returns all issues in a sprint, for a given sprint ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that contains the requested issues.
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
  Future<SoftwareIssueResults?> getIssuesForSprintJSIS(int sprintId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForSprintJSISWithHttpInfo(sprintId, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
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

  /// Get properties keys
  ///
  /// Returns the keys of all properties for the sprint identified by the id. The user who retrieves the property keys is required to have permissions to view the sprint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint from which property keys will be returned.
  Future<Response> getPropertiesKeysWithHttpInfo(String sprintId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/properties'
      .replaceAll('{sprintId}', sprintId);

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

  /// Get properties keys
  ///
  /// Returns the keys of all properties for the sprint identified by the id. The user who retrieves the property keys is required to have permissions to view the sprint.
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint from which property keys will be returned.
  Future<void> getPropertiesKeys(String sprintId, { Future<void>? abortTrigger, }) async {
    final response = await getPropertiesKeysWithHttpInfo(sprintId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get property
  ///
  /// Returns the value of the property with a given key from the sprint identified by the provided id. The user who retrieves the property is required to have permissions to view the sprint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint from which the property will be returned.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to return.
  Future<Response> getPropertyWithHttpInfo(String sprintId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/properties/{propertyKey}'
      .replaceAll('{sprintId}', sprintId)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Get property
  ///
  /// Returns the value of the property with a given key from the sprint identified by the provided id. The user who retrieves the property is required to have permissions to view the sprint.
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint from which the property will be returned.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to return.
  Future<void> getProperty(String sprintId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getPropertyWithHttpInfo(sprintId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get sprint
  ///
  /// Returns the sprint for a given sprint ID. The sprint will only be returned if the user can view the board that the sprint was created on, or view at least one of the issues in the sprint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the requested sprint.
  Future<Response> getSprintWithHttpInfo(int sprintId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}'
      .replaceAll('{sprintId}', sprintId.toString());

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

  /// Get sprint
  ///
  /// Returns the sprint for a given sprint ID. The sprint will only be returned if the user can view the board that the sprint was created on, or view at least one of the issues in the sprint.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the requested sprint.
  Future<void> getSprint(int sprintId, { Future<void>? abortTrigger, }) async {
    final response = await getSprintWithHttpInfo(sprintId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Move issues to sprint and rank
  ///
  /// Moves issues to a sprint, for a given sprint ID. Issues can only be moved to open or active sprints. The maximum number of issues that can be moved in one operation is 50.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that you want to assign issues to.
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  Future<Response> moveIssuesToSprintAndRankWithHttpInfo(int sprintId, MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/issue'
      .replaceAll('{sprintId}', sprintId.toString());

    // ignore: prefer_final_locals
    Object? postBody = moveIssuesToBacklogForBoardRequest;

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

  /// Move issues to sprint and rank
  ///
  /// Moves issues to a sprint, for a given sprint ID. Issues can only be moved to open or active sprints. The maximum number of issues that can be moved in one operation is 50.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that you want to assign issues to.
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  Future<void> moveIssuesToSprintAndRank(int sprintId, MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    final response = await moveIssuesToSprintAndRankWithHttpInfo(sprintId, moveIssuesToBacklogForBoardRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Partially update sprint
  ///
  /// Performs a partial update of a sprint. A partial update means that fields not present in the request JSON will not be updated.  Notes:   *  For closed sprints, only the name and goal can be updated; changes to other fields will be ignored.  *  A sprint can be started by updating the state to 'active'. This requires the sprint to be in the 'future' state and have a startDate and endDate set.  *  A sprint can be completed by updating the state to 'closed'. This action requires the sprint to be in the 'active' state. This sets the completeDate to the time of the request.  *  Other changes to state are not allowed.  *  The completeDate field cannot be updated manually.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint to update.
  ///
  /// * [UpdateSprintRequest] updateSprintRequest (required):
  Future<Response> partiallyUpdateSprintWithHttpInfo(int sprintId, UpdateSprintRequest updateSprintRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}'
      .replaceAll('{sprintId}', sprintId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateSprintRequest;

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

  /// Partially update sprint
  ///
  /// Performs a partial update of a sprint. A partial update means that fields not present in the request JSON will not be updated.  Notes:   *  For closed sprints, only the name and goal can be updated; changes to other fields will be ignored.  *  A sprint can be started by updating the state to 'active'. This requires the sprint to be in the 'future' state and have a startDate and endDate set.  *  A sprint can be completed by updating the state to 'closed'. This action requires the sprint to be in the 'active' state. This sets the completeDate to the time of the request.  *  Other changes to state are not allowed.  *  The completeDate field cannot be updated manually.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint to update.
  ///
  /// * [UpdateSprintRequest] updateSprintRequest (required):
  Future<void> partiallyUpdateSprint(int sprintId, UpdateSprintRequest updateSprintRequest, { Future<void>? abortTrigger, }) async {
    final response = await partiallyUpdateSprintWithHttpInfo(sprintId, updateSprintRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Set property
  ///
  /// Sets the value of the specified sprint's property.  You can use this resource to store a custom data against the sprint identified by the id. The user who stores the data is required to have permissions to modify the sprint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint on which the property will be set.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the sprint's property. The maximum length of the key is 255 bytes.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Response> setPropertyWithHttpInfo(String sprintId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/properties/{propertyKey}'
      .replaceAll('{sprintId}', sprintId)
      .replaceAll('{propertyKey}', propertyKey);

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// Set property
  ///
  /// Sets the value of the specified sprint's property.  You can use this resource to store a custom data against the sprint identified by the id. The user who stores the data is required to have permissions to modify the sprint.
  ///
  /// Parameters:
  ///
  /// * [String] sprintId (required):
  ///   the ID of the sprint on which the property will be set.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the sprint's property. The maximum length of the key is 255 bytes.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Object?> setProperty(String sprintId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await setPropertyWithHttpInfo(sprintId, propertyKey, body, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Swap sprint
  ///
  /// Swap the position of the sprint with the second sprint.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint to swap.
  ///
  /// * [SwapSprintRequest] swapSprintRequest (required):
  Future<Response> swapSprintWithHttpInfo(int sprintId, SwapSprintRequest swapSprintRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}/swap'
      .replaceAll('{sprintId}', sprintId.toString());

    // ignore: prefer_final_locals
    Object? postBody = swapSprintRequest;

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

  /// Swap sprint
  ///
  /// Swap the position of the sprint with the second sprint.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint to swap.
  ///
  /// * [SwapSprintRequest] swapSprintRequest (required):
  Future<void> swapSprint(int sprintId, SwapSprintRequest swapSprintRequest, { Future<void>? abortTrigger, }) async {
    final response = await swapSprintWithHttpInfo(sprintId, swapSprintRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Update sprint
  ///
  /// Performs a full update of a sprint. A full update means that the result will be exactly the same as the request body. Any fields not present in the request JSON will be set to null.  Notes:   *  For closed sprints, only the name and goal can be updated; changes to other fields will be ignored.  *  A sprint can be started by updating the state to 'active'. This requires the sprint to be in the 'future' state and have a startDate and endDate set.  *  A sprint can be completed by updating the state to 'closed'. This action requires the sprint to be in the 'active' state. This sets the completeDate to the time of the request.  *  Other changes to state are not allowed.  *  The completeDate field cannot be updated manually.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   the ID of the sprint to update.
  ///
  /// * [UpdateSprintRequest] updateSprintRequest (required):
  Future<Response> updateSprintWithHttpInfo(int sprintId, UpdateSprintRequest updateSprintRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/sprint/{sprintId}'
      .replaceAll('{sprintId}', sprintId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateSprintRequest;

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

  /// Update sprint
  ///
  /// Performs a full update of a sprint. A full update means that the result will be exactly the same as the request body. Any fields not present in the request JSON will be set to null.  Notes:   *  For closed sprints, only the name and goal can be updated; changes to other fields will be ignored.  *  A sprint can be started by updating the state to 'active'. This requires the sprint to be in the 'future' state and have a startDate and endDate set.  *  A sprint can be completed by updating the state to 'closed'. This action requires the sprint to be in the 'active' state. This sets the completeDate to the time of the request.  *  Other changes to state are not allowed.  *  The completeDate field cannot be updated manually.
  ///
  /// Parameters:
  ///
  /// * [int] sprintId (required):
  ///   the ID of the sprint to update.
  ///
  /// * [UpdateSprintRequest] updateSprintRequest (required):
  Future<void> updateSprint(int sprintId, UpdateSprintRequest updateSprintRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateSprintWithHttpInfo(sprintId, updateSprintRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
