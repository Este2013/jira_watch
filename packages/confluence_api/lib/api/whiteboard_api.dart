//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WhiteboardApi {
  WhiteboardApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create whiteboard
  ///
  /// Creates a whiteboard in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a whiteboard in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateWhiteboardRequest] createWhiteboardRequest (required):
  ///
  /// * [bool] private:
  ///   The whiteboard will be private. Only the user who creates this whiteboard will have permission to view and edit one.
  Future<Response> createWhiteboardWithHttpInfo(CreateWhiteboardRequest createWhiteboardRequest, { bool? private, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards';

    // ignore: prefer_final_locals
    Object? postBody = createWhiteboardRequest;

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

  /// Create whiteboard
  ///
  /// Creates a whiteboard in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a whiteboard in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateWhiteboardRequest] createWhiteboardRequest (required):
  ///
  /// * [bool] private:
  ///   The whiteboard will be private. Only the user who creates this whiteboard will have permission to view and edit one.
  Future<CreateWhiteboard200Response?> createWhiteboard(CreateWhiteboardRequest createWhiteboardRequest, { bool? private, Future<void>? abortTrigger, }) async {
    final response = await createWhiteboardWithHttpInfo(createWhiteboardRequest, private: private, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateWhiteboard200Response',) as CreateWhiteboard200Response;
    
    }
    return null;
  }

  /// Delete whiteboard
  ///
  /// Delete a whiteboard by id.  Deleting a whiteboard moves the whiteboard to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard and its corresponding space. Permission to delete whiteboards in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard to be deleted.
  Future<Response> deleteWhiteboardWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}'
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

  /// Delete whiteboard
  ///
  /// Delete a whiteboard by id.  Deleting a whiteboard moves the whiteboard to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard and its corresponding space. Permission to delete whiteboards in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard to be deleted.
  Future<void> deleteWhiteboard(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteWhiteboardWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get whiteboard by id
  ///
  /// Returns a specific whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard to be returned
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the whiteboard.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the whiteboard, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this whiteboard in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this whiteboard in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<Response> getWhiteboardByIdWithHttpInfo(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}'
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

  /// Get whiteboard by id
  ///
  /// Returns a specific whiteboard.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the whiteboard and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard to be returned
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the whiteboard.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the whiteboard, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this whiteboard in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this whiteboard in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<CreateWhiteboard200Response?> getWhiteboardById(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    final response = await getWhiteboardByIdWithHttpInfo(id, includeCollaborators: includeCollaborators, includeDirectChildren: includeDirectChildren, includeOperations: includeOperations, includeProperties: includeProperties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateWhiteboard200Response',) as CreateWhiteboard200Response;
    
    }
    return null;
  }
}
