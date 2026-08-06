//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AuditRecordsApi {
  AuditRecordsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get audit records
  ///
  /// Returns a list of audit records. The list can be filtered to include items:   *  where each item in `filter` has at least one match in any of these fields:           *  `summary`      *  `category`      *  `eventSource`      *  `objectItem.name` If the object is a user, account ID is available to filter.      *  `objectItem.parentName`      *  `objectItem.typeName`      *  `changedValues.changedFrom`      *  `changedValues.changedTo`      *  `remoteAddress`          For example, if `filter` contains *man ed*, an audit record containing `summary\": \"User added to group\"` and `\"category\": \"group management\"` is returned.  *  created on or after a date and time.  *  created or or before a date and time.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] offset:
  ///   The number of records to skip before returning the first result.
  ///
  /// * [int] limit:
  ///   The maximum number of results to return.
  ///
  /// * [String] filter:
  ///   The strings to match with audit field content, space separated.
  ///
  /// * [String] from:
  ///   The date and time on or after which returned audit records must have been created. If `to` is provided `from` must be before `to` or no audit records are returned.
  ///
  /// * [String] to:
  ///   The date and time on or before which returned audit results must have been created. If `from` is provided `to` must be after `from` or no audit records are returned.
  Future<Response> getAuditRecordsWithHttpInfo({ int? offset, int? limit, String? filter, String? from, String? to, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/auditing/record';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (offset != null) {
      queryParams.addAll(_queryParams('', 'offset', offset));
    }
    if (limit != null) {
      queryParams.addAll(_queryParams('', 'limit', limit));
    }
    if (filter != null) {
      queryParams.addAll(_queryParams('', 'filter', filter));
    }
    if (from != null) {
      queryParams.addAll(_queryParams('', 'from', from));
    }
    if (to != null) {
      queryParams.addAll(_queryParams('', 'to', to));
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

  /// Get audit records
  ///
  /// Returns a list of audit records. The list can be filtered to include items:   *  where each item in `filter` has at least one match in any of these fields:           *  `summary`      *  `category`      *  `eventSource`      *  `objectItem.name` If the object is a user, account ID is available to filter.      *  `objectItem.parentName`      *  `objectItem.typeName`      *  `changedValues.changedFrom`      *  `changedValues.changedTo`      *  `remoteAddress`          For example, if `filter` contains *man ed*, an audit record containing `summary\": \"User added to group\"` and `\"category\": \"group management\"` is returned.  *  created on or after a date and time.  *  created or or before a date and time.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] offset:
  ///   The number of records to skip before returning the first result.
  ///
  /// * [int] limit:
  ///   The maximum number of results to return.
  ///
  /// * [String] filter:
  ///   The strings to match with audit field content, space separated.
  ///
  /// * [String] from:
  ///   The date and time on or after which returned audit records must have been created. If `to` is provided `from` must be before `to` or no audit records are returned.
  ///
  /// * [String] to:
  ///   The date and time on or before which returned audit results must have been created. If `from` is provided `to` must be after `from` or no audit records are returned.
  Future<AuditRecords?> getAuditRecords({ int? offset, int? limit, String? filter, String? from, String? to, Future<void>? abortTrigger, }) async {
    final response = await getAuditRecordsWithHttpInfo(offset: offset, limit: limit, filter: filter, from: from, to: to, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AuditRecords',) as AuditRecords;
    
    }
    return null;
  }
}
