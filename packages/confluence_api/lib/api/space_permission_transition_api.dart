//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SpacePermissionTransitionApi {
  SpacePermissionTransitionApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Bulk assign space permission roles
  ///
  /// Bulk assigns roles for one or more permission combination IDs obtained from the space permission combinations. Supports targeting all spaces, specific spaces, or excluding specific spaces.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [BulkAssignRolesRequest] bulkAssignRolesRequest (required):
  Future<Response> bulkAssignSpacePermissionRolesWithHttpInfo(BulkAssignRolesRequest bulkAssignRolesRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-permissions/transition/role-assignments';

    // ignore: prefer_final_locals
    Object? postBody = bulkAssignRolesRequest;

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

  /// Bulk assign space permission roles
  ///
  /// Bulk assigns roles for one or more permission combination IDs obtained from the space permission combinations. Supports targeting all spaces, specific spaces, or excluding specific spaces.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Parameters:
  ///
  /// * [BulkAssignRolesRequest] bulkAssignRolesRequest (required):
  Future<BulkTransitionTaskResponse?> bulkAssignSpacePermissionRoles(BulkAssignRolesRequest bulkAssignRolesRequest, { Future<void>? abortTrigger, }) async {
    final response = await bulkAssignSpacePermissionRolesWithHttpInfo(bulkAssignRolesRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BulkTransitionTaskResponse',) as BulkTransitionTaskResponse;
    
    }
    return null;
  }

  /// Bulk remove space permission access
  ///
  /// Bulk removes access for one or more permission combination IDs obtained from the space permission combinations. This removes all space permissions for the specified combinations across the targeted spaces.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [BulkRemoveAccessRequest] bulkRemoveAccessRequest (required):
  Future<Response> bulkRemoveSpacePermissionAccessWithHttpInfo(BulkRemoveAccessRequest bulkRemoveAccessRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-permissions/transition/access-removals';

    // ignore: prefer_final_locals
    Object? postBody = bulkRemoveAccessRequest;

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

  /// Bulk remove space permission access
  ///
  /// Bulk removes access for one or more permission combination IDs obtained from the space permission combinations. This removes all space permissions for the specified combinations across the targeted spaces.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Parameters:
  ///
  /// * [BulkRemoveAccessRequest] bulkRemoveAccessRequest (required):
  Future<BulkTransitionTaskResponse?> bulkRemoveSpacePermissionAccess(BulkRemoveAccessRequest bulkRemoveAccessRequest, { Future<void>? abortTrigger, }) async {
    final response = await bulkRemoveSpacePermissionAccessWithHttpInfo(bulkRemoveAccessRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BulkTransitionTaskResponse',) as BulkTransitionTaskResponse;
    
    }
    return null;
  }

  /// Generate space permission combinations
  ///
  /// Submits a task to refresh the space permission combinations in the database, which identifies all unique permission combinations across the site. This provides permission combination IDs that can be used with the assign-roles and remove-access endpoints.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> generateSpacePermissionCombinationsWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-permissions/transition/combinations';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


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

  /// Generate space permission combinations
  ///
  /// Submits a task to refresh the space permission combinations in the database, which identifies all unique permission combinations across the site. This provides permission combination IDs that can be used with the assign-roles and remove-access endpoints.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  Future<BulkTransitionTaskResponse?> generateSpacePermissionCombinations({ Future<void>? abortTrigger, }) async {
    final response = await generateSpacePermissionCombinationsWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BulkTransitionTaskResponse',) as BulkTransitionTaskResponse;
    
    }
    return null;
  }

  /// Get space permission transition task status
  ///
  /// Retrieves the status of an async space permission transition task. Use the taskId returned from the generate-combinations, assign-roles, or remove-access endpoints to poll for progress and completion.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] taskId (required):
  ///   The ID of the async task, as returned by the generate-combinations, assign-roles, or remove-access endpoints.
  Future<Response> getSpacePermissionTransitionTaskStatusWithHttpInfo(String taskId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-permissions/transition/tasks/{taskId}'
      .replaceAll('{taskId}', taskId);

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

  /// Get space permission transition task status
  ///
  /// Retrieves the status of an async space permission transition task. Use the taskId returned from the generate-combinations, assign-roles, or remove-access endpoints to poll for progress and completion.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Parameters:
  ///
  /// * [String] taskId (required):
  ///   The ID of the async task, as returned by the generate-combinations, assign-roles, or remove-access endpoints.
  Future<BulkTransitionTaskStatusResponse?> getSpacePermissionTransitionTaskStatus(String taskId, { Future<void>? abortTrigger, }) async {
    final response = await getSpacePermissionTransitionTaskStatusWithHttpInfo(taskId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BulkTransitionTaskStatusResponse',) as BulkTransitionTaskStatusResponse;
    
    }
    return null;
  }

  /// List unassigned space permission combinations
  ///
  /// Lists the unique unassigned space permission combinations currently present on the tenant. Combinations that already map to a space role are filtered out server-side. Each row carries the decoded set of space permissions and the principal types that currently hold the combination — these inform which `principalType` values are valid to include in the matching bulk role-assignments request.  Results are always sorted by `principalCount` descending. Sort field and sort order are not configurable; page size is controlled by the `limit` query parameter (default 25, min 1, max 250). Use the `cursor` field to page through additional results. The `generatedAt` field reflects the last audit run that populated the combinations table — call the generate-combinations endpoint to refresh stale data.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] cursor:
  ///   Opaque cursor returned from a previous page in the `cursor` field of the response. Omit for the first page.
  ///
  /// * [int] limit:
  ///   The maximum number of combinations to return per page. Requests outside the supported range return `400`.
  Future<Response> listSpacePermissionCombinationsWithHttpInfo({ String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-permissions/transition/combinations';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// List unassigned space permission combinations
  ///
  /// Lists the unique unassigned space permission combinations currently present on the tenant. Combinations that already map to a space role are filtered out server-side. Each row carries the decoded set of space permissions and the principal types that currently hold the combination — these inform which `principalType` values are valid to include in the matching bulk role-assignments request.  Results are always sorted by `principalCount` descending. Sort field and sort order are not configurable; page size is controlled by the `limit` query parameter (default 25, min 1, max 250). Use the `cursor` field to page through additional results. The `generatedAt` field reflects the last audit run that populated the combinations table — call the generate-combinations endpoint to refresh stale data.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be a Confluence administrator.
  ///
  /// Parameters:
  ///
  /// * [String] cursor:
  ///   Opaque cursor returned from a previous page in the `cursor` field of the response. Omit for the first page.
  ///
  /// * [int] limit:
  ///   The maximum number of combinations to return per page. Requests outside the supported range return `400`.
  Future<ListSpacePermissionCombinationsResponse?> listSpacePermissionCombinations({ String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await listSpacePermissionCombinationsWithHttpInfo(cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ListSpacePermissionCombinationsResponse',) as ListSpacePermissionCombinationsResponse;
    
    }
    return null;
  }
}
