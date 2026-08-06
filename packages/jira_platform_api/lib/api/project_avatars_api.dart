//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectAvatarsApi {
  ProjectAvatarsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Load project avatar
  ///
  /// Loads an avatar for a project.  Specify the avatar's local file location in the body of the request. Also, include the following headers:   *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).  *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.  For example:   `curl --request POST `  `--user email@example.com:<api_token> `  `--header 'X-Atlassian-Token: no-check' `  `--header 'Content-Type: image/< image_type>' `  `--data-binary \"<@/path/to/file/with/your/avatar>\" `  `--url 'https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatar2'`  The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.  The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.  After creating the avatar use [Set project avatar](#api-rest-api-3-project-projectIdOrKey-avatar-put) to set it as the project's displayed avatar.  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  ///
  /// * [Object] body (required):
  ///
  /// * [int] x:
  ///   The X coordinate of the top-left corner of the crop region.
  ///
  /// * [int] y:
  ///   The Y coordinate of the top-left corner of the crop region.
  ///
  /// * [int] size:
  ///   The length of each side of the crop region.
  Future<Response> createProjectAvatarWithHttpInfo(String projectIdOrKey, Object body, { int? x, int? y, int? size, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/avatar2'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = body;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (x != null) {
      queryParams.addAll(_queryParams('', 'x', x));
    }
    if (y != null) {
      queryParams.addAll(_queryParams('', 'y', y));
    }
    if (size != null) {
      queryParams.addAll(_queryParams('', 'size', size));
    }

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

  /// Load project avatar
  ///
  /// Loads an avatar for a project.  Specify the avatar's local file location in the body of the request. Also, include the following headers:   *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).  *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.  For example:   `curl --request POST `  `--user email@example.com:<api_token> `  `--header 'X-Atlassian-Token: no-check' `  `--header 'Content-Type: image/< image_type>' `  `--data-binary \"<@/path/to/file/with/your/avatar>\" `  `--url 'https://your-domain.atlassian.net/rest/api/3/project/{projectIdOrKey}/avatar2'`  The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.  The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.  After creating the avatar use [Set project avatar](#api-rest-api-3-project-projectIdOrKey-avatar-put) to set it as the project's displayed avatar.  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  ///
  /// * [Object] body (required):
  ///
  /// * [int] x:
  ///   The X coordinate of the top-left corner of the crop region.
  ///
  /// * [int] y:
  ///   The Y coordinate of the top-left corner of the crop region.
  ///
  /// * [int] size:
  ///   The length of each side of the crop region.
  Future<Avatar?> createProjectAvatar(String projectIdOrKey, Object body, { int? x, int? y, int? size, Future<void>? abortTrigger, }) async {
    final response = await createProjectAvatarWithHttpInfo(projectIdOrKey, body, x: x, y: y, size: size, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Avatar',) as Avatar;
    
    }
    return null;
  }

  /// Delete project avatar
  ///
  /// Deletes a custom avatar from a project. Note that system avatars cannot be deleted.  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or (case-sensitive) key.
  ///
  /// * [int] id (required):
  ///   The ID of the avatar.
  Future<Response> deleteProjectAvatarWithHttpInfo(String projectIdOrKey, int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/avatar/{id}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
      .replaceAll('{id}', id.toString());

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

  /// Delete project avatar
  ///
  /// Deletes a custom avatar from a project. Note that system avatars cannot be deleted.  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or (case-sensitive) key.
  ///
  /// * [int] id (required):
  ///   The ID of the avatar.
  Future<void> deleteProjectAvatar(String projectIdOrKey, int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteProjectAvatarWithHttpInfo(projectIdOrKey, id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get all project avatars
  ///
  /// Returns all project avatars, grouped by system and custom avatars.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  Future<Response> getAllProjectAvatarsWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/avatars'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

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

  /// Get all project avatars
  ///
  /// Returns all project avatars, grouped by system and custom avatars.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  Future<ProjectAvatars?> getAllProjectAvatars(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await getAllProjectAvatarsWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ProjectAvatars',) as ProjectAvatars;
    
    }
    return null;
  }

  /// Set project avatar
  ///
  /// Sets the avatar displayed for a project.  Use [Load project avatar](#api-rest-api-3-project-projectIdOrKey-avatar2-post) to store avatars against the project, before using this operation to set the displayed avatar.  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  ///
  /// * [Avatar] avatar (required):
  Future<Response> updateProjectAvatarWithHttpInfo(String projectIdOrKey, Avatar avatar, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/avatar'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = avatar;

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

  /// Set project avatar
  ///
  /// Sets the avatar displayed for a project.  Use [Load project avatar](#api-rest-api-3-project-projectIdOrKey-avatar2-post) to store avatars against the project, before using this operation to set the displayed avatar.  **[Permissions](#permissions) required:** *Administer projects* [project permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The ID or (case-sensitive) key of the project.
  ///
  /// * [Avatar] avatar (required):
  Future<Object?> updateProjectAvatar(String projectIdOrKey, Avatar avatar, { Future<void>? abortTrigger, }) async {
    final response = await updateProjectAvatarWithHttpInfo(projectIdOrKey, avatar, abortTrigger: abortTrigger,);
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
