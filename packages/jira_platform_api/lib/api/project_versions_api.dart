//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectVersionsApi {
  ProjectVersionsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create related work
  ///
  /// Creates a related work for the given version. You can only create a generic link type of related works via this API. relatedWorkId will be auto-generated UUID, that does not need to be provided.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Resolve issues:* and *Edit issues* [Managing project permissions](https://confluence.atlassian.com/adminjiraserver/managing-project-permissions-938847145.html) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [VersionRelatedWork] versionRelatedWork (required):
  Future<Response> createRelatedWorkWithHttpInfo(String id, VersionRelatedWork versionRelatedWork, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/relatedwork'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = versionRelatedWork;

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

  /// Create related work
  ///
  /// Creates a related work for the given version. You can only create a generic link type of related works via this API. relatedWorkId will be auto-generated UUID, that does not need to be provided.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Resolve issues:* and *Edit issues* [Managing project permissions](https://confluence.atlassian.com/adminjiraserver/managing-project-permissions-938847145.html) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///
  /// * [VersionRelatedWork] versionRelatedWork (required):
  Future<VersionRelatedWork?> createRelatedWork(String id, VersionRelatedWork versionRelatedWork, { Future<void>? abortTrigger, }) async {
    final response = await createRelatedWorkWithHttpInfo(id, versionRelatedWork, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VersionRelatedWork',) as VersionRelatedWork;
    
    }
    return null;
  }

  /// Create version
  ///
  /// Creates a project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the version is added to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Version] version (required):
  Future<Response> createVersionWithHttpInfo(Version version, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version';

    // ignore: prefer_final_locals
    Object? postBody = version;

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

  /// Create version
  ///
  /// Creates a project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project the version is added to.
  ///
  /// Parameters:
  ///
  /// * [Version] version (required):
  Future<Version?> createVersion(Version version, { Future<void>? abortTrigger, }) async {
    final response = await createVersionWithHttpInfo(version, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Version',) as Version;
    
    }
    return null;
  }

  /// Delete and replace version
  ///
  /// Deletes a project version.  Alternative versions can be provided to update issues that use the deleted version in `fixVersion`, `affectedVersion`, or any version picker custom fields. If alternatives are not provided, occurrences of `fixVersion`, `affectedVersion`, and any version picker custom field, that contain the deleted version, are cleared. Any replacement version must be in the same project as the version being deleted and cannot be the version being deleted.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [DeleteAndReplaceVersionBean] deleteAndReplaceVersionBean (required):
  Future<Response> deleteAndReplaceVersionWithHttpInfo(String id, DeleteAndReplaceVersionBean deleteAndReplaceVersionBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/removeAndSwap'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = deleteAndReplaceVersionBean;

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

  /// Delete and replace version
  ///
  /// Deletes a project version.  Alternative versions can be provided to update issues that use the deleted version in `fixVersion`, `affectedVersion`, or any version picker custom fields. If alternatives are not provided, occurrences of `fixVersion`, `affectedVersion`, and any version picker custom field, that contain the deleted version, are cleared. Any replacement version must be in the same project as the version being deleted and cannot be the version being deleted.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [DeleteAndReplaceVersionBean] deleteAndReplaceVersionBean (required):
  Future<Object?> deleteAndReplaceVersion(String id, DeleteAndReplaceVersionBean deleteAndReplaceVersionBean, { Future<void>? abortTrigger, }) async {
    final response = await deleteAndReplaceVersionWithHttpInfo(id, deleteAndReplaceVersionBean, abortTrigger: abortTrigger,);
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

  /// Delete related work
  ///
  /// Deletes the given related work for the given version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Resolve issues:* and *Edit issues* [Managing project permissions](https://confluence.atlassian.com/adminjiraserver/managing-project-permissions-938847145.html) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] versionId (required):
  ///   The ID of the version that the target related work belongs to.
  ///
  /// * [String] relatedWorkId (required):
  ///   The ID of the related work to delete.
  Future<Response> deleteRelatedWorkWithHttpInfo(String versionId, String relatedWorkId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{versionId}/relatedwork/{relatedWorkId}'
      .replaceAll('{versionId}', versionId)
      .replaceAll('{relatedWorkId}', relatedWorkId);

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

  /// Delete related work
  ///
  /// Deletes the given related work for the given version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Resolve issues:* and *Edit issues* [Managing project permissions](https://confluence.atlassian.com/adminjiraserver/managing-project-permissions-938847145.html) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] versionId (required):
  ///   The ID of the version that the target related work belongs to.
  ///
  /// * [String] relatedWorkId (required):
  ///   The ID of the related work to delete.
  Future<void> deleteRelatedWork(String versionId, String relatedWorkId, { Future<void>? abortTrigger, }) async {
    final response = await deleteRelatedWorkWithHttpInfo(versionId, relatedWorkId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete version
  ///
  /// Deletes a project version.  Deprecated, use [ Delete and replace version](#api-rest-api-3-version-id-removeAndSwap-post) that supports swapping version values in custom fields, in addition to the swapping for `fixVersion` and `affectedVersion` provided in this resource.  Alternative versions can be provided to update issues that use the deleted version in `fixVersion` or `affectedVersion`. If alternatives are not provided, occurrences of `fixVersion` and `affectedVersion` that contain the deleted version are cleared.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [String] moveFixIssuesTo:
  ///   The ID of the version to update `fixVersion` to when the field contains the deleted version. The replacement version must be in the same project as the version being deleted and cannot be the version being deleted.
  ///
  /// * [String] moveAffectedIssuesTo:
  ///   The ID of the version to update `affectedVersion` to when the field contains the deleted version. The replacement version must be in the same project as the version being deleted and cannot be the version being deleted.
  Future<Response> deleteVersionWithHttpInfo(String id, { String? moveFixIssuesTo, String? moveAffectedIssuesTo, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (moveFixIssuesTo != null) {
      queryParams.addAll(_queryParams('', 'moveFixIssuesTo', moveFixIssuesTo));
    }
    if (moveAffectedIssuesTo != null) {
      queryParams.addAll(_queryParams('', 'moveAffectedIssuesTo', moveAffectedIssuesTo));
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

  /// Delete version
  ///
  /// Deletes a project version.  Deprecated, use [ Delete and replace version](#api-rest-api-3-version-id-removeAndSwap-post) that supports swapping version values in custom fields, in addition to the swapping for `fixVersion` and `affectedVersion` provided in this resource.  Alternative versions can be provided to update issues that use the deleted version in `fixVersion` or `affectedVersion`. If alternatives are not provided, occurrences of `fixVersion` and `affectedVersion` that contain the deleted version are cleared.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [String] moveFixIssuesTo:
  ///   The ID of the version to update `fixVersion` to when the field contains the deleted version. The replacement version must be in the same project as the version being deleted and cannot be the version being deleted.
  ///
  /// * [String] moveAffectedIssuesTo:
  ///   The ID of the version to update `affectedVersion` to when the field contains the deleted version. The replacement version must be in the same project as the version being deleted and cannot be the version being deleted.
  Future<void> deleteVersion(String id, { String? moveFixIssuesTo, String? moveAffectedIssuesTo, Future<void>? abortTrigger, }) async {
    final response = await deleteVersionWithHttpInfo(id, moveFixIssuesTo: moveFixIssuesTo, moveAffectedIssuesTo: moveAffectedIssuesTo, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get project versions
  ///
  /// Returns all versions in a project. The response is not paginated. Use [Get project versions paginated](#api-rest-api-3-project-projectIdOrKey-version-get) if you want to get the versions in a project with pagination.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts `operations`, which returns actions that can be performed on the version.
  Future<Response> getProjectVersionsWithHttpInfo(String projectIdOrKey, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/versions'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

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

  /// Get project versions
  ///
  /// Returns all versions in a project. The response is not paginated. Use [Get project versions paginated](#api-rest-api-3-project-projectIdOrKey-version-get) if you want to get the versions in a project with pagination.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts `operations`, which returns actions that can be performed on the version.
  Future<List<Version>?> getProjectVersions(String projectIdOrKey, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getProjectVersionsWithHttpInfo(projectIdOrKey, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Version>') as List)
        .cast<Version>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get project versions paginated
  ///
  /// Returns a [paginated](#pagination) list of all versions in a project. See the [Get project versions](#api-rest-api-3-project-projectIdOrKey-versions-get) resource if you want to get a full list of versions without pagination.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `description` Sorts by version description.  *  `name` Sorts by version name.  *  `releaseDate` Sorts by release date, starting with the oldest date. Versions with no release date are listed last.  *  `sequence` Sorts by the order of appearance in the user interface.  *  `startDate` Sorts by start date, starting with the oldest date. Versions with no start date are listed last.
  ///
  /// * [String] query:
  ///   Filter the results using a literal string. Versions with matching `name` or `description` are returned (case insensitive).
  ///
  /// * [String] status:
  ///   A list of status values used to filter the results by version status. This parameter accepts a comma-separated list. The status values are `released`, `unreleased`, and `archived`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `issuesstatus` Returns the number of issues in each status category for each version.  *  `operations` Returns actions that can be performed on the specified version.  *  `driver` Returns the Atlassian account ID of the version driver.  *  `approvers` Returns a list containing the approvers for this version.
  Future<Response> getProjectVersionsPaginatedWithHttpInfo(String projectIdOrKey, { int? startAt, int? maxResults, String? orderBy, String? query, String? status, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/version'
      .replaceAll('{projectIdOrKey}', projectIdOrKey);

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
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
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

  /// Get project versions paginated
  ///
  /// Returns a [paginated](#pagination) list of all versions in a project. See the [Get project versions](#api-rest-api-3-project-projectIdOrKey-versions-get) resource if you want to get a full list of versions without pagination.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `description` Sorts by version description.  *  `name` Sorts by version name.  *  `releaseDate` Sorts by release date, starting with the oldest date. Versions with no release date are listed last.  *  `sequence` Sorts by the order of appearance in the user interface.  *  `startDate` Sorts by start date, starting with the oldest date. Versions with no start date are listed last.
  ///
  /// * [String] query:
  ///   Filter the results using a literal string. Versions with matching `name` or `description` are returned (case insensitive).
  ///
  /// * [String] status:
  ///   A list of status values used to filter the results by version status. This parameter accepts a comma-separated list. The status values are `released`, `unreleased`, and `archived`.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts a comma-separated list. Expand options include:   *  `issuesstatus` Returns the number of issues in each status category for each version.  *  `operations` Returns actions that can be performed on the specified version.  *  `driver` Returns the Atlassian account ID of the version driver.  *  `approvers` Returns a list containing the approvers for this version.
  Future<PageBeanVersion?> getProjectVersionsPaginated(String projectIdOrKey, { int? startAt, int? maxResults, String? orderBy, String? query, String? status, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getProjectVersionsPaginatedWithHttpInfo(projectIdOrKey, startAt: startAt, maxResults: maxResults, orderBy: orderBy, query: query, status: status, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanVersion',) as PageBeanVersion;
    
    }
    return null;
  }

  /// Get related work
  ///
  /// Returns related work items for the given version id.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  Future<Response> getRelatedWorkWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/relatedwork'
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

  /// Get related work
  ///
  /// Returns related work items for the given version id.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  Future<List<VersionRelatedWork>?> getRelatedWork(String id, { Future<void>? abortTrigger, }) async {
    final response = await getRelatedWorkWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<VersionRelatedWork>') as List)
        .cast<VersionRelatedWork>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get version
  ///
  /// Returns a project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about version in the response. This parameter accepts a comma-separated list. Expand options include:   *  `operations` Returns the list of operations available for this version.  *  `issuesstatus` Returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property represents the number of issues with a status other than *to do*, *in progress*, and *done*.  *  `driver` Returns the Atlassian account ID of the version driver.  *  `approvers` Returns a list containing the Atlassian account IDs of approvers for this version.
  Future<Response> getVersionWithHttpInfo(String id, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}'
      .replaceAll('{id}', id);

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

  /// Get version
  ///
  /// Returns a project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about version in the response. This parameter accepts a comma-separated list. Expand options include:   *  `operations` Returns the list of operations available for this version.  *  `issuesstatus` Returns the count of issues in this version for each of the status categories *to do*, *in progress*, *done*, and *unmapped*. The *unmapped* property represents the number of issues with a status other than *to do*, *in progress*, and *done*.  *  `driver` Returns the Atlassian account ID of the version driver.  *  `approvers` Returns a list containing the Atlassian account IDs of approvers for this version.
  Future<Version?> getVersion(String id, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await getVersionWithHttpInfo(id, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Version',) as Version;
    
    }
    return null;
  }

  /// Get version's related issues count
  ///
  /// Returns the following counts for a version:   *  Number of issues where the `fixVersion` is set to the version.  *  Number of issues where the `affectedVersion` is set to the version.  *  Number of issues where a version custom field is set to the version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  Future<Response> getVersionRelatedIssuesWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/relatedIssueCounts'
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

  /// Get version's related issues count
  ///
  /// Returns the following counts for a version:   *  Number of issues where the `fixVersion` is set to the version.  *  Number of issues where the `affectedVersion` is set to the version.  *  Number of issues where a version custom field is set to the version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  Future<VersionIssueCounts?> getVersionRelatedIssues(String id, { Future<void>? abortTrigger, }) async {
    final response = await getVersionRelatedIssuesWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VersionIssueCounts',) as VersionIssueCounts;
    
    }
    return null;
  }

  /// Get version's unresolved issues count
  ///
  /// Returns counts of the issues and unresolved issues for the project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  Future<Response> getVersionUnresolvedIssuesWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/unresolvedIssueCount'
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

  /// Get version's unresolved issues count
  ///
  /// Returns counts of the issues and unresolved issues for the project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  Future<VersionUnresolvedIssuesCount?> getVersionUnresolvedIssues(String id, { Future<void>? abortTrigger, }) async {
    final response = await getVersionUnresolvedIssuesWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VersionUnresolvedIssuesCount',) as VersionUnresolvedIssuesCount;
    
    }
    return null;
  }

  /// Merge versions
  ///
  /// Merges two project versions. The merge is completed by deleting the version specified in `id` and replacing any occurrences of its ID in `fixVersion` with the version ID specified in `moveIssuesTo`.  Consider using [ Delete and replace version](#api-rest-api-3-version-id-removeAndSwap-post) instead. This resource supports swapping version values in `fixVersion`, `affectedVersion`, and custom fields.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version to delete.
  ///
  /// * [String] moveIssuesTo (required):
  ///   The ID of the version to merge into.
  Future<Response> mergeVersionsWithHttpInfo(String id, String moveIssuesTo, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/mergeto/{moveIssuesTo}'
      .replaceAll('{id}', id)
      .replaceAll('{moveIssuesTo}', moveIssuesTo);

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

  /// Merge versions
  ///
  /// Merges two project versions. The merge is completed by deleting the version specified in `id` and replacing any occurrences of its ID in `fixVersion` with the version ID specified in `moveIssuesTo`.  Consider using [ Delete and replace version](#api-rest-api-3-version-id-removeAndSwap-post) instead. This resource supports swapping version values in `fixVersion`, `affectedVersion`, and custom fields.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version to delete.
  ///
  /// * [String] moveIssuesTo (required):
  ///   The ID of the version to merge into.
  Future<Object?> mergeVersions(String id, String moveIssuesTo, { Future<void>? abortTrigger, }) async {
    final response = await mergeVersionsWithHttpInfo(id, moveIssuesTo, abortTrigger: abortTrigger,);
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

  /// Move version
  ///
  /// Modifies the version's sequence within the project, which affects the display order of the versions in Jira.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version to be moved.
  ///
  /// * [VersionMoveBean] versionMoveBean (required):
  Future<Response> moveVersionWithHttpInfo(String id, VersionMoveBean versionMoveBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/move'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = versionMoveBean;

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

  /// Move version
  ///
  /// Modifies the version's sequence within the project, which affects the display order of the versions in Jira.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* project permission for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version to be moved.
  ///
  /// * [VersionMoveBean] versionMoveBean (required):
  Future<Version?> moveVersion(String id, VersionMoveBean versionMoveBean, { Future<void>? abortTrigger, }) async {
    final response = await moveVersionWithHttpInfo(id, versionMoveBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Version',) as Version;
    
    }
    return null;
  }

  /// Update related work
  ///
  /// Updates the given related work. You can only update generic link related works via Rest APIs. Any archived version related works can't be edited.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Resolve issues:* and *Edit issues* [Managing project permissions](https://confluence.atlassian.com/adminjiraserver/managing-project-permissions-938847145.html) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version to update the related work on. For the related work id, pass it to the input JSON.
  ///
  /// * [VersionRelatedWork] versionRelatedWork (required):
  Future<Response> updateRelatedWorkWithHttpInfo(String id, VersionRelatedWork versionRelatedWork, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}/relatedwork'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = versionRelatedWork;

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

  /// Update related work
  ///
  /// Updates the given related work. You can only update generic link related works via Rest APIs. Any archived version related works can't be edited.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Resolve issues:* and *Edit issues* [Managing project permissions](https://confluence.atlassian.com/adminjiraserver/managing-project-permissions-938847145.html) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version to update the related work on. For the related work id, pass it to the input JSON.
  ///
  /// * [VersionRelatedWork] versionRelatedWork (required):
  Future<VersionRelatedWork?> updateRelatedWork(String id, VersionRelatedWork versionRelatedWork, { Future<void>? abortTrigger, }) async {
    final response = await updateRelatedWorkWithHttpInfo(id, versionRelatedWork, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'VersionRelatedWork',) as VersionRelatedWork;
    
    }
    return null;
  }

  /// Update version
  ///
  /// Updates a project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [Version] version (required):
  Future<Response> updateVersionWithHttpInfo(String id, Version version, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/version/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody = version;

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

  /// Update version
  ///
  /// Updates a project version.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that contains the version.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the version.
  ///
  /// * [Version] version (required):
  Future<Version?> updateVersion(String id, Version version, { Future<void>? abortTrigger, }) async {
    final response = await updateVersionWithHttpInfo(id, version, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Version',) as Version;
    
    }
    return null;
  }
}
