//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class BlogPostApi {
  BlogPostApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create blog post
  ///
  /// Creates a new blog post in the space specified by the spaceId.  By default this will create the blog post as a non-draft, unless the status is specified as draft. If creating a non-draft, the title must not be empty.  Currently only supports the storage representation specified in the body.representation enums below
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateBlogPostRequest] createBlogPostRequest (required):
  ///
  /// * [bool] private:
  ///   The blog post will be private. Only the user who creates this blog post will have permission to view and edit one.
  Future<Response> createBlogPostWithHttpInfo(CreateBlogPostRequest createBlogPostRequest, { bool? private, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts';

    // ignore: prefer_final_locals
    Object? postBody = createBlogPostRequest;

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

  /// Create blog post
  ///
  /// Creates a new blog post in the space specified by the spaceId.  By default this will create the blog post as a non-draft, unless the status is specified as draft. If creating a non-draft, the title must not be empty.  Currently only supports the storage representation specified in the body.representation enums below
  ///
  /// Parameters:
  ///
  /// * [CreateBlogPostRequest] createBlogPostRequest (required):
  ///
  /// * [bool] private:
  ///   The blog post will be private. Only the user who creates this blog post will have permission to view and edit one.
  Future<CreateBlogPost200Response?> createBlogPost(CreateBlogPostRequest createBlogPostRequest, { bool? private, Future<void>? abortTrigger, }) async {
    final response = await createBlogPostWithHttpInfo(createBlogPostRequest, private: private, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateBlogPost200Response',) as CreateBlogPost200Response;
    
    }
    return null;
  }

  /// Delete blog post
  ///
  /// Delete a blog post by id.  By default this will delete blog posts that are non-drafts. To delete a blog post that is a draft, the endpoint must be called on a  draft with the following param `draft=true`. Discarded drafts are not sent to the trash and are permanently deleted.  Deleting a blog post that is not a draft moves the blog post to the trash, where it can be restored later. To permanently delete a blog post (or \"purge\" it), the endpoint must be called on a **trashed** blog post with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space. Permission to delete blog posts in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the blog post.
  ///
  /// * [bool] draft:
  ///   If attempting to delete a blog post that is a draft.
  Future<Response> deleteBlogPostWithHttpInfo(int id, { bool? purge, bool? draft, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (purge != null) {
      queryParams.addAll(_queryParams('', 'purge', purge));
    }
    if (draft != null) {
      queryParams.addAll(_queryParams('', 'draft', draft));
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

  /// Delete blog post
  ///
  /// Delete a blog post by id.  By default this will delete blog posts that are non-drafts. To delete a blog post that is a draft, the endpoint must be called on a  draft with the following param `draft=true`. Discarded drafts are not sent to the trash and are permanently deleted.  Deleting a blog post that is not a draft moves the blog post to the trash, where it can be restored later. To permanently delete a blog post (or \"purge\" it), the endpoint must be called on a **trashed** blog post with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space. Permission to delete blog posts in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the blog post.
  ///
  /// * [bool] draft:
  ///   If attempting to delete a blog post that is a draft.
  Future<void> deleteBlogPost(int id, { bool? purge, bool? draft, Future<void>? abortTrigger, }) async {
    final response = await deleteBlogPostWithHttpInfo(id, purge: purge, draft: draft, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get blog post by id
  ///
  /// Returns a specific blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be returned. If you don't know the blog post ID, use Get blog posts and filter the results.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [bool] getDraft:
  ///   Retrieve the draft version of this blog post.
  ///
  /// * [List<String>] status:
  ///   Filter the blog post being retrieved by its status.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this blog post in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this blog post in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeFavoritedByCurrentUserStatus:
  ///   Includes whether this blog post has been favorited by the current user.
  ///
  /// * [bool] includeWebresources:
  ///   Includes web resources that can be used to render blog post content on a client.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the blog post.
  Future<Response> getBlogPostByIdWithHttpInfo(int id, { PrimaryBodyRepresentationSingle? bodyFormat, bool? getDraft, List<String>? status, int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, bool? includeFavoritedByCurrentUserStatus, bool? includeWebresources, bool? includeCollaborators, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
    }
    if (getDraft != null) {
      queryParams.addAll(_queryParams('', 'get-draft', getDraft));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
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
    if (includeLikes != null) {
      queryParams.addAll(_queryParams('', 'include-likes', includeLikes));
    }
    if (includeVersions != null) {
      queryParams.addAll(_queryParams('', 'include-versions', includeVersions));
    }
    if (includeVersion != null) {
      queryParams.addAll(_queryParams('', 'include-version', includeVersion));
    }
    if (includeFavoritedByCurrentUserStatus != null) {
      queryParams.addAll(_queryParams('', 'include-favorited-by-current-user-status', includeFavoritedByCurrentUserStatus));
    }
    if (includeWebresources != null) {
      queryParams.addAll(_queryParams('', 'include-webresources', includeWebresources));
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

  /// Get blog post by id
  ///
  /// Returns a specific blog post.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be returned. If you don't know the blog post ID, use Get blog posts and filter the results.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [bool] getDraft:
  ///   Retrieve the draft version of this blog post.
  ///
  /// * [List<String>] status:
  ///   Filter the blog post being retrieved by its status.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this blog post in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this blog post in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this blog post in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeFavoritedByCurrentUserStatus:
  ///   Includes whether this blog post has been favorited by the current user.
  ///
  /// * [bool] includeWebresources:
  ///   Includes web resources that can be used to render blog post content on a client.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the blog post.
  Future<CreateBlogPost200Response?> getBlogPostById(int id, { PrimaryBodyRepresentationSingle? bodyFormat, bool? getDraft, List<String>? status, int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, bool? includeFavoritedByCurrentUserStatus, bool? includeWebresources, bool? includeCollaborators, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostByIdWithHttpInfo(id, bodyFormat: bodyFormat, getDraft: getDraft, status: status, version: version, includeLabels: includeLabels, includeProperties: includeProperties, includeOperations: includeOperations, includeLikes: includeLikes, includeVersions: includeVersions, includeVersion: includeVersion, includeFavoritedByCurrentUserStatus: includeFavoritedByCurrentUserStatus, includeWebresources: includeWebresources, includeCollaborators: includeCollaborators, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateBlogPost200Response',) as CreateBlogPost200Response;
    
    }
    return null;
  }

  /// Get blog posts
  ///
  /// Returns all blog posts. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only blog posts that the user has permission to view will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] id:
  ///   Filter the results based on blog post ids. Multiple blog post ids can be specified as a comma-separated list.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [BlogPostSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to blog posts based on their status. By default, `current` is used.
  ///
  /// * [String] title:
  ///   Filter the results to blog posts based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of blog posts per result to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<Response> getBlogPostsWithHttpInfo({ List<int>? id, List<int>? spaceId, BlogPostSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (spaceId != null) {
      queryParams.addAll(_queryParams('multi', 'space-id', spaceId));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (title != null) {
      queryParams.addAll(_queryParams('', 'title', title));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get blog posts
  ///
  /// Returns all blog posts. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only blog posts that the user has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [List<int>] id:
  ///   Filter the results based on blog post ids. Multiple blog post ids can be specified as a comma-separated list.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [BlogPostSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to blog posts based on their status. By default, `current` is used.
  ///
  /// * [String] title:
  ///   Filter the results to blog posts based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of blog posts per result to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultBlogPost?> getBlogPosts({ List<int>? id, List<int>? spaceId, BlogPostSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostsWithHttpInfo(id: id, spaceId: spaceId, sort: sort, status: status, title: title, bodyFormat: bodyFormat, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultBlogPost',) as MultiEntityResultBlogPost;
    
    }
    return null;
  }

  /// Get blog posts in space
  ///
  /// Returns all blog posts in a space. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and view the space. Only blog posts that the user has permission to view will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which blog posts should be returned.
  ///
  /// * [BlogPostSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to blog posts based on their status. By default, `current` is used.
  ///
  /// * [String] title:
  ///   Filter the results to blog posts based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of blog posts per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getBlogPostsInSpaceWithHttpInfo(int id, { BlogPostSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/blogposts'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (title != null) {
      queryParams.addAll(_queryParams('', 'title', title));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get blog posts in space
  ///
  /// Returns all blog posts in a space. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and view the space. Only blog posts that the user has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which blog posts should be returned.
  ///
  /// * [BlogPostSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to blog posts based on their status. By default, `current` is used.
  ///
  /// * [String] title:
  ///   Filter the results to blog posts based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of blog posts per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultBlogPost?> getBlogPostsInSpace(int id, { BlogPostSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getBlogPostsInSpaceWithHttpInfo(id, sort: sort, status: status, title: title, bodyFormat: bodyFormat, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultBlogPost',) as MultiEntityResultBlogPost;
    
    }
    return null;
  }

  /// Get blog posts for label
  ///
  /// Returns the blogposts of specified label. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the label for which blog posts should be returned.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [BlogPostSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of blog posts per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getLabelBlogPostsWithHttpInfo(int id, { List<int>? spaceId, PrimaryBodyRepresentation? bodyFormat, BlogPostSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/labels/{id}/blogposts'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (spaceId != null) {
      queryParams.addAll(_queryParams('multi', 'space-id', spaceId));
    }
    if (bodyFormat != null) {
      queryParams.addAll(_queryParams('', 'body-format', bodyFormat));
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

  /// Get blog posts for label
  ///
  /// Returns the blogposts of specified label. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the label for which blog posts should be returned.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [BlogPostSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of blog posts per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultBlogPost?> getLabelBlogPosts(int id, { List<int>? spaceId, PrimaryBodyRepresentation? bodyFormat, BlogPostSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getLabelBlogPostsWithHttpInfo(id, spaceId: spaceId, bodyFormat: bodyFormat, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultBlogPost',) as MultiEntityResultBlogPost;
    
    }
    return null;
  }

  /// Update blog post
  ///
  /// Update a blog post by id.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space. Permission to update blog posts in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be updated. If you don't know the blog post ID, use Get Blog Posts and filter the results.
  ///
  /// * [UpdateBlogPostRequest] updateBlogPostRequest (required):
  Future<Response> updateBlogPostWithHttpInfo(int id, UpdateBlogPostRequest updateBlogPostRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/blogposts/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateBlogPostRequest;

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

  /// Update blog post
  ///
  /// Update a blog post by id.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the blog post and its corresponding space. Permission to update blog posts in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the blog post to be updated. If you don't know the blog post ID, use Get Blog Posts and filter the results.
  ///
  /// * [UpdateBlogPostRequest] updateBlogPostRequest (required):
  Future<CreateBlogPost200Response?> updateBlogPost(int id, UpdateBlogPostRequest updateBlogPostRequest, { Future<void>? abortTrigger, }) async {
    final response = await updateBlogPostWithHttpInfo(id, updateBlogPostRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateBlogPost200Response',) as CreateBlogPost200Response;
    
    }
    return null;
  }
}
