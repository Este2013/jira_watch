//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ProjectPropertiesApi {
  ProjectPropertiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete project property
  ///
  /// Deletes the [property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) from a project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] propertyKey (required):
  ///   The project property key. Use [Get project property keys](#api-rest-api-3-project-projectIdOrKey-properties-get) to get a list of all project property keys.
  Future<Response> deleteProjectPropertyWithHttpInfo(String projectIdOrKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
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

  /// Delete project property
  ///
  /// Deletes the [property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) from a project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] propertyKey (required):
  ///   The project property key. Use [Get project property keys](#api-rest-api-3-project-projectIdOrKey-properties-get) to get a list of all project property keys.
  Future<void> deleteProjectProperty(String projectIdOrKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await deleteProjectPropertyWithHttpInfo(projectIdOrKey, propertyKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get project property
  ///
  /// Returns the value of a [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] propertyKey (required):
  ///   The project property key. Use [Get project property keys](#api-rest-api-3-project-projectIdOrKey-properties-get) to get a list of all project property keys.
  Future<Response> getProjectPropertyWithHttpInfo(String projectIdOrKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
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

  /// Get project property
  ///
  /// Returns the value of a [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project containing the property.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] propertyKey (required):
  ///   The project property key. Use [Get project property keys](#api-rest-api-3-project-projectIdOrKey-properties-get) to get a list of all project property keys.
  Future<EntityProperty?> getProjectProperty(String projectIdOrKey, String propertyKey, { Future<void>? abortTrigger, }) async {
    final response = await getProjectPropertyWithHttpInfo(projectIdOrKey, propertyKey, abortTrigger: abortTrigger,);
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

  /// Get project property keys
  ///
  /// Returns all [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys for the project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<Response> getProjectPropertyKeysWithHttpInfo(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/properties'
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

  /// Get project property keys
  ///
  /// Returns all [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties) keys for the project.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  Future<PropertyKeys?> getProjectPropertyKeys(String projectIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await getProjectPropertyKeysWithHttpInfo(projectIdOrKey, abortTrigger: abortTrigger,);
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

  /// Set project property
  ///
  /// Sets the value of the [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). You can use project properties to store custom data against the project.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the property is created.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] propertyKey (required):
  ///   The key of the project property. The maximum length is 255 characters.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Response> setProjectPropertyWithHttpInfo(String projectIdOrKey, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/project/{projectIdOrKey}/properties/{propertyKey}'
      .replaceAll('{projectIdOrKey}', projectIdOrKey)
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

  /// Set project property
  ///
  /// Sets the value of the [project property](https://developer.atlassian.com/cloud/jira/platform/storing-data-without-a-database/#a-id-jira-entity-properties-a-jira-entity-properties). You can use project properties to store custom data against the project.  The value of the request body must be a [valid](http://tools.ietf.org/html/rfc4627), non-empty JSON blob. The maximum length is 32768 characters.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project in which the property is created.
  ///
  /// Parameters:
  ///
  /// * [String] projectIdOrKey (required):
  ///   The project ID or project key (case sensitive).
  ///
  /// * [String] propertyKey (required):
  ///   The key of the project property. The maximum length is 255 characters.
  ///
  /// * [Object] body (required):
  ///   The value of the property. The value has to be a valid, non-empty [JSON](https://tools.ietf.org/html/rfc4627) value. The maximum length of the property value is 32768 bytes.
  Future<Object?> setProjectProperty(String projectIdOrKey, String propertyKey, Object body, { Future<void>? abortTrigger, }) async {
    final response = await setProjectPropertyWithHttpInfo(projectIdOrKey, propertyKey, body, abortTrigger: abortTrigger,);
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
