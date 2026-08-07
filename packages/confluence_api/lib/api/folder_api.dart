//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FolderApi {
  FolderApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create folder
  ///
  /// Creates a folder in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a folder in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateFolderRequest] createFolderRequest (required):
  Future<Response> createFolderWithHttpInfo(CreateFolderRequest createFolderRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders';

    // ignore: prefer_final_locals
    Object? postBody = createFolderRequest;

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

  /// Create folder
  ///
  /// Creates a folder in the space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a folder in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateFolderRequest] createFolderRequest (required):
  Future<CreateFolder200Response?> createFolder(CreateFolderRequest createFolderRequest, { Future<void>? abortTrigger, }) async {
    final response = await createFolderWithHttpInfo(createFolderRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateFolder200Response',) as CreateFolder200Response;
    
    }
    return null;
  }

  /// Delete folder
  ///
  /// Delete a folder by id.  Deleting a folder moves the folder to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder and its corresponding space. Permission to delete folders in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder to be deleted.
  Future<Response> deleteFolderWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{id}'
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

  /// Delete folder
  ///
  /// Delete a folder by id.  Deleting a folder moves the folder to the trash, where it can be restored later  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder and its corresponding space. Permission to delete folders in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder to be deleted.
  Future<void> deleteFolder(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteFolderWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get folder by id
  ///
  /// Returns a specific folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder to be returned.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the folder.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the folder, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this folder in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this folder in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<Response> getFolderByIdWithHttpInfo(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{id}'
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

  /// Get folder by id
  ///
  /// Returns a specific folder.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the folder and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder to be returned.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the folder.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the folder, as defined in the `ChildrenResponse` object.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this folder in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this folder in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<CreateFolder200Response?> getFolderById(int id, { bool? includeCollaborators, bool? includeDirectChildren, bool? includeOperations, bool? includeProperties, Future<void>? abortTrigger, }) async {
    final response = await getFolderByIdWithHttpInfo(id, includeCollaborators: includeCollaborators, includeDirectChildren: includeDirectChildren, includeOperations: includeOperations, includeProperties: includeProperties, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateFolder200Response',) as CreateFolder200Response;
    
    }
    return null;
  }
}
