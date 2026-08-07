//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DescendantsApi {
  DescendantsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get descendants of a database
  ///
  /// Returns descendants in the content tree for a given database by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the database and its corresponding space
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<Response> getDatabaseDescendantsWithHttpInfo(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/databases/{id}/descendants'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
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

  /// Get descendants of a database
  ///
  /// Returns descendants in the content tree for a given database by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the database and its corresponding space
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the database.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<MultiEntityResultDescendantsResponse?> getDatabaseDescendants(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    final response = await getDatabaseDescendantsWithHttpInfo(id, limit: limit, depth: depth, cursor: cursor, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultDescendantsResponse',) as MultiEntityResultDescendantsResponse;
    
    }
    return null;
  }

  /// Get descendants of folder
  ///
  /// Returns descendants in the content tree for a given folder by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the  and its corresponding space
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<Response> getFolderDescendantsWithHttpInfo(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/folders/{id}/descendants'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
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

  /// Get descendants of folder
  ///
  /// Returns descendants in the content tree for a given folder by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the  and its corresponding space
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the folder.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<MultiEntityResultDescendantsResponse?> getFolderDescendants(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    final response = await getFolderDescendantsWithHttpInfo(id, limit: limit, depth: depth, cursor: cursor, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultDescendantsResponse',) as MultiEntityResultDescendantsResponse;
    
    }
    return null;
  }

  /// Get descendants of page
  ///
  /// Returns descendants in the content tree for a given page by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the page and its corresponding space
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<Response> getPageDescendantsWithHttpInfo(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/descendants'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
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

  /// Get descendants of page
  ///
  /// Returns descendants in the content tree for a given page by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the page and its corresponding space
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<MultiEntityResultDescendantsResponse?> getPageDescendants(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    final response = await getPageDescendantsWithHttpInfo(id, limit: limit, depth: depth, cursor: cursor, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultDescendantsResponse',) as MultiEntityResultDescendantsResponse;
    
    }
    return null;
  }

  /// Get descendants of a smart link
  ///
  /// Returns descendants in the content tree for a given smart link by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard   This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the smart link and its corresponding space
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the smart link.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<Response> getSmartLinkDescendantsWithHttpInfo(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/embeds/{id}/descendants'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
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

  /// Get descendants of a smart link
  ///
  /// Returns descendants in the content tree for a given smart link by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard   This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the smart link and its corresponding space
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the smart link.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<MultiEntityResultDescendantsResponse?> getSmartLinkDescendants(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    final response = await getSmartLinkDescendantsWithHttpInfo(id, limit: limit, depth: depth, cursor: cursor, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultDescendantsResponse',) as MultiEntityResultDescendantsResponse;
    
    }
    return null;
  }

  /// Get descendants of a whiteboard
  ///
  /// Returns descendants in the content tree for a given whiteboard by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the whiteboard and its corresponding space
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<Response> getWhiteboardDescendantsWithHttpInfo(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/whiteboards/{id}/descendants'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
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

  /// Get descendants of a whiteboard
  ///
  /// Returns descendants in the content tree for a given whiteboard by ID in top-to-bottom order (that is, the highest descendant is the first item in the response payload). The number of results is limited by the `limit` parameter and additional results (if available) will be available by calling this endpoint with the cursor in the response payload. There is also a `depth` parameter specifying depth of descendants to be fetched.  The following types of content will be returned: - Database - Embed - Folder - Page - Whiteboard  This endpoint returns minimal information about each descendant. To fetch more details, use a related endpoint based on the content type, such as:  - [Get database by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-database/#api-databases-id-get) - [Get embed by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-smart-link/#api-embeds-id-get) - [Get folder by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-folder/#api-folders-id-get) - [Get page by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-page/#api-pages-id-get) - [Get whiteboard by id](https://developer.atlassian.com/cloud/confluence/rest/v2/api-group-whiteboard/#api-whiteboards-id-get).  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Permission to view the whiteboard and its corresponding space
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the whiteboard.
  ///
  /// * [int] limit:
  ///   Maximum number of items per result to return. If more results exist, call the endpoint with the cursor to fetch the next set of results.
  ///
  /// * [int] depth:
  ///   Maximum depth of descendants to return. If more results are required, use the endpoint corresponding to the content type of the deepest descendant to fetch more descendants.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  Future<MultiEntityResultDescendantsResponse?> getWhiteboardDescendants(int id, { int? limit, int? depth, String? cursor, Future<void>? abortTrigger, }) async {
    final response = await getWhiteboardDescendantsWithHttpInfo(id, limit: limit, depth: depth, cursor: cursor, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultDescendantsResponse',) as MultiEntityResultDescendantsResponse;
    
    }
    return null;
  }
}
