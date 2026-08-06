//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueRedactionApi {
  IssueRedactionApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get redaction status
  ///
  /// Retrieves the current status of a redaction job ID.  The jobStatus will be one of the following:   *  IN\\_PROGRESS - The redaction job is currently in progress  *  COMPLETED - The redaction job has completed successfully.  *  PENDING - The redaction job has not started yet
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] jobId (required):
  ///   Redaction job id
  Future<Response> getRedactionStatusWithHttpInfo(String jobId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/redact/status/{jobId}'
      .replaceAll('{jobId}', jobId);

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

  /// Get redaction status
  ///
  /// Retrieves the current status of a redaction job ID.  The jobStatus will be one of the following:   *  IN\\_PROGRESS - The redaction job is currently in progress  *  COMPLETED - The redaction job has completed successfully.  *  PENDING - The redaction job has not started yet
  ///
  /// Parameters:
  ///
  /// * [String] jobId (required):
  ///   Redaction job id
  Future<RedactionJobStatusResponse?> getRedactionStatus(String jobId, { Future<void>? abortTrigger, }) async {
    final response = await getRedactionStatusWithHttpInfo(jobId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'RedactionJobStatusResponse',) as RedactionJobStatusResponse;
    
    }
    return null;
  }

  /// Redact
  ///
  /// Submit a job to redact issue field data. This will trigger the redaction of the data in the specified fields asynchronously.  The redaction status can be polled using the job id.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [BulkRedactionRequest] bulkRedactionRequest (required):
  ///   List of redaction requests
  Future<Response> redactWithHttpInfo(BulkRedactionRequest bulkRedactionRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/redact';

    // ignore: prefer_final_locals
    Object? postBody = bulkRedactionRequest;

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

  /// Redact
  ///
  /// Submit a job to redact issue field data. This will trigger the redaction of the data in the specified fields asynchronously.  The redaction status can be polled using the job id.
  ///
  /// Parameters:
  ///
  /// * [BulkRedactionRequest] bulkRedactionRequest (required):
  ///   List of redaction requests
  Future<String?> redact(BulkRedactionRequest bulkRedactionRequest, { Future<void>? abortTrigger, }) async {
    final response = await redactWithHttpInfo(bulkRedactionRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'String',) as String;
    
    }
    return null;
  }
}
