//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class BoardApi {
  BoardApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create board
  ///
  /// Creates a new board. Board name, type and filter ID is required.   *  `name` \\- Must be less than 255 characters.  *  `type` \\- Valid values: scrum, kanban  *  `filterId` \\- ID of a filter that the user has permissions to view. Note, if the user does not have the 'Create shared objects' permission and tries to create a shared board, a private board will be created instead (remember that board sharing depends on the filter sharing).  *  `location` \\- The container that the board will be located in. `location` must include the `type` property (Valid values: project, user). If choosing 'project', then a project must be specified by a `projectKeyOrId` property in `location`. If choosing 'user', the current user is chosen by default. The `projectKeyOrId` property should not be provided.  Note:   *  If you want to create a new project with an associated board, use the [Jira platform REST API](https://docs.atlassian.com/jira/REST/latest). For more information, see the [Create project](#api-rest-api-3-project-post) method. The `projectTypeKey` for software boards must be 'software' and the `projectTemplateKey` must be either `com.pyxis.greenhopper.jira:gh-kanban-template` or `com.pyxis.greenhopper.jira:gh-scrum-template`.  *  You can create a filter using the [Jira REST API](https://docs.atlassian.com/jira/REST/latest). For more information, see the [Create filter](#api-rest-api-3-filter-post) method.  *  If you do not ORDER BY the Rank field for the filter of your board, you will not be able to reorder issues on the board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateBoardRequest] createBoardRequest (required):
  Future<Response> createBoardWithHttpInfo(CreateBoardRequest createBoardRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board';

    // ignore: prefer_final_locals
    Object? postBody = createBoardRequest;

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

  /// Create board
  ///
  /// Creates a new board. Board name, type and filter ID is required.   *  `name` \\- Must be less than 255 characters.  *  `type` \\- Valid values: scrum, kanban  *  `filterId` \\- ID of a filter that the user has permissions to view. Note, if the user does not have the 'Create shared objects' permission and tries to create a shared board, a private board will be created instead (remember that board sharing depends on the filter sharing).  *  `location` \\- The container that the board will be located in. `location` must include the `type` property (Valid values: project, user). If choosing 'project', then a project must be specified by a `projectKeyOrId` property in `location`. If choosing 'user', the current user is chosen by default. The `projectKeyOrId` property should not be provided.  Note:   *  If you want to create a new project with an associated board, use the [Jira platform REST API](https://docs.atlassian.com/jira/REST/latest). For more information, see the [Create project](#api-rest-api-3-project-post) method. The `projectTypeKey` for software boards must be 'software' and the `projectTemplateKey` must be either `com.pyxis.greenhopper.jira:gh-kanban-template` or `com.pyxis.greenhopper.jira:gh-scrum-template`.  *  You can create a filter using the [Jira REST API](https://docs.atlassian.com/jira/REST/latest). For more information, see the [Create filter](#api-rest-api-3-filter-post) method.  *  If you do not ORDER BY the Rank field for the filter of your board, you will not be able to reorder issues on the board.
  ///
  /// Parameters:
  ///
  /// * [CreateBoardRequest] createBoardRequest (required):
  Future<GetAllBoards200ResponseValuesInner?> createBoard(CreateBoardRequest createBoardRequest, { Future<void>? abortTrigger, }) async {
    final response = await createBoardWithHttpInfo(createBoardRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAllBoards200ResponseValuesInner',) as GetAllBoards200ResponseValuesInner;
    
    }
    return null;
  }

  /// Delete board
  ///
  /// Deletes the board. Admin without the view permission can still remove the board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   ID of the board to be deleted
  Future<Response> deleteBoardWithHttpInfo(int boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Delete board
  ///
  /// Deletes the board. Admin without the view permission can still remove the board.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   ID of the board to be deleted
  Future<void> deleteBoard(int boardId, { Future<void>? abortTrigger, }) async {
    final response = await deleteBoardWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete board property
  ///
  /// Removes the property from the board identified by the id. Ths user removing the property is required to have permissions to modify the board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the id of the board from which the property will be removed.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to remove.
  Future<Response> deleteBoardPropertyWithHttpInfo(String boardId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/properties/{propertyKey}'
      .replaceAll('{boardId}', boardId)
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

  /// Delete board property
  ///
  /// Removes the property from the board identified by the id. Ths user removing the property is required to have permissions to modify the board.
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the id of the board from which the property will be removed.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to remove.
  Future<void> deleteBoardProperty(String boardId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteBoardPropertyWithHttpInfo(boardId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get all boards
  ///
  /// Returns all boards. This only includes boards that the user has permission to view.  **Deprecation notice:** The required OAuth 2.0 scopes will be updated on February 15, 2024.   *  `read:board-scope:jira-software`, `read:project:jira`
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The starting index of the returned boards. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of boards to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [Object] type:
  ///   Filters results to boards of the specified types. Valid values: scrum, kanban, simple.
  ///
  /// * [String] name:
  ///   Filters results to boards that match or partially match the specified name.
  ///
  /// * [String] projectKeyOrId:
  ///   Filters results to boards that are relevant to a project. Relevance means that the jql filter defined in board contains a reference to a project.
  ///
  /// * [String] accountIdLocation:
  ///
  /// * [String] projectLocation:
  ///
  /// * [bool] includePrivate:
  ///   Appends private boards to the end of the list. The name and type fields are excluded for security reasons.
  ///
  /// * [bool] negateLocationFiltering:
  ///   If set to true, negate filters used for querying by location. By default false.
  ///
  /// * [String] orderBy:
  ///   Ordering of the results by a given field. If not provided, values will not be sorted. Valid values: name.
  ///
  /// * [String] expand:
  ///   List of fields to expand for each board. Valid values: admins, permissions.
  ///
  /// * [List<String>] projectTypeLocation:
  ///   Filters results to boards that are relevant to a project types. Support Jira Software, Jira Service Management. Valid values: software, service\\_desk. By default software.
  ///
  /// * [int] filterId:
  ///   Filters results to boards that are relevant to a filter. Not supported for next-gen boards.
  Future<Response> getAllBoardsWithHttpInfo({ int? startAt, int? maxResults, Object? type, String? name, String? projectKeyOrId, String? accountIdLocation, String? projectLocation, bool? includePrivate, bool? negateLocationFiltering, String? orderBy, String? expand, List<String>? projectTypeLocation, int? filterId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board';

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
    if (type != null) {
      queryParams.addAll(_queryParams('', 'type', type));
    }
    if (name != null) {
      queryParams.addAll(_queryParams('', 'name', name));
    }
    if (projectKeyOrId != null) {
      queryParams.addAll(_queryParams('', 'projectKeyOrId', projectKeyOrId));
    }
    if (accountIdLocation != null) {
      queryParams.addAll(_queryParams('', 'accountIdLocation', accountIdLocation));
    }
    if (projectLocation != null) {
      queryParams.addAll(_queryParams('', 'projectLocation', projectLocation));
    }
    if (includePrivate != null) {
      queryParams.addAll(_queryParams('', 'includePrivate', includePrivate));
    }
    if (negateLocationFiltering != null) {
      queryParams.addAll(_queryParams('', 'negateLocationFiltering', negateLocationFiltering));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (projectTypeLocation != null) {
      queryParams.addAll(_queryParams('multi', 'projectTypeLocation', projectTypeLocation));
    }
    if (filterId != null) {
      queryParams.addAll(_queryParams('', 'filterId', filterId));
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

  /// Get all boards
  ///
  /// Returns all boards. This only includes boards that the user has permission to view.  **Deprecation notice:** The required OAuth 2.0 scopes will be updated on February 15, 2024.   *  `read:board-scope:jira-software`, `read:project:jira`
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The starting index of the returned boards. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of boards to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [Object] type:
  ///   Filters results to boards of the specified types. Valid values: scrum, kanban, simple.
  ///
  /// * [String] name:
  ///   Filters results to boards that match or partially match the specified name.
  ///
  /// * [String] projectKeyOrId:
  ///   Filters results to boards that are relevant to a project. Relevance means that the jql filter defined in board contains a reference to a project.
  ///
  /// * [String] accountIdLocation:
  ///
  /// * [String] projectLocation:
  ///
  /// * [bool] includePrivate:
  ///   Appends private boards to the end of the list. The name and type fields are excluded for security reasons.
  ///
  /// * [bool] negateLocationFiltering:
  ///   If set to true, negate filters used for querying by location. By default false.
  ///
  /// * [String] orderBy:
  ///   Ordering of the results by a given field. If not provided, values will not be sorted. Valid values: name.
  ///
  /// * [String] expand:
  ///   List of fields to expand for each board. Valid values: admins, permissions.
  ///
  /// * [List<String>] projectTypeLocation:
  ///   Filters results to boards that are relevant to a project types. Support Jira Software, Jira Service Management. Valid values: software, service\\_desk. By default software.
  ///
  /// * [int] filterId:
  ///   Filters results to boards that are relevant to a filter. Not supported for next-gen boards.
  Future<GetAllBoards200Response?> getAllBoards({ int? startAt, int? maxResults, Object? type, String? name, String? projectKeyOrId, String? accountIdLocation, String? projectLocation, bool? includePrivate, bool? negateLocationFiltering, String? orderBy, String? expand, List<String>? projectTypeLocation, int? filterId, Future<void>? abortTrigger, }) async {
    final response = await getAllBoardsWithHttpInfo(startAt: startAt, maxResults: maxResults, type: type, name: name, projectKeyOrId: projectKeyOrId, accountIdLocation: accountIdLocation, projectLocation: projectLocation, includePrivate: includePrivate, negateLocationFiltering: negateLocationFiltering, orderBy: orderBy, expand: expand, projectTypeLocation: projectTypeLocation, filterId: filterId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAllBoards200Response',) as GetAllBoards200Response;
    
    }
    return null;
  }

  /// Get all quick filters
  ///
  /// Returns all quick filters from a board, for a given board ID.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested quick filters.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned quick filters. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of sprints to return per page. See the 'Pagination' section at the top of this page for more details.
  Future<Response> getAllQuickFiltersWithHttpInfo(int boardId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/quickfilter'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get all quick filters
  ///
  /// Returns all quick filters from a board, for a given board ID.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested quick filters.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned quick filters. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of sprints to return per page. See the 'Pagination' section at the top of this page for more details.
  Future<GetAllQuickFilters200Response?> getAllQuickFilters(int boardId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getAllQuickFiltersWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAllQuickFilters200Response',) as GetAllQuickFilters200Response;
    
    }
    return null;
  }

  /// Get all sprints
  ///
  /// Returns all sprints from a board, for a given board ID. This only includes sprints that the user has permission to view.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested sprints.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned sprints. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of sprints to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [Object] state:
  ///   Filters results to sprints in specified states. Valid values: future, active, closed. You can define multiple states separated by commas, e.g. state=active,closed
  Future<Response> getAllSprintsWithHttpInfo(int boardId, { int? startAt, int? maxResults, Object? state, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/sprint'
      .replaceAll('{boardId}', boardId.toString());

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
    if (state != null) {
      queryParams.addAll(_queryParams('', 'state', state));
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

  /// Get all sprints
  ///
  /// Returns all sprints from a board, for a given board ID. This only includes sprints that the user has permission to view.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested sprints.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned sprints. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of sprints to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [Object] state:
  ///   Filters results to sprints in specified states. Valid values: future, active, closed. You can define multiple states separated by commas, e.g. state=active,closed
  Future<void> getAllSprints(int boardId, { int? startAt, int? maxResults, Object? state, Future<void>? abortTrigger, }) async {
    final response = await getAllSprintsWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, state: state, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get all versions
  ///
  /// Returns all versions from a board, for a given board ID. This only includes versions that the user has permission to view. Note, if the user does not have permission to view the board, no versions will be returned at all. Returned versions are ordered by the name of the project from which they belong and then by sequence defined by user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested versions.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned versions. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of versions to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [String] released:
  ///   Filters results to versions that are either released or unreleased. Valid values: true, false.
  Future<Response> getAllVersionsWithHttpInfo(int boardId, { int? startAt, int? maxResults, String? released, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/version'
      .replaceAll('{boardId}', boardId.toString());

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
    if (released != null) {
      queryParams.addAll(_queryParams('', 'released', released));
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

  /// Get all versions
  ///
  /// Returns all versions from a board, for a given board ID. This only includes versions that the user has permission to view. Note, if the user does not have permission to view the board, no versions will be returned at all. Returned versions are ordered by the name of the project from which they belong and then by sequence defined by user.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested versions.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned versions. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of versions to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [String] released:
  ///   Filters results to versions that are either released or unreleased. Valid values: true, false.
  Future<void> getAllVersions(int boardId, { int? startAt, int? maxResults, String? released, Future<void>? abortTrigger, }) async {
    final response = await getAllVersionsWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, released: released, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get approximate issue count for backlog
  ///
  /// Returns the approximate count of all issues from the board's backlog, for the given board ID. This is equivalent to counting the issues on all pages returned by [Get issues for backlog enhanced](https://developer.atlassian.com/cloud/jira/software/rest/api-group-board/#api-rest-software-1-0-board-boardid-backlog-get). Recent updates might not be immediately visible in the returned output. This only includes issues that the user has permission to view.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that has the backlog containing the requested issues.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  Future<Response> getApproximateIssueCountForBacklogWithHttpInfo(int boardId, { String? jql, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/backlog/approximate-count'
      .replaceAll('{boardId}', boardId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
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

  /// Get approximate issue count for backlog
  ///
  /// Returns the approximate count of all issues from the board's backlog, for the given board ID. This is equivalent to counting the issues on all pages returned by [Get issues for backlog enhanced](https://developer.atlassian.com/cloud/jira/software/rest/api-group-board/#api-rest-software-1-0-board-boardid-backlog-get). Recent updates might not be immediately visible in the returned output. This only includes issues that the user has permission to view.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that has the backlog containing the requested issues.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  Future<IssueCountBean?> getApproximateIssueCountForBacklog(int boardId, { String? jql, Future<void>? abortTrigger, }) async {
    final response = await getApproximateIssueCountForBacklogWithHttpInfo(boardId, jql: jql, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueCountBean',) as IssueCountBean;
    
    }
    return null;
  }

  /// Get approximate issue count for board
  ///
  /// Returns the approximate count of all issues from a board, for a given board ID. This is equivalent to counting the issues on all pages returned by [Get issues for board enhanced](https://developer.atlassian.com/cloud/jira/software/rest/api-group-board/#api-rest-software-1-0-board-boardid-issue-get). Recent updates might not be immediately visible in the returned output. This only includes issues that the user has permission to view.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  Future<Response> getApproximateIssueCountForBoardWithHttpInfo(int boardId, { String? jql, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/issue/approximate-count'
      .replaceAll('{boardId}', boardId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (jql != null) {
      queryParams.addAll(_queryParams('', 'jql', jql));
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

  /// Get approximate issue count for board
  ///
  /// Returns the approximate count of all issues from a board, for a given board ID. This is equivalent to counting the issues on all pages returned by [Get issues for board enhanced](https://developer.atlassian.com/cloud/jira/software/rest/api-group-board/#api-rest-software-1-0-board-boardid-issue-get). Recent updates might not be immediately visible in the returned output. This only includes issues that the user has permission to view.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
  ///
  /// * [String] jql:
  ///   Filters results using a JQL query. Note that `username` and `userkey` can't be used as search terms for this parameter due to privacy reasons. Use `accountId` instead.
  Future<IssueCountBean?> getApproximateIssueCountForBoard(int boardId, { String? jql, Future<void>? abortTrigger, }) async {
    final response = await getApproximateIssueCountForBoardWithHttpInfo(boardId, jql: jql, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueCountBean',) as IssueCountBean;
    
    }
    return null;
  }

  /// Get board
  ///
  /// Returns the board for the given board ID. This board will only be returned if the user has permission to view it. Admins without the view permission will see the board as a private one, so will see only a subset of the board's data (board location for instance).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the requested board.
  Future<Response> getBoardWithHttpInfo(int boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get board
  ///
  /// Returns the board for the given board ID. This board will only be returned if the user has permission to view it. Admins without the view permission will see the board as a private one, so will see only a subset of the board's data (board location for instance).
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the requested board.
  Future<GetAllBoards200ResponseValuesInner?> getBoard(int boardId, { Future<void>? abortTrigger, }) async {
    final response = await getBoardWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAllBoards200ResponseValuesInner',) as GetAllBoards200ResponseValuesInner;
    
    }
    return null;
  }

  /// Get board by filter id
  ///
  /// Returns any boards which use the provided filter id. This method can be executed by users without a valid software license in order to find which boards are using a particular filter.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] filterId (required):
  ///   Filters results to boards that are relevant to a filter. Not supported for next-gen boards.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned boards. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of boards to return per page. Default: 50. See the 'Pagination' section at the top of this page for more details.
  Future<Response> getBoardByFilterIdWithHttpInfo(int filterId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/filter/{filterId}'
      .replaceAll('{filterId}', filterId.toString());

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

  /// Get board by filter id
  ///
  /// Returns any boards which use the provided filter id. This method can be executed by users without a valid software license in order to find which boards are using a particular filter.
  ///
  /// Parameters:
  ///
  /// * [int] filterId (required):
  ///   Filters results to boards that are relevant to a filter. Not supported for next-gen boards.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned boards. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of boards to return per page. Default: 50. See the 'Pagination' section at the top of this page for more details.
  Future<GetBoardByFilterId200Response?> getBoardByFilterId(int filterId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getBoardByFilterIdWithHttpInfo(filterId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetBoardByFilterId200Response',) as GetBoardByFilterId200Response;
    
    }
    return null;
  }

  /// Get board issues for epic
  ///
  /// Returns all issues that belong to an epic on the board, for the given epic ID and the board ID. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
  ///
  /// * [int] epicId (required):
  ///   The ID of the epic that contains the requested issues.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. Default: 50. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
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
  Future<Response> getBoardIssuesForEpicWithHttpInfo(int boardId, int epicId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/epic/{epicId}/issue'
      .replaceAll('{boardId}', boardId.toString())
      .replaceAll('{epicId}', epicId.toString());

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

  /// Get board issues for epic
  ///
  /// Returns all issues that belong to an epic on the board, for the given epic ID and the board ID. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
  ///
  /// * [int] epicId (required):
  ///   The ID of the epic that contains the requested issues.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned issues. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of issues to return per page. Default: 50. See the 'Pagination' section at the top of this page for more details. Note, the total number of issues returned is limited by the property 'jira.search.views.default.max' in your Jira instance. If you exceed this limit, your results will be truncated.
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
  Future<void> getBoardIssuesForEpic(int boardId, int epicId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getBoardIssuesForEpicWithHttpInfo(boardId, epicId, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get board issues for epic (enhanced)
  ///
  /// Returns all issues that belong to an epic on the board, for the given epic ID and the board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
  ///
  /// * [int] epicId (required):
  ///   The ID of the epic that contains the requested issues.
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
  Future<Response> getBoardIssuesForEpicJSISWithHttpInfo(int boardId, int epicId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/epic/{epicId}/issue'
      .replaceAll('{boardId}', boardId.toString())
      .replaceAll('{epicId}', epicId.toString());

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

  /// Get board issues for epic (enhanced)
  ///
  /// Returns all issues that belong to an epic on the board, for the given epic ID and the board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
  ///
  /// * [int] epicId (required):
  ///   The ID of the epic that contains the requested issues.
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
  Future<SoftwareIssueResults?> getBoardIssuesForEpicJSIS(int boardId, int epicId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getBoardIssuesForEpicJSISWithHttpInfo(boardId, epicId, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
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

  /// Get board issues for sprint
  ///
  /// Get all issues you have access to that belong to the sprint from the board. Issue returned from this resource contains additional fields like: sprint, closedSprints, flagged and epic. Issues are returned ordered by rank. JQL order has higher priority than default rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains requested issues.
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that contains requested issues.
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
  Future<Response> getBoardIssuesForSprintWithHttpInfo(int boardId, int sprintId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/sprint/{sprintId}/issue'
      .replaceAll('{boardId}', boardId.toString())
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

  /// Get board issues for sprint
  ///
  /// Get all issues you have access to that belong to the sprint from the board. Issue returned from this resource contains additional fields like: sprint, closedSprints, flagged and epic. Issues are returned ordered by rank. JQL order has higher priority than default rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains requested issues.
  ///
  /// * [int] sprintId (required):
  ///   The ID of the sprint that contains requested issues.
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
  Future<void> getBoardIssuesForSprint(int boardId, int sprintId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getBoardIssuesForSprintWithHttpInfo(boardId, sprintId, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get board issues for sprint (enhanced)
  ///
  /// Get all issues you have access to that belong to the sprint from the board. Result pagination is token-based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource contains additional fields like: sprint, closedSprints, flagged, and epic. Issues are returned ordered by rank. JQL order has higher priority than default rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<Response> getBoardIssuesForSprintJSISWithHttpInfo(int boardId, int sprintId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/sprint/{sprintId}/issue'
      .replaceAll('{boardId}', boardId.toString())
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

  /// Get board issues for sprint (enhanced)
  ///
  /// Get all issues you have access to that belong to the sprint from the board. Result pagination is token-based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource contains additional fields like: sprint, closedSprints, flagged, and epic. Issues are returned ordered by rank. JQL order has higher priority than default rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<SoftwareIssueResults?> getBoardIssuesForSprintJSIS(int boardId, int sprintId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getBoardIssuesForSprintJSISWithHttpInfo(boardId, sprintId, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
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

  /// Get board property
  ///
  /// Returns the value of the property with a given key from the board identified by the provided id. The user who retrieves the property is required to have permissions to view the board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the ID of the board from which the property will be returned.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to return.
  Future<Response> getBoardPropertyWithHttpInfo(String boardId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/properties/{propertyKey}'
      .replaceAll('{boardId}', boardId)
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

  /// Get board property
  ///
  /// Returns the value of the property with a given key from the board identified by the provided id. The user who retrieves the property is required to have permissions to view the board.
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the ID of the board from which the property will be returned.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the property to return.
  Future<void> getBoardProperty(String boardId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getBoardPropertyWithHttpInfo(boardId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get board property keys
  ///
  /// Returns the keys of all properties for the board identified by the id. The user who retrieves the property keys is required to have permissions to view the board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the ID of the board from which property keys will be returned.
  Future<Response> getBoardPropertyKeysWithHttpInfo(String boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/properties'
      .replaceAll('{boardId}', boardId);

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

  /// Get board property keys
  ///
  /// Returns the keys of all properties for the board identified by the id. The user who retrieves the property keys is required to have permissions to view the board.
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the ID of the board from which property keys will be returned.
  Future<void> getBoardPropertyKeys(String boardId, { Future<void>? abortTrigger, }) async {
    final response = await getBoardPropertyKeysWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get configuration
  ///
  /// Get the board configuration. The response contains the following fields:   *  `id` \\- ID of the board.  *  `name` \\- Name of the board.  *  `filter` \\- Reference to the filter used by the given board.  *  `location` \\- Reference to the container that the board is located in. Includes the container type (Valid values: project, user).  *  `subQuery` (Kanban only) - JQL subquery used by the given board.  *  `columnConfig` \\- The column configuration lists the columns for the board, in the order defined in the column configuration. For each column, it shows the issue status mapping as well as the constraint type (Valid values: none, issueCount, issueCountExclSubs) for the min/max number of issues. Note, the last column with statuses mapped to it is treated as the \"Done\" column, which means that issues in that column will be marked as already completed.  *  `estimation` (Scrum only) - Contains information about type of estimation used for the board. Valid values: none, issueCount, field. If the estimation type is \"field\", the ID and display name of the field used for estimation is also returned. Note, estimates for an issue can be updated by a PUT /rest/api/3/issue/\\{issueIdOrKey\\} request, however the fields must be on the screen. \"timeoriginalestimate\" field will never be on the screen, so in order to update it \"originalEstimate\" in \"timetracking\" field should be updated.  *  `ranking` \\- Contains information about custom field used for ranking in the given board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board for which configuration is requested.
  Future<Response> getConfigurationWithHttpInfo(int boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/configuration'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get configuration
  ///
  /// Get the board configuration. The response contains the following fields:   *  `id` \\- ID of the board.  *  `name` \\- Name of the board.  *  `filter` \\- Reference to the filter used by the given board.  *  `location` \\- Reference to the container that the board is located in. Includes the container type (Valid values: project, user).  *  `subQuery` (Kanban only) - JQL subquery used by the given board.  *  `columnConfig` \\- The column configuration lists the columns for the board, in the order defined in the column configuration. For each column, it shows the issue status mapping as well as the constraint type (Valid values: none, issueCount, issueCountExclSubs) for the min/max number of issues. Note, the last column with statuses mapped to it is treated as the \"Done\" column, which means that issues in that column will be marked as already completed.  *  `estimation` (Scrum only) - Contains information about type of estimation used for the board. Valid values: none, issueCount, field. If the estimation type is \"field\", the ID and display name of the field used for estimation is also returned. Note, estimates for an issue can be updated by a PUT /rest/api/3/issue/\\{issueIdOrKey\\} request, however the fields must be on the screen. \"timeoriginalestimate\" field will never be on the screen, so in order to update it \"originalEstimate\" in \"timetracking\" field should be updated.  *  `ranking` \\- Contains information about custom field used for ranking in the given board.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board for which configuration is requested.
  Future<GetConfiguration200Response?> getConfiguration(int boardId, { Future<void>? abortTrigger, }) async {
    final response = await getConfigurationWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetConfiguration200Response',) as GetConfiguration200Response;
    
    }
    return null;
  }

  /// Get epics
  ///
  /// Returns all epics from the board, for the given board ID. This only includes epics that the user has permission to view. Note, if the user does not have permission to view the board, no epics will be returned at all.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested epics.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned epics. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of epics to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [String] done:
  ///   Filters results to epics that are either done or not done. Valid values: true, false.
  Future<Response> getEpicsWithHttpInfo(int boardId, { int? startAt, int? maxResults, String? done, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/epic'
      .replaceAll('{boardId}', boardId.toString());

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
    if (done != null) {
      queryParams.addAll(_queryParams('', 'done', done));
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

  /// Get epics
  ///
  /// Returns all epics from the board, for the given board ID. This only includes epics that the user has permission to view. Note, if the user does not have permission to view the board, no epics will be returned at all.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested epics.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned epics. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of epics to return per page. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [String] done:
  ///   Filters results to epics that are either done or not done. Valid values: true, false.
  Future<void> getEpics(int boardId, { int? startAt, int? maxResults, String? done, Future<void>? abortTrigger, }) async {
    final response = await getEpicsWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, done: done, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get features for board
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  Future<Response> getFeaturesForBoardWithHttpInfo(int boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/features'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get features for board
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  Future<GetFeaturesForBoard200Response?> getFeaturesForBoard(int boardId, { Future<void>? abortTrigger, }) async {
    final response = await getFeaturesForBoardWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetFeaturesForBoard200Response',) as GetFeaturesForBoard200Response;
    
    }
    return null;
  }

  /// Get issues for backlog
  ///
  /// Returns all issues from the board's backlog, for the given board ID. This only includes issues that the user has permission to view. The backlog contains incomplete issues that are not assigned to any future or active sprint. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that has the backlog containing the requested issues.
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
  ///   This parameter is currently not used.
  Future<Response> getIssuesForBacklogWithHttpInfo(int boardId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/backlog'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get issues for backlog
  ///
  /// Returns all issues from the board's backlog, for the given board ID. This only includes issues that the user has permission to view. The backlog contains incomplete issues that are not assigned to any future or active sprint. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that has the backlog containing the requested issues.
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
  ///   This parameter is currently not used.
  Future<SearchResults?> getIssuesForBacklog(int boardId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForBacklogWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SearchResults',) as SearchResults;
    
    }
    return null;
  }

  /// Get issues for backlog (enhanced)
  ///
  /// Returns all issues from the board's backlog, for the given board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. The backlog contains incomplete issues that are not assigned to any future or active sprint. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that has the backlog containing the requested issues.
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
  Future<Response> getIssuesForBacklogJSISWithHttpInfo(int boardId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/backlog'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get issues for backlog (enhanced)
  ///
  /// Returns all issues from the board's backlog, for the given board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. The backlog contains incomplete issues that are not assigned to any future or active sprint. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that has the backlog containing the requested issues.
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
  Future<SoftwareIssueResults?> getIssuesForBacklogJSIS(int boardId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForBacklogJSISWithHttpInfo(boardId, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
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

  /// Get issues for board
  ///
  /// Returns all issues from a board, for a given board ID. This only includes issues that the user has permission to view. An issue belongs to the board if its status is mapped to the board's column. Epic issues do not belongs to the scrum boards. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  ///   This parameter is currently not used.
  Future<Response> getIssuesForBoardWithHttpInfo(int boardId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/issue'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get issues for board
  ///
  /// Returns all issues from a board, for a given board ID. This only includes issues that the user has permission to view. An issue belongs to the board if its status is mapped to the board's column. Epic issues do not belongs to the scrum boards. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  ///   This parameter is currently not used.
  Future<SearchResults?> getIssuesForBoard(int boardId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForBoardWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SearchResults',) as SearchResults;
    
    }
    return null;
  }

  /// Get issues for board (enhanced)
  ///
  /// Returns all issues from a board, for a given board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. An issue belongs to the board if its status is mapped to the board's column. Epic issues do not belong to scrum boards. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<Response> getIssuesForBoardJSISWithHttpInfo(int boardId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/issue'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get issues for board (enhanced)
  ///
  /// Returns all issues from a board, for a given board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. An issue belongs to the board if its status is mapped to the board's column. Epic issues do not belong to scrum boards. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<SoftwareIssueResults?> getIssuesForBoardJSIS(int boardId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesForBoardJSISWithHttpInfo(boardId, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
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

  /// Get issues without epic for board
  ///
  /// Returns all issues that do not belong to any epic on a board, for a given board ID. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<Response> getIssuesWithoutEpicForBoardWithHttpInfo(int boardId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/epic/none/issue'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get issues without epic for board
  ///
  /// Returns all issues that do not belong to any epic on a board, for a given board ID. This only includes issues that the user has permission to view. Issues returned from this resource include Agile fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<void> getIssuesWithoutEpicForBoard(int boardId, { int? startAt, int? maxResults, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesWithoutEpicForBoardWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issues without epic for board (enhanced)
  ///
  /// Returns all issues that do not belong to any epic on a board, for a given board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<Response> getIssuesWithoutEpicForBoardJSISWithHttpInfo(int boardId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/software/1.0/board/{boardId}/epic/none/issue'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get issues without epic for board (enhanced)
  ///
  /// Returns all issues that do not belong to any epic on a board, for a given board ID. Result pagination is token based, using `nextPageToken` and `maxResults`. This only includes issues that the user has permission to view. Note, if the user does not have permission to view the board, no issues will be returned at all. Issues returned from this resource include Software project fields, like sprint, closedSprints, flagged, and epic. By default, the returned issues are ordered by rank.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains the requested issues.
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
  Future<SoftwareIssueResults?> getIssuesWithoutEpicForBoardJSIS(int boardId, { String? nextPageToken, int? maxResults, List<int>? reconcileIssues, String? jql, bool? validateQuery, List<Object>? fields, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getIssuesWithoutEpicForBoardJSISWithHttpInfo(boardId, nextPageToken: nextPageToken, maxResults: maxResults, reconcileIssues: reconcileIssues, jql: jql, validateQuery: validateQuery, fields: fields, expand: expand, abortTrigger: abortTrigger,);
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

  /// Get projects
  ///
  /// Returns all projects that are associated with the board, for the given board ID. If the user does not have permission to view the board, no projects will be returned at all. Returned projects are ordered by the name.  A project is associated with a board if the board filter contains reference the project or there is an issue from the project that belongs to the board.  The board filter contains reference the project only if JQL query guarantees that returned issues will be returned from the project set defined in JQL. For instance the query `project in (ABC, BCD) AND reporter = admin` have reference to ABC and BCD projects but query `project in (ABC, BCD) OR reporter = admin` doesn't have reference to any project.  An issue belongs to the board if its status is mapped to the board's column. Epic issues do not belongs to the scrum boards.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains returned projects.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned projects. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of projects to return per page. See the 'Pagination' section at the top of this page for more details.
  Future<Response> getProjectsWithHttpInfo(int boardId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/project'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get projects
  ///
  /// Returns all projects that are associated with the board, for the given board ID. If the user does not have permission to view the board, no projects will be returned at all. Returned projects are ordered by the name.  A project is associated with a board if the board filter contains reference the project or there is an issue from the project that belongs to the board.  The board filter contains reference the project only if JQL query guarantees that returned issues will be returned from the project set defined in JQL. For instance the query `project in (ABC, BCD) AND reporter = admin` have reference to ABC and BCD projects but query `project in (ABC, BCD) OR reporter = admin` doesn't have reference to any project.  An issue belongs to the board if its status is mapped to the board's column. Epic issues do not belongs to the scrum boards.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains returned projects.
  ///
  /// * [int] startAt:
  ///   The starting index of the returned projects. Base index: 0. See the 'Pagination' section at the top of this page for more details.
  ///
  /// * [int] maxResults:
  ///   The maximum number of projects to return per page. See the 'Pagination' section at the top of this page for more details.
  Future<void> getProjects(int boardId, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getProjectsWithHttpInfo(boardId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get projects full
  ///
  /// Returns all projects that are statically associated with the board, for the given board ID. Returned projects are ordered by the name.  A project is associated with a board if the board filter contains reference the project.  The board filter contains reference the project only if JQL query guarantees that returned issues will be returned from the project set defined in JQL. For instance the query `project in (ABC, BCD) AND reporter = admin` have reference to ABC and BCD projects but query `project in (ABC, BCD) OR reporter = admin` doesn't have reference to any project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains returned projects.
  Future<Response> getProjectsFullWithHttpInfo(int boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/project/full'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get projects full
  ///
  /// Returns all projects that are statically associated with the board, for the given board ID. Returned projects are ordered by the name.  A project is associated with a board if the board filter contains reference the project.  The board filter contains reference the project only if JQL query guarantees that returned issues will be returned from the project set defined in JQL. For instance the query `project in (ABC, BCD) AND reporter = admin` have reference to ABC and BCD projects but query `project in (ABC, BCD) OR reporter = admin` doesn't have reference to any project.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///   The ID of the board that contains returned projects.
  Future<void> getProjectsFull(int boardId, { Future<void>? abortTrigger, }) async {
    final response = await getProjectsFullWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get quick filter
  ///
  /// Returns the quick filter for a given quick filter ID. The quick filter will only be returned if the user can view the board that the quick filter belongs to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [int] quickFilterId (required):
  ///   The ID of the requested quick filter.
  Future<Response> getQuickFilterWithHttpInfo(int boardId, int quickFilterId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/quickfilter/{quickFilterId}'
      .replaceAll('{boardId}', boardId.toString())
      .replaceAll('{quickFilterId}', quickFilterId.toString());

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

  /// Get quick filter
  ///
  /// Returns the quick filter for a given quick filter ID. The quick filter will only be returned if the user can view the board that the quick filter belongs to.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [int] quickFilterId (required):
  ///   The ID of the requested quick filter.
  Future<GetAllQuickFilters200ResponseValuesInner?> getQuickFilter(int boardId, int quickFilterId, { Future<void>? abortTrigger, }) async {
    final response = await getQuickFilterWithHttpInfo(boardId, quickFilterId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAllQuickFilters200ResponseValuesInner',) as GetAllQuickFilters200ResponseValuesInner;
    
    }
    return null;
  }

  /// Get reports for board
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  Future<Response> getReportsForBoardWithHttpInfo(int boardId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/reports'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Get reports for board
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  Future<GetReportsForBoard200Response?> getReportsForBoard(int boardId, { Future<void>? abortTrigger, }) async {
    final response = await getReportsForBoardWithHttpInfo(boardId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetReportsForBoard200Response',) as GetReportsForBoard200Response;
    
    }
    return null;
  }

  /// Move issues to board
  ///
  /// Move issues from the backog to the board (if they are already in the backlog of that board).   This operation either moves an issue(s) onto a board from the backlog (by adding it to the issueList for the board) Or transitions the issue(s) to the first column for a kanban board with backlog. At most 50 issues may be moved at once.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  Future<Response> moveIssuesToBoardWithHttpInfo(int boardId, MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/issue'
      .replaceAll('{boardId}', boardId.toString());

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

  /// Move issues to board
  ///
  /// Move issues from the backog to the board (if they are already in the backlog of that board).   This operation either moves an issue(s) onto a board from the backlog (by adding it to the issueList for the board) Or transitions the issue(s) to the first column for a kanban board with backlog. At most 50 issues may be moved at once.
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [MoveIssuesToBacklogForBoardRequest] moveIssuesToBacklogForBoardRequest (required):
  Future<void> moveIssuesToBoard(int boardId, MoveIssuesToBacklogForBoardRequest moveIssuesToBacklogForBoardRequest, { Future<void>? abortTrigger, }) async {
    final response = await moveIssuesToBoardWithHttpInfo(boardId, moveIssuesToBacklogForBoardRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Set board property
  ///
  /// Sets the value of the specified board's property.  You can use this resource to store a custom data against the board identified by the id. The user who stores the data is required to have permissions to modify the board.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the ID of the board on which the property will be set.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the board's property. The maximum length of the key is 255 bytes.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Response> setBoardPropertyWithHttpInfo(String boardId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/properties/{propertyKey}'
      .replaceAll('{boardId}', boardId)
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

  /// Set board property
  ///
  /// Sets the value of the specified board's property.  You can use this resource to store a custom data against the board identified by the id. The user who stores the data is required to have permissions to modify the board.
  ///
  /// Parameters:
  ///
  /// * [String] boardId (required):
  ///   the ID of the board on which the property will be set.
  ///
  /// * [String] propertyKey (required):
  ///   the key of the board's property. The maximum length of the key is 255 bytes.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Object?> setBoardProperty(String boardId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await setBoardPropertyWithHttpInfo(boardId, propertyKey, body, abortTrigger: abortTrigger,);
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

  /// Toggle features
  ///
  /// 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [ToggleFeaturesRequest] toggleFeaturesRequest (required):
  Future<Response> toggleFeaturesWithHttpInfo(int boardId, ToggleFeaturesRequest toggleFeaturesRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/agile/1.0/board/{boardId}/features'
      .replaceAll('{boardId}', boardId.toString());

    // ignore: prefer_final_locals
    Object? postBody = toggleFeaturesRequest;

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

  /// Toggle features
  ///
  /// 
  ///
  /// Parameters:
  ///
  /// * [int] boardId (required):
  ///
  /// * [ToggleFeaturesRequest] toggleFeaturesRequest (required):
  Future<GetFeaturesForBoard200Response?> toggleFeatures(int boardId, ToggleFeaturesRequest toggleFeaturesRequest, { Future<void>? abortTrigger, }) async {
    final response = await toggleFeaturesWithHttpInfo(boardId, toggleFeaturesRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetFeaturesForBoard200Response',) as GetFeaturesForBoard200Response;
    
    }
    return null;
  }
}
