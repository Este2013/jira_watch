//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueSecuritySchemesApi {
  IssueSecuritySchemesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add issue security levels
  ///
  /// Adds levels and levels' members to the issue security scheme. You can add up to 100 levels per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [AddSecuritySchemeLevelsRequestBean] addSecuritySchemeLevelsRequestBean (required):
  Future<Response> addSecurityLevelWithHttpInfo(String schemeId, AddSecuritySchemeLevelsRequestBean addSecuritySchemeLevelsRequestBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{schemeId}/level'
      .replaceAll('{schemeId}', schemeId);

    // ignore: prefer_final_locals
    Object? postBody = addSecuritySchemeLevelsRequestBean;

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

  /// Add issue security levels
  ///
  /// Adds levels and levels' members to the issue security scheme. You can add up to 100 levels per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [AddSecuritySchemeLevelsRequestBean] addSecuritySchemeLevelsRequestBean (required):
  Future<Object?> addSecurityLevel(String schemeId, AddSecuritySchemeLevelsRequestBean addSecuritySchemeLevelsRequestBean, { Future<void>? abortTrigger, }) async {
    final response = await addSecurityLevelWithHttpInfo(schemeId, addSecuritySchemeLevelsRequestBean, abortTrigger: abortTrigger,);
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

  /// Add issue security level members
  ///
  /// Adds members to the issue security level. You can add up to 100 members per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level.
  ///
  /// * [SecuritySchemeMembersRequest] securitySchemeMembersRequest (required):
  Future<Response> addSecurityLevelMembersWithHttpInfo(String schemeId, String levelId, SecuritySchemeMembersRequest securitySchemeMembersRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member'
      .replaceAll('{schemeId}', schemeId)
      .replaceAll('{levelId}', levelId);

    // ignore: prefer_final_locals
    Object? postBody = securitySchemeMembersRequest;

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

  /// Add issue security level members
  ///
  /// Adds members to the issue security level. You can add up to 100 members per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level.
  ///
  /// * [SecuritySchemeMembersRequest] securitySchemeMembersRequest (required):
  Future<Object?> addSecurityLevelMembers(String schemeId, String levelId, SecuritySchemeMembersRequest securitySchemeMembersRequest, { Future<void>? abortTrigger, }) async {
    final response = await addSecurityLevelMembersWithHttpInfo(schemeId, levelId, securitySchemeMembersRequest, abortTrigger: abortTrigger,);
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

  /// Associate security scheme to project
  ///
  /// Associates an issue security scheme with a project and remaps security levels of issues to the new levels, if provided.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AssociateSecuritySchemeWithProjectDetails] associateSecuritySchemeWithProjectDetails (required):
  Future<Response> associateSchemesToProjectsWithHttpInfo(AssociateSecuritySchemeWithProjectDetails associateSecuritySchemeWithProjectDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/project';

    // ignore: prefer_final_locals
    Object? postBody = associateSecuritySchemeWithProjectDetails;

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

  /// Associate security scheme to project
  ///
  /// Associates an issue security scheme with a project and remaps security levels of issues to the new levels, if provided.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [AssociateSecuritySchemeWithProjectDetails] associateSecuritySchemeWithProjectDetails (required):
  Future<void> associateSchemesToProjects(AssociateSecuritySchemeWithProjectDetails associateSecuritySchemeWithProjectDetails, { Future<void>? abortTrigger, }) async {
    final response = await associateSchemesToProjectsWithHttpInfo(associateSecuritySchemeWithProjectDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Create issue security scheme
  ///
  /// Creates a security scheme with security scheme levels and levels' members. You can create up to 100 security scheme levels and security scheme levels' members per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateIssueSecuritySchemeDetails] createIssueSecuritySchemeDetails (required):
  Future<Response> createIssueSecuritySchemeWithHttpInfo(CreateIssueSecuritySchemeDetails createIssueSecuritySchemeDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes';

    // ignore: prefer_final_locals
    Object? postBody = createIssueSecuritySchemeDetails;

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

  /// Create issue security scheme
  ///
  /// Creates a security scheme with security scheme levels and levels' members. You can create up to 100 security scheme levels and security scheme levels' members per request.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [CreateIssueSecuritySchemeDetails] createIssueSecuritySchemeDetails (required):
  Future<SecuritySchemeId?> createIssueSecurityScheme(CreateIssueSecuritySchemeDetails createIssueSecuritySchemeDetails, { Future<void>? abortTrigger, }) async {
    final response = await createIssueSecuritySchemeWithHttpInfo(createIssueSecuritySchemeDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SecuritySchemeId',) as SecuritySchemeId;
    
    }
    return null;
  }

  /// Delete issue security scheme
  ///
  /// Deletes an issue security scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  Future<Response> deleteSecuritySchemeWithHttpInfo(String schemeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{schemeId}'
      .replaceAll('{schemeId}', schemeId);

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

  /// Delete issue security scheme
  ///
  /// Deletes an issue security scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  Future<Object?> deleteSecurityScheme(String schemeId, { Future<void>? abortTrigger, }) async {
    final response = await deleteSecuritySchemeWithHttpInfo(schemeId, abortTrigger: abortTrigger,);
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

  /// Get issue security scheme
  ///
  /// Returns an issue security scheme along with its security levels.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project that uses the requested issue security scheme.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the issue security scheme. Use the [Get issue security schemes](#api-rest-api-3-issuesecurityschemes-get) operation to get a list of issue security scheme IDs.
  Future<Response> getIssueSecuritySchemeWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{id}'
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

  /// Get issue security scheme
  ///
  /// Returns an issue security scheme along with its security levels.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project that uses the requested issue security scheme.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the issue security scheme. Use the [Get issue security schemes](#api-rest-api-3-issuesecurityschemes-get) operation to get a list of issue security scheme IDs.
  Future<SecurityScheme?> getIssueSecurityScheme(int id, { Future<void>? abortTrigger, }) async {
    final response = await getIssueSecuritySchemeWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SecurityScheme',) as SecurityScheme;
    
    }
    return null;
  }

  /// Get issue security schemes
  ///
  /// Returns all [issue security schemes](https://confluence.atlassian.com/x/J4lKLg).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getIssueSecuritySchemesWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes';

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

  /// Get issue security schemes
  ///
  /// Returns all [issue security schemes](https://confluence.atlassian.com/x/J4lKLg).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<SecuritySchemes?> getIssueSecuritySchemes({ Future<void>? abortTrigger, }) async {
    final response = await getIssueSecuritySchemesWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SecuritySchemes',) as SecuritySchemes;
    
    }
    return null;
  }

  /// Get issue security level members
  ///
  /// Returns a [paginated](#pagination) list of issue security level members.  Only issue security level members in the context of classic projects are returned.  Filtering using parameters is inclusive: if you specify both security scheme IDs and level IDs, the result will include all issue security level members from the specified schemes and levels.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of issue security level member IDs. To include multiple issue security level members separate IDs with an ampersand: `id=10000&id=10001`.
  ///
  /// * [List<String>] schemeId:
  ///   The list of issue security scheme IDs. To include multiple issue security schemes separate IDs with an ampersand: `schemeId=10000&schemeId=10001`.
  ///
  /// * [List<String>] levelId:
  ///   The list of issue security level IDs. To include multiple issue security levels separate IDs with an ampersand: `levelId=10000&levelId=10001`.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about the custom field granted the permission  *  `group` Returns information about the group that is granted the permission  *  `projectRole` Returns information about the project role granted the permission  *  `user` Returns information about the user who is granted the permission
  Future<Response> getSecurityLevelMembersWithHttpInfo({ String? startAt, String? maxResults, List<String>? id, List<String>? schemeId, List<String>? levelId, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/level/member';

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
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (schemeId != null) {
      queryParams.addAll(_queryParams('multi', 'schemeId', schemeId));
    }
    if (levelId != null) {
      queryParams.addAll(_queryParams('multi', 'levelId', levelId));
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

  /// Get issue security level members
  ///
  /// Returns a [paginated](#pagination) list of issue security level members.  Only issue security level members in the context of classic projects are returned.  Filtering using parameters is inclusive: if you specify both security scheme IDs and level IDs, the result will include all issue security level members from the specified schemes and levels.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of issue security level member IDs. To include multiple issue security level members separate IDs with an ampersand: `id=10000&id=10001`.
  ///
  /// * [List<String>] schemeId:
  ///   The list of issue security scheme IDs. To include multiple issue security schemes separate IDs with an ampersand: `schemeId=10000&schemeId=10001`.
  ///
  /// * [List<String>] levelId:
  ///   The list of issue security level IDs. To include multiple issue security levels separate IDs with an ampersand: `levelId=10000&levelId=10001`.
  ///
  /// * [String] expand:
  ///   Use expand to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `all` Returns all expandable information  *  `field` Returns information about the custom field granted the permission  *  `group` Returns information about the group that is granted the permission  *  `projectRole` Returns information about the project role granted the permission  *  `user` Returns information about the user who is granted the permission
  Future<PageBeanSecurityLevelMember?> getSecurityLevelMembers({ String? startAt, String? maxResults, List<String>? id, List<String>? schemeId, List<String>? levelId, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getSecurityLevelMembersWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, schemeId: schemeId, levelId: levelId, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanSecurityLevelMember',) as PageBeanSecurityLevelMember;
    
    }
    return null;
  }

  /// Get issue security levels
  ///
  /// Returns a [paginated](#pagination) list of issue security levels.  Only issue security levels in the context of classic projects are returned.  Filtering using IDs is inclusive: if you specify both security scheme IDs and level IDs, the result will include both specified issue security levels and all issue security levels from the specified schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of issue security scheme level IDs. To include multiple issue security levels, separate IDs with an ampersand: `id=10000&id=10001`.
  ///
  /// * [List<String>] schemeId:
  ///   The list of issue security scheme IDs. To include multiple issue security schemes, separate IDs with an ampersand: `schemeId=10000&schemeId=10001`.
  ///
  /// * [bool] onlyDefault:
  ///   When set to true, returns multiple default levels for each security scheme containing a default. If you provide scheme and level IDs not associated with the default, returns an empty page. The default value is false.
  Future<Response> getSecurityLevelsWithHttpInfo({ String? startAt, String? maxResults, List<String>? id, List<String>? schemeId, bool? onlyDefault, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/level';

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
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (schemeId != null) {
      queryParams.addAll(_queryParams('multi', 'schemeId', schemeId));
    }
    if (onlyDefault != null) {
      queryParams.addAll(_queryParams('', 'onlyDefault', onlyDefault));
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

  /// Get issue security levels
  ///
  /// Returns a [paginated](#pagination) list of issue security levels.  Only issue security levels in the context of classic projects are returned.  Filtering using IDs is inclusive: if you specify both security scheme IDs and level IDs, the result will include both specified issue security levels and all issue security levels from the specified schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of issue security scheme level IDs. To include multiple issue security levels, separate IDs with an ampersand: `id=10000&id=10001`.
  ///
  /// * [List<String>] schemeId:
  ///   The list of issue security scheme IDs. To include multiple issue security schemes, separate IDs with an ampersand: `schemeId=10000&schemeId=10001`.
  ///
  /// * [bool] onlyDefault:
  ///   When set to true, returns multiple default levels for each security scheme containing a default. If you provide scheme and level IDs not associated with the default, returns an empty page. The default value is false.
  Future<PageBeanSecurityLevel?> getSecurityLevels({ String? startAt, String? maxResults, List<String>? id, List<String>? schemeId, bool? onlyDefault, Future<void>? abortTrigger, }) async {
    final response = await getSecurityLevelsWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, schemeId: schemeId, onlyDefault: onlyDefault, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanSecurityLevel',) as PageBeanSecurityLevel;
    
    }
    return null;
  }

  /// Remove issue security level
  ///
  /// Deletes an issue security level.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level to remove.
  ///
  /// * [String] replaceWith:
  ///   The ID of the issue security level that will replace the currently selected level.
  Future<Response> removeLevelWithHttpInfo(String schemeId, String levelId, { String? replaceWith, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}'
      .replaceAll('{schemeId}', schemeId)
      .replaceAll('{levelId}', levelId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (replaceWith != null) {
      queryParams.addAll(_queryParams('', 'replaceWith', replaceWith));
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

  /// Remove issue security level
  ///
  /// Deletes an issue security level.  This operation is [asynchronous](#async). Follow the `location` link in the response to determine the status of the task and use [Get task](#api-rest-api-3-task-taskId-get) to obtain subsequent updates.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level to remove.
  ///
  /// * [String] replaceWith:
  ///   The ID of the issue security level that will replace the currently selected level.
  Future<void> removeLevel(String schemeId, String levelId, { String? replaceWith, Future<void>? abortTrigger, }) async {
    final response = await removeLevelWithHttpInfo(schemeId, levelId, replaceWith: replaceWith, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Remove member from issue security level
  ///
  /// Removes an issue security level member from an issue security scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level.
  ///
  /// * [String] memberId (required):
  ///   The ID of the issue security level member to be removed.
  Future<Response> removeMemberFromSecurityLevelWithHttpInfo(String schemeId, String levelId, String memberId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}/member/{memberId}'
      .replaceAll('{schemeId}', schemeId)
      .replaceAll('{levelId}', levelId)
      .replaceAll('{memberId}', memberId);

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

  /// Remove member from issue security level
  ///
  /// Removes an issue security level member from an issue security scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level.
  ///
  /// * [String] memberId (required):
  ///   The ID of the issue security level member to be removed.
  Future<Object?> removeMemberFromSecurityLevel(String schemeId, String levelId, String memberId, { Future<void>? abortTrigger, }) async {
    final response = await removeMemberFromSecurityLevelWithHttpInfo(schemeId, levelId, memberId, abortTrigger: abortTrigger,);
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

  /// Get projects using issue security schemes
  ///
  /// Returns a [paginated](#pagination) mapping of projects that are using security schemes. You can provide either one or multiple security scheme IDs or project IDs to filter by. If you don't provide any, this will return a list of all mappings. Only issue security schemes in the context of classic projects are supported. **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] issueSecuritySchemeId:
  ///   The list of security scheme IDs to be filtered out.
  ///
  /// * [List<String>] projectId:
  ///   The list of project IDs to be filtered out.
  Future<Response> searchProjectsUsingSecuritySchemesWithHttpInfo({ String? startAt, String? maxResults, List<String>? issueSecuritySchemeId, List<String>? projectId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/project';

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
    if (issueSecuritySchemeId != null) {
      queryParams.addAll(_queryParams('multi', 'issueSecuritySchemeId', issueSecuritySchemeId));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
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

  /// Get projects using issue security schemes
  ///
  /// Returns a [paginated](#pagination) mapping of projects that are using security schemes. You can provide either one or multiple security scheme IDs or project IDs to filter by. If you don't provide any, this will return a list of all mappings. Only issue security schemes in the context of classic projects are supported. **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] issueSecuritySchemeId:
  ///   The list of security scheme IDs to be filtered out.
  ///
  /// * [List<String>] projectId:
  ///   The list of project IDs to be filtered out.
  Future<PageBeanIssueSecuritySchemeToProjectMapping?> searchProjectsUsingSecuritySchemes({ String? startAt, String? maxResults, List<String>? issueSecuritySchemeId, List<String>? projectId, Future<void>? abortTrigger, }) async {
    final response = await searchProjectsUsingSecuritySchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, issueSecuritySchemeId: issueSecuritySchemeId, projectId: projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanIssueSecuritySchemeToProjectMapping',) as PageBeanIssueSecuritySchemeToProjectMapping;
    
    }
    return null;
  }

  /// Search issue security schemes
  ///
  /// Returns a [paginated](#pagination) list of issue security schemes.   If you specify the project ID parameter, the result will contain issue security schemes and related project IDs you filter by. Use \\{@link IssueSecuritySchemeResource\\#searchProjectsUsingSecuritySchemes(String, String, Set, Set)\\} to obtain all projects related to scheme.  Only issue security schemes in the context of classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of issue security scheme IDs. To include multiple issue security scheme IDs, separate IDs with an ampersand: `id=10000&id=10001`.
  ///
  /// * [List<String>] projectId:
  ///   The list of project IDs. To include multiple project IDs, separate IDs with an ampersand: `projectId=10000&projectId=10001`.
  Future<Response> searchSecuritySchemesWithHttpInfo({ String? startAt, String? maxResults, List<String>? id, List<String>? projectId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/search';

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
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
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

  /// Search issue security schemes
  ///
  /// Returns a [paginated](#pagination) list of issue security schemes.   If you specify the project ID parameter, the result will contain issue security schemes and related project IDs you filter by. Use \\{@link IssueSecuritySchemeResource\\#searchProjectsUsingSecuritySchemes(String, String, Set, Set)\\} to obtain all projects related to scheme.  Only issue security schemes in the context of classic projects are returned.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [String] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] id:
  ///   The list of issue security scheme IDs. To include multiple issue security scheme IDs, separate IDs with an ampersand: `id=10000&id=10001`.
  ///
  /// * [List<String>] projectId:
  ///   The list of project IDs. To include multiple project IDs, separate IDs with an ampersand: `projectId=10000&projectId=10001`.
  Future<PageBeanSecuritySchemeWithProjects?> searchSecuritySchemes({ String? startAt, String? maxResults, List<String>? id, List<String>? projectId, Future<void>? abortTrigger, }) async {
    final response = await searchSecuritySchemesWithHttpInfo(startAt: startAt, maxResults: maxResults, id: id, projectId: projectId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanSecuritySchemeWithProjects',) as PageBeanSecuritySchemeWithProjects;
    
    }
    return null;
  }

  /// Set default issue security levels
  ///
  /// Sets default issue security levels for schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [SetDefaultLevelsRequest] setDefaultLevelsRequest (required):
  Future<Response> setDefaultLevelsWithHttpInfo(SetDefaultLevelsRequest setDefaultLevelsRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/level/default';

    // ignore: prefer_final_locals
    Object? postBody = setDefaultLevelsRequest;

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

  /// Set default issue security levels
  ///
  /// Sets default issue security levels for schemes.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [SetDefaultLevelsRequest] setDefaultLevelsRequest (required):
  Future<Object?> setDefaultLevels(SetDefaultLevelsRequest setDefaultLevelsRequest, { Future<void>? abortTrigger, }) async {
    final response = await setDefaultLevelsWithHttpInfo(setDefaultLevelsRequest, abortTrigger: abortTrigger,);
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

  /// Update issue security scheme
  ///
  /// Updates the issue security scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [UpdateIssueSecuritySchemeRequestBean] updateIssueSecuritySchemeRequestBean (required):
  Future<Response> updateIssueSecuritySchemeWithHttpInfo(String id, UpdateIssueSecuritySchemeRequestBean updateIssueSecuritySchemeRequestBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = updateIssueSecuritySchemeRequestBean;

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

  /// Update issue security scheme
  ///
  /// Updates the issue security scheme.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the issue security scheme.
  ///
  /// * [UpdateIssueSecuritySchemeRequestBean] updateIssueSecuritySchemeRequestBean (required):
  Future<Object?> updateIssueSecurityScheme(String id, UpdateIssueSecuritySchemeRequestBean updateIssueSecuritySchemeRequestBean, { Future<void>? abortTrigger, }) async {
    final response = await updateIssueSecuritySchemeWithHttpInfo(id, updateIssueSecuritySchemeRequestBean, abortTrigger: abortTrigger,);
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

  /// Update issue security level
  ///
  /// Updates the issue security level.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme level belongs to.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level to update.
  ///
  /// * [UpdateIssueSecurityLevelDetails] updateIssueSecurityLevelDetails (required):
  Future<Response> updateSecurityLevelWithHttpInfo(String schemeId, String levelId, UpdateIssueSecurityLevelDetails updateIssueSecurityLevelDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuesecurityschemes/{schemeId}/level/{levelId}'
      .replaceAll('{schemeId}', schemeId)
      .replaceAll('{levelId}', levelId);

    // ignore: prefer_final_locals
    Object? postBody = updateIssueSecurityLevelDetails;

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

  /// Update issue security level
  ///
  /// Updates the issue security level.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] schemeId (required):
  ///   The ID of the issue security scheme level belongs to.
  ///
  /// * [String] levelId (required):
  ///   The ID of the issue security level to update.
  ///
  /// * [UpdateIssueSecurityLevelDetails] updateIssueSecurityLevelDetails (required):
  Future<Object?> updateSecurityLevel(String schemeId, String levelId, UpdateIssueSecurityLevelDetails updateIssueSecurityLevelDetails, { Future<void>? abortTrigger, }) async {
    final response = await updateSecurityLevelWithHttpInfo(schemeId, levelId, updateIssueSecurityLevelDetails, abortTrigger: abortTrigger,);
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
