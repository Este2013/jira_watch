//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PermissionSchemesApi {
  PermissionSchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create permission grant
  ///
  /// Creates a permission grant in a permission scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme in which to create a new permission grant.
  ///
  /// * [PermissionGrant] permissionGrant (required):
  ///   The permission grant to create.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `permissions` Returns all permission grants for each permission scheme.  *  `user` Returns information about the user who is granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `projectRole` Returns information about the project role granted the permission.  *  `field` Returns information about the custom field granted the permission.  *  `all` Returns all expandable information.
  Future<Response> createPermissionGrantWithHttpInfo(int schemeId, PermissionGrant permissionGrant, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}/permission'
      .replaceAll('{schemeId}', schemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody = permissionGrant;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Create permission grant
  ///
  /// Creates a permission grant in a permission scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme in which to create a new permission grant.
  ///
  /// * [PermissionGrant] permissionGrant (required):
  ///   The permission grant to create.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `permissions` Returns all permission grants for each permission scheme.  *  `user` Returns information about the user who is granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `projectRole` Returns information about the project role granted the permission.  *  `field` Returns information about the custom field granted the permission.  *  `all` Returns all expandable information.
  Future<PermissionGrant?> createPermissionGrant(int schemeId, PermissionGrant permissionGrant, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await createPermissionGrantWithHttpInfo(schemeId, permissionGrant, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionGrant',) as PermissionGrant;
    
    }
    return null;
  }

  /// Create permission scheme
  ///
  /// Creates a new permission scheme. You can create a permission scheme with or without defining a set of permission grants.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [PermissionScheme] permissionScheme (required):
  ///   The permission scheme to create.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<Response> createPermissionSchemeWithHttpInfo(PermissionScheme permissionScheme, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme';

    // ignore: prefer_final_locals
    Object? postBody = permissionScheme;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Create permission scheme
  ///
  /// Creates a new permission scheme. You can create a permission scheme with or without defining a set of permission grants.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [PermissionScheme] permissionScheme (required):
  ///   The permission scheme to create.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<PermissionScheme?> createPermissionScheme(PermissionScheme permissionScheme, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await createPermissionSchemeWithHttpInfo(permissionScheme, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionScheme',) as PermissionScheme;
    
    }
    return null;
  }

  /// Delete permission scheme
  ///
  /// Deletes a permission scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme being deleted.
  Future<Response> deletePermissionSchemeWithHttpInfo(int schemeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}'
      .replaceAll('{schemeId}', schemeId.toString());

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

  /// Delete permission scheme
  ///
  /// Deletes a permission scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme being deleted.
  Future<void> deletePermissionScheme(int schemeId, { Future<void>? abortTrigger, }) async {
    final response = await deletePermissionSchemeWithHttpInfo(schemeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete permission scheme grant
  ///
  /// Deletes a permission grant from a permission scheme. See [About permission schemes and grants](../api-group-permission-schemes/#about-permission-schemes-and-grants) for more details.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme to delete the permission grant from.
  ///
  /// * [int] permissionId (required):
  ///   The ID of the permission grant to delete.
  Future<Response> deletePermissionSchemeEntityWithHttpInfo(int schemeId, int permissionId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}/permission/{permissionId}'
      .replaceAll('{schemeId}', schemeId.toString())
      .replaceAll('{permissionId}', permissionId.toString());

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

  /// Delete permission scheme grant
  ///
  /// Deletes a permission grant from a permission scheme. See [About permission schemes and grants](../api-group-permission-schemes/#about-permission-schemes-and-grants) for more details.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme to delete the permission grant from.
  ///
  /// * [int] permissionId (required):
  ///   The ID of the permission grant to delete.
  Future<void> deletePermissionSchemeEntity(int schemeId, int permissionId, { Future<void>? abortTrigger, }) async {
    final response = await deletePermissionSchemeEntityWithHttpInfo(schemeId, permissionId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get all permission schemes
  ///
  /// Returns all permission schemes.  ### About permission schemes and grants ###  A permission scheme is a collection of permission grants. A permission grant consists of a `holder` and a `permission`.  #### Holder object ####  The `holder` object contains information about the user or group being granted the permission. For example, the *Administer projects* permission is granted to a group named *Teams in space administrators*. In this case, the type is `\"type\": \"group\"`, and the parameter is the group name, `\"parameter\": \"Teams in space administrators\"` and the value is group ID, `\"value\": \"ca85fac0-d974-40ca-a615-7af99c48d24f\"`.  The `holder` object is defined by the following properties:   *  `type` Identifies the user or group (see the list of types below).  *  `parameter` As a group's name can change, use of `value` is recommended. The value of this property depends on the `type`. For example, if the `type` is a group, then you need to specify the group name.  *  `value` The value of this property depends on the `type`. If the `type` is a group, then you need to specify the group ID. For other `type` it has the same value as `parameter`  The following `types` are available. The expected values for `parameter` and `value` are given in parentheses (some types may not have a `parameter` or `value`):   *  `anyone` Grant for anonymous users.  *  `applicationRole` Grant for users with access to the specified application (application name, application name). See [Update product access settings](https://confluence.atlassian.com/x/3YxjL) for more information.  *  `assignee` Grant for the user currently assigned to an issue.  *  `group` Grant for the specified group (`parameter` : group name, `value` : group ID).  *  `groupCustomField` Grant for a user in the group selected in the specified custom field (`parameter` : custom field ID, `value` : custom field ID).  *  `projectLead` Grant for a project lead.  *  `projectRole` Grant for the specified project role (`parameter` :project role ID, `value` : project role ID).  *  `reporter` Grant for the user who reported the issue.  *  `sd.customer.portal.only` Jira Service Desk only. Grants customers permission to access the customer portal but not Jira. See [Customizing Jira Service Desk permissions](https://confluence.atlassian.com/x/24dKLg) for more information.  *  `user` Grant for the specified user (`parameter` : user ID - historically this was the userkey but that is deprecated and the account ID should be used, `value` : user ID).  *  `userCustomField` Grant for a user selected in the specified custom field (`parameter` : custom field ID, `value` : custom field ID).  #### Built-in permissions ####  The [built-in Jira permissions](https://confluence.atlassian.com/x/yodKLg) are listed below. Apps can also define custom permissions. See the [project permission](https://developer.atlassian.com/cloud/jira/platform/modules/project-permission/) and [global permission](https://developer.atlassian.com/cloud/jira/platform/modules/global-permission/) module documentation for more information.  **Administration permissions**   *  `ADMINISTER_PROJECTS`  *  `EDIT_WORKFLOW`  *  `EDIT_ISSUE_LAYOUT`  **Project permissions**   *  `BROWSE_PROJECTS`  *  `MANAGE_SPRINTS_PERMISSION` (Jira Software only)  *  `SERVICEDESK_AGENT` (Jira Service Desk only)  *  `VIEW_DEV_TOOLS` (Jira Software only)  *  `VIEW_READONLY_WORKFLOW`  **Issue permissions**   *  `ASSIGNABLE_USER`  *  `ASSIGN_ISSUES`  *  `CLOSE_ISSUES`  *  `CREATE_ISSUES`  *  `DELETE_ISSUES`  *  `EDIT_ISSUES`  *  `LINK_ISSUES`  *  `MODIFY_REPORTER`  *  `MOVE_ISSUES`  *  `RESOLVE_ISSUES`  *  `SCHEDULE_ISSUES`  *  `SET_ISSUE_SECURITY`  *  `TRANSITION_ISSUES`  **Voters and watchers permissions**   *  `MANAGE_WATCHERS`  *  `VIEW_VOTERS_AND_WATCHERS`  **Comments permissions**   *  `ADD_COMMENTS`  *  `DELETE_ALL_COMMENTS`  *  `DELETE_OWN_COMMENTS`  *  `EDIT_ALL_COMMENTS`  *  `EDIT_OWN_COMMENTS`  **Attachments permissions**   *  `CREATE_ATTACHMENTS`  *  `DELETE_ALL_ATTACHMENTS`  *  `DELETE_OWN_ATTACHMENTS`  **Time tracking permissions**   *  `DELETE_ALL_WORKLOGS`  *  `DELETE_OWN_WORKLOGS`  *  `EDIT_ALL_WORKLOGS`  *  `EDIT_OWN_WORKLOGS`  *  `WORK_ON_ISSUES`  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<Response> getAllPermissionSchemesWithHttpInfo({ String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get all permission schemes
  ///
  /// Returns all permission schemes.  ### About permission schemes and grants ###  A permission scheme is a collection of permission grants. A permission grant consists of a `holder` and a `permission`.  #### Holder object ####  The `holder` object contains information about the user or group being granted the permission. For example, the *Administer projects* permission is granted to a group named *Teams in space administrators*. In this case, the type is `\"type\": \"group\"`, and the parameter is the group name, `\"parameter\": \"Teams in space administrators\"` and the value is group ID, `\"value\": \"ca85fac0-d974-40ca-a615-7af99c48d24f\"`.  The `holder` object is defined by the following properties:   *  `type` Identifies the user or group (see the list of types below).  *  `parameter` As a group's name can change, use of `value` is recommended. The value of this property depends on the `type`. For example, if the `type` is a group, then you need to specify the group name.  *  `value` The value of this property depends on the `type`. If the `type` is a group, then you need to specify the group ID. For other `type` it has the same value as `parameter`  The following `types` are available. The expected values for `parameter` and `value` are given in parentheses (some types may not have a `parameter` or `value`):   *  `anyone` Grant for anonymous users.  *  `applicationRole` Grant for users with access to the specified application (application name, application name). See [Update product access settings](https://confluence.atlassian.com/x/3YxjL) for more information.  *  `assignee` Grant for the user currently assigned to an issue.  *  `group` Grant for the specified group (`parameter` : group name, `value` : group ID).  *  `groupCustomField` Grant for a user in the group selected in the specified custom field (`parameter` : custom field ID, `value` : custom field ID).  *  `projectLead` Grant for a project lead.  *  `projectRole` Grant for the specified project role (`parameter` :project role ID, `value` : project role ID).  *  `reporter` Grant for the user who reported the issue.  *  `sd.customer.portal.only` Jira Service Desk only. Grants customers permission to access the customer portal but not Jira. See [Customizing Jira Service Desk permissions](https://confluence.atlassian.com/x/24dKLg) for more information.  *  `user` Grant for the specified user (`parameter` : user ID - historically this was the userkey but that is deprecated and the account ID should be used, `value` : user ID).  *  `userCustomField` Grant for a user selected in the specified custom field (`parameter` : custom field ID, `value` : custom field ID).  #### Built-in permissions ####  The [built-in Jira permissions](https://confluence.atlassian.com/x/yodKLg) are listed below. Apps can also define custom permissions. See the [project permission](https://developer.atlassian.com/cloud/jira/platform/modules/project-permission/) and [global permission](https://developer.atlassian.com/cloud/jira/platform/modules/global-permission/) module documentation for more information.  **Administration permissions**   *  `ADMINISTER_PROJECTS`  *  `EDIT_WORKFLOW`  *  `EDIT_ISSUE_LAYOUT`  **Project permissions**   *  `BROWSE_PROJECTS`  *  `MANAGE_SPRINTS_PERMISSION` (Jira Software only)  *  `SERVICEDESK_AGENT` (Jira Service Desk only)  *  `VIEW_DEV_TOOLS` (Jira Software only)  *  `VIEW_READONLY_WORKFLOW`  **Issue permissions**   *  `ASSIGNABLE_USER`  *  `ASSIGN_ISSUES`  *  `CLOSE_ISSUES`  *  `CREATE_ISSUES`  *  `DELETE_ISSUES`  *  `EDIT_ISSUES`  *  `LINK_ISSUES`  *  `MODIFY_REPORTER`  *  `MOVE_ISSUES`  *  `RESOLVE_ISSUES`  *  `SCHEDULE_ISSUES`  *  `SET_ISSUE_SECURITY`  *  `TRANSITION_ISSUES`  **Voters and watchers permissions**   *  `MANAGE_WATCHERS`  *  `VIEW_VOTERS_AND_WATCHERS`  **Comments permissions**   *  `ADD_COMMENTS`  *  `DELETE_ALL_COMMENTS`  *  `DELETE_OWN_COMMENTS`  *  `EDIT_ALL_COMMENTS`  *  `EDIT_OWN_COMMENTS`  **Attachments permissions**   *  `CREATE_ATTACHMENTS`  *  `DELETE_ALL_ATTACHMENTS`  *  `DELETE_OWN_ATTACHMENTS`  **Time tracking permissions**   *  `DELETE_ALL_WORKLOGS`  *  `DELETE_OWN_WORKLOGS`  *  `EDIT_ALL_WORKLOGS`  *  `EDIT_OWN_WORKLOGS`  *  `WORK_ON_ISSUES`  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<PermissionSchemes?> getAllPermissionSchemes({ String? expand, Future<void>? abortTrigger, }) async {
    final response = await getAllPermissionSchemesWithHttpInfo(expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionSchemes',) as PermissionSchemes;
    
    }
    return null;
  }

  /// Get permission scheme
  ///
  /// Returns a permission scheme.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme to return.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<Response> getPermissionSchemeWithHttpInfo(int schemeId, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}'
      .replaceAll('{schemeId}', schemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get permission scheme
  ///
  /// Returns a permission scheme.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme to return.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<PermissionScheme?> getPermissionScheme(int schemeId, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getPermissionSchemeWithHttpInfo(schemeId, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionScheme',) as PermissionScheme;
    
    }
    return null;
  }

  /// Get permission scheme grant
  ///
  /// Returns a permission grant.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme.
  ///
  /// * [int] permissionId (required):
  ///   The ID of the permission grant.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<Response> getPermissionSchemeGrantWithHttpInfo(int schemeId, int permissionId, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}/permission/{permissionId}'
      .replaceAll('{schemeId}', schemeId.toString())
      .replaceAll('{permissionId}', permissionId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get permission scheme grant
  ///
  /// Returns a permission grant.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme.
  ///
  /// * [int] permissionId (required):
  ///   The ID of the permission grant.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<PermissionGrant?> getPermissionSchemeGrant(int schemeId, int permissionId, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getPermissionSchemeGrantWithHttpInfo(schemeId, permissionId, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionGrant',) as PermissionGrant;
    
    }
    return null;
  }

  /// Get permission scheme grants
  ///
  /// Returns all permission grants for a permission scheme.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `permissions` Returns all permission grants for each permission scheme.  *  `user` Returns information about the user who is granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `projectRole` Returns information about the project role granted the permission.  *  `field` Returns information about the custom field granted the permission.  *  `all` Returns all expandable information.
  Future<Response> getPermissionSchemeGrantsWithHttpInfo(int schemeId, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}/permission'
      .replaceAll('{schemeId}', schemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get permission scheme grants
  ///
  /// Returns all permission grants for a permission scheme.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `permissions` Returns all permission grants for each permission scheme.  *  `user` Returns information about the user who is granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `projectRole` Returns information about the project role granted the permission.  *  `field` Returns information about the custom field granted the permission.  *  `all` Returns all expandable information.
  Future<PermissionGrants?> getPermissionSchemeGrants(int schemeId, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getPermissionSchemeGrantsWithHttpInfo(schemeId, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionGrants',) as PermissionGrants;
    
    }
    return null;
  }

  /// Update permission scheme
  ///
  /// Updates a permission scheme. Below are some important things to note when using this resource:   *  If a permissions list is present in the request, then it is set in the permission scheme, overwriting *all existing* grants.  *  If you want to update only the name and description, then do not send a permissions list in the request.  *  Sending an empty list will remove all permission grants from the permission scheme.  If you want to add or delete a permission grant instead of updating the whole list, see [Create permission grant](#api-rest-api-3-permissionscheme-schemeId-permission-post) or [Delete permission scheme entity](#api-rest-api-3-permissionscheme-schemeId-permission-permissionId-delete).  See [About permission schemes and grants](../api-group-permission-schemes/#about-permission-schemes-and-grants) for more details.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme to update.
  ///
  /// * [PermissionScheme] permissionScheme (required):
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<Response> updatePermissionSchemeWithHttpInfo(int schemeId, PermissionScheme permissionScheme, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/permissionscheme/{schemeId}'
      .replaceAll('{schemeId}', schemeId.toString());

    // ignore: prefer_final_locals
    Object? postBody = permissionScheme;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

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

  /// Update permission scheme
  ///
  /// Updates a permission scheme. Below are some important things to note when using this resource:   *  If a permissions list is present in the request, then it is set in the permission scheme, overwriting *all existing* grants.  *  If you want to update only the name and description, then do not send a permissions list in the request.  *  Sending an empty list will remove all permission grants from the permission scheme.  If you want to add or delete a permission grant instead of updating the whole list, see [Create permission grant](#api-rest-api-3-permissionscheme-schemeId-permission-post) or [Delete permission scheme entity](#api-rest-api-3-permissionscheme-schemeId-permission-permissionId-delete).  See [About permission schemes and grants](../api-group-permission-schemes/#about-permission-schemes-and-grants) for more details.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] schemeId (required):
  ///   The ID of the permission scheme to update.
  ///
  /// * [PermissionScheme] permissionScheme (required):
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Note that permissions are always included when you specify any value. Expand options include:   *  `all` Returns all expandable information.  *  `field` Returns information about the custom field granted the permission.  *  `group` Returns information about the group that is granted the permission.  *  `permissions` Returns all permission grants for each permission scheme.  *  `projectRole` Returns information about the project role granted the permission.  *  `user` Returns information about the user who is granted the permission.
  Future<PermissionScheme?> updatePermissionScheme(int schemeId, PermissionScheme permissionScheme, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await updatePermissionSchemeWithHttpInfo(schemeId, permissionScheme, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PermissionScheme',) as PermissionScheme;
    
    }
    return null;
  }
}
