//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class SpaceApi {
  SpaceApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create space
  ///
  /// Creates a Space as specified in the payload.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to create spaces.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateSpaceRequest] createSpaceRequest (required):
  Future<Response> createSpaceWithHttpInfo(CreateSpaceRequest createSpaceRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces';

    // ignore: prefer_final_locals
    Object? postBody = createSpaceRequest;

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

  /// Create space
  ///
  /// Creates a Space as specified in the payload.  Available on tenants with [Role-Based Access Control](https://support.atlassian.com/confluence-cloud/docs/manage-user-roles/).   **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to create spaces.
  ///
  /// Parameters:
  ///
  /// * [CreateSpaceRequest] createSpaceRequest (required):
  Future<CreateSpace201Response?> createSpace(CreateSpaceRequest createSpaceRequest, { Future<void>? abortTrigger, }) async {
    final response = await createSpaceWithHttpInfo(createSpaceRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateSpace201Response',) as CreateSpace201Response;
    
    }
    return null;
  }

  /// Get space by id
  ///
  /// Returns a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the space.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space to be returned.
  ///
  /// * [SpaceDescriptionBodyRepresentation] descriptionFormat:
  ///   The content format type to be returned in the `description` field of the response. If available, the representation will be available under a response field of the same name under the `description` field.
  ///
  /// * [bool] includeIcon:
  ///   If the icon for the space should be fetched or not.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this space in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes space properties associated with this space in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includePermissions:
  ///   Includes space permissions associated with this space in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeRoleAssignments:
  ///   Includes role assignments associated with this space in the response. This parameter is only accepted for EAP sites. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this space in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<Response> getSpaceByIdWithHttpInfo(int id, { SpaceDescriptionBodyRepresentation? descriptionFormat, bool? includeIcon, bool? includeOperations, bool? includeProperties, bool? includePermissions, bool? includeRoleAssignments, bool? includeLabels, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces/{id}'
      .replaceAll('{id}', id.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (descriptionFormat != null) {
      queryParams.addAll(_queryParams('', 'description-format', descriptionFormat));
    }
    if (includeIcon != null) {
      queryParams.addAll(_queryParams('', 'include-icon', includeIcon));
    }
    if (includeOperations != null) {
      queryParams.addAll(_queryParams('', 'include-operations', includeOperations));
    }
    if (includeProperties != null) {
      queryParams.addAll(_queryParams('', 'include-properties', includeProperties));
    }
    if (includePermissions != null) {
      queryParams.addAll(_queryParams('', 'include-permissions', includePermissions));
    }
    if (includeRoleAssignments != null) {
      queryParams.addAll(_queryParams('', 'include-role-assignments', includeRoleAssignments));
    }
    if (includeLabels != null) {
      queryParams.addAll(_queryParams('', 'include-labels', includeLabels));
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

  /// Get space by id
  ///
  /// Returns a specific space.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to view the space.
  ///
  /// Parameters:
  ///
  /// * [int] id (required):
  ///   The ID of the space to be returned.
  ///
  /// * [SpaceDescriptionBodyRepresentation] descriptionFormat:
  ///   The content format type to be returned in the `description` field of the response. If available, the representation will be available under a response field of the same name under the `description` field.
  ///
  /// * [bool] includeIcon:
  ///   If the icon for the space should be fetched or not.
  ///
  /// * [bool] includeOperations:
  ///   Includes operations associated with this space in the response, as defined in the `Operation` object. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeProperties:
  ///   Includes space properties associated with this space in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includePermissions:
  ///   Includes space permissions associated with this space in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeRoleAssignments:
  ///   Includes role assignments associated with this space in the response. This parameter is only accepted for EAP sites. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  ///
  /// * [bool] includeLabels:
  ///   Includes labels associated with this space in the response. The number of results will be limited to 50 and sorted in the default sort order. A `meta` and `_links` property will be present to indicate if more results are available and a link to retrieve the rest of the results.
  Future<GetSpaceById200Response?> getSpaceById(int id, { SpaceDescriptionBodyRepresentation? descriptionFormat, bool? includeIcon, bool? includeOperations, bool? includeProperties, bool? includePermissions, bool? includeRoleAssignments, bool? includeLabels, Future<void>? abortTrigger, }) async {
    final response = await getSpaceByIdWithHttpInfo(id, descriptionFormat: descriptionFormat, includeIcon: includeIcon, includeOperations: includeOperations, includeProperties: includeProperties, includePermissions: includePermissions, includeRoleAssignments: includeRoleAssignments, includeLabels: includeLabels, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'GetSpaceById200Response',) as GetSpaceById200Response;
    
    }
    return null;
  }

  /// Get spaces
  ///
  /// Returns all spaces. The results will be sorted by id ascending. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only spaces that the user has permission to view will be returned.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<int>] ids:
  ///   Filter the results to spaces based on their IDs. Multiple IDs can be specified as a comma-separated list.
  ///
  /// * [List<String>] keys:
  ///   Filter the results to spaces based on their keys. Multiple keys can be specified as a comma-separated list.
  ///
  /// * [String] type:
  ///   Filter the results to spaces based on their type.
  ///
  /// * [String] status:
  ///   Filter the results to spaces based on their status.
  ///
  /// * [List<String>] labels:
  ///   Filter the results to spaces based on their labels. Multiple labels can be specified as a comma-separated list.
  ///
  /// * [String] favoritedBy:
  ///   Filter the results to spaces favorited by the user with the specified account ID.
  ///
  /// * [String] notFavoritedBy:
  ///   Filter the results to spaces NOT favorited by the user with the specified account ID.
  ///
  /// * [SpaceSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [SpaceDescriptionBodyRepresentation] descriptionFormat:
  ///   The content format type to be returned in the `description` field of the response. If available, the representation will be available under a response field of the same name under the `description` field.
  ///
  /// * [bool] includeIcon:
  ///   If the icon for the space should be fetched or not.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of spaces per result to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<Response> getSpacesWithHttpInfo({ List<int>? ids, List<String>? keys, String? type, String? status, List<String>? labels, String? favoritedBy, String? notFavoritedBy, SpaceSortOrder? sort, SpaceDescriptionBodyRepresentation? descriptionFormat, bool? includeIcon, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/spaces';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (ids != null) {
      queryParams.addAll(_queryParams('multi', 'ids', ids));
    }
    if (keys != null) {
      queryParams.addAll(_queryParams('multi', 'keys', keys));
    }
    if (type != null) {
      queryParams.addAll(_queryParams('', 'type', type));
    }
    if (status != null) {
      queryParams.addAll(_queryParams('', 'status', status));
    }
    if (labels != null) {
      queryParams.addAll(_queryParams('multi', 'labels', labels));
    }
    if (favoritedBy != null) {
      queryParams.addAll(_queryParams('', 'favorited-by', favoritedBy));
    }
    if (notFavoritedBy != null) {
      queryParams.addAll(_queryParams('', 'not-favorited-by', notFavoritedBy));
    }
    if (sort != null) {
      queryParams.addAll(_queryParams('', 'sort', sort));
    }
    if (descriptionFormat != null) {
      queryParams.addAll(_queryParams('', 'description-format', descriptionFormat));
    }
    if (includeIcon != null) {
      queryParams.addAll(_queryParams('', 'include-icon', includeIcon));
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

  /// Get spaces
  ///
  /// Returns all spaces. The results will be sorted by id ascending. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). Only spaces that the user has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [List<int>] ids:
  ///   Filter the results to spaces based on their IDs. Multiple IDs can be specified as a comma-separated list.
  ///
  /// * [List<String>] keys:
  ///   Filter the results to spaces based on their keys. Multiple keys can be specified as a comma-separated list.
  ///
  /// * [String] type:
  ///   Filter the results to spaces based on their type.
  ///
  /// * [String] status:
  ///   Filter the results to spaces based on their status.
  ///
  /// * [List<String>] labels:
  ///   Filter the results to spaces based on their labels. Multiple labels can be specified as a comma-separated list.
  ///
  /// * [String] favoritedBy:
  ///   Filter the results to spaces favorited by the user with the specified account ID.
  ///
  /// * [String] notFavoritedBy:
  ///   Filter the results to spaces NOT favorited by the user with the specified account ID.
  ///
  /// * [SpaceSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [SpaceDescriptionBodyRepresentation] descriptionFormat:
  ///   The content format type to be returned in the `description` field of the response. If available, the representation will be available under a response field of the same name under the `description` field.
  ///
  /// * [bool] includeIcon:
  ///   If the icon for the space should be fetched or not.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of spaces per result to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultSpace?> getSpaces({ List<int>? ids, List<String>? keys, String? type, String? status, List<String>? labels, String? favoritedBy, String? notFavoritedBy, SpaceSortOrder? sort, SpaceDescriptionBodyRepresentation? descriptionFormat, bool? includeIcon, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getSpacesWithHttpInfo(ids: ids, keys: keys, type: type, status: status, labels: labels, favoritedBy: favoritedBy, notFavoritedBy: notFavoritedBy, sort: sort, descriptionFormat: descriptionFormat, includeIcon: includeIcon, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultSpace',) as MultiEntityResultSpace;
    
    }
    return null;
  }
}
