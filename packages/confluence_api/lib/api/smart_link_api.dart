//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SmartLinkApi {
  SmartLinkApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create Smart Link in the content tree
  ///
  /// Creates a Smart Link in the content tree in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a Smart Link in the content tree in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSmartLinkRequest] createSmartLinkRequest (required):
  Future<Response> createSmartLinkWithHttpInfo(CreateSmartLinkRequest createSmartLinkRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds';

    // ignore: prefer_final_locals
    Object? postBody = createSmartLinkRequest;

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

  /// Create Smart Link in the content tree
  ///
  /// Creates a Smart Link in the content tree in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a Smart Link in the content tree in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateSmartLinkRequest] createSmartLinkRequest (required):
  Future<CreateSmartLink200Response?> createSmartLink(CreateSmartLinkRequest createSmartLinkRequest, { Future<void>? abortTrigger, }) async {
    final response = await createSmartLinkWithHttpInfo(createSmartLinkRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateSmartLink200Response',) as CreateSmartLink200Response;
    
    }
    return null;
  }

  /// Delete Smart Link in the content tree
  ///
  /// Delete a Smart Link in the content tree by id.  Deleting a Smart Link in the content tree moves the Smart Link to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree and its corresponding space. Permission to delete Smart Links in the content tree in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree to be deleted.
  Future<Response> deleteSmartLinkWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{id}'
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

  /// Delete Smart Link in the content tree
  ///
  /// Delete a Smart Link in the content tree by id.  Deleting a Smart Link in the content tree moves the Smart Link to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree and its corresponding space. Permission to delete Smart Links in the content tree in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree to be deleted.
  Future<void> deleteSmartLink(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteSmartLinkWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get Smart Link in the content tree by id
  ///
  /// Returns a specific Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree to be returned.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the Smart Link.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the Smart Link, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this Smart Link in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this Smart Link in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<Response> getSmartLinkByIdWithHttpInfo(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{id}'
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

  /// Get Smart Link in the content tree by id
  ///
  /// Returns a specific Smart Link in the content tree.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the Smart Link in the content tree and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the Smart Link in the content tree to be returned.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the Smart Link.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the Smart Link, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this Smart Link in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this Smart Link in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<CreateSmartLink200Response?> getSmartLinkById(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    final response = await getSmartLinkByIdWithHttpInfo(id, includeCollaborators: includeCollaborators, includeDirectChildren: includeDirectChildren, includeOperations: includeOperations, includeProperties: includeProperties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateSmartLink200Response',) as CreateSmartLink200Response;
    
    }
    return null;
  }
}
