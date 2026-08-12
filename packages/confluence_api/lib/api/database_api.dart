//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DatabaseApi {
  DatabaseApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create database
  ///
  /// Creates a database in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a database in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateDatabaseRequest] createDatabaseRequest (required):
  ///
  /// * [bool] private:
  ///   The database will be private. Only the user who creates this database will have permission to view and edit one.
  Future<Response> createDatabaseWithHttpInfo(CreateDatabaseRequest createDatabaseRequest, { bool? private, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases';

    // ignore: prefer_final_locals
    Object? postBody = createDatabaseRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (private != null) {
      queryParams.addAll(_queryParams('', 'private', private));
    }

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

  /// Create database
  ///
  /// Creates a database in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a database in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateDatabaseRequest] createDatabaseRequest (required):
  ///
  /// * [bool] private:
  ///   The database will be private. Only the user who creates this database will have permission to view and edit one.
  Future<CreateDatabase200Response?> createDatabase(CreateDatabaseRequest createDatabaseRequest, { bool? private, Future<void>? abortTrigger, }) async {
    final response = await createDatabaseWithHttpInfo(createDatabaseRequest, private: private, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateDatabase200Response',) as CreateDatabase200Response;
    
    }
    return null;
  }

  /// Delete database
  ///
  /// Delete a database by id.  Deleting a database moves the database to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database and its corresponding space. Permission to delete databases in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database to be deleted.
  Future<Response> deleteDatabaseWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}'
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

  /// Delete database
  ///
  /// Delete a database by id.  Deleting a database moves the database to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database and its corresponding space. Permission to delete databases in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database to be deleted.
  Future<void> deleteDatabase(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteDatabaseWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get database by id
  ///
  /// Returns a specific database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database to be returned
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the database.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the database, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this database in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this database in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<Response> getDatabaseByIdWithHttpInfo(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (includeCollaborators != null) {
      queryParams.addAll(_queryParams('', 'include-collaborators', includeCollaborators));
    }
    if (includeDirectChildren != null) {
      queryParams.addAll(_queryParams('', 'include-direct-children', includeDirectChildren));
    }
    if (includeOperations != null) {
      queryParams.addAll(_queryParams('', 'include-operations', includeOperations));
    }
    if (includeProperties != null) {
      queryParams.addAll(_queryParams('', 'include-properties', includeProperties));
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

  /// Get database by id
  ///
  /// Returns a specific database.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the database and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database to be returned
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the database.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the database, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this database in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this database in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<CreateDatabase200Response?> getDatabaseById(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    final response = await getDatabaseByIdWithHttpInfo(id, includeCollaborators: includeCollaborators, includeDirectChildren: includeDirectChildren, includeOperations: includeOperations, includeProperties: includeProperties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateDatabase200Response',) as CreateDatabase200Response;
    
    }
    return null;
  }
}
