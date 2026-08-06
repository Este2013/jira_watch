//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DefaultApi {
  DefaultApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get worklogs by issue id and worklog id
  ///
  /// Returns worklog details for a list of issue ID and worklog ID pairs.  This is an internal API for bulk fetching worklogs by their issue and worklog IDs. Worklogs that don't exist will be filtered out from the response.  The returned list of worklogs is limited to 1000 items.  **[Permissions](#permissions) required:** This is an internal service-to-service API that requires ASAP authentication. No user permission checks are performed as this bypasses normal user context.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [BulkWorklogKeyRequestBean] bulkWorklogKeyRequestBean (required):
  ///   A JSON object containing a list of issue ID and worklog ID pairs.
  Future<Response> getWorklogsByIssueIdAndWorklogIdWithHttpInfo(BulkWorklogKeyRequestBean bulkWorklogKeyRequestBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/internal/api/latest/worklog/bulk';

    // ignore: prefer_final_locals
    Object? postBody = bulkWorklogKeyRequestBean;

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

  /// Get worklogs by issue id and worklog id
  ///
  /// Returns worklog details for a list of issue ID and worklog ID pairs.  This is an internal API for bulk fetching worklogs by their issue and worklog IDs. Worklogs that don't exist will be filtered out from the response.  The returned list of worklogs is limited to 1000 items.  **[Permissions](#permissions) required:** This is an internal service-to-service API that requires ASAP authentication. No user permission checks are performed as this bypasses normal user context.
  ///
  /// Parameters:
  ///
  /// * [BulkWorklogKeyRequestBean] bulkWorklogKeyRequestBean (required):
  ///   A JSON object containing a list of issue ID and worklog ID pairs.
  Future<BulkWorklogKeyResponseBean?> getWorklogsByIssueIdAndWorklogId(BulkWorklogKeyRequestBean bulkWorklogKeyRequestBean, { Future<void>? abortTrigger, }) async {
    final response = await getWorklogsByIssueIdAndWorklogIdWithHttpInfo(bulkWorklogKeyRequestBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'BulkWorklogKeyResponseBean',) as BulkWorklogKeyResponseBean;
    
    }
    return null;
  }
}
