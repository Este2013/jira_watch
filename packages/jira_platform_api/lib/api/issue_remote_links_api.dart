//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueRemoteLinksApi {
  IssueRemoteLinksApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create or update remote issue link
  ///
  /// Creates or updates a remote issue link for an issue.  If a `globalId` is provided and a remote issue link with that global ID is found it is updated. Any fields without values in the request are set to null. Otherwise, the remote issue link is created.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [RemoteIssueLinkRequest] remoteIssueLinkRequest (required):
  Future<Response> createOrUpdateRemoteIssueLinkWithHttpInfo(String issueIdOrKey, RemoteIssueLinkRequest remoteIssueLinkRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/remotelink'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody = remoteIssueLinkRequest;

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

  /// Create or update remote issue link
  ///
  /// Creates or updates a remote issue link for an issue.  If a `globalId` is provided and a remote issue link with that global ID is found it is updated. Any fields without values in the request are set to null. Otherwise, the remote issue link is created.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [RemoteIssueLinkRequest] remoteIssueLinkRequest (required):
  Future<RemoteIssueLinkIdentifies?> createOrUpdateRemoteIssueLink(String issueIdOrKey, RemoteIssueLinkRequest remoteIssueLinkRequest, { Future<void>? abortTrigger, }) async {
    final response = await createOrUpdateRemoteIssueLinkWithHttpInfo(issueIdOrKey, remoteIssueLinkRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RemoteIssueLinkIdentifies',) as RemoteIssueLinkIdentifies;
    
    }
    return null;
  }

  /// Delete remote issue link by global ID
  ///
  /// Deletes the remote issue link from the issue using the link's global ID. Where the global ID includes reserved URL characters these must be escaped in the request. For example, pass `system=http://www.mycompany.com/support&id=1` as `system%3Dhttp%3A%2F%2Fwww.mycompany.com%2Fsupport%26id%3D1`.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is implemented, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] globalId (required):
  ///   The global ID of a remote issue link.
  Future<Response> deleteRemoteIssueLinkByGlobalIdWithHttpInfo(String issueIdOrKey, String globalId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/remotelink'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'globalId', globalId));

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

  /// Delete remote issue link by global ID
  ///
  /// Deletes the remote issue link from the issue using the link's global ID. Where the global ID includes reserved URL characters these must be escaped in the request. For example, pass `system=http://www.mycompany.com/support&id=1` as `system%3Dhttp%3A%2F%2Fwww.mycompany.com%2Fsupport%26id%3D1`.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is implemented, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] globalId (required):
  ///   The global ID of a remote issue link.
  Future<void> deleteRemoteIssueLinkByGlobalId(String issueIdOrKey, String globalId, { Future<void>? abortTrigger, }) async {
    final response = await deleteRemoteIssueLinkByGlobalIdWithHttpInfo(issueIdOrKey, globalId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete remote issue link by ID
  ///
  /// Deletes a remote issue link from an issue.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects*, *Edit issues*, and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] linkId (required):
  ///   The ID of a remote issue link.
  Future<Response> deleteRemoteIssueLinkByIdWithHttpInfo(String issueIdOrKey, String linkId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/remotelink/{linkId}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{linkId}', linkId);

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

  /// Delete remote issue link by ID
  ///
  /// Deletes a remote issue link from an issue.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects*, *Edit issues*, and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] linkId (required):
  ///   The ID of a remote issue link.
  Future<void> deleteRemoteIssueLinkById(String issueIdOrKey, String linkId, { Future<void>? abortTrigger, }) async {
    final response = await deleteRemoteIssueLinkByIdWithHttpInfo(issueIdOrKey, linkId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get remote issue link by ID
  ///
  /// Returns a remote issue link for an issue.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] linkId (required):
  ///   The ID of the remote issue link.
  Future<Response> getRemoteIssueLinkByIdWithHttpInfo(String issueIdOrKey, String linkId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/remotelink/{linkId}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{linkId}', linkId);

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

  /// Get remote issue link by ID
  ///
  /// Returns a remote issue link for an issue.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] linkId (required):
  ///   The ID of the remote issue link.
  Future<RemoteIssueLink?> getRemoteIssueLinkById(String issueIdOrKey, String linkId, { Future<void>? abortTrigger, }) async {
    final response = await getRemoteIssueLinkByIdWithHttpInfo(issueIdOrKey, linkId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RemoteIssueLink',) as RemoteIssueLink;
    
    }
    return null;
  }

  /// Get remote issue links
  ///
  /// Returns the remote issue links for an issue. When a remote issue link global ID is provided the record with that global ID is returned, otherwise all remote issue links are returned. Where a global ID includes reserved URL characters these must be escaped in the request. For example, pass `system=http://www.mycompany.com/support&id=1` as `system%3Dhttp%3A%2F%2Fwww.mycompany.com%2Fsupport%26id%3D1`.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] globalId:
  ///   The global ID of the remote issue link.
  Future<Response> getRemoteIssueLinksWithHttpInfo(String issueIdOrKey, { String? globalId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/remotelink'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (globalId != null) {
      queryParams.addAll(_queryParams('', 'globalId', globalId));
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

  /// Get remote issue links
  ///
  /// Returns the remote issue links for an issue. When a remote issue link global ID is provided the record with that global ID is returned, otherwise all remote issue links are returned. Where a global ID includes reserved URL characters these must be escaped in the request. For example, pass `system=http://www.mycompany.com/support&id=1` as `system%3Dhttp%3A%2F%2Fwww.mycompany.com%2Fsupport%26id%3D1`.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] globalId:
  ///   The global ID of the remote issue link.
  Future<GetRemoteIssueLinks200Response?> getRemoteIssueLinks(String issueIdOrKey, { String? globalId, Future<void>? abortTrigger, }) async {
    final response = await getRemoteIssueLinksWithHttpInfo(issueIdOrKey, globalId: globalId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetRemoteIssueLinks200Response',) as GetRemoteIssueLinks200Response;
    
    }
    return null;
  }

  /// Update remote issue link by ID
  ///
  /// Updates a remote issue link for an issue.  Note: Fields without values in the request are set to null.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] linkId (required):
  ///   The ID of the remote issue link.
  ///
  /// * [RemoteIssueLinkRequest] remoteIssueLinkRequest (required):
  Future<Response> updateRemoteIssueLinkWithHttpInfo(String issueIdOrKey, String linkId, RemoteIssueLinkRequest remoteIssueLinkRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/remotelink/{linkId}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{linkId}', linkId);

    // ignore: prefer_final_locals
    Object? postBody = remoteIssueLinkRequest;

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

  /// Update remote issue link by ID
  ///
  /// Updates a remote issue link for an issue.  Note: Fields without values in the request are set to null.  This operation requires [issue linking to be active](https://confluence.atlassian.com/x/yoXKM).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* and *Link issues* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] linkId (required):
  ///   The ID of the remote issue link.
  ///
  /// * [RemoteIssueLinkRequest] remoteIssueLinkRequest (required):
  Future<Object?> updateRemoteIssueLink(String issueIdOrKey, String linkId, RemoteIssueLinkRequest remoteIssueLinkRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateRemoteIssueLinkWithHttpInfo(issueIdOrKey, linkId, remoteIssueLinkRequest, abortTrigger: abortTrigger,);
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
