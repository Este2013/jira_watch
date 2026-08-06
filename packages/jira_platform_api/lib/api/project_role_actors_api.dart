//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectRoleActorsApi {
  ProjectRoleActorsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add actors to project role
  ///
  /// Adds actors to a project role for the project.  To replace all actors for the project, use [Set actors for project role](#api-rest-api-3-project-projectIdOrKey-role-id-put).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [ActorsMap] actorsMap (required):
  ///   The groups or users to associate with the project role for this project. Provide the user account ID, group name, or group ID. As a group's name can change, use of group ID is recommended.
  Future<Response> addActorUsersWithHttpInfo(String projectIdOrKey, int id, ActorsMap actorsMap, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/role/{id}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = actorsMap;

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

  /// Add actors to project role
  ///
  /// Adds actors to a project role for the project.  To replace all actors for the project, use [Set actors for project role](#api-rest-api-3-project-projectIdOrKey-role-id-put).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [ActorsMap] actorsMap (required):
  ///   The groups or users to associate with the project role for this project. Provide the user account ID, group name, or group ID. As a group's name can change, use of group ID is recommended.
  Future<ProjectRole?> addActorUsers(String projectIdOrKey, int id, ActorsMap actorsMap, { Future<void>? abortTrigger, }) async {
    final response = await addActorUsersWithHttpInfo(projectIdOrKey, id, actorsMap, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectRole',) as ProjectRole;
    
    }
    return null;
  }

  /// Add default actors to project role
  ///
  /// Adds [default actors](#api-rest-api-3-resolution-get) to a role. You may add groups or users, but you cannot add groups and users in the same request.  Changing a project role's default actors does not affect project role members for projects already created.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [ActorInputBean] actorInputBean (required):
  Future<Response> addProjectRoleActorsToRoleWithHttpInfo(int id, ActorInputBean actorInputBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/role/{id}/actors'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = actorInputBean;

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

  /// Add default actors to project role
  ///
  /// Adds [default actors](#api-rest-api-3-resolution-get) to a role. You may add groups or users, but you cannot add groups and users in the same request.  Changing a project role's default actors does not affect project role members for projects already created.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [ActorInputBean] actorInputBean (required):
  Future<ProjectRole?> addProjectRoleActorsToRole(int id, ActorInputBean actorInputBean, { Future<void>? abortTrigger, }) async {
    final response = await addProjectRoleActorsToRoleWithHttpInfo(id, actorInputBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectRole',) as ProjectRole;
    
    }
    return null;
  }

  /// Delete actors from project role
  ///
  /// Deletes actors from a project role for the project.  To remove default actors from the project role, use [Delete default actors from project role](#api-rest-api-3-role-id-actors-delete).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [String] user:
  ///   The user account ID of the user to remove from the project role.
  ///
  /// * [String] group:
  ///   The name of the group to remove from the project role. This parameter cannot be used with the `groupId` parameter. As a group's name can change, use of `groupId` is recommended.
  ///
  /// * [String] groupId:
  ///   The ID of the group to remove from the project role. This parameter cannot be used with the `group` parameter.
  Future<Response> deleteActorWithHttpInfo(String projectIdOrKey, int id, { String? user, String? group, String? groupId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/role/{id}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (user != null) {
      queryParams.addAll(_queryParams('', 'user', user));
    }
    if (group != null) {
      queryParams.addAll(_queryParams('', 'group', group));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }

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

  /// Delete actors from project role
  ///
  /// Deletes actors from a project role for the project.  To remove default actors from the project role, use [Delete default actors from project role](#api-rest-api-3-role-id-actors-delete).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [String] user:
  ///   The user account ID of the user to remove from the project role.
  ///
  /// * [String] group:
  ///   The name of the group to remove from the project role. This parameter cannot be used with the `groupId` parameter. As a group's name can change, use of `groupId` is recommended.
  ///
  /// * [String] groupId:
  ///   The ID of the group to remove from the project role. This parameter cannot be used with the `group` parameter.
  Future<void> deleteActor(String projectIdOrKey, int id, { String? user, String? group, String? groupId, Future<void>? abortTrigger, }) async {
    final response = await deleteActorWithHttpInfo(projectIdOrKey, id, user: user, group: group, groupId: groupId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete default actors from project role
  ///
  /// Deletes the [default actors](#api-rest-api-3-resolution-get) from a project role. You may delete a group or user, but you cannot delete a group and a user in the same request.  Changing a project role's default actors does not affect project role members for projects already created.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [String] user:
  ///   The user account ID of the user to remove as a default actor.
  ///
  /// * [String] groupId:
  ///   The group ID of the group to be removed as a default actor. This parameter cannot be used with the `group` parameter.
  ///
  /// * [String] group:
  ///   The group name of the group to be removed as a default actor.This parameter cannot be used with the `groupId` parameter. As a group's name can change, use of `groupId` is recommended.
  Future<Response> deleteProjectRoleActorsFromRoleWithHttpInfo(int id, { String? user, String? groupId, String? group, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/role/{id}/actors'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (user != null) {
      queryParams.addAll(_queryParams('', 'user', user));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }
    if (group != null) {
      queryParams.addAll(_queryParams('', 'group', group));
    }

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

  /// Delete default actors from project role
  ///
  /// Deletes the [default actors](#api-rest-api-3-resolution-get) from a project role. You may delete a group or user, but you cannot delete a group and a user in the same request.  Changing a project role's default actors does not affect project role members for projects already created.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [String] user:
  ///   The user account ID of the user to remove as a default actor.
  ///
  /// * [String] groupId:
  ///   The group ID of the group to be removed as a default actor. This parameter cannot be used with the `group` parameter.
  ///
  /// * [String] group:
  ///   The group name of the group to be removed as a default actor.This parameter cannot be used with the `groupId` parameter. As a group's name can change, use of `groupId` is recommended.
  Future<ProjectRole?> deleteProjectRoleActorsFromRole(int id, { String? user, String? groupId, String? group, Future<void>? abortTrigger, }) async {
    final response = await deleteProjectRoleActorsFromRoleWithHttpInfo(id, user: user, groupId: groupId, group: group, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectRole',) as ProjectRole;
    
    }
    return null;
  }

  /// Get default actors for project role
  ///
  /// Returns the [default actors](#api-rest-api-3-resolution-get) for the project role.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  Future<Response> getProjectRoleActorsForRoleWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/role/{id}/actors'
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

  /// Get default actors for project role
  ///
  /// Returns the [default actors](#api-rest-api-3-resolution-get) for the project role.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  Future<ProjectRole?> getProjectRoleActorsForRole(int id, { Future<void>? abortTrigger, }) async {
    final response = await getProjectRoleActorsForRoleWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectRole',) as ProjectRole;
    
    }
    return null;
  }

  /// Set actors for project role
  ///
  /// Sets the actors for a project role for a project, replacing all existing actors.  To add actors to the project without overwriting the existing list, use [Add actors to project role](#api-rest-api-3-project-projectIdOrKey-role-id-post).  **[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [ProjectRoleActorsUpdateBean] projectRoleActorsUpdateBean (required):
  ///   The groups or users to associate with the project role for this project. Provide the user account ID, group name, or group ID. As a group's name can change, use of group ID is recommended.
  Future<Response> setActorsWithHttpInfo(String projectIdOrKey, int id, ProjectRoleActorsUpdateBean projectRoleActorsUpdateBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/role/{id}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = projectRoleActorsUpdateBean;

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

  /// Set actors for project role
  ///
  /// Sets the actors for a project role for a project, replacing all existing actors.  To add actors to the project without overwriting the existing list, use [Add actors to project role](#api-rest-api-3-project-projectIdOrKey-role-id-post).  **[Permissions](#permissions) required:** *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] id (required):
  ///   The ID of the project role. Use [Get all project roles](#api-rest-api-3-role-get) to get a list of project role IDs.
  ///
  /// * [ProjectRoleActorsUpdateBean] projectRoleActorsUpdateBean (required):
  ///   The groups or users to associate with the project role for this project. Provide the user account ID, group name, or group ID. As a group's name can change, use of group ID is recommended.
  Future<ProjectRole?> setActors(String projectIdOrKey, int id, ProjectRoleActorsUpdateBean projectRoleActorsUpdateBean, { Future<void>? abortTrigger, }) async {
    final response = await setActorsWithHttpInfo(projectIdOrKey, id, projectRoleActorsUpdateBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectRole',) as ProjectRole;
    
    }
    return null;
  }
}
