//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueTypesApi {
  IssueTypesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create issue type
  ///
  /// Creates an issue type.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [IssueTypeCreateBean] issueTypeCreateBean (required):
  Future<Response> createIssueTypeWithHttpInfo(IssueTypeCreateBean issueTypeCreateBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype';

    // ignore: prefer_final_locals
    Object? postBody = issueTypeCreateBean;

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

  /// Create issue type
  ///
  /// Creates an issue type.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [IssueTypeCreateBean] issueTypeCreateBean (required):
  Future<IssueTypeDetails?> createIssueType(IssueTypeCreateBean issueTypeCreateBean, { Future<void>? abortTrigger, }) async {
    final response = await createIssueTypeWithHttpInfo(issueTypeCreateBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypeDetails',) as IssueTypeDetails;
    
    }
    return null;
  }

  /// Load issue type avatar
  ///
  /// Loads an avatar for the issue type.  Specify the avatar's local file location in the body of the request. Also, include the following headers:   *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).  *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.  For example:   `curl --request POST \\ --user email@example.com:<api_token> \\ --header 'X-Atlassian-Token: no-check' \\ --header 'Content-Type: image/< image_type>' \\ --data-binary \"<@/path/to/file/with/your/avatar>\" \\ --url 'https://your-domain.atlassian.net/rest/api/3/issuetype/{issueTypeId}'This`  The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.  The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.  After creating the avatar, use [ Update issue type](#api-rest-api-3-issuetype-id-put) to set it as the issue type's displayed avatar.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
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
  Future<Response> createIssueTypeAvatarWithHttpInfo(String id, int size, Object body, { int? x, int? y, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{id}/avatar2'
      .replaceAll('{id}', id);

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

  /// Load issue type avatar
  ///
  /// Loads an avatar for the issue type.  Specify the avatar's local file location in the body of the request. Also, include the following headers:   *  `X-Atlassian-Token: no-check` To prevent XSRF protection blocking the request, for more information see [Special Headers](#special-request-headers).  *  `Content-Type: image/image type` Valid image types are JPEG, GIF, or PNG.  For example:   `curl --request POST \\ --user email@example.com:<api_token> \\ --header 'X-Atlassian-Token: no-check' \\ --header 'Content-Type: image/< image_type>' \\ --data-binary \"<@/path/to/file/with/your/avatar>\" \\ --url 'https://your-domain.atlassian.net/rest/api/3/issuetype/{issueTypeId}'This`  The avatar is cropped to a square. If no crop parameters are specified, the square originates at the top left of the image. The length of the square's sides is set to the smaller of the height or width of the image.  The cropped image is then used to create avatars of 16x16, 24x24, 32x32, and 48x48 in size.  After creating the avatar, use [ Update issue type](#api-rest-api-3-issuetype-id-put) to set it as the issue type's displayed avatar.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
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
  Future<Avatar?> createIssueTypeAvatar(String id, int size, Object body, { int? x, int? y, Future<void>? abortTrigger, }) async {
    final response = await createIssueTypeAvatarWithHttpInfo(id, size, body, x: x, y: y, abortTrigger: abortTrigger,);
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

  /// Delete issue type
  ///
  /// Deletes the issue type. If the issue type is in use, all uses are updated with the alternative issue type (`alternativeIssueTypeId`). A list of alternative issue types are obtained from the [Get alternative issue types](#api-rest-api-3-issuetype-id-alternatives-get) resource.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  ///
  /// * [String] alternativeIssueTypeId:
  ///   The ID of the replacement issue type.
  Future<Response> deleteIssueTypeWithHttpInfo(String id, { String? alternativeIssueTypeId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (alternativeIssueTypeId != null) {
      queryParams.addAll(_queryParams('', 'alternativeIssueTypeId', alternativeIssueTypeId));
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

  /// Delete issue type
  ///
  /// Deletes the issue type. If the issue type is in use, all uses are updated with the alternative issue type (`alternativeIssueTypeId`). A list of alternative issue types are obtained from the [Get alternative issue types](#api-rest-api-3-issuetype-id-alternatives-get) resource.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  ///
  /// * [String] alternativeIssueTypeId:
  ///   The ID of the replacement issue type.
  Future<void> deleteIssueType(String id, { String? alternativeIssueTypeId, Future<void>? abortTrigger, }) async {
    final response = await deleteIssueTypeWithHttpInfo(id, alternativeIssueTypeId: alternativeIssueTypeId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get alternative issue types
  ///
  /// Returns a list of issue types that can be used to replace the issue type. The alternative issue types are those assigned to the same workflow scheme, field configuration scheme, and screen scheme.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  Future<Response> getAlternativeIssueTypesWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{id}/alternatives'
      .replaceAll('{id}', id);

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

  /// Get alternative issue types
  ///
  /// Returns a list of issue types that can be used to replace the issue type. The alternative issue types are those assigned to the same workflow scheme, field configuration scheme, and screen scheme.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  Future<List<IssueTypeDetails>?> getAlternativeIssueTypes(String id, { Future<void>? abortTrigger, }) async {
    final response = await getAlternativeIssueTypesWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IssueTypeDetails>') as List)
        .cast<IssueTypeDetails>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get all issue types for user
  ///
  /// Returns all issue types.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Issue types are only returned as follows:   *  if the user has the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), all issue types are returned.  *  if the user has the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, the issue types associated with the projects the user has permission to browse are returned.  *  if the user is anonymous then they will be able to access projects with the *Browse projects* for anonymous users  *  if the user authentication is incorrect they will fall back to anonymous
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getIssueAllTypesWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype';

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

  /// Get all issue types for user
  ///
  /// Returns all issue types.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** Issue types are only returned as follows:   *  if the user has the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), all issue types are returned.  *  if the user has the *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for one or more projects, the issue types associated with the projects the user has permission to browse are returned.  *  if the user is anonymous then they will be able to access projects with the *Browse projects* for anonymous users  *  if the user authentication is incorrect they will fall back to anonymous
  Future<List<IssueTypeDetails>?> getIssueAllTypes({ Future<void>? abortTrigger, }) async {
    final response = await getIssueAllTypesWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IssueTypeDetails>') as List)
        .cast<IssueTypeDetails>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get issue type
  ///
  /// Returns an issue type.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) in a project the issue type is associated with or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  Future<Response> getIssueTypeWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{id}'
      .replaceAll('{id}', id);

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

  /// Get issue type
  ///
  /// Returns an issue type.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) in a project the issue type is associated with or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  Future<IssueTypeDetails?> getIssueType(String id, { Future<void>? abortTrigger, }) async {
    final response = await getIssueTypeWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypeDetails',) as IssueTypeDetails;
    
    }
    return null;
  }

  /// Get issue types for project
  ///
  /// Returns issue types for a project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) in the relevant project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] projectId (required):
  ///   The ID of the project.
  ///
  /// * [int] level:
  ///   The level of the issue type to filter by. Use:   *  `-1` for Subtask.  *  `0` for Base.  *  `1` for Epic.
  Future<Response> getIssueTypesForProjectWithHttpInfo(int projectId, { int? level, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/project';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'projectId', projectId));
    if (level != null) {
      queryParams.addAll(_queryParams('', 'level', level));
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

  /// Get issue types for project
  ///
  /// Returns issue types for a project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) in the relevant project or *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] projectId (required):
  ///   The ID of the project.
  ///
  /// * [int] level:
  ///   The level of the issue type to filter by. Use:   *  `-1` for Subtask.  *  `0` for Base.  *  `1` for Epic.
  Future<List<IssueTypeDetails>?> getIssueTypesForProject(int projectId, { int? level, Future<void>? abortTrigger, }) async {
    final response = await getIssueTypesForProjectWithHttpInfo(projectId, level: level, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<IssueTypeDetails>') as List)
        .cast<IssueTypeDetails>()
        .toList(growable: false);

    }
    return null;
  }

  /// Update issue type
  ///
  /// Updates the issue type.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  ///
  /// * [IssueTypeUpdateBean] issueTypeUpdateBean (required):
  Future<Response> updateIssueTypeWithHttpInfo(String id, IssueTypeUpdateBean issueTypeUpdateBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = issueTypeUpdateBean;

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

  /// Update issue type
  ///
  /// Updates the issue type.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue type.
  ///
  /// * [IssueTypeUpdateBean] issueTypeUpdateBean (required):
  Future<IssueTypeDetails?> updateIssueType(String id, IssueTypeUpdateBean issueTypeUpdateBean, { Future<void>? abortTrigger, }) async {
    final response = await updateIssueTypeWithHttpInfo(id, issueTypeUpdateBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'IssueTypeDetails',) as IssueTypeDetails;
    
    }
    return null;
  }
}
