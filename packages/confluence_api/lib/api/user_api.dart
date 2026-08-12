//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserApi {
  UserApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Check site access for a list of emails
  ///
  /// Returns the list of emails from the input list that do not have access to site.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CheckAccessByEmailRequest] checkAccessByEmailRequest (required):
  Future<Response> checkAccessByEmailWithHttpInfo(CheckAccessByEmailRequest checkAccessByEmailRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/user/access/check-access-by-email';

    // ignore: prefer_final_locals
    Object? postBody = checkAccessByEmailRequest;

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

  /// Check site access for a list of emails
  ///
  /// Returns the list of emails from the input list that do not have access to site.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Parameters:
  ///
  /// * [CheckAccessByEmailRequest] checkAccessByEmailRequest (required):
  Future<CheckAccessByEmail200Response?> checkAccessByEmail(CheckAccessByEmailRequest checkAccessByEmailRequest, { Future<void>? abortTrigger, }) async {
    final response = await checkAccessByEmailWithHttpInfo(checkAccessByEmailRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CheckAccessByEmail200Response',) as CheckAccessByEmail200Response;
    
    }
    return null;
  }

  /// Create bulk user lookup using ids
  ///
  /// Returns user details for the ids provided in the request body.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). The user must be able to view user profiles in the Confluence site.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateBulkUserLookupRequest] createBulkUserLookupRequest (required):
  Future<Response> createBulkUserLookupWithHttpInfo(CreateBulkUserLookupRequest createBulkUserLookupRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/users-bulk';

    // ignore: prefer_final_locals
    Object? postBody = createBulkUserLookupRequest;

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

  /// Create bulk user lookup using ids
  ///
  /// Returns user details for the ids provided in the request body.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission). The user must be able to view user profiles in the Confluence site.
  ///
  /// Parameters:
  ///
  /// * [CreateBulkUserLookupRequest] createBulkUserLookupRequest (required):
  Future<MultiEntityResultUser?> createBulkUserLookup(CreateBulkUserLookupRequest createBulkUserLookupRequest, { Future<void>? abortTrigger, }) async {
    final response = await createBulkUserLookupWithHttpInfo(createBulkUserLookupRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MultiEntityResultUser',) as MultiEntityResultUser;
    
    }
    return null;
  }

  /// Invite a list of emails to the site
  ///
  /// Invite a list of emails to the site.  Ignores all invalid emails and no action is taken for the emails that already have access to the site.  <b>NOTE:</b> This API is asynchronous and may take some time to complete.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CheckAccessByEmailRequest] checkAccessByEmailRequest (required):
  Future<Response> inviteByEmailWithHttpInfo(CheckAccessByEmailRequest checkAccessByEmailRequest, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/user/access/invite-by-email';

    // ignore: prefer_final_locals
    Object? postBody = checkAccessByEmailRequest;

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

  /// Invite a list of emails to the site
  ///
  /// Invite a list of emails to the site.  Ignores all invalid emails and no action is taken for the emails that already have access to the site.  <b>NOTE:</b> This API is asynchronous and may take some time to complete.  **[Permissions](https://confluence.atlassian.com/x/_AozKw) required**: Permission to access the Confluence site ('Can use' global permission).
  ///
  /// Parameters:
  ///
  /// * [CheckAccessByEmailRequest] checkAccessByEmailRequest (required):
  Future<void> inviteByEmail(CheckAccessByEmailRequest checkAccessByEmailRequest, { Future<void>? abortTrigger, }) async {
    final response = await inviteByEmailWithHttpInfo(checkAccessByEmailRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
