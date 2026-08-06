//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class ClassificationLevelsApi {
  ClassificationLevelsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get all classification levels
  ///
  /// Returns all classification levels.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] status:
  ///   Optional set of statuses to filter by.
  ///
  /// * [String] orderBy:
  ///   Ordering of the results by a given field. If not provided, values will not be sorted.
  Future<Response> getAllUserDataClassificationLevelsWithHttpInfo({ List<String>? status, String? orderBy, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/classification-levels';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (status != null) {
      queryParams.addAll(_queryParams('multi', 'status', status));
    }
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
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

  /// Get all classification levels
  ///
  /// Returns all classification levels.  **[Permissions](#permissions) required:** None.
  ///
  /// Parameters:
  ///
  /// * [List<String>] status:
  ///   Optional set of statuses to filter by.
  ///
  /// * [String] orderBy:
  ///   Ordering of the results by a given field. If not provided, values will not be sorted.
  Future<DataClassificationLevelsBean?> getAllUserDataClassificationLevels({ List<String>? status, String? orderBy, Future<void>? abortTrigger, }) async {
    final response = await getAllUserDataClassificationLevelsWithHttpInfo(status: status, orderBy: orderBy, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'DataClassificationLevelsBean',) as DataClassificationLevelsBean;
    
    }
    return null;
  }
}
