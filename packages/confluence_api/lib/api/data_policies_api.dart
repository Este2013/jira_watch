//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DataPoliciesApi {
  DataPoliciesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get data policy metadata for the workspace
  ///
  /// Returns data policy metadata for the workspace.  **[Permissions](#permissions) required:** Only apps can make this request. Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getDataPolicyMetadataWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/data-policies/metadata';

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

  /// Get data policy metadata for the workspace
  ///
  /// Returns data policy metadata for the workspace.  **[Permissions](#permissions) required:** Only apps can make this request. Permission to access the Confluence site ('Can use' global permission).
  Future<DataPolicyMetadata?> getDataPolicyMetadata({ Future<void>? abortTrigger, }) async {
    final response = await getDataPolicyMetadataWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DataPolicyMetadata',) as DataPolicyMetadata;
    
    }
    return null;
  }

  /// Get spaces with data policies
  ///
  /// Returns all spaces. The results will be sorted by id ascending. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Only apps can make this request. Permission to access the Confluence site ('Can use' global permission). Only spaces that the app has permission to view will be returned.
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
  /// * [SpaceSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of spaces per result to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<Response> getDataPolicySpacesWithHttpInfo({ List<int>? ids, List<String>? keys, SpaceSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/data-policies/spaces';

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

  /// Get spaces with data policies
  ///
  /// Returns all spaces. The results will be sorted by id ascending. The number of results is limited by the `limit` parameter and additional results (if available) will be available through the `next` URL present in the `Link` response header.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Only apps can make this request. Permission to access the Confluence site ('Can use' global permission). Only spaces that the app has permission to view will be returned.
  ///
  /// Parameters:
  ///
  /// * [List<int>] ids:
  ///   Filter the results to spaces based on their IDs. Multiple IDs can be specified as a comma-separated list.
  ///
  /// * [List<String>] keys:
  ///   Filter the results to spaces based on their keys. Multiple keys can be specified as a comma-separated list.
  ///
  /// * [SpaceSortOrder] sort:
  ///   Used to sort the result by a particular field.
  ///
  /// * [String] cursor:
  ///   Used for pagination, this opaque cursor will be returned in the `next` URL in the `Link` response header. Use the relative URL in the `Link` header to retrieve the `next` set of results.
  ///
  /// * [int] limit:
  ///   Maximum number of spaces per result to return. If more results exist, use the `Link` response header to retrieve a relative URL that will return the next set of results.
  Future<MultiEntityResultDataPolicySpace?> getDataPolicySpaces({ List<int>? ids, List<String>? keys, SpaceSortOrder? sort, String? cursor, int? limit, Future<void>? abortTrigger, }) async {
    final response = await getDataPolicySpacesWithHttpInfo(ids: ids, keys: keys, sort: sort, cursor: cursor, limit: limit, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultDataPolicySpace',) as MultiEntityResultDataPolicySpace;
    
    }
    return null;
  }
}
