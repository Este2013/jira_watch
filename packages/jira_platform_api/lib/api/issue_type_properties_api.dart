//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueTypePropertiesApi {
  IssueTypePropertiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete issue type property
  ///
  /// Deletes the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property. Use [Get issue type property keys](#api-rest-api-3-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.
  Future<Response> deleteIssueTypePropertyWithHttpInfo(String issueTypeId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}'
      .replaceAll('{issueTypeId}', issueTypeId)
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

  /// Delete issue type property
  ///
  /// Deletes the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property. Use [Get issue type property keys](#api-rest-api-3-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.
  Future<void> deleteIssueTypeProperty(String issueTypeId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteIssueTypePropertyWithHttpInfo(issueTypeId, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get issue type property
  ///
  /// Returns the key and value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the details of any issue type.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the details of any issue types associated with the projects the user has permission to browse.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property. Use [Get issue type property keys](#api-rest-api-3-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.
  Future<Response> getIssueTypePropertyWithHttpInfo(String issueTypeId, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}'
      .replaceAll('{issueTypeId}', issueTypeId)
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

  /// Get issue type property
  ///
  /// Returns the key and value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the details of any issue type.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the details of any issue types associated with the projects the user has permission to browse.
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the property. Use [Get issue type property keys](#api-rest-api-3-issuetype-issueTypeId-properties-get) to get a list of all issue type property keys.
  Future<EntityProperty?> getIssueTypeProperty(String issueTypeId, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getIssueTypePropertyWithHttpInfo(issueTypeId, propertyKey, abortTrigger: abortTrigger,);
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

  /// Get issue type property keys
  ///
  /// Returns all the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys of the issue type.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the property keys of any issue type.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the property keys of any issue types associated with the projects the user has permission to browse.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  Future<Response> getIssueTypePropertyKeysWithHttpInfo(String issueTypeId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{issueTypeId}/properties'
      .replaceAll('{issueTypeId}', issueTypeId);

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

  /// Get issue type property keys
  ///
  /// Returns all the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys of the issue type.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) to get the property keys of any issue type.  *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) to get the property keys of any issue types associated with the projects the user has permission to browse.
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  Future<PropertyKeys?> getIssueTypePropertyKeys(String issueTypeId, { Future<void>? abortTrigger, }) async {
    final response = await getIssueTypePropertyKeysWithHttpInfo(issueTypeId, abortTrigger: abortTrigger,);
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

  /// Set issue type property
  ///
  /// Creates or updates the value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). Use this resource to store and update data against an issue type.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the issue type property. The maximum length is 255 characters.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Response> setIssueTypePropertyWithHttpInfo(String issueTypeId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issuetype/{issueTypeId}/properties/{propertyKey}'
      .replaceAll('{issueTypeId}', issueTypeId)
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

  /// Set issue type property
  ///
  /// Creates or updates the value of the [issue type property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). Use this resource to store and update data against an issue type.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] issueTypeId (required):
  ///   The ID of the issue type.
  ///
  /// * [String] propertyKey (required):
  ///   The key of the issue type property. The maximum length is 255 characters.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Object?> setIssueTypeProperty(String issueTypeId, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await setIssueTypePropertyWithHttpInfo(issueTypeId, propertyKey, body, abortTrigger: abortTrigger,);
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
