//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AvatarsApi {
  AvatarsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete avatar
  ///
  /// Deletes an avatar from a project, issue type or priority.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  ///
  /// * [String] owningObjectId (required):
  ///   The ID of the item the avatar is associated with.
  ///
  /// * [int] id (required):
  ///   The ID of the avatar.
  Future<Response> deleteAvatarWithHttpInfo(String type, String owningObjectId, int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/universal_avatar/type/{type}/owner/{owningObjectId}/avatar/{id}'
      .replaceAll('{type}', type)
      .replaceAll('{owningObjectId}', owningObjectId)
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

  /// Delete avatar
  ///
  /// Deletes an avatar from a project, issue type or priority.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  ///
  /// * [String] owningObjectId (required):
  ///   The ID of the item the avatar is associated with.
  ///
  /// * [int] id (required):
  ///   The ID of the avatar.
  Future<void> deleteAvatar(String type, String owningObjectId, int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteAvatarWithHttpInfo(type, owningObjectId, id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get system avatars by type
  ///
  /// Returns a list of system avatar details by owner type, where the owner types are issue type, project, user or priority.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  Future<Response> getAllSystemAvatarsWithHttpInfo(String type, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/avatar/{type}/system'
      .replaceAll('{type}', type);

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

  /// Get system avatars by type
  ///
  /// Returns a list of system avatar details by owner type, where the owner types are issue type, project, user or priority.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  Future<SystemAvatars?> getAllSystemAvatars(String type, { Future<void>? abortTrigger, }) async {
    final response = await getAllSystemAvatarsWithHttpInfo(type, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SystemAvatars',) as SystemAvatars;
    
    }
    return null;
  }

  /// Get avatar image by ID
  ///
  /// Returns a project, issue type or priority avatar image by ID.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  For system avatars, none.  *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.  *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.  *  For priority avatars, none.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The icon type of the avatar.
  ///
  /// * [int] id (required):
  ///   The ID of the avatar.
  ///
  /// * [String] size:
  ///   The size of the avatar image. If not provided the default size is returned.
  ///
  /// * [String] format:
  ///   The format to return the avatar image in. If not provided the original content format is returned.
  Future<Response> getAvatarImageByIDWithHttpInfo(String type, int id, { String? size, String? format, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/universal_avatar/view/type/{type}/avatar/{id}'
      .replaceAll('{type}', type)
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (size != null) {
      queryParams.addAll(_queryParams('', 'size', size));
    }
    if (format != null) {
      queryParams.addAll(_queryParams('', 'format', format));
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

  /// Get avatar image by ID
  ///
  /// Returns a project, issue type or priority avatar image by ID.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  For system avatars, none.  *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.  *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.  *  For priority avatars, none.
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The icon type of the avatar.
  ///
  /// * [int] id (required):
  ///   The ID of the avatar.
  ///
  /// * [String] size:
  ///   The size of the avatar image. If not provided the default size is returned.
  ///
  /// * [String] format:
  ///   The format to return the avatar image in. If not provided the original content format is returned.
  Future<void> getAvatarImageByID(String type, int id, { String? size, String? format, Future<void>? abortTrigger, }) async {
    final response = await getAvatarImageByIDWithHttpInfo(type, id, size: size, format: format, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get avatar image by owner
  ///
  /// Returns the avatar image for a project, issue type or priority.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  For system avatars, none.  *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.  *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.  *  For priority avatars, none.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The icon type of the avatar.
  ///
  /// * [String] entityId (required):
  ///   The ID of the project or issue type the avatar belongs to.
  ///
  /// * [String] size:
  ///   The size of the avatar image. If not provided the default size is returned.
  ///
  /// * [String] format:
  ///   The format to return the avatar image in. If not provided the original content format is returned.
  Future<Response> getAvatarImageByOwnerWithHttpInfo(String type, String entityId, { String? size, String? format, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/universal_avatar/view/type/{type}/owner/{entityId}'
      .replaceAll('{type}', type)
      .replaceAll('{entityId}', entityId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (size != null) {
      queryParams.addAll(_queryParams('', 'size', size));
    }
    if (format != null) {
      queryParams.addAll(_queryParams('', 'format', format));
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

  /// Get avatar image by owner
  ///
  /// Returns the avatar image for a project, issue type or priority.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  For system avatars, none.  *  For custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.  *  For custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.  *  For priority avatars, none.
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The icon type of the avatar.
  ///
  /// * [String] entityId (required):
  ///   The ID of the project or issue type the avatar belongs to.
  ///
  /// * [String] size:
  ///   The size of the avatar image. If not provided the default size is returned.
  ///
  /// * [String] format:
  ///   The format to return the avatar image in. If not provided the original content format is returned.
  Future<void> getAvatarImageByOwner(String type, String entityId, { String? size, String? format, Future<void>? abortTrigger, }) async {
    final response = await getAvatarImageByOwnerWithHttpInfo(type, entityId, size: size, format: format, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get avatar image by type
  ///
  /// Returns the default project, issue type or priority avatar image.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The icon type of the avatar.
  ///
  /// * [String] size:
  ///   The size of the avatar image. If not provided the default size is returned.
  ///
  /// * [String] format:
  ///   The format to return the avatar image in. If not provided the original content format is returned.
  Future<Response> getAvatarImageByTypeWithHttpInfo(String type, { String? size, String? format, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/universal_avatar/view/type/{type}'
      .replaceAll('{type}', type);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (size != null) {
      queryParams.addAll(_queryParams('', 'size', size));
    }
    if (format != null) {
      queryParams.addAll(_queryParams('', 'format', format));
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

  /// Get avatar image by type
  ///
  /// Returns the default project, issue type or priority avatar image.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The icon type of the avatar.
  ///
  /// * [String] size:
  ///   The size of the avatar image. If not provided the default size is returned.
  ///
  /// * [String] format:
  ///   The format to return the avatar image in. If not provided the original content format is returned.
  Future<void> getAvatarImageByType(String type, { String? size, String? format, Future<void>? abortTrigger, }) async {
    final response = await getAvatarImageByTypeWithHttpInfo(type, size: size, format: format, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get avatars
  ///
  /// Returns the system and custom avatars for a project, issue type or priority.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  for custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.  *  for custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.  *  for system avatars, none.  *  for priority avatars, none.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  ///
  /// * [String] entityId (required):
  ///   The ID of the item the avatar is associated with.
  Future<Response> getAvatarsWithHttpInfo(String type, String entityId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'
      .replaceAll('{type}', type)
      .replaceAll('{entityId}', entityId);

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

  /// Get avatars
  ///
  /// Returns the system and custom avatars for a project, issue type or priority.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  for custom project avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the avatar belongs to.  *  for custom issue type avatars, *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for at least one project the issue type is used in.  *  for system avatars, none.  *  for priority avatars, none.
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  ///
  /// * [String] entityId (required):
  ///   The ID of the item the avatar is associated with.
  Future<Avatars?> getAvatars(String type, String entityId, { Future<void>? abortTrigger, }) async {
    final response = await getAvatarsWithHttpInfo(type, entityId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Avatars',) as Avatars;
    
    }
    return null;
  }

  /// Load avatar
  ///
  /// Loads a custom avatar for a project, issue type or priority.  Specify the avatar's local file location in the body of the request. Also, include the following headers:   *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).  *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.  For example:   `curl --request POST `  `--user email@example.com:<api_token> `  `--header 'X-Atlassian-Token: no-check' `  `--header 'Content-Type: image/< image_type>' `  `--data-binary \"<@/path/to/file/with/your/avatar>\" `  `--url 'https://your-domain.atlassian.net/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'`  The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.  The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.  After creating the avatar use:   *  [Update issue type](#api-rest-api-3-issuetype-id-put) to set it as the issue type's displayed avatar.  *  [Set project avatar](#api-rest-api-3-project-projectIdOrKey-avatar-put) to set it as the project's displayed avatar.  *  [Update priority](#api-rest-api-3-priority-id-put) to set it as the priority's displayed avatar.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  ///
  /// * [String] entityId (required):
  ///   The ID of the item the avatar is associated with.
  ///
  /// * [int] size (required):
  ///   The length of each side of the crop region.
  ///
  /// * [Object] body (required):
  ///
  /// * [int] x:
  ///   The X coordinate of the top-left corner of the crop region.
  ///
  /// * [int] y:
  ///   The Y coordinate of the top-left corner of the crop region.
  Future<Response> storeAvatarWithHttpInfo(String type, String entityId, int size, Object body, { int? x, int? y, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'
      .replaceAll('{type}', type)
      .replaceAll('{entityId}', entityId);

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
      queryParams.addAll(_queryParams('', 'size', size));

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

  /// Load avatar
  ///
  /// Loads a custom avatar for a project, issue type or priority.  Specify the avatar's local file location in the body of the request. Also, include the following headers:   *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).  *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.  For example:   `curl --request POST `  `--user email@example.com:<api_token> `  `--header 'X-Atlassian-Token: no-check' `  `--header 'Content-Type: image/< image_type>' `  `--data-binary \"<@/path/to/file/with/your/avatar>\" `  `--url 'https://your-domain.atlassian.net/rest/api/3/universal_avatar/type/{type}/owner/{entityId}'`  The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.  The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.  After creating the avatar use:   *  [Update issue type](#api-rest-api-3-issuetype-id-put) to set it as the issue type's displayed avatar.  *  [Set project avatar](#api-rest-api-3-project-projectIdOrKey-avatar-put) to set it as the project's displayed avatar.  *  [Update priority](#api-rest-api-3-priority-id-put) to set it as the priority's displayed avatar.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The avatar type.
  ///
  /// * [String] entityId (required):
  ///   The ID of the item the avatar is associated with.
  ///
  /// * [int] size (required):
  ///   The length of each side of the crop region.
  ///
  /// * [Object] body (required):
  ///
  /// * [int] x:
  ///   The X coordinate of the top-left corner of the crop region.
  ///
  /// * [int] y:
  ///   The Y coordinate of the top-left corner of the crop region.
  Future<Avatar?> storeAvatar(String type, String entityId, int size, Object body, { int? x, int? y, Future<void>? abortTrigger, }) async {
    final response = await storeAvatarWithHttpInfo(type, entityId, size, body, x: x, y: y, abortTrigger: abortTrigger,);
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
}
