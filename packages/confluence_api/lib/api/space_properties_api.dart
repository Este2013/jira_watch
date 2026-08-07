//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SpacePropertiesApi {
  SpacePropertiesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create space property in space
  ///
  /// Creates a new space property.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space for which space properties should be returned.
  ///
  /// * [SpacePropertyCreateRequest] spacePropertyCreateRequest (required):
  ///   The space property to be created
  Future<Response> createSpacePropertyWithHttpInfo(int spaceId, SpacePropertyCreateRequest spacePropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{space-id}/properties'
      .replaceAll('{space-id}', spaceId.toString());

    // ignore: prefer_final_locals
    Object? postBody = spacePropertyCreateRequest;

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

  /// Create space property in space
  ///
  /// Creates a new space property.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space for which space properties should be returned.
  ///
  /// * [SpacePropertyCreateRequest] spacePropertyCreateRequest (required):
  ///   The space property to be created
  Future<SpaceProperty?> createSpaceProperty(int spaceId, SpacePropertyCreateRequest spacePropertyCreateRequest, { Future<void>? abortTrigger, }) async {
    final response = await createSpacePropertyWithHttpInfo(spaceId, spacePropertyCreateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SpaceProperty',) as SpaceProperty;
    
    }
    return null;
  }

  /// Delete space property by id
  ///
  /// Deletes a space property by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<Response> deleteSpacePropertyByIdWithHttpInfo(int spaceId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{space-id}/properties/{property-id}'
      .replaceAll('{space-id}', spaceId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Delete space property by id
  ///
  /// Deletes a space property by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be deleted.
  Future<void> deleteSpacePropertyById(int spaceId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await deleteSpacePropertyByIdWithHttpInfo(spaceId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get space properties in space
  ///
  /// Returns all properties for the given space. Space properties are a key-value storage associated with a space. The limit parameter specifies the maximum number of results returned in a single response. Use the `link` response header to paginate through additional results.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'View' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space for which space properties should be returned.
  ///
  /// * [String] key:
  ///   The key of the space property to retrieve. This should be used when a user knows the key of their property, but needs to retrieve the id for use in other methods.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getSpacePropertiesWithHttpInfo(int spaceId, { String? key, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{space-id}/properties'
      .replaceAll('{space-id}', spaceId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
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

  /// Get space properties in space
  ///
  /// Returns all properties for the given space. Space properties are a key-value storage associated with a space. The limit parameter specifies the maximum number of results returned in a single response. Use the `link` response header to paginate through additional results.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'View' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space for which space properties should be returned.
  ///
  /// * [String] key:
  ///   The key of the space property to retrieve. This should be used when a user knows the key of their property, but needs to retrieve the id for use in other methods.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultSpaceProperty?> getSpaceProperties(int spaceId, { String? key, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getSpacePropertiesWithHttpInfo(spaceId, key: key, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultSpaceProperty',) as MultiEntityResultSpaceProperty;
    
    }
    return null;
  }

  /// Get space property by id
  ///
  /// Retrieve a space property by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'View' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be retrieved.
  Future<Response> getSpacePropertyByIdWithHttpInfo(int spaceId, int propertyId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{space-id}/properties/{property-id}'
      .replaceAll('{space-id}', spaceId.toString())
      .replaceAll('{property-id}', propertyId.toString());

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

  /// Get space property by id
  ///
  /// Retrieve a space property by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'View' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be retrieved.
  Future<SpaceProperty?> getSpacePropertyById(int spaceId, int propertyId, { Future<void>? abortTrigger, }) async {
    final response = await getSpacePropertyByIdWithHttpInfo(spaceId, propertyId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SpaceProperty',) as SpaceProperty;
    
    }
    return null;
  }

  /// Update space property by id
  ///
  /// Update a space property by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [SpacePropertyUpdateRequest] spacePropertyUpdateRequest (required):
  ///   The space property to be updated.
  Future<Response> updateSpacePropertyByIdWithHttpInfo(int spaceId, int propertyId, SpacePropertyUpdateRequest spacePropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{space-id}/properties/{property-id}'
      .replaceAll('{space-id}', spaceId.toString())
      .replaceAll('{property-id}', propertyId.toString());

    // ignore: prefer_final_locals
    Object? postBody = spacePropertyUpdateRequest;

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

  /// Update space property by id
  ///
  /// Update a space property by its id.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'Admin' permission for the space.
  ///
  /// Parameters:
  ///
  /// * [int] spaceId (required):
  ///   The ID of the space the property belongs to.
  ///
  /// * [int] propertyId (required):
  ///   The ID of the property to be updated.
  ///
  /// * [SpacePropertyUpdateRequest] spacePropertyUpdateRequest (required):
  ///   The space property to be updated.
  Future<SpaceProperty?> updateSpacePropertyById(int spaceId, int propertyId, SpacePropertyUpdateRequest spacePropertyUpdateRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateSpacePropertyByIdWithHttpInfo(spaceId, propertyId, spacePropertyUpdateRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'SpaceProperty',) as SpaceProperty;
    
    }
    return null;
  }
}
