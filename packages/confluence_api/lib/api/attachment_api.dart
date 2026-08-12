//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AttachmentApi {
  AttachmentApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete attachment
  ///
  /// Delete an attachment by id.  Deleting an attachment moves the attachment to the trash, where it can be restored later. To permanently delete an attachment (or \"purge\" it), the endpoint must be called on a **trashed** attachment with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the container of the attachment. Permission to delete attachments in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the attachment to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the attachment.
  Future<Response> deleteAttachmentWithHttpInfo(int id, { bool? purge, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{id}'
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

  /// Delete attachment
  ///
  /// Delete an attachment by id.  Deleting an attachment moves the attachment to the trash, where it can be restored later. To permanently delete an attachment (or \"purge\" it), the endpoint must be called on a **trashed** attachment with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the container of the attachment. Permission to delete attachments in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the attachment to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the attachment.
  Future<void> deleteAttachment(int id, { bool? purge, Future<void>? abortTrigger, }) async {
    final response = await deleteAttachmentWithHttpInfo(id, purge: purge, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get attachment by id
  ///
  /// Returns a specific attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment's container.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment to be returned. If you don't know the attachment's ID, use Get attachments for page/blogpost/custom content.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this attachment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this attachment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this attachment in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this attachment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this attachment in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the attachment.
  Future<Response> getAttachmentByIdWithHttpInfo(String id, { int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeVersions, bool? includeVersion, bool? includeCollaborators, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get attachment by id
  ///
  /// Returns a specific attachment.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment's container.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment to be returned. If you don't know the attachment's ID, use Get attachments for page/blogpost/custom content.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this attachment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this attachment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this attachment in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this attachment in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this attachment in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the attachment.
  Future<GetAttachmentById200Response?> getAttachmentById(String id, { int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeVersions, bool? includeVersion, bool? includeCollaborators, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentByIdWithHttpInfo(id, version: version, includeLabels: includeLabels, includeProperties: includeProperties, includeOperations: includeOperations, includeVersions: includeVersions, includeVersion: includeVersion, includeCollaborators: includeCollaborators, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetAttachmentById200Response',) as GetAttachmentById200Response;
    
    }
    return null;
  }

  /// Download attachment thumbnail by id
  ///
  /// Redirects the client to a URL that serves an attachment thumbnail's binary data.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment's container.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment to be returned. If you don't know the attachment's ID, use Get attachments for page/blogpost/custom content.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [int] height:
  ///   Allows you to define the thumbnail height.
  ///
  /// * [int] width:
  ///   Allows you to define the thumbnail width.
  Future<Response> getAttachmentThumbnailByIdWithHttpInfo(String id, { int? version, int? height, int? width, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments/{id}/thumbnail/download'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (version != null) {
      queryParams.addAll(_queryParams('', 'version', version));
    }
    if (height != null) {
      queryParams.addAll(_queryParams('', 'height', height));
    }
    if (width != null) {
      queryParams.addAll(_queryParams('', 'width', width));
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

  /// Download attachment thumbnail by id
  ///
  /// Redirects the client to a URL that serves an attachment thumbnail's binary data.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment's container.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment to be returned. If you don't know the attachment's ID, use Get attachments for page/blogpost/custom content.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [int] height:
  ///   Allows you to define the thumbnail height.
  ///
  /// * [int] width:
  ///   Allows you to define the thumbnail width.
  Future<void> getAttachmentThumbnailById(String id, { int? version, int? height, int? width, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentThumbnailByIdWithHttpInfo(id, version: version, height: height, width: width, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get attachments
  ///
  /// Returns all attachments. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the container of the attachment.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getAttachmentsWithHttpInfo({ AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/attachments';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (mediaType != null) {
      queryParams.addAll(_queryParams('', 'mediaType', mediaType));
    }
    if (filename != null) {
      queryParams.addAll(_queryParams('', 'filename', filename));
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

  /// Get attachments
  ///
  /// Returns all attachments. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the container of the attachment.
  ///
  /// Parameters:
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultAttachment?> getAttachments({ AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentsWithHttpInfo(sort: sort, cursor: cursor, status: status, mediaType: mediaType, filename: filename, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultAttachment',) as MultiEntityResultAttachment;
    
    }
    return null;
  }

  /// Get attachments for blog post
  ///
  /// Returns the attachments of specific blog post. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getBlogpostAttachmentsWithHttpInfo(int id, { AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}/attachments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (mediaType != null) {
      queryParams.addAll(_queryParams('', 'mediaType', mediaType));
    }
    if (filename != null) {
      queryParams.addAll(_queryParams('', 'filename', filename));
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

  /// Get attachments for blog post
  ///
  /// Returns the attachments of specific blog post. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultAttachment?> getBlogpostAttachments(int id, { AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getBlogpostAttachmentsWithHttpInfo(id, sort: sort, cursor: cursor, status: status, mediaType: mediaType, filename: filename, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultAttachment',) as MultiEntityResultAttachment;
    
    }
    return null;
  }

  /// Get attachments for custom content
  ///
  /// Returns the attachments of specific custom content. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the custom content and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getCustomContentAttachmentsWithHttpInfo(int id, { AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/custom-content/{id}/attachments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (mediaType != null) {
      queryParams.addAll(_queryParams('', 'mediaType', mediaType));
    }
    if (filename != null) {
      queryParams.addAll(_queryParams('', 'filename', filename));
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

  /// Get attachments for custom content
  ///
  /// Returns the attachments of specific custom content. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the custom content and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the custom content for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultAttachment?> getCustomContentAttachments(int id, { AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getCustomContentAttachmentsWithHttpInfo(id, sort: sort, cursor: cursor, status: status, mediaType: mediaType, filename: filename, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultAttachment',) as MultiEntityResultAttachment;
    
    }
    return null;
  }

  /// Get attachments for label
  ///
  /// Returns the attachments of specified label. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the label for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getLabelAttachmentsWithHttpInfo(int id, { AttachmentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/labels/{id}/attachments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
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

  /// Get attachments for label
  ///
  /// Returns the attachments of specified label. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the attachment and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the label for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultAttachment?> getLabelAttachments(int id, { AttachmentSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getLabelAttachmentsWithHttpInfo(id, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultAttachment',) as MultiEntityResultAttachment;
    
    }
    return null;
  }

  /// Get attachments for page
  ///
  /// Returns the attachments of specific page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getPageAttachmentsWithHttpInfo(int id, { AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/attachments'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (cursor != null) {
      queryParams.addAll(_queryParams('', 'cursor', cursor));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (mediaType != null) {
      queryParams.addAll(_queryParams('', 'mediaType', mediaType));
    }
    if (filename != null) {
      queryParams.addAll(_queryParams('', 'filename', filename));
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

  /// Get attachments for page
  ///
  /// Returns the attachments of specific page. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page for which attachments should be returned.
  ///
  /// * [AttachmentSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [List<String>] status:
  ///   Filter the results to attachments based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] mediaType:
  ///   Filters on the mediaType of attachments. Only one may be specified.
  ///
  /// * [String] filename:
  ///   Filters on the file-name of attachments. Only one may be specified.
  ///
  /// * [int] limit:
  ///   Maximum number of attachments per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultAttachment?> getPageAttachments(int id, { AttachmentSortOrder? sort, String? cursor, List<String>? status, String? mediaType, String? filename, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getPageAttachmentsWithHttpInfo(id, sort: sort, cursor: cursor, status: status, mediaType: mediaType, filename: filename, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultAttachment',) as MultiEntityResultAttachment;
    
    }
    return null;
  }
}
