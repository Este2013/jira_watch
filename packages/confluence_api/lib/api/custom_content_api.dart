//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class CustomContentApi {
  CustomContentApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create custom content
  ///
  /// Creates a new custom content in the given space, page, blogpost or other custom content.  Only one of `spaceId`, `pageId`, `blogPostId`, or `customContentId` is required in the request body. **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create custom content in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateCustomContentRequest] createCustomContentRequest (required):
  Future<Response> createCustomContentWithHttpInfo(CreateCustomContentRequest createCustomContentRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content';

    // ignore: prefer_final_locals
    Object? postBody = createCustomContentRequest;

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

  /// Create custom content
  ///
  /// Creates a new custom content in the given space, page, blogpost or other custom content.  Only one of `spaceId`, `pageId`, `blogPostId`, or `customContentId` is required in the request body. **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to create custom content in the space.
  ///
  /// Parameters:
  ///
  /// * [CreateCustomContentRequest] createCustomContentRequest (required):
  Future<CreateCustomContent201Response?> createCustomContent(CreateCustomContentRequest createCustomContentRequest, { Future<void>? abortTrigger, }) async {
    final response = await createCustomContentWithHttpInfo(createCustomContentRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateCustomContent201Response',) as CreateCustomContent201Response;
    
    }
    return null;
  }

  /// Delete custom content
  ///
  /// Delete a custom content by id.  Deleting a custom content will either move it to the trash or permanently delete it (purge it), depending on the apiSupport. To permanently delete a **trashed** custom content, the endpoint must be called with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to delete custom content in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the custom content.
  Future<Response> deleteCustomContentWithHttpInfo(int id, { bool? purge, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (purge != null) {
      queryParams.addAll(_queryParams('', 'purge', purge));
    }

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

  /// Delete custom content
  ///
  /// Delete a custom content by id.  Deleting a custom content will either move it to the trash or permanently delete it (purge it), depending on the apiSupport. To permanently delete a **trashed** custom content, the endpoint must be called with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to delete custom content in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the custom content.
  Future<void> deleteCustomContent(int id, { bool? purge, Future<void>? abortTrigger, }) async {
    final response = await deleteCustomContentWithHttpInfo(id, purge: purge, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get custom content by id
  ///
  /// Returns a specific piece of custom content.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content, and the corresponding space (if different from the container).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content to be returned. If you don't know the custom content ID, use Get Custom Content by Type and filter the results.
  ///
  /// * [CustomContentBodyRepresentationSingle] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this custom content in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this custom content in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this custom content in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this custom content in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this custom content in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the custom content.
  Future<Response> getCustomContentByIdWithHttpInfo(int id, { CustomContentBodyRepresentationSingle? bodyFormat, int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeVersions, bool? includeVersion, bool? includeCollaborators, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (version != null) {
      queryParams.addAll(_queryParams('', 'version', version));
    }
    if (includeLabels != null) {
      queryParams.addAll(_queryParams('', 'include-labels', includeLabels));
    }
    if (includeProperties != null) {
      queryParams.addAll(_queryParams('', 'include-properties', includeProperties));
    }
    if (includeOperations != null) {
      queryParams.addAll(_queryParams('', 'include-operations', includeOperations));
    }
    if (includeVersions != null) {
      queryParams.addAll(_queryParams('', 'include-versions', includeVersions));
    }
    if (includeVersion != null) {
      queryParams.addAll(_queryParams('', 'include-version', includeVersion));
    }
    if (includeCollaborators != null) {
      queryParams.addAll(_queryParams('', 'include-collaborators', includeCollaborators));
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

  /// Get custom content by id
  ///
  /// Returns a specific piece of custom content.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content, and the corresponding space (if different from the container).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content to be returned. If you don't know the custom content ID, use Get Custom Content by Type and filter the results.
  ///
  /// * [CustomContentBodyRepresentationSingle] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this custom content in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this custom content in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this custom content in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this custom content in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this custom content in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the custom content.
  Future<CreateCustomContent201Response?> getCustomContentById(int id, { CustomContentBodyRepresentationSingle? bodyFormat, int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeVersions, bool? includeVersion, bool? includeCollaborators, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentByIdWithHttpInfo(id, bodyFormat: bodyFormat, version: version, includeLabels: includeLabels, includeProperties: includeProperties, includeOperations: includeOperations, includeVersions: includeVersions, includeVersion: includeVersion, includeCollaborators: includeCollaborators, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateCustomContent201Response',) as CreateCustomContent201Response;
    
    }
    return null;
  }

  /// Get custom content by type
  ///
  /// Returns all custom content for a given type. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content, and the corresponding space (if different from the container).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [List<int>] id:
  ///   Filter the results based on custom content ids. Multiple custom content ids can be specified as a comma-separated list.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [CustomContentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<Response> getCustomContentByTypeWithHttpInfo(String type, { List<int>? id, List<int>? spaceId, CustomContentSortOrder? sort, String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'type', type));
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (spaceId != null) {
      queryParams.addAll(_queryParams('multi', 'space-id', spaceId));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get custom content by type
  ///
  /// Returns all custom content for a given type. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content, and the corresponding space (if different from the container).
  ///
  /// Parameters:
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [List<int>] id:
  ///   Filter the results based on custom content ids. Multiple custom content ids can be specified as a comma-separated list.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [CustomContentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<MultiEntityResultCustomContent?> getCustomContentByType(String type, { List<int>? id, List<int>? spaceId, CustomContentSortOrder? sort, String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentByTypeWithHttpInfo(type, id: id, spaceId: spaceId, sort: sort, cursor: cursor, limit: limit, bodyFormat: bodyFormat, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultCustomContent',) as MultiEntityResultCustomContent;
    
    }
    return null;
  }

  /// Get custom content by type in blog post
  ///
  /// Returns all custom content for a given type within a given blogpost. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content (blog post), and the corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which custom content should be returned.
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [CustomContentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<Response> getCustomContentByTypeInBlogPostWithHttpInfo(int id, String type, { CustomContentSortOrder? sort, String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/custom-content'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'type', type));
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get custom content by type in blog post
  ///
  /// Returns all custom content for a given type within a given blogpost. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content (blog post), and the corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which custom content should be returned.
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [CustomContentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<MultiEntityResultCustomContent?> getCustomContentByTypeInBlogPost(int id, String type, { CustomContentSortOrder? sort, String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentByTypeInBlogPostWithHttpInfo(id, type, sort: sort, cursor: cursor, limit: limit, bodyFormat: bodyFormat, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultCustomContent',) as MultiEntityResultCustomContent;
    
    }
    return null;
  }

  /// Get custom content by type in page
  ///
  /// Returns all custom content for a given type within a given page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content (page), and the corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which custom content should be returned.
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [CustomContentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<Response> getCustomContentByTypeInPageWithHttpInfo(int id, String type, { CustomContentSortOrder? sort, String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/custom-content'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'type', type));
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get custom content by type in page
  ///
  /// Returns all custom content for a given type within a given page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content, the container of the custom content (page), and the corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which custom content should be returned.
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [CustomContentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<MultiEntityResultCustomContent?> getCustomContentByTypeInPage(int id, String type, { CustomContentSortOrder? sort, String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentByTypeInPageWithHttpInfo(id, type, sort: sort, cursor: cursor, limit: limit, bodyFormat: bodyFormat, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultCustomContent',) as MultiEntityResultCustomContent;
    
    }
    return null;
  }

  /// Get custom content by type in space
  ///
  /// Returns all custom content for a given type within a given space. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content and the corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which custom content should be returned.
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<Response> getCustomContentByTypeInSpaceWithHttpInfo(int id, String type, { String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/custom-content'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'type', type));
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get custom content by type in space
  ///
  /// Returns all custom content for a given type within a given space. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content and the corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which custom content should be returned.
  ///
  /// * [String] type (required):
  ///   The type of custom content being requested. See: https://developer.atlassian.com/cloud/confluence/custom-content/ for additional details on custom content.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  Future<MultiEntityResultCustomContent?> getCustomContentByTypeInSpace(int id, String type, { String? cursor, int? limit, CustomContentBodyRepresentation? bodyFormat, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentByTypeInSpaceWithHttpInfo(id, type, cursor: cursor, limit: limit, bodyFormat: bodyFormat, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultCustomContent',) as MultiEntityResultCustomContent;
    
    }
    return null;
  }

  /// Update custom content
  ///
  /// Update a custom content by id. At most one of `spaceId`, `pageId`, `blogPostId`, or `customContentId` is allowed in the request body. Note that if `spaceId` is specified, it must be the same as the `spaceId` used for creating the custom content as moving custom content to a different space is not supported.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to update custom content in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content to be updated. If you don't know the custom content ID, use Get Custom Content by Type and filter the results.
  ///
  /// * [UpdateCustomContentRequest] updateCustomContentRequest (required):
  Future<Response> updateCustomContentWithHttpInfo(int id, UpdateCustomContentRequest updateCustomContentRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateCustomContentRequest;

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

  /// Update custom content
  ///
  /// Update a custom content by id. At most one of `spaceId`, `pageId`, `blogPostId`, or `customContentId` is allowed in the request body. Note that if `spaceId` is specified, it must be the same as the `spaceId` used for creating the custom content as moving custom content to a different space is not supported.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blogpost and its corresponding space. Permission to update custom content in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content to be updated. If you don't know the custom content ID, use Get Custom Content by Type and filter the results.
  ///
  /// * [UpdateCustomContentRequest] updateCustomContentRequest (required):
  Future<CreateCustomContent201Response?> updateCustomContent(int id, UpdateCustomContentRequest updateCustomContentRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateCustomContentWithHttpInfo(id, updateCustomContentRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateCustomContent201Response',) as CreateCustomContent201Response;
    
    }
    return null;
  }
}
