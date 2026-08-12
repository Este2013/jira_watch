//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SpaceRolesApi {
  SpaceRolesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a space role
  ///
  /// Create a space role.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be an organization or site admin. Connect and Forge app users are not authorized to access this resource.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSpaceRoleRequest] createSpaceRoleRequest (required):
  Future<Response> createSpaceRoleWithHttpInfo(CreateSpaceRoleRequest createSpaceRoleRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-roles';

    // ignore: prefer_final_locals
    Object? postBody = createSpaceRoleRequest;

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

  /// Create a space role
  ///
  /// Create a space role.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be an organization or site admin. Connect and Forge app users are not authorized to access this resource.
  ///
  /// Parameters:
  ///
  /// * [CreateSpaceRoleRequest] createSpaceRoleRequest (required):
  Future<SpaceRole?> createSpaceRole(CreateSpaceRoleRequest createSpaceRoleRequest, { Future<void>? abortTrigger, }) async {
    final response = await createSpaceRoleWithHttpInfo(createSpaceRoleRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SpaceRole',) as SpaceRole;
    
    }
    return null;
  }

  /// Delete a space role
  ///
  /// Delete a space role  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be an organization or site admin. Connect and Forge app users are not authorized to access this resource.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Id of the space role
  Future<Response> deleteSpaceRoleWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-roles/{id}'
      .replaceAll('{id}', id);

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

  /// Delete a space role
  ///
  /// Delete a space role  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be an organization or site admin. Connect and Forge app users are not authorized to access this resource.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Id of the space role
  Future<DeleteSpaceRoleResponse?> deleteSpaceRole(String id, { Future<void>? abortTrigger, }) async {
    final response = await deleteSpaceRoleWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DeleteSpaceRoleResponse',) as DeleteSpaceRoleResponse;
    
    }
    return null;
  }

  /// Get available space roles
  ///
  /// Retrieves the available space roles.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site; if requesting a certain space's roles, permission to view the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] spaceId:
  ///   The space ID for which to filter available space roles; if empty, return all available space roles for the tenant.
  ///
  /// * [String] roleType:
  ///   The space role type to filter results by.
  ///
  /// * [String] principalId:
  ///   The principal ID to filter results by. If specified, a principal-type must also be specified. Paired with a `principal-type` of `ACCESS_CLASS`, valid values include [`anonymous-users`, `jsm-project-admins`, `authenticated-users`, `all-licensed-users`, `all-product-admins`]
  ///
  /// * [PrincipalType] principalType:
  ///   The principal type to filter results by. If specified, a principal-id must also be specified.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of space roles to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<Response> getAvailableSpaceRolesWithHttpInfo({ String? spaceId, String? roleType, String? principalId, PrincipalType? principalType, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-roles';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (spaceId != null) {
      queryParams.addAll(_queryParams('', 'space-id', spaceId));
    }
    if (roleType != null) {
      queryParams.addAll(_queryParams('', 'role-type', roleType));
    }
    if (principalId != null) {
      queryParams.addAll(_queryParams('', 'principal-id', principalId));
    }
    if (principalType != null) {
      queryParams.addAll(_queryParams('', 'principal-type', principalType));
    }
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

  /// Get available space roles
  ///
  /// Retrieves the available space roles.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site; if requesting a certain space's roles, permission to view the space.
  ///
  /// Parameters:
  ///
  /// * [String] spaceId:
  ///   The space ID for which to filter available space roles; if empty, return all available space roles for the tenant.
  ///
  /// * [String] roleType:
  ///   The space role type to filter results by.
  ///
  /// * [String] principalId:
  ///   The principal ID to filter results by. If specified, a principal-type must also be specified. Paired with a `principal-type` of `ACCESS_CLASS`, valid values include [`anonymous-users`, `jsm-project-admins`, `authenticated-users`, `all-licensed-users`, `all-product-admins`]
  ///
  /// * [PrincipalType] principalType:
  ///   The principal type to filter results by. If specified, a principal-id must also be specified.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of space roles to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultSpaceRole?> getAvailableSpaceRoles({ String? spaceId, String? roleType, String? principalId, PrincipalType? principalType, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getAvailableSpaceRolesWithHttpInfo(spaceId: spaceId, roleType: roleType, principalId: principalId, principalType: principalType, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultSpaceRole',) as MultiEntityResultSpaceRole;
    
    }
    return null;
  }

  /// Get space role assignments
  ///
  /// Retrieves the space role assignments.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which to retrieve assignments.
  ///
  /// * [String] roleId:
  ///   Filters the returned role assignments to the provided role ID.
  ///
  /// * [String] roleType:
  ///   Filters the returned role assignments to the provided role type.
  ///
  /// * [String] principalId:
  ///   Filters the returned role assignments to the provided principal id. If specified, a principal-type must also be specified. Paired with a `principal-type` of `ACCESS_CLASS`, valid values include [`anonymous-users`, `jsm-project-admins`, `authenticated-users`, `all-licensed-users`, `all-product-admins`]
  ///
  /// * [PrincipalType] principalType:
  ///   Filters the returned role assignments to the provided principal type. If specified, a principal-id must also be specified.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of space roles to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<Response> getSpaceRoleAssignmentsWithHttpInfo(int id, { String? roleId, String? roleType, String? principalId, PrincipalType? principalType, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/role-assignments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (roleId != null) {
      queryParams.addAll(_queryParams('', 'role-id', roleId));
    }
    if (roleType != null) {
      queryParams.addAll(_queryParams('', 'role-type', roleType));
    }
    if (principalId != null) {
      queryParams.addAll(_queryParams('', 'principal-id', principalId));
    }
    if (principalType != null) {
      queryParams.addAll(_queryParams('', 'principal-type', principalType));
    }
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

  /// Get space role assignments
  ///
  /// Retrieves the space role assignments.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which to retrieve assignments.
  ///
  /// * [String] roleId:
  ///   Filters the returned role assignments to the provided role ID.
  ///
  /// * [String] roleType:
  ///   Filters the returned role assignments to the provided role type.
  ///
  /// * [String] principalId:
  ///   Filters the returned role assignments to the provided principal id. If specified, a principal-type must also be specified. Paired with a `principal-type` of `ACCESS_CLASS`, valid values include [`anonymous-users`, `jsm-project-admins`, `authenticated-users`, `all-licensed-users`, `all-product-admins`]
  ///
  /// * [PrincipalType] principalType:
  ///   Filters the returned role assignments to the provided principal type. If specified, a principal-id must also be specified.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of space roles to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultSpaceRoleAssignment?> getSpaceRoleAssignments(int id, { String? roleId, String? roleType, String? principalId, PrincipalType? principalType, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getSpaceRoleAssignmentsWithHttpInfo(id, roleId: roleId, roleType: roleType, principalId: principalId, principalType: principalType, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultSpaceRoleAssignment',) as MultiEntityResultSpaceRoleAssignment;
    
    }
    return null;
  }

  /// Get space role mode
  ///
  /// Retrieves the space role mode.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getSpaceRoleModeWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-role-mode';

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

  /// Get space role mode
  ///
  /// Retrieves the space role mode.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission).
  Future<GetSpaceRoleMode200Response?> getSpaceRoleMode({ Future<void>? abortTrigger, }) async {
    final response = await getSpaceRoleModeWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetSpaceRoleMode200Response',) as GetSpaceRoleMode200Response;
    
    }
    return null;
  }

  /// Get space role by ID
  ///
  /// Retrieves the space role by ID.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space role to retrieve.
  Future<Response> getSpaceRolesByIdWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-roles/{id}'
      .replaceAll('{id}', id.toString());

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

  /// Get space role by ID
  ///
  /// Retrieves the space role by ID.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space role to retrieve.
  Future<GetSpaceRolesById200Response?> getSpaceRolesById(int id, { Future<void>? abortTrigger, }) async {
    final response = await getSpaceRolesByIdWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetSpaceRolesById200Response',) as GetSpaceRolesById200Response;
    
    }
    return null;
  }

  /// Set space role assignments
  ///
  /// Sets space role assignments as specified in the payload. For each entry, if `roleId` is provided the principal is assigned to that role. If `roleId` is omitted, the role assignment for that principal is removed, if it exists.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to manage roles in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which to retrieve assignments.
  ///
  /// * [List<SetSpaceRoleAssignmentsRequestInner>] setSpaceRoleAssignmentsRequestInner (required):
  Future<Response> setSpaceRoleAssignmentsWithHttpInfo(int id, List<SetSpaceRoleAssignmentsRequestInner> setSpaceRoleAssignmentsRequestInner, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/role-assignments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = setSpaceRoleAssignmentsRequestInner;

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

  /// Set space role assignments
  ///
  /// Sets space role assignments as specified in the payload. For each entry, if `roleId` is provided the principal is assigned to that role. If `roleId` is omitted, the role assignment for that principal is removed, if it exists.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to manage roles in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which to retrieve assignments.
  ///
  /// * [List<SetSpaceRoleAssignmentsRequestInner>] setSpaceRoleAssignmentsRequestInner (required):
  Future<MultiEntityResultSpaceRoleAssignment?> setSpaceRoleAssignments(int id, List<SetSpaceRoleAssignmentsRequestInner> setSpaceRoleAssignmentsRequestInner, { Future<void>? abortTrigger, }) async {
    final response = await setSpaceRoleAssignmentsWithHttpInfo(id, setSpaceRoleAssignmentsRequestInner, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultSpaceRoleAssignment',) as MultiEntityResultSpaceRoleAssignment;
    
    }
    return null;
  }

  /// Update a space role
  ///
  /// Update a space role.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be an organization or site admin. Connect and Forge app users are not authorized to access this resource.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Id of the space role
  ///
  /// * [UpdateSpaceRoleRequest] updateSpaceRoleRequest (required):
  Future<Response> updateSpaceRoleWithHttpInfo(String id, UpdateSpaceRoleRequest updateSpaceRoleRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/space-roles/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = updateSpaceRoleRequest;

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

  /// Update a space role
  ///
  /// Update a space role.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: User must be an organization or site admin. Connect and Forge app users are not authorized to access this resource.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   Id of the space role
  ///
  /// * [UpdateSpaceRoleRequest] updateSpaceRoleRequest (required):
  Future<UpdateSpaceRoleResponse?> updateSpaceRole(String id, UpdateSpaceRoleRequest updateSpaceRoleRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateSpaceRoleWithHttpInfo(id, updateSpaceRoleRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UpdateSpaceRoleResponse',) as UpdateSpaceRoleResponse;
    
    }
    return null;
  }
}
