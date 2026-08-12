//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class AdminKeyApi {
  AdminKeyApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Disable Admin Key
  ///
  /// Disables admin key access for the calling user within the site.  **[Permissions](https://support.atlassian.com/user-management/docs/give-users-admin-permissions/#Centralized-user-management-content) required**: User must be an organization or site admin.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> disableAdminKeyWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin-key';

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

  /// Disable Admin Key
  ///
  /// Disables admin key access for the calling user within the site.  **[Permissions](https://support.atlassian.com/user-management/docs/give-users-admin-permissions/#Centralized-user-management-content) required**: User must be an organization or site admin.
  Future<void> disableAdminKey({ Future<void>? abortTrigger, }) async {
    final response = await disableAdminKeyWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Enable Admin Key
  ///
  /// Enables admin key access for the calling user within the site. If an admin key already exists for the user, a new one will be issued with an updated expiration time.  **Note:** The `durationInMinutes` field within the request body is optional. If the request body is empty or if the `durationInMinutes` is set to 0 minutes, a new admin key will be issued to the calling user with a default duration of 10 minutes.  **[Permissions](https://support.atlassian.com/user-management/docs/give-users-admin-permissions/#Centralized-user-management-content) required**: User must be an organization or site admin.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [EnableAdminKeyRequest] enableAdminKeyRequest:
  Future<Response> enableAdminKeyWithHttpInfo({ EnableAdminKeyRequest? enableAdminKeyRequest, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin-key';

    // ignore: prefer_final_locals
    Object? postBody = enableAdminKeyRequest;

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

  /// Enable Admin Key
  ///
  /// Enables admin key access for the calling user within the site. If an admin key already exists for the user, a new one will be issued with an updated expiration time.  **Note:** The `durationInMinutes` field within the request body is optional. If the request body is empty or if the `durationInMinutes` is set to 0 minutes, a new admin key will be issued to the calling user with a default duration of 10 minutes.  **[Permissions](https://support.atlassian.com/user-management/docs/give-users-admin-permissions/#Centralized-user-management-content) required**: User must be an organization or site admin.
  ///
  /// Parameters:
  ///
  /// * [EnableAdminKeyRequest] enableAdminKeyRequest:
  Future<AdminKeyResponse?> enableAdminKey({ EnableAdminKeyRequest? enableAdminKeyRequest, Future<void>? abortTrigger, }) async {
    final response = await enableAdminKeyWithHttpInfo(enableAdminKeyRequest: enableAdminKeyRequest, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminKeyResponse',) as AdminKeyResponse;
    
    }
    return null;
  }

  /// Get Admin Key
  ///
  /// Returns information about the admin key if one is currently enabled for the calling user within the site.  **[Permissions](https://support.atlassian.com/user-management/docs/give-users-admin-permissions/#Centralized-user-management-content) required**: User must be an organization or site admin.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getAdminKeyWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/admin-key';

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

  /// Get Admin Key
  ///
  /// Returns information about the admin key if one is currently enabled for the calling user within the site.  **[Permissions](https://support.atlassian.com/user-management/docs/give-users-admin-permissions/#Centralized-user-management-content) required**: User must be an organization or site admin.
  Future<AdminKeyResponse?> getAdminKey({ Future<void>? abortTrigger, }) async {
    final response = await getAdminKeyWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AdminKeyResponse',) as AdminKeyResponse;
    
    }
    return null;
  }
}
