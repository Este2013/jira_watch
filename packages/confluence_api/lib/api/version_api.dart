//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class VersionApi {
  VersionApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get version details for attachment version
  ///
  /// Retrieves version details for the specified attachment and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the attachment to be returned.
  Future<Response> getAttachmentVersionDetailsWithHttpInfo(String attachmentId, int versionNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{attachment-id}/versions/{version-number}'
      .replaceAll('{attachment-id}', attachmentId)
      .replaceAll('{version-number}', versionNumber.toString());

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

  /// Get version details for attachment version
  ///
  /// Retrieves version details for the specified attachment and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment.
  ///
  /// Parameters:
  ///
  /// * [String] attachmentId (required):
  ///   The ID of the attachment for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the attachment to be returned.
  Future<DetailedVersion?> getAttachmentVersionDetails(String attachmentId, int versionNumber, { Future<void>? abortTrigger, }) async {
    final response = await getAttachmentVersionDetailsWithHttpInfo(attachmentId, versionNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedVersion',) as DetailedVersion;
    
    }
    return null;
  }

  /// Get attachment versions
  ///
  /// Returns the versions of specific attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment to be queried for its versions. If you don't know the attachment ID, use Get attachments and filter the results.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getAttachmentVersionsWithHttpInfo(String id, { String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{id}/versions'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get attachment versions
  ///
  /// Returns the versions of specific attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment to be queried for its versions. If you don't know the attachment ID, use Get attachments and filter the results.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultVersion?> getAttachmentVersions(String id, { String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentVersionsWithHttpInfo(id, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultVersion',) as MultiEntityResultVersion;
    
    }
    return null;
  }

  /// Get version details for blog post version
  ///
  /// Retrieves version details for the specified blog post and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the blog post to be returned.
  Future<Response> getBlogPostVersionDetailsWithHttpInfo(int blogpostId, int versionNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{blogpost-id}/versions/{version-number}'
      .replaceAll('{blogpost-id}', blogpostId.toString())
      .replaceAll('{version-number}', versionNumber.toString());

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

  /// Get version details for blog post version
  ///
  /// Retrieves version details for the specified blog post and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post.
  ///
  /// Parameters:
  ///
  /// * [int] blogpostId (required):
  ///   The ID of the blog post for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the blog post to be returned.
  Future<DetailedVersion?> getBlogPostVersionDetails(int blogpostId, int versionNumber, { Future<void>? abortTrigger, }) async {
    final response = await getBlogPostVersionDetailsWithHttpInfo(blogpostId, versionNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedVersion',) as DetailedVersion;
    
    }
    return null;
  }

  /// Get blog post versions
  ///
  /// Returns the versions of specific blog post.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be queried for its versions. If you don't know the blog post ID, use Get blog posts and filter the results.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getBlogPostVersionsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/versions'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get blog post versions
  ///
  /// Returns the versions of specific blog post.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be queried for its versions. If you don't know the blog post ID, use Get blog posts and filter the results.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultVersion1?> getBlogPostVersions(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostVersionsWithHttpInfo(id, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultVersion1',) as MultiEntityResultVersion1;
    
    }
    return null;
  }

  /// Get version details for custom content version
  ///
  /// Retrieves version details for the specified custom content and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the custom content to be returned.
  Future<Response> getCustomContentVersionDetailsWithHttpInfo(int customContentId, int versionNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/versions/{version-number}'
      .replaceAll('{custom-content-id}', customContentId.toString())
      .replaceAll('{version-number}', versionNumber.toString());

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

  /// Get version details for custom content version
  ///
  /// Retrieves version details for the specified custom content and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the custom content to be returned.
  Future<DetailedVersion?> getCustomContentVersionDetails(int customContentId, int versionNumber, { Future<void>? abortTrigger, }) async {
    final response = await getCustomContentVersionDetailsWithHttpInfo(customContentId, versionNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedVersion',) as DetailedVersion;
    
    }
    return null;
  }

  /// Get custom content versions
  ///
  /// Returns the versions of specific custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content and its corresponding page and space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content to be queried for its versions. If you don't know the custom content ID, use Get custom-content by type and filter the results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getCustomContentVersionsWithHttpInfo(int customContentId, { CustomContentBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{custom-content-id}/versions'
      .replaceAll('{custom-content-id}', customContentId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get custom content versions
  ///
  /// Returns the versions of specific custom content.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the custom content and its corresponding page and space.
  ///
  /// Parameters:
  ///
  /// * [int] customContentId (required):
  ///   The ID of the custom content to be queried for its versions. If you don't know the custom content ID, use Get custom-content by type and filter the results.
  ///
  /// * [CustomContentBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.  Note: If the custom content body type is `storage`, the `storage` and `atlas_doc_format` body formats are able to be returned. If the custom content body type is `raw`, only the `raw` body format is able to be returned.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultVersion3?> getCustomContentVersions(int customContentId, { CustomContentBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentVersionsWithHttpInfo(customContentId, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultVersion3',) as MultiEntityResultVersion3;
    
    }
    return null;
  }

  /// Get version details for footer comment version
  ///
  /// Retrieves version details for the specified footer comment version.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the footer comment for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the footer comment to be returned.
  Future<Response> getFooterCommentVersionDetailsWithHttpInfo(int id, int versionNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments/{id}/versions/{version-number}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{version-number}', versionNumber.toString());

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

  /// Get version details for footer comment version
  ///
  /// Retrieves version details for the specified footer comment version.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the footer comment for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the footer comment to be returned.
  Future<DetailedVersion?> getFooterCommentVersionDetails(int id, int versionNumber, { Future<void>? abortTrigger, }) async {
    final response = await getFooterCommentVersionDetailsWithHttpInfo(id, versionNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedVersion',) as DetailedVersion;
    
    }
    return null;
  }

  /// Get footer comment versions
  ///
  /// Retrieves the versions of the specified footer comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the footer comment for which versions should be returned
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getFooterCommentVersionsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/footer-comments/{id}/versions'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get footer comment versions
  ///
  /// Retrieves the versions of the specified footer comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the footer comment for which versions should be returned
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultVersion4?> getFooterCommentVersions(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getFooterCommentVersionsWithHttpInfo(id, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultVersion4',) as MultiEntityResultVersion4;
    
    }
    return null;
  }

  /// Get version details for inline comment version
  ///
  /// Retrieves version details for the specified inline comment version.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the inline comment for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the inline comment to be returned.
  Future<Response> getInlineCommentVersionDetailsWithHttpInfo(int id, int versionNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments/{id}/versions/{version-number}'
      .replaceAll('{id}', id.toString())
      .replaceAll('{version-number}', versionNumber.toString());

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

  /// Get version details for inline comment version
  ///
  /// Retrieves version details for the specified inline comment version.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the inline comment for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the inline comment to be returned.
  Future<DetailedVersion?> getInlineCommentVersionDetails(int id, int versionNumber, { Future<void>? abortTrigger, }) async {
    final response = await getInlineCommentVersionDetailsWithHttpInfo(id, versionNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedVersion',) as DetailedVersion;
    
    }
    return null;
  }

  /// Get inline comment versions
  ///
  /// Retrieves the versions of the specified inline comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the inline comment for which versions should be returned
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getInlineCommentVersionsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/inline-comments/{id}/versions'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get inline comment versions
  ///
  /// Retrieves the versions of the specified inline comment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page or blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the inline comment for which versions should be returned
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultVersion4?> getInlineCommentVersions(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getInlineCommentVersionsWithHttpInfo(id, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultVersion4',) as MultiEntityResultVersion4;
    
    }
    return null;
  }

  /// Get version details for page version
  ///
  /// Retrieves version details for the specified page and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the page to be returned.
  Future<Response> getPageVersionDetailsWithHttpInfo(int pageId, int versionNumber, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{page-id}/versions/{version-number}'
      .replaceAll('{page-id}', pageId.toString())
      .replaceAll('{version-number}', versionNumber.toString());

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

  /// Get version details for page version
  ///
  /// Retrieves version details for the specified page and version number.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page.
  ///
  /// Parameters:
  ///
  /// * [int] pageId (required):
  ///   The ID of the page for which version details should be returned.
  ///
  /// * [int] versionNumber (required):
  ///   The version number of the page to be returned.
  Future<DetailedVersion?> getPageVersionDetails(int pageId, int versionNumber, { Future<void>? abortTrigger, }) async {
    final response = await getPageVersionDetailsWithHttpInfo(pageId, versionNumber, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DetailedVersion',) as DetailedVersion;
    
    }
    return null;
  }

  /// Get page versions
  ///
  /// Returns the versions of specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be queried for its versions. If you don't know the page ID, use Get pages and filter the results.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<Response> getPageVersionsWithHttpInfo(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/versions'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get page versions
  ///
  /// Returns the versions of specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be queried for its versions. If you don't know the page ID, use Get pages and filter the results.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of versions per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  ///
  /// * [VersionSortOrder] sort:
  ///   Used to sort the result by a particular field.
  Future<MultiEntityResultVersion2?> getPageVersions(int id, { PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, VersionSortOrder? sort, Future<void>? abortTrigger, }) async {
    final response = await getPageVersionsWithHttpInfo(id, bodyFormat: bodyFormat, cursor: cursor, limit: limit, sort: sort, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultVersion2',) as MultiEntityResultVersion2;
    
    }
    return null;
  }
}
