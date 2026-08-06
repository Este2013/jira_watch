//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class FiltersApi {
  FiltersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Change filter owner
  ///
  /// Changes the owner of the filter.  **[Permissions](#permissions) required:** Permission to access Jira. However, the user must own the filter or have the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to update.
  ///
  /// * [ChangeFilterOwner] changeFilterOwner (required):
  ///   The account ID of the new owner of the filter.
  Future<Response> changeFilterOwnerWithHttpInfo(int id, ChangeFilterOwner changeFilterOwner, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}/owner'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = changeFilterOwner;

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

  /// Change filter owner
  ///
  /// Changes the owner of the filter.  **[Permissions](#permissions) required:** Permission to access Jira. However, the user must own the filter or have the *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to update.
  ///
  /// * [ChangeFilterOwner] changeFilterOwner (required):
  ///   The account ID of the new owner of the filter.
  Future<Object?> changeFilterOwner(int id, ChangeFilterOwner changeFilterOwner, { Future<void>? abortTrigger, }) async {
    final response = await changeFilterOwnerWithHttpInfo(id, changeFilterOwner, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Create filter
  ///
  /// Creates a filter. The filter is shared according to the [default share scope](#api-rest-api-3-filter-post). The filter is not selected as a favorite.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The filter to create.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable filters with any share permissions to be created. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<Response> createFilterWithHttpInfo(Filter filter, { String? expand, bool? overrideSharePermissions, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter';

    // ignore: prefer_final_locals
    Object? postBody = filter;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (overrideSharePermissions != null) {
      queryParams.addAll(_queryParams('', 'overrideSharePermissions', overrideSharePermissions));
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

  /// Create filter
  ///
  /// Creates a filter. The filter is shared according to the [default share scope](#api-rest-api-3-filter-post). The filter is not selected as a favorite.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [Filter] filter (required):
  ///   The filter to create.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable filters with any share permissions to be created. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<Filter?> createFilter(Filter filter, { String? expand, bool? overrideSharePermissions, Future<void>? abortTrigger, }) async {
    final response = await createFilterWithHttpInfo(filter, expand: expand, overrideSharePermissions: overrideSharePermissions, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Filter',) as Filter;
    
    }
    return null;
  }

  /// Remove filter as favorite
  ///
  /// Removes a filter as a favorite for the user. Note that this operation only removes filters visible to the user from the user's favorites list. For example, if the user favorites a public filter that is subsequently made private (and is therefore no longer visible on their favorites list) they cannot remove it from their favorites list.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  Future<Response> deleteFavouriteForFilterWithHttpInfo(int id, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}/favourite'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Remove filter as favorite
  ///
  /// Removes a filter as a favorite for the user. Note that this operation only removes filters visible to the user from the user's favorites list. For example, if the user favorites a public filter that is subsequently made private (and is therefore no longer visible on their favorites list) they cannot remove it from their favorites list.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  Future<Filter?> deleteFavouriteForFilter(int id, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await deleteFavouriteForFilterWithHttpInfo(id, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Filter',) as Filter;
    
    }
    return null;
  }

  /// Delete filter
  ///
  /// Delete a filter.  **[Permissions](#permissions) required:** Permission to access Jira, however filters can only be deleted by the creator of the filter or a user with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to delete.
  Future<Response> deleteFilterWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}'
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

  /// Delete filter
  ///
  /// Delete a filter.  **[Permissions](#permissions) required:** Permission to access Jira, however filters can only be deleted by the creator of the filter or a user with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to delete.
  Future<void> deleteFilter(int id, { Future<void>? abortTrigger, }) async {
    final response = await deleteFilterWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get columns
  ///
  /// Returns the columns configured for a filter. The column configuration is used when the filter's results are viewed in *List View* with the *Columns* set to *Filter*.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None, however, column details are only returned for:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  Future<Response> getColumnsWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}/columns'
      .replaceAll('{id}', id.toString());

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

  /// Get columns
  ///
  /// Returns the columns configured for a filter. The column configuration is used when the filter's results are viewed in *List View* with the *Columns* set to *Filter*.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None, however, column details are only returned for:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  Future<List<ColumnItem>?> getColumns(int id, { Future<void>? abortTrigger, }) async {
    final response = await getColumnsWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<ColumnItem>') as List)
        .cast<ColumnItem>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get favorite filters
  ///
  /// Returns the visible favorite filters of the user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** A favorite filter is only visible to the user where the filter is:   *  owned by the user.  *  shared with a group that the user is a member of.  *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  shared with a public project.  *  shared with the public.  For example, if the user favorites a public filter that is subsequently made private that filter is not returned by this operation.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  Future<Response> getFavouriteFiltersWithHttpInfo({ String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/favourite';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
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

  /// Get favorite filters
  ///
  /// Returns the visible favorite filters of the user.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** A favorite filter is only visible to the user where the filter is:   *  owned by the user.  *  shared with a group that the user is a member of.  *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  shared with a public project.  *  shared with the public.  For example, if the user favorites a public filter that is subsequently made private that filter is not returned by this operation.
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  Future<List<Filter>?> getFavouriteFilters({ String? expand, Future<void>? abortTrigger, }) async {
    final response = await getFavouriteFiltersWithHttpInfo(expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Filter>') as List)
        .cast<Filter>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get filter
  ///
  /// Returns a filter.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None, however, the filter is only returned where it is:   *  owned by the user.  *  shared with a group that the user is a member of.  *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  shared with a public project.  *  shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to return.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable filters with any share permissions to be returned. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<Response> getFilterWithHttpInfo(int id, { String? expand, bool? overrideSharePermissions, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (overrideSharePermissions != null) {
      queryParams.addAll(_queryParams('', 'overrideSharePermissions', overrideSharePermissions));
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

  /// Get filter
  ///
  /// Returns a filter.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None, however, the filter is only returned where it is:   *  owned by the user.  *  shared with a group that the user is a member of.  *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  shared with a public project.  *  shared with the public.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to return.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable filters with any share permissions to be returned. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<Filter?> getFilter(int id, { String? expand, bool? overrideSharePermissions, Future<void>? abortTrigger, }) async {
    final response = await getFilterWithHttpInfo(id, expand: expand, overrideSharePermissions: overrideSharePermissions, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Filter',) as Filter;
    
    }
    return null;
  }

  /// Search for filters
  ///
  /// Returns a [paginated](#pagination) list of filters. Use this operation to get:   *  specific filters, by defining `id` only.  *  filters that match all of the specified attributes. For example, all filters for a user with a particular word in their name. When multiple attributes are specified only filters matching all attributes are returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None, however, only the following filters that match the query parameters are returned:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] filterName:
  ///   String used to perform a case-insensitive partial match with `name`.
  ///
  /// * [String] accountId:
  ///   User account ID used to return filters with the matching `owner.accountId`. This parameter cannot be used with `owner`.
  ///
  /// * [String] owner:
  ///   This parameter is deprecated because of privacy changes. Use `accountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. User name used to return filters with the matching `owner.name`. This parameter cannot be used with `accountId`.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group. Group name used to returns filters that are shared with a group that matches `sharePermissions.group.groupname`. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   Group ID used to returns filters that are shared with a group that matches `sharePermissions.group.groupId`. This parameter cannot be used with the `groupname` parameter.
  ///
  /// * [int] projectId:
  ///   Project ID used to returns filters that are shared with a project that matches `sharePermissions.project.id`.
  ///
  /// * [List<int>] id:
  ///   The list of filter IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Do not exceed 200 filter IDs.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `description` Sorts by filter description. Note that this sorting works independently of whether the expand to display the description field is in use.  *  `favourite_count` Sorts by the count of how many users have this filter as a favorite.  *  `is_favourite` Sorts by whether the filter is marked as a favorite.  *  `id` Sorts by filter ID.  *  `name` Sorts by filter name.  *  `owner` Sorts by the ID of the filter owner.  *  `is_shared` Sorts by whether the filter is shared.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `description` Returns the description of the filter.  *  `favourite` Returns an indicator of whether the user has set the filter as a favorite.  *  `favouritedCount` Returns a count of how many users have set this filter as a favorite.  *  `jql` Returns the JQL query that the filter uses.  *  `owner` Returns the owner of the filter.  *  `searchUrl` Returns a URL to perform the filter's JQL query.  *  `sharePermissions` Returns the share permissions defined for the filter.  *  `editPermissions` Returns the edit permissions defined for the filter.  *  `isWritable` Returns whether the current user has permission to edit the filter.  *  `approximateLastUsed` \\[Experimental\\] Returns the approximate date and time when the filter was last evaluated.  *  `subscriptions` Returns the users that are subscribed to the filter.  *  `viewUrl` Returns a URL to view the filter.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable filters with any share permissions to be returned. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// * [bool] isSubstringMatch:
  ///   When `true` this will perform a case-insensitive substring match for the provided `filterName`. When `false` the filter name will be searched using [full text search syntax](https://support.atlassian.com/jira-software-cloud/docs/search-for-issues-using-the-text-field/).
  Future<Response> getFiltersPaginatedWithHttpInfo({ String? filterName, String? accountId, String? owner, String? groupname, String? groupId, int? projectId, List<int>? id, String? orderBy, int? startAt, int? maxResults, String? expand, bool? overrideSharePermissions, bool? isSubstringMatch, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (filterName != null) {
      queryParams.addAll(_queryParams('', 'filterName', filterName));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (owner != null) {
      queryParams.addAll(_queryParams('', 'owner', owner));
    }
    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('', 'projectId', projectId));
    }
    if (id != null) {
      queryParams.addAll(_queryParams('multi', 'id', id));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (overrideSharePermissions != null) {
      queryParams.addAll(_queryParams('', 'overrideSharePermissions', overrideSharePermissions));
    }
    if (isSubstringMatch != null) {
      queryParams.addAll(_queryParams('', 'isSubstringMatch', isSubstringMatch));
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

  /// Search for filters
  ///
  /// Returns a [paginated](#pagination) list of filters. Use this operation to get:   *  specific filters, by defining `id` only.  *  filters that match all of the specified attributes. For example, all filters for a user with a particular word in their name. When multiple attributes are specified only filters matching all attributes are returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None, however, only the following filters that match the query parameters are returned:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Parameters:
  ///
  /// * [String] filterName:
  ///   String used to perform a case-insensitive partial match with `name`.
  ///
  /// * [String] accountId:
  ///   User account ID used to return filters with the matching `owner.accountId`. This parameter cannot be used with `owner`.
  ///
  /// * [String] owner:
  ///   This parameter is deprecated because of privacy changes. Use `accountId` instead. See the [migration guide](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details. User name used to return filters with the matching `owner.name`. This parameter cannot be used with `accountId`.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group. Group name used to returns filters that are shared with a group that matches `sharePermissions.group.groupname`. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   Group ID used to returns filters that are shared with a group that matches `sharePermissions.group.groupId`. This parameter cannot be used with the `groupname` parameter.
  ///
  /// * [int] projectId:
  ///   Project ID used to returns filters that are shared with a project that matches `sharePermissions.project.id`.
  ///
  /// * [List<int>] id:
  ///   The list of filter IDs. To include multiple IDs, provide an ampersand-separated list. For example, `id=10000&id=10001`. Do not exceed 200 filter IDs.
  ///
  /// * [String] orderBy:
  ///   [Order](#ordering) the results by a field:   *  `description` Sorts by filter description. Note that this sorting works independently of whether the expand to display the description field is in use.  *  `favourite_count` Sorts by the count of how many users have this filter as a favorite.  *  `is_favourite` Sorts by whether the filter is marked as a favorite.  *  `id` Sorts by filter ID.  *  `name` Sorts by filter name.  *  `owner` Sorts by the ID of the filter owner.  *  `is_shared` Sorts by whether the filter is shared.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `description` Returns the description of the filter.  *  `favourite` Returns an indicator of whether the user has set the filter as a favorite.  *  `favouritedCount` Returns a count of how many users have set this filter as a favorite.  *  `jql` Returns the JQL query that the filter uses.  *  `owner` Returns the owner of the filter.  *  `searchUrl` Returns a URL to perform the filter's JQL query.  *  `sharePermissions` Returns the share permissions defined for the filter.  *  `editPermissions` Returns the edit permissions defined for the filter.  *  `isWritable` Returns whether the current user has permission to edit the filter.  *  `approximateLastUsed` \\[Experimental\\] Returns the approximate date and time when the filter was last evaluated.  *  `subscriptions` Returns the users that are subscribed to the filter.  *  `viewUrl` Returns a URL to view the filter.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable filters with any share permissions to be returned. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// * [bool] isSubstringMatch:
  ///   When `true` this will perform a case-insensitive substring match for the provided `filterName`. When `false` the filter name will be searched using [full text search syntax](https://support.atlassian.com/jira-software-cloud/docs/search-for-issues-using-the-text-field/).
  Future<PageBeanFilterDetails?> getFiltersPaginated({ String? filterName, String? accountId, String? owner, String? groupname, String? groupId, int? projectId, List<int>? id, String? orderBy, int? startAt, int? maxResults, String? expand, bool? overrideSharePermissions, bool? isSubstringMatch, Future<void>? abortTrigger, }) async {
    final response = await getFiltersPaginatedWithHttpInfo(filterName: filterName, accountId: accountId, owner: owner, groupname: groupname, groupId: groupId, projectId: projectId, id: id, orderBy: orderBy, startAt: startAt, maxResults: maxResults, expand: expand, overrideSharePermissions: overrideSharePermissions, isSubstringMatch: isSubstringMatch, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanFilterDetails',) as PageBeanFilterDetails;
    
    }
    return null;
  }

  /// Get my filters
  ///
  /// Returns the filters owned by the user. If `includeFavourites` is `true`, the user's visible favorite filters are also returned.  **[Permissions](#permissions) required:** Permission to access Jira, however, a favorite filters is only visible to the user where the filter is:   *  owned by the user.  *  shared with a group that the user is a member of.  *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  shared with a public project.  *  shared with the public.  For example, if the user favorites a public filter that is subsequently made private that filter is not returned by this operation.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] includeFavourites:
  ///   Include the user's favorite filters in the response.
  Future<Response> getMyFiltersWithHttpInfo({ String? expand, bool? includeFavourites, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/my';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (includeFavourites != null) {
      queryParams.addAll(_queryParams('', 'includeFavourites', includeFavourites));
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

  /// Get my filters
  ///
  /// Returns the filters owned by the user. If `includeFavourites` is `true`, the user's visible favorite filters are also returned.  **[Permissions](#permissions) required:** Permission to access Jira, however, a favorite filters is only visible to the user where the filter is:   *  owned by the user.  *  shared with a group that the user is a member of.  *  shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  shared with a public project.  *  shared with the public.  For example, if the user favorites a public filter that is subsequently made private that filter is not returned by this operation.
  ///
  /// Parameters:
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] includeFavourites:
  ///   Include the user's favorite filters in the response.
  Future<List<Filter>?> getMyFilters({ String? expand, bool? includeFavourites, Future<void>? abortTrigger, }) async {
    final response = await getMyFiltersWithHttpInfo(expand: expand, includeFavourites: includeFavourites, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Filter>') as List)
        .cast<Filter>()
        .toList(growable: false);

    }
    return null;
  }

  /// Reset columns
  ///
  /// Reset the user's column configuration for the filter to the default.  **[Permissions](#permissions) required:** Permission to access Jira, however, columns are only reset for:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  Future<Response> resetColumnsWithHttpInfo(int id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}/columns'
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

  /// Reset columns
  ///
  /// Reset the user's column configuration for the filter to the default.  **[Permissions](#permissions) required:** Permission to access Jira, however, columns are only reset for:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  Future<void> resetColumns(int id, { Future<void>? abortTrigger, }) async {
    final response = await resetColumnsWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Set columns
  ///
  /// Sets the columns for a filter. Only navigable fields can be set as columns. Use [Get fields](#api-rest-api-3-field-get) to get the list fields in Jira. A navigable field has `navigable` set to `true`.  The parameters for this resource are expressed as HTML form data. For example, in curl:  `curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/filter/10000/columns`  **[Permissions](#permissions) required:** Permission to access Jira, however, columns are only set for:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  ///
  /// * [ColumnRequestBody] columnRequestBody (required):
  ///   The IDs of the fields to set as columns. In the form data, specify each field as `columns=id`, where `id` is the *id* of a field (as seen in the response for [Get fields](#api-rest-api-<ver>-field-get)). For example, `columns=summary`.
  Future<Response> setColumnsWithHttpInfo(int id, ColumnRequestBody columnRequestBody, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}/columns'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = columnRequestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'multipart/form-data'];


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

  /// Set columns
  ///
  /// Sets the columns for a filter. Only navigable fields can be set as columns. Use [Get fields](#api-rest-api-3-field-get) to get the list fields in Jira. A navigable field has `navigable` set to `true`.  The parameters for this resource are expressed as HTML form data. For example, in curl:  `curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/filter/10000/columns`  **[Permissions](#permissions) required:** Permission to access Jira, however, columns are only set for:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  ///
  /// * [ColumnRequestBody] columnRequestBody (required):
  ///   The IDs of the fields to set as columns. In the form data, specify each field as `columns=id`, where `id` is the *id* of a field (as seen in the response for [Get fields](#api-rest-api-<ver>-field-get)). For example, `columns=summary`.
  Future<Object?> setColumns(int id, ColumnRequestBody columnRequestBody, { Future<void>? abortTrigger, }) async {
    final response = await setColumnsWithHttpInfo(id, columnRequestBody, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Object',) as Object;
    
    }
    return null;
  }

  /// Add filter as favorite
  ///
  /// Add a filter as a favorite for the user.  **[Permissions](#permissions) required:** Permission to access Jira, however, the user can only favorite:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  Future<Response> setFavouriteForFilterWithHttpInfo(int id, { String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}/favourite'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }

    const contentTypes = <String>[];


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

  /// Add filter as favorite
  ///
  /// Add a filter as a favorite for the user.  **[Permissions](#permissions) required:** Permission to access Jira, however, the user can only favorite:   *  filters owned by the user.  *  filters shared with a group that the user is a member of.  *  filters shared with a private project that the user has *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for.  *  filters shared with a public project.  *  filters shared with the public.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  Future<Filter?> setFavouriteForFilter(int id, { String? expand, Future<void>? abortTrigger, }) async {
    final response = await setFavouriteForFilterWithHttpInfo(id, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Filter',) as Filter;
    
    }
    return null;
  }

  /// Update filter
  ///
  /// Updates a filter. Use this operation to update a filter's name, description, JQL, or sharing.  **[Permissions](#permissions) required:** Permission to access Jira, however the user must own the filter.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to update.
  ///
  /// * [Filter] filter (required):
  ///   The filter to update.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable the addition of any share permissions to filters. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<Response> updateFilterWithHttpInfo(int id, Filter filter, { String? expand, bool? overrideSharePermissions, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/filter/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody = filter;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (expand != null) {
      queryParams.addAll(_queryParams('', 'expand', expand));
    }
    if (overrideSharePermissions != null) {
      queryParams.addAll(_queryParams('', 'overrideSharePermissions', overrideSharePermissions));
    }

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

  /// Update filter
  ///
  /// Updates a filter. Use this operation to update a filter's name, description, JQL, or sharing.  **[Permissions](#permissions) required:** Permission to access Jira, however the user must own the filter.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the filter to update.
  ///
  /// * [Filter] filter (required):
  ///   The filter to update.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about filter in the response. This parameter accepts a comma-separated list. Expand options include:   *  `sharedUsers` Returns the users that the filter is shared with. This includes users that can browse projects that the filter is shared with. If you don't specify `sharedUsers`, then the `sharedUsers` object is returned but it doesn't list any users. The list of users returned is limited to 1000, to access additional users append `[start-index:end-index]` to the expand request. For example, to access the next 1000 users, use `?expand=sharedUsers[1001:2000]`.  *  `subscriptions` Returns the users that are subscribed to the filter. If you don't specify `subscriptions`, the `subscriptions` object is returned but it doesn't list any subscriptions. The list of subscriptions returned is limited to 1000, to access additional subscriptions append `[start-index:end-index]` to the expand request. For example, to access the next 1000 subscriptions, use `?expand=subscriptions[1001:2000]`.
  ///
  /// * [bool] overrideSharePermissions:
  ///   EXPERIMENTAL: Whether share permissions are overridden to enable the addition of any share permissions to filters. Available to users with *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  Future<Filter?> updateFilter(int id, Filter filter, { String? expand, bool? overrideSharePermissions, Future<void>? abortTrigger, }) async {
    final response = await updateFilterWithHttpInfo(id, filter, expand: expand, overrideSharePermissions: overrideSharePermissions, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Filter',) as Filter;
    
    }
    return null;
  }
}
