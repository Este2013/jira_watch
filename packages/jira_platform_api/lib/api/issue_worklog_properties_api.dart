//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueWorklogPropertiesApi {
  IssueWorklogPropertiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete worklog property
  ///
  /// Deletes a worklog property.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<Response> deleteWorklogPropertyWithHttpInfo(String issueIdOrKey, String worklogId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties/{propertyKey}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{worklogId}', worklogId)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Delete worklog property
  ///
  /// Deletes a worklog property.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<void> deleteWorklogProperty(String issueIdOrKey, String worklogId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteWorklogPropertyWithHttpInfo(issueIdOrKey, worklogId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get worklog property
  ///
  /// Returns the value of a worklog property.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<Response> getWorklogPropertyWithHttpInfo(String issueIdOrKey, String worklogId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties/{propertyKey}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{worklogId}', worklogId)
      .replaceAll('{propertyKey}', propertyKey);

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

  /// Get worklog property
  ///
  /// Returns the value of a worklog property.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property.
  Future<EntityProperty?> getWorklogProperty(String issueIdOrKey, String worklogId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getWorklogPropertyWithHttpInfo(issueIdOrKey, worklogId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'EntityProperty',) as EntityProperty;
    
    }
    return null;
  }

  /// Get worklog property keys
  ///
  /// Returns the keys of all properties for a worklog.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  Future<Response> getWorklogPropertyKeysWithHttpInfo(String issueIdOrKey, String worklogId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{worklogId}', worklogId);

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

  /// Get worklog property keys
  ///
  /// Returns the keys of all properties for a worklog.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  Future<PropertyKeys?> getWorklogPropertyKeys(String issueIdOrKey, String worklogId, { Future<void>? abortTrigger, }) async {
    final response = await getWorklogPropertyKeysWithHttpInfo(issueIdOrKey, worklogId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PropertyKeys',) as PropertyKeys;
    
    }
    return null;
  }

  /// Set worklog property
  ///
  /// Sets the value of a worklog property. Use this operation to store custom data against the worklog.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Edit all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any worklog or *Edit own worklogs* to update worklogs created by the user.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the issue property. The maximum length is 255 characters.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Response> setWorklogPropertyWithHttpInfo(String issueIdOrKey, String worklogId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/worklog/{worklogId}/properties/{propertyKey}'
      .replaceAll('{issueIdOrKey}', issueIdOrKey)
      .replaceAll('{worklogId}', worklogId)
      .replaceAll('{propertyKey}', propertyKey);

    // ignore: prefer_final_locals
    Object? postBody = body;

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

  /// Set worklog property
  ///
  /// Sets the value of a worklog property. Use this operation to store custom data against the worklog.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  *Edit all worklogs*[ project permission](https://confluence.atlassian.com/x/yodKLg) to update any worklog or *Edit own worklogs* to update worklogs created by the user.  *  If the worklog has visibility restrictions, belongs to the group or has the role visibility is restricted to.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue.
  ///
  /// * [String] worklogId (required):
  ///   The ID of the worklog.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the issue property. The maximum length is 255 characters.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Object?> setWorklogProperty(String issueIdOrKey, String worklogId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await setWorklogPropertyWithHttpInfo(issueIdOrKey, worklogId, propertyKey, body, abortTrigger: abortTrigger,);
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
