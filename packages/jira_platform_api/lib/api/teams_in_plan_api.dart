//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class TeamsInPlanApi {
  TeamsInPlanApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add Atlassian team to plan
  ///
  /// Adds an existing Atlassian team to a plan and configures their plannning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [AddAtlassianTeamRequest] addAtlassianTeamRequest (required):
  Future<Response> addAtlassianTeamWithHttpInfo(int planId, AddAtlassianTeamRequest addAtlassianTeamRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/atlassian'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody = addAtlassianTeamRequest;

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

  /// Add Atlassian team to plan
  ///
  /// Adds an existing Atlassian team to a plan and configures their plannning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [AddAtlassianTeamRequest] addAtlassianTeamRequest (required):
  Future<Object?> addAtlassianTeam(int planId, AddAtlassianTeamRequest addAtlassianTeamRequest, { Future<void>? abortTrigger, }) async {
    final response = await addAtlassianTeamWithHttpInfo(planId, addAtlassianTeamRequest, abortTrigger: abortTrigger,);
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

  /// Create plan-only team
  ///
  /// Creates a plan-only team and configures their planning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [CreatePlanOnlyTeamRequest] createPlanOnlyTeamRequest (required):
  Future<Response> createPlanOnlyTeamWithHttpInfo(int planId, CreatePlanOnlyTeamRequest createPlanOnlyTeamRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/planonly'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody = createPlanOnlyTeamRequest;

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

  /// Create plan-only team
  ///
  /// Creates a plan-only team and configures their planning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [CreatePlanOnlyTeamRequest] createPlanOnlyTeamRequest (required):
  Future<int?> createPlanOnlyTeam(int planId, CreatePlanOnlyTeamRequest createPlanOnlyTeamRequest, { Future<void>? abortTrigger, }) async {
    final response = await createPlanOnlyTeamWithHttpInfo(planId, createPlanOnlyTeamRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'int',) as int;
    
    }
    return null;
  }

  /// Delete plan-only team
  ///
  /// Deletes a plan-only team and their planning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [int] planOnlyTeamId (required):
  ///   The ID of the plan-only team.
  Future<Response> deletePlanOnlyTeamWithHttpInfo(int planId, int planOnlyTeamId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}'
      .replaceAll('{planId}', planId.toString())
      .replaceAll('{planOnlyTeamId}', planOnlyTeamId.toString());

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

  /// Delete plan-only team
  ///
  /// Deletes a plan-only team and their planning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [int] planOnlyTeamId (required):
  ///   The ID of the plan-only team.
  Future<Object?> deletePlanOnlyTeam(int planId, int planOnlyTeamId, { Future<void>? abortTrigger, }) async {
    final response = await deletePlanOnlyTeamWithHttpInfo(planId, planOnlyTeamId, abortTrigger: abortTrigger,);
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

  /// Get Atlassian team in plan
  ///
  /// Returns planning settings for an Atlassian team in a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] atlassianTeamId (required):
  ///   The ID of the Atlassian team.
  Future<Response> getAtlassianTeamWithHttpInfo(int planId, String atlassianTeamId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}'
      .replaceAll('{planId}', planId.toString())
      .replaceAll('{atlassianTeamId}', atlassianTeamId);

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

  /// Get Atlassian team in plan
  ///
  /// Returns planning settings for an Atlassian team in a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] atlassianTeamId (required):
  ///   The ID of the Atlassian team.
  Future<GetAtlassianTeamResponse?> getAtlassianTeam(int planId, String atlassianTeamId, { Future<void>? abortTrigger, }) async {
    final response = await getAtlassianTeamWithHttpInfo(planId, atlassianTeamId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAtlassianTeamResponse',) as GetAtlassianTeamResponse;
    
    }
    return null;
  }

  /// Get plan-only team
  ///
  /// Returns planning settings for a plan-only team.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [int] planOnlyTeamId (required):
  ///   The ID of the plan-only team.
  Future<Response> getPlanOnlyTeamWithHttpInfo(int planId, int planOnlyTeamId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}'
      .replaceAll('{planId}', planId.toString())
      .replaceAll('{planOnlyTeamId}', planOnlyTeamId.toString());

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

  /// Get plan-only team
  ///
  /// Returns planning settings for a plan-only team.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [int] planOnlyTeamId (required):
  ///   The ID of the plan-only team.
  Future<GetPlanOnlyTeamResponse?> getPlanOnlyTeam(int planId, int planOnlyTeamId, { Future<void>? abortTrigger, }) async {
    final response = await getPlanOnlyTeamWithHttpInfo(planId, planOnlyTeamId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetPlanOnlyTeamResponse',) as GetPlanOnlyTeamResponse;
    
    }
    return null;
  }

  /// Get teams in plan paginated
  ///
  /// Returns a [paginated](#pagination) list of plan-only and Atlassian teams in a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] cursor:
  ///   The cursor to start from. If not provided, the first page will be returned.
  ///
  /// * [int] maxResults:
  ///   The maximum number of plan teams to return per page. The maximum value is 50. The default value is 50.
  Future<Response> getTeamsWithHttpInfo(int planId, { String? cursor, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
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

  /// Get teams in plan paginated
  ///
  /// Returns a [paginated](#pagination) list of plan-only and Atlassian teams in a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] cursor:
  ///   The cursor to start from. If not provided, the first page will be returned.
  ///
  /// * [int] maxResults:
  ///   The maximum number of plan teams to return per page. The maximum value is 50. The default value is 50.
  Future<PageWithCursorGetTeamResponseForPage?> getTeams(int planId, { String? cursor, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getTeamsWithHttpInfo(planId, cursor: cursor, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageWithCursorGetTeamResponseForPage',) as PageWithCursorGetTeamResponseForPage;
    
    }
    return null;
  }

  /// Remove Atlassian team from plan
  ///
  /// Removes an Atlassian team from a plan and deletes their planning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] atlassianTeamId (required):
  ///   The ID of the Atlassian team.
  Future<Response> removeAtlassianTeamWithHttpInfo(int planId, String atlassianTeamId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}'
      .replaceAll('{planId}', planId.toString())
      .replaceAll('{atlassianTeamId}', atlassianTeamId);

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

  /// Remove Atlassian team from plan
  ///
  /// Removes an Atlassian team from a plan and deletes their planning settings.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] atlassianTeamId (required):
  ///   The ID of the Atlassian team.
  Future<Object?> removeAtlassianTeam(int planId, String atlassianTeamId, { Future<void>? abortTrigger, }) async {
    final response = await removeAtlassianTeamWithHttpInfo(planId, atlassianTeamId, abortTrigger: abortTrigger,);
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

  /// Update Atlassian team in plan
  ///
  /// Updates any of the following planning settings of an Atlassian team in a plan using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).   *  planningStyle  *  issueSourceId  *  sprintLength  *  capacity  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *Note that \"add\" operations do not respect array indexes in target locations. Call the \"Get Atlassian team in plan\" endpoint to find out the order of array elements.*
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] atlassianTeamId (required):
  ///   The ID of the Atlassian team.
  ///
  /// * [Object] body (required):
  Future<Response> updateAtlassianTeamWithHttpInfo(int planId, String atlassianTeamId, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/atlassian/{atlassianTeamId}'
      .replaceAll('{planId}', planId.toString())
      .replaceAll('{atlassianTeamId}', atlassianTeamId);

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json-patch+json'];


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

  /// Update Atlassian team in plan
  ///
  /// Updates any of the following planning settings of an Atlassian team in a plan using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).   *  planningStyle  *  issueSourceId  *  sprintLength  *  capacity  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *Note that \"add\" operations do not respect array indexes in target locations. Call the \"Get Atlassian team in plan\" endpoint to find out the order of array elements.*
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [String] atlassianTeamId (required):
  ///   The ID of the Atlassian team.
  ///
  /// * [Object] body (required):
  Future<Object?> updateAtlassianTeam(int planId, String atlassianTeamId, Object body, { Future<void>? abortTrigger, }) async {
    final response = await updateAtlassianTeamWithHttpInfo(planId, atlassianTeamId, body, abortTrigger: abortTrigger,);
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

  /// Update plan-only team
  ///
  /// Updates any of the following planning settings of a plan-only team using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).   *  name  *  planningStyle  *  issueSourceId  *  sprintLength  *  capacity  *  memberAccountIds  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *Note that \"add\" operations do not respect array indexes in target locations. Call the \"Get plan-only team\" endpoint to find out the order of array elements.*
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [int] planOnlyTeamId (required):
  ///   The ID of the plan-only team.
  ///
  /// * [Object] body (required):
  Future<Response> updatePlanOnlyTeamWithHttpInfo(int planId, int planOnlyTeamId, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/team/planonly/{planOnlyTeamId}'
      .replaceAll('{planId}', planId.toString())
      .replaceAll('{planOnlyTeamId}', planOnlyTeamId.toString());

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json-patch+json'];


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

  /// Update plan-only team
  ///
  /// Updates any of the following planning settings of a plan-only team using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).   *  name  *  planningStyle  *  issueSourceId  *  sprintLength  *  capacity  *  memberAccountIds  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *Note that \"add\" operations do not respect array indexes in target locations. Call the \"Get plan-only team\" endpoint to find out the order of array elements.*
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [int] planOnlyTeamId (required):
  ///   The ID of the plan-only team.
  ///
  /// * [Object] body (required):
  Future<Object?> updatePlanOnlyTeam(int planId, int planOnlyTeamId, Object body, { Future<void>? abortTrigger, }) async {
    final response = await updatePlanOnlyTeamWithHttpInfo(planId, planOnlyTeamId, body, abortTrigger: abortTrigger,);
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
}
