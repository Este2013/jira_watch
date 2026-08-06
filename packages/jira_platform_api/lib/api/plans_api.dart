//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PlansApi {
  PlansApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Archive plan
  ///
  /// Archives a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  Future<Response> archivePlanWithHttpInfo(int planId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/archive'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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

  /// Archive plan
  ///
  /// Archives a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  Future<Object?> archivePlan(int planId, { Future<void>? abortTrigger, }) async {
    final response = await archivePlanWithHttpInfo(planId, abortTrigger: abortTrigger,);
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

  /// Create plan
  ///
  /// Creates a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreatePlanRequest] createPlanRequest (required):
  ///
  /// * [bool] useGroupId:
  ///   Whether to accept group IDs instead of group names. Group names are deprecated.
  Future<Response> createPlanWithHttpInfo(CreatePlanRequest createPlanRequest, { bool? useGroupId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan';

    // ignore: prefer_final_locals
    Object? postBody = createPlanRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (useGroupId != null) {
      queryParams.addAll(_queryParams('', 'useGroupId', useGroupId));
    }

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

  /// Create plan
  ///
  /// Creates a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreatePlanRequest] createPlanRequest (required):
  ///
  /// * [bool] useGroupId:
  ///   Whether to accept group IDs instead of group names. Group names are deprecated.
  Future<int?> createPlan(CreatePlanRequest createPlanRequest, { bool? useGroupId, Future<void>? abortTrigger, }) async {
    final response = await createPlanWithHttpInfo(createPlanRequest, useGroupId: useGroupId, abortTrigger: abortTrigger,);
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

  /// Duplicate plan
  ///
  /// Duplicates a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [DuplicatePlanRequest] duplicatePlanRequest (required):
  Future<Response> duplicatePlanWithHttpInfo(int planId, DuplicatePlanRequest duplicatePlanRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/duplicate'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody = duplicatePlanRequest;

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

  /// Duplicate plan
  ///
  /// Duplicates a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [DuplicatePlanRequest] duplicatePlanRequest (required):
  Future<int?> duplicatePlan(int planId, DuplicatePlanRequest duplicatePlanRequest, { Future<void>? abortTrigger, }) async {
    final response = await duplicatePlanWithHttpInfo(planId, duplicatePlanRequest, abortTrigger: abortTrigger,);
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

  /// Get plan
  ///
  /// Returns a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [bool] useGroupId:
  ///   Whether to return group IDs instead of group names. Group names are deprecated.
  Future<Response> getPlanWithHttpInfo(int planId, { bool? useGroupId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (useGroupId != null) {
      queryParams.addAll(_queryParams('', 'useGroupId', useGroupId));
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

  /// Get plan
  ///
  /// Returns a plan.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [bool] useGroupId:
  ///   Whether to return group IDs instead of group names. Group names are deprecated.
  Future<GetPlanResponse?> getPlan(int planId, { bool? useGroupId, Future<void>? abortTrigger, }) async {
    final response = await getPlanWithHttpInfo(planId, useGroupId: useGroupId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetPlanResponse',) as GetPlanResponse;
    
    }
    return null;
  }

  /// Get plans paginated
  ///
  /// Returns a [paginated](#pagination) list of plans.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [bool] includeTrashed:
  ///   Whether to include trashed plans in the results.
  ///
  /// * [bool] includeArchived:
  ///   Whether to include archived plans in the results.
  ///
  /// * [String] cursor:
  ///   The cursor to start from. If not provided, the first page will be returned.
  ///
  /// * [int] maxResults:
  ///   The maximum number of plans to return per page. The maximum value is 50. The default value is 50.
  Future<Response> getPlansWithHttpInfo({ bool? includeTrashed, bool? includeArchived, String? cursor, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (includeTrashed != null) {
      queryParams.addAll(_queryParams('', 'includeTrashed', includeTrashed));
    }
    if (includeArchived != null) {
      queryParams.addAll(_queryParams('', 'includeArchived', includeArchived));
    }
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

  /// Get plans paginated
  ///
  /// Returns a [paginated](#pagination) list of plans.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [bool] includeTrashed:
  ///   Whether to include trashed plans in the results.
  ///
  /// * [bool] includeArchived:
  ///   Whether to include archived plans in the results.
  ///
  /// * [String] cursor:
  ///   The cursor to start from. If not provided, the first page will be returned.
  ///
  /// * [int] maxResults:
  ///   The maximum number of plans to return per page. The maximum value is 50. The default value is 50.
  Future<PageWithCursorGetPlanResponseForPage?> getPlans({ bool? includeTrashed, bool? includeArchived, String? cursor, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getPlansWithHttpInfo(includeTrashed: includeTrashed, includeArchived: includeArchived, cursor: cursor, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageWithCursorGetPlanResponseForPage',) as PageWithCursorGetPlanResponseForPage;
    
    }
    return null;
  }

  /// Trash plan
  ///
  /// Moves a plan to trash.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  Future<Response> trashPlanWithHttpInfo(int planId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}/trash'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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

  /// Trash plan
  ///
  /// Moves a plan to trash.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  Future<Object?> trashPlan(int planId, { Future<void>? abortTrigger, }) async {
    final response = await trashPlanWithHttpInfo(planId, abortTrigger: abortTrigger,);
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

  /// Update plan
  ///
  /// Updates any of the following details of a plan using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).   *  name  *  leadAccountId  *  scheduling           *  estimation with StoryPoints, Days or Hours as possible values      *  startDate                   *  type with DueDate, TargetStartDate, TargetEndDate or DateCustomField as possible values          *  dateCustomFieldId      *  endDate                   *  type with DueDate, TargetStartDate, TargetEndDate or DateCustomField as possible values          *  dateCustomFieldId      *  inferredDates with None, SprintDates or ReleaseDates as possible values      *  dependencies with Sequential or Concurrent as possible values  *  issueSources           *  type with Board, Project or Filter as possible values      *  value  *  exclusionRules           *  numberOfDaysToShowCompletedIssues      *  issueIds      *  workStatusIds      *  workStatusCategoryIds      *  issueTypeIds      *  releaseIds  *  crossProjectReleases           *  name      *  releaseIds  *  customFields           *  customFieldId      *  filter  *  permissions           *  type with View or Edit as possible values      *  holder                   *  type with Group or AccountId as possible values          *  value  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *Note that \"add\" operations do not respect array indexes in target locations. Call the \"Get plan\" endpoint to find out the order of array elements.*
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [Object] body (required):
  ///
  /// * [bool] useGroupId:
  ///   Whether to accept group IDs instead of group names. Group names are deprecated.
  Future<Response> updatePlanWithHttpInfo(int planId, Object body, { bool? useGroupId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/plans/plan/{planId}'
      .replaceAll('{planId}', planId.toString());

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (useGroupId != null) {
      queryParams.addAll(_queryParams('', 'useGroupId', useGroupId));
    }

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

  /// Update plan
  ///
  /// Updates any of the following details of a plan using [JSON Patch](https://datatracker.ietf.org/doc/html/rfc6902).   *  name  *  leadAccountId  *  scheduling           *  estimation with StoryPoints, Days or Hours as possible values      *  startDate                   *  type with DueDate, TargetStartDate, TargetEndDate or DateCustomField as possible values          *  dateCustomFieldId      *  endDate                   *  type with DueDate, TargetStartDate, TargetEndDate or DateCustomField as possible values          *  dateCustomFieldId      *  inferredDates with None, SprintDates or ReleaseDates as possible values      *  dependencies with Sequential or Concurrent as possible values  *  issueSources           *  type with Board, Project or Filter as possible values      *  value  *  exclusionRules           *  numberOfDaysToShowCompletedIssues      *  issueIds      *  workStatusIds      *  workStatusCategoryIds      *  issueTypeIds      *  releaseIds  *  crossProjectReleases           *  name      *  releaseIds  *  customFields           *  customFieldId      *  filter  *  permissions           *  type with View or Edit as possible values      *  holder                   *  type with Group or AccountId as possible values          *  value  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *Note that \"add\" operations do not respect array indexes in target locations. Call the \"Get plan\" endpoint to find out the order of array elements.*
  ///
  /// Parameters:
  ///
  /// * [int] planId (required):
  ///   The ID of the plan.
  ///
  /// * [Object] body (required):
  ///
  /// * [bool] useGroupId:
  ///   Whether to accept group IDs instead of group names. Group names are deprecated.
  Future<Object?> updatePlan(int planId, Object body, { bool? useGroupId, Future<void>? abortTrigger, }) async {
    final response = await updatePlanWithHttpInfo(planId, body, useGroupId: useGroupId, abortTrigger: abortTrigger,);
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
