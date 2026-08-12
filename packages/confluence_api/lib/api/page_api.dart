//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class PageApi {
  PageApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create page
  ///
  /// Creates a page in the space.  Pages are created as published by default unless specified as a draft in the status field. If creating a published page, the title must be specified.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a page in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreatePageRequest] createPageRequest (required):
  ///
  /// * [bool] embedded:
  ///   Tag the content as embedded and content will be created in NCS.
  ///
  /// * [bool] private:
  ///   The page will be private. Only the user who creates this page will have permission to view and edit one.
  ///
  /// * [bool] rootLevel:
  ///   The page will be created at the root level of the space (outside the space homepage tree). If true, then a  value may not be supplied for the `parentId` body parameter.
  Future<Response> createPageWithHttpInfo(CreatePageRequest createPageRequest, { bool? embedded, bool? private, bool? rootLevel, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages';

    // ignore: prefer_final_locals
    Object? postBody = createPageRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (embedded != null) {
      queryParams.addAll(_queryParams('', 'embedded', embedded));
    }
    if (private != null) {
      queryParams.addAll(_queryParams('', 'private', private));
    }
    if (rootLevel != null) {
      queryParams.addAll(_queryParams('', 'root-level', rootLevel));
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

  /// Create page
  ///
  /// Creates a page in the space.  Pages are created as published by default unless specified as a draft in the status field. If creating a published page, the title must be specified.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the corresponding space. Permission to create a page in the space.
  ///
  /// Parameters:
  ///
  /// * [CreatePageRequest] createPageRequest (required):
  ///
  /// * [bool] embedded:
  ///   Tag the content as embedded and content will be created in NCS.
  ///
  /// * [bool] private:
  ///   The page will be private. Only the user who creates this page will have permission to view and edit one.
  ///
  /// * [bool] rootLevel:
  ///   The page will be created at the root level of the space (outside the space homepage tree). If true, then a  value may not be supplied for the `parentId` body parameter.
  Future<CreatePage200Response?> createPage(CreatePageRequest createPageRequest, { bool? embedded, bool? private, bool? rootLevel, Future<void>? abortTrigger, }) async {
    final response = await createPageWithHttpInfo(createPageRequest, embedded: embedded, private: private, rootLevel: rootLevel, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreatePage200Response',) as CreatePage200Response;
    
    }
    return null;
  }

  /// Delete page
  ///
  /// Delete a page by id.  By default this will delete pages that are non-drafts. To delete a page that is a draft, the endpoint must be called on a  draft with the following param `draft=true`. Discarded drafts are not sent to the trash and are permanently deleted.  Deleting a page moves the page to the trash, where it can be restored later. To permanently delete a page (or \"purge\" it), the endpoint must be called on a **trashed** page with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space. Permission to delete pages in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the page.
  ///
  /// * [bool] draft:
  ///   If attempting to delete a page that is a draft.
  Future<Response> deletePageWithHttpInfo(int id, { bool? purge, bool? draft, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}'
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

  /// Delete page
  ///
  /// Delete a page by id.  By default this will delete pages that are non-drafts. To delete a page that is a draft, the endpoint must be called on a  draft with the following param `draft=true`. Discarded drafts are not sent to the trash and are permanently deleted.  Deleting a page moves the page to the trash, where it can be restored later. To permanently delete a page (or \"purge\" it), the endpoint must be called on a **trashed** page with the following param `purge=true`.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space. Permission to delete pages in the space. Permission to administer the space (if attempting to purge).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be deleted.
  ///
  /// * [bool] purge:
  ///   If attempting to purge the page.
  ///
  /// * [bool] draft:
  ///   If attempting to delete a page that is a draft.
  Future<void> deletePage(int id, { bool? purge, bool? draft, Future<void>? abortTrigger, }) async {
    final response = await deletePageWithHttpInfo(id, purge: purge, draft: draft, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get pages for label
  ///
  /// Returns the pages of specified label. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the label for which pages should be returned.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [PageSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getLabelPagesWithHttpInfo(int id, { List<int>? spaceId, PrimaryBodyRepresentation? bodyFormat, PageSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/labels/{id}/pages'
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

  /// Get pages for label
  ///
  /// Returns the pages of specified label. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the content of the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the label for which pages should be returned.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [PageSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultPage?> getLabelPages(int id, { List<int>? spaceId, PrimaryBodyRepresentation? bodyFormat, PageSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getLabelPagesWithHttpInfo(id, spaceId: spaceId, bodyFormat: bodyFormat, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultPage',) as MultiEntityResultPage;
    
    }
    return null;
  }

  /// Get page by id
  ///
  /// Returns a specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be returned. If you don't know the page ID, use Get pages and filter the results.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [bool] getDraft:
  ///   Retrieve the draft version of this page.
  ///
  /// * [List<String>] status:
  ///   Filter the page being retrieved by its status.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this page in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this page in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeFavoritedByCurrentUserStatus:
  ///   Includes whether this page has been favorited by the current user.
  ///
  /// * [bool] includeWebresources:
  ///   Includes web resources that can be used to render page content on a client.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the page.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the page, as defined in the `ChildrenResponse` object.
  Future<Response> getPageByIdWithHttpInfo(int id, { PrimaryBodyRepresentationSingle? bodyFormat, bool? getDraft, List<String>? status, int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, bool? includeFavoritedByCurrentUserStatus, bool? includeWebresources, bool? includeCollaborators, bool? includeDirectChildren, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}'
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
    if (includeDirectChildren != null) {
      queryParams.addAll(_queryParams('', 'include-direct-children', includeDirectChildren));
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

  /// Get page by id
  ///
  /// Returns a specific page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be returned. If you don't know the page ID, use Get pages and filter the results.
  ///
  /// * [PrimaryBodyRepresentationSingle] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [bool] getDraft:
  ///   Retrieve the draft version of this page.
  ///
  /// * [List<String>] status:
  ///   Filter the page being retrieved by its status.
  ///
  /// * [int] version:
  ///   Allows you to retrieve a previously published version. Specify the previous version's number to retrieve its details.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes content properties associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this page in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLikes:
  ///   Includes likes associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersions:
  ///   Includes versions associated with this page in the response. The number of results will be limited to 50 and sorted in the default sort order.  A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeVersion:
  ///   Includes the current version associated with this page in the response. By default this is included and can be omitted by setting the value to `false`.
  ///
  /// * [bool] includeFavoritedByCurrentUserStatus:
  ///   Includes whether this page has been favorited by the current user.
  ///
  /// * [bool] includeWebresources:
  ///   Includes web resources that can be used to render page content on a client.
  ///
  /// * [bool] includeCollaborators:
  ///   Includes collaborators on the page.
  ///
  /// * [bool] includeDirectChildren:
  ///   Includes direct children of the page, as defined in the `ChildrenResponse` object.
  Future<CreatePage200Response?> getPageById(int id, { PrimaryBodyRepresentationSingle? bodyFormat, bool? getDraft, List<String>? status, int? version, bool? includeLabels, bool? includeProperties, bool? includeOperations, bool? includeLikes, bool? includeVersions, bool? includeVersion, bool? includeFavoritedByCurrentUserStatus, bool? includeWebresources, bool? includeCollaborators, bool? includeDirectChildren, Future<void>? abortTrigger, }) async {
    final response = await getPageByIdWithHttpInfo(id, bodyFormat: bodyFormat, getDraft: getDraft, status: status, version: version, includeLabels: includeLabels, includeProperties: includeProperties, includeOperations: includeOperations, includeLikes: includeLikes, includeVersions: includeVersions, includeVersion: includeVersion, includeFavoritedByCurrentUserStatus: includeFavoritedByCurrentUserStatus, includeWebresources: includeWebresources, includeCollaborators: includeCollaborators, includeDirectChildren: includeDirectChildren, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreatePage200Response',) as CreatePage200Response;
    
    }
    return null;
  }

  /// Get pages
  ///
  /// Returns all pages. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only pages that the user has permission to view will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] id:
  ///   Filter the results based on page ids. Multiple page ids can be specified as a comma-separated list.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [PageSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to pages based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] title:
  ///   Filter the results to pages based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] subtype:
  ///   Filter the results to pages based on their subtype.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getPagesWithHttpInfo({ List<int>? id, List<int>? spaceId, PageSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? subtype, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages';

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
    if (subtype != null) {
      queryParams.addAll(_queryParams('', 'subtype', subtype));
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

  /// Get pages
  ///
  /// Returns all pages. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only pages that the user has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [List<int>] id:
  ///   Filter the results based on page ids. Multiple page ids can be specified as a comma-separated list.
  ///
  /// * [List<int>] spaceId:
  ///   Filter the results based on space ids. Multiple space ids can be specified as a comma-separated list.
  ///
  /// * [PageSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to pages based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] title:
  ///   Filter the results to pages based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] subtype:
  ///   Filter the results to pages based on their subtype.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultPage?> getPages({ List<int>? id, List<int>? spaceId, PageSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? subtype, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getPagesWithHttpInfo(id: id, spaceId: spaceId, sort: sort, status: status, title: title, bodyFormat: bodyFormat, subtype: subtype, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultPage',) as MultiEntityResultPage;
    
    }
    return null;
  }

  /// Get pages in space
  ///
  /// Returns all pages in a space. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'View' permission for the space. Only pages that the user has permission to view will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which pages should be returned.
  ///
  /// * [String] depth:
  ///   Filter the results to pages at the root level of the space or to all pages in the space.
  ///
  /// * [PageSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to pages based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] title:
  ///   Filter the results to pages based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<Response> getPagesInSpaceWithHttpInfo(int id, { String? depth, PageSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}/pages'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (depth != null) {
      queryParams.addAll(_queryParams('', 'depth', depth));
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

  /// Get pages in space
  ///
  /// Returns all pages in a space. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission) and 'View' permission for the space. Only pages that the user has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space for which pages should be returned.
  ///
  /// * [String] depth:
  ///   Filter the results to pages at the root level of the space or to all pages in the space.
  ///
  /// * [PageSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [List<String>] status:
  ///   Filter the results to pages based on their status. By default, `current` and `archived` are used.
  ///
  /// * [String] title:
  ///   Filter the results to pages based on their title.
  ///
  /// * [PrimaryBodyRepresentation] bodyFormat:
  ///   The content format types to be returned in the `body` field of the response. If available, the representation will be available under a response field of the same name under the `body` field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of pages per result to return. If more results exist, use the `Link` header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultPage?> getPagesInSpace(int id, { String? depth, PageSortOrder? sort, List<String>? status, String? title, PrimaryBodyRepresentation? bodyFormat, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getPagesInSpaceWithHttpInfo(id, depth: depth, sort: sort, status: status, title: title, bodyFormat: bodyFormat, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultPage',) as MultiEntityResultPage;
    
    }
    return null;
  }

  /// Update page
  ///
  /// Update a page by id.  When the \"current\" version is updated, the provided body content is considered as the latest version. This latest body content will be attempted to be merged into the draft version through a content reconciliation algorithm. If two versions are significantly diverged,  the latest provided content may entirely override what was previously in the draft.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space. Permission to update pages in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be updated. If you don't know the page ID, use Get Pages and filter the results.
  ///
  /// * [UpdatePageRequest] updatePageRequest (required):
  Future<Response> updatePageWithHttpInfo(int id, UpdatePageRequest updatePageRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updatePageRequest;

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

  /// Update page
  ///
  /// Update a page by id.  When the \"current\" version is updated, the provided body content is considered as the latest version. This latest body content will be attempted to be merged into the draft version through a content reconciliation algorithm. If two versions are significantly diverged,  the latest provided content may entirely override what was previously in the draft.   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space. Permission to update pages in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be updated. If you don't know the page ID, use Get Pages and filter the results.
  ///
  /// * [UpdatePageRequest] updatePageRequest (required):
  Future<CreatePage200Response?> updatePage(int id, UpdatePageRequest updatePageRequest, { Future<void>? abortTrigger, }) async {
    final response = await updatePageWithHttpInfo(id, updatePageRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreatePage200Response',) as CreatePage200Response;
    
    }
    return null;
  }

  /// Update page title
  ///
  /// Updates the title of a specified page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space. Permission to update pages in the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be updated. If you don't know the page ID, use Get Pages and filter the results
  ///
  /// * [UpdatePageTitleRequest] updatePageTitleRequest (required):
  Future<Response> updatePageTitleWithHttpInfo(int id, UpdatePageTitleRequest updatePageTitleRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/pages/{id}/title'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = updatePageTitleRequest;

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

  /// Update page title
  ///
  /// Updates the title of a specified page.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the page and its corresponding space. Permission to update pages in the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the page to be updated. If you don't know the page ID, use Get Pages and filter the results
  ///
  /// * [UpdatePageTitleRequest] updatePageTitleRequest (required):
  Future<CreatePage200Response?> updatePageTitle(int id, UpdatePageTitleRequest updatePageTitleRequest, { Future<void>? abortTrigger, }) async {
    final response = await updatePageTitleWithHttpInfo(id, updatePageTitleRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreatePage200Response',) as CreatePage200Response;
    
    }
    return null;
  }
}
