//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UsersApi {
  UsersApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Bulk get users
  ///
  /// Returns a [paginated](#pagination) list of the users specified by one or more account IDs.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] accountId (required):
  ///   The account ID of a user. To specify multiple users, pass multiple `accountId` parameters. For example, `accountId=5b10a2844c20165700ede21g&accountId=5b10ac8d82e05b22cc7d4ef5`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] username:
  ///   This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [List<String>] key:
  ///   This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> bulkGetUsersWithHttpInfo(List<String> accountId, { int? startAt, int? maxResults, List<String>? username, List<String>? key, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/bulk';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('multi', 'username', username));
    }
    if (key != null) {
      queryParams.addAll(_queryParams('multi', 'key', key));
    }
      queryParams.addAll(_queryParams('multi', 'accountId', accountId));

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

  /// Bulk get users
  ///
  /// Returns a [paginated](#pagination) list of the users specified by one or more account IDs.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [List<String>] accountId (required):
  ///   The account ID of a user. To specify multiple users, pass multiple `accountId` parameters. For example, `accountId=5b10a2844c20165700ede21g&accountId=5b10ac8d82e05b22cc7d4ef5`.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] username:
  ///   This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [List<String>] key:
  ///   This parameter is no longer available and will be removed from the documentation soon. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<PageBeanUser?> bulkGetUsers(List<String> accountId, { int? startAt, int? maxResults, List<String>? username, List<String>? key, Future<void>? abortTrigger, }) async {
    final response = await bulkGetUsersWithHttpInfo(accountId, startAt: startAt, maxResults: maxResults, username: username, key: key, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanUser',) as PageBeanUser;
    
    }
    return null;
  }

  /// Get account IDs for users
  ///
  /// Returns the account IDs for the users specified in the `key` or `username` parameters. Note that multiple `key` or `username` parameters can be specified.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] username:
  ///   Username of a user. To specify multiple users, pass multiple copies of this parameter. For example, `username=fred&username=barney`. Required if `key` isn't provided. Cannot be provided if `key` is present.
  ///
  /// * [List<String>] key:
  ///   Key of a user. To specify multiple users, pass multiple copies of this parameter. For example, `key=fred&key=barney`. Required if `username` isn't provided. Cannot be provided if `username` is present.
  Future<Response> bulkGetUsersMigrationWithHttpInfo({ int? startAt, int? maxResults, List<String>? username, List<String>? key, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/bulk/migration';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('multi', 'username', username));
    }
    if (key != null) {
      queryParams.addAll(_queryParams('multi', 'key', key));
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

  /// Get account IDs for users
  ///
  /// Returns the account IDs for the users specified in the `key` or `username` parameters. Note that multiple `key` or `username` parameters can be specified.  **[Permissions](#permissions) required:** Permission to access Jira.
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] username:
  ///   Username of a user. To specify multiple users, pass multiple copies of this parameter. For example, `username=fred&username=barney`. Required if `key` isn't provided. Cannot be provided if `key` is present.
  ///
  /// * [List<String>] key:
  ///   Key of a user. To specify multiple users, pass multiple copies of this parameter. For example, `key=fred&key=barney`. Required if `username` isn't provided. Cannot be provided if `username` is present.
  Future<List<UserMigrationBean>?> bulkGetUsersMigration({ int? startAt, int? maxResults, List<String>? username, List<String>? key, Future<void>? abortTrigger, }) async {
    final response = await bulkGetUsersMigrationWithHttpInfo(startAt: startAt, maxResults: maxResults, username: username, key: key, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<UserMigrationBean>') as List)
        .cast<UserMigrationBean>()
        .toList(growable: false);

    }
    return null;
  }

  /// Create user
  ///
  /// Creates a user. This resource is retained for legacy compatibility. As soon as a more suitable alternative is available this resource will be deprecated.  **Note:** This API does not support Forge apps.  If the user exists and has access to Jira, the operation returns a 201 status. If the user exists but does not have access to Jira, the operation returns a 400 status.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). The caller has to be an **organization admin**.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [NewUserDetails] newUserDetails (required):
  ///   Details about the user to be created.
  Future<Response> createUserWithHttpInfo(NewUserDetails newUserDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user';

    // ignore: prefer_final_locals
    Object? postBody = newUserDetails;

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

  /// Create user
  ///
  /// Creates a user. This resource is retained for legacy compatibility. As soon as a more suitable alternative is available this resource will be deprecated.  **Note:** This API does not support Forge apps.  If the user exists and has access to Jira, the operation returns a 201 status. If the user exists but does not have access to Jira, the operation returns a 400 status.  **[Permissions](#permissions) required:** *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg). The caller has to be an **organization admin**.
  ///
  /// Parameters:
  ///
  /// * [NewUserDetails] newUserDetails (required):
  ///   Details about the user to be created.
  Future<User?> createUser(NewUserDetails newUserDetails, { Future<void>? abortTrigger, }) async {
    final response = await createUserWithHttpInfo(newUserDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'User',) as User;
    
    }
    return null;
  }

  /// Get all users
  ///
  /// Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return (limited to 1000).
  ///
  /// * [String] expand:
  Future<Response> getAllUsersWithHttpInfo({ int? startAt, int? maxResults, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/users/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
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

  /// Get all users
  ///
  /// Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return (limited to 1000).
  ///
  /// * [String] expand:
  Future<List<User>?> getAllUsers({ int? startAt, int? maxResults, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getAllUsersWithHttpInfo(startAt: startAt, maxResults: maxResults, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<User>') as List)
        .cast<User>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get all users default
  ///
  /// Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return (limited to 1000).
  ///
  /// * [String] expand:
  Future<Response> getAllUsersDefaultWithHttpInfo({ int? startAt, int? maxResults, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/users';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
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

  /// Get all users default
  ///
  /// Returns a list of all users, including active users, inactive users and previously deleted users that have an Atlassian account.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return (limited to 1000).
  ///
  /// * [String] expand:
  Future<List<User>?> getAllUsersDefault({ int? startAt, int? maxResults, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getAllUsersDefaultWithHttpInfo(startAt: startAt, maxResults: maxResults, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<User>') as List)
        .cast<User>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get user
  ///
  /// Returns a user.  Privacy controls are applied to the response based on the user's preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details.
  ///
  /// * [String] key:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about users in the response. This parameter accepts a comma-separated list. Expand options include:   *  `groups` includes all groups and nested groups to which the user belongs.  *  `applicationRoles` includes details of all the applications to which the user has access.
  Future<Response> getUserWithHttpInfo({ String? accountId, String? username, String? key, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
    }
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

  /// Get user
  ///
  /// Returns a user.  Privacy controls are applied to the response based on the user's preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*. Required.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details.
  ///
  /// * [String] key:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide) for details.
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information about users in the response. This parameter accepts a comma-separated list. Expand options include:   *  `groups` includes all groups and nested groups to which the user belongs.  *  `applicationRoles` includes details of all the applications to which the user has access.
  Future<User?> getUser({ String? accountId, String? username, String? key, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getUserWithHttpInfo(accountId: accountId, username: username, key: key, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'User',) as User;
    
    }
    return null;
  }

  /// Get user default columns
  ///
  /// Returns the default [issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user. If `accountId` is not passed in the request, the calling user's details are returned.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLgl), to get the column details for any user.  *  Permission to access Jira, to get the calling user's column details.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> getUserDefaultColumnsWithHttpInfo({ String? accountId, String? username, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/columns';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
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

  /// Get user default columns
  ///
  /// Returns the default [issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user. If `accountId` is not passed in the request, the calling user's details are returned.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLgl), to get the column details for any user.  *  Permission to access Jira, to get the calling user's column details.
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<List<ColumnItem>?> getUserDefaultColumns({ String? accountId, String? username, Future<void>? abortTrigger, }) async {
    final response = await getUserDefaultColumnsWithHttpInfo(accountId: accountId, username: username, abortTrigger: abortTrigger,);
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

  /// Get user email
  ///
  /// Returns a user's email address regardless of the user's profile visibility settings. For Connect apps, this API is only available to apps approved by Atlassian, according to these [guidelines](https://community.developer.atlassian.com/t/guidelines-for-requesting-access-to-email-address/27603). For Forge apps, this API only supports access via asApp() requests.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`.
  Future<Response> getUserEmailWithHttpInfo(String accountId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/email';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'accountId', accountId));

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

  /// Get user email
  ///
  /// Returns a user's email address regardless of the user's profile visibility settings. For Connect apps, this API is only available to apps approved by Atlassian, according to these [guidelines](https://community.developer.atlassian.com/t/guidelines-for-requesting-access-to-email-address/27603). For Forge apps, this API only supports access via asApp() requests.
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`.
  Future<UnrestrictedUserEmail?> getUserEmail(String accountId, { Future<void>? abortTrigger, }) async {
    final response = await getUserEmailWithHttpInfo(accountId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UnrestrictedUserEmail',) as UnrestrictedUserEmail;
    
    }
    return null;
  }

  /// Get user email bulk
  ///
  /// Returns a user's email address regardless of the user's profile visibility settings. For Connect apps, this API is only available to apps approved by Atlassian, according to these [guidelines](https://community.developer.atlassian.com/t/guidelines-for-requesting-access-to-email-address/27603). For Forge apps, this API only supports access via asApp() requests.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] accountId (required):
  ///   The account IDs of the users for which emails are required. An `accountId` is an identifier that uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`. Note, this should be treated as an opaque identifier (that is, do not assume any structure in the value).
  Future<Response> getUserEmailBulkWithHttpInfo(List<String> accountId, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/email/bulk';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('multi', 'accountId', accountId));

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

  /// Get user email bulk
  ///
  /// Returns a user's email address regardless of the user's profile visibility settings. For Connect apps, this API is only available to apps approved by Atlassian, according to these [guidelines](https://community.developer.atlassian.com/t/guidelines-for-requesting-access-to-email-address/27603). For Forge apps, this API only supports access via asApp() requests.
  ///
  /// Parameters:
  ///
  /// * [List<String>] accountId (required):
  ///   The account IDs of the users for which emails are required. An `accountId` is an identifier that uniquely identifies the user across all Atlassian products. For example, `5b10ac8d82e05b22cc7d4ef5`. Note, this should be treated as an opaque identifier (that is, do not assume any structure in the value).
  Future<UnrestrictedUserEmail?> getUserEmailBulk(List<String> accountId, { Future<void>? abortTrigger, }) async {
    final response = await getUserEmailBulkWithHttpInfo(accountId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'UnrestrictedUserEmail',) as UnrestrictedUserEmail;
    
    }
    return null;
  }

  /// Get user groups
  ///
  /// Returns the groups to which a user belongs.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] key:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> getUserGroupsWithHttpInfo(String accountId, { String? username, String? key, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/groups';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'accountId', accountId));
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Get user groups
  ///
  /// Returns the groups to which a user belongs.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] key:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<List<GroupName>?> getUserGroups(String accountId, { String? username, String? key, Future<void>? abortTrigger, }) async {
    final response = await getUserGroupsWithHttpInfo(accountId, username: username, key: key, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<GroupName>') as List)
        .cast<GroupName>()
        .toList(growable: false);

    }
    return null;
  }

  /// Delete user
  ///
  /// Deletes a user. If the operation completes successfully then the user is removed from Jira's user base. This operation does not delete the user's Atlassian account.  **[Permissions](#permissions) required:** Site administration (that is, membership of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] key:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> removeUserWithHttpInfo(String accountId, { String? username, String? key, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'accountId', accountId));
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (key != null) {
      queryParams.addAll(_queryParams('', 'key', key));
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

  /// Delete user
  ///
  /// Deletes a user. If the operation completes successfully then the user is removed from Jira's user base. This operation does not delete the user's Atlassian account.  **[Permissions](#permissions) required:** Site administration (that is, membership of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] key:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<void> removeUser(String accountId, { String? username, String? key, Future<void>? abortTrigger, }) async {
    final response = await removeUserWithHttpInfo(accountId, username: username, key: key, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Reset user default columns
  ///
  /// Resets the default [ issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user to the system default. If `accountId` is not passed, the calling user's default columns are reset.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set the columns on any user.  *  Permission to access Jira, to set the calling user's columns.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> resetUserColumnsWithHttpInfo({ String? accountId, String? username, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/columns';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
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

  /// Reset user default columns
  ///
  /// Resets the default [ issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user to the system default. If `accountId` is not passed, the calling user's default columns are reset.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set the columns on any user.  *  Permission to access Jira, to set the calling user's columns.
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<void> resetUserColumns({ String? accountId, String? username, Future<void>? abortTrigger, }) async {
    final response = await resetUserColumnsWithHttpInfo(accountId: accountId, username: username, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Set user default columns
  ///
  /// Sets the default [ issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user. If an account ID is not passed, the calling user's default columns are set. If no column details are sent, then all default columns are removed.  The parameters for this resource are expressed as HTML form data. For example, in curl:  `curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/user/columns?accountId=5b10ac8d82e05b22cc7d4ef5'`  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set the columns on any user.  *  Permission to access Jira, to set the calling user's columns.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UserColumnRequestBody] userColumnRequestBody (required):
  ///   The ID of a column to set. To set multiple columns, send multiple `columns` parameters.
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  Future<Response> setUserColumnsWithHttpInfo(UserColumnRequestBody userColumnRequestBody, { String? accountId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/columns';

    // ignore: prefer_final_locals
    Object? postBody = userColumnRequestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }

    const contentTypes = <String>['multipart/form-data'];


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

  /// Set user default columns
  ///
  /// Sets the default [ issue table columns](https://confluence.atlassian.com/x/XYdKLg) for the user. If an account ID is not passed, the calling user's default columns are set. If no column details are sent, then all default columns are removed.  The parameters for this resource are expressed as HTML form data. For example, in curl:  `curl -X PUT -d columns=summary -d columns=description https://your-domain.atlassian.net/rest/api/3/user/columns?accountId=5b10ac8d82e05b22cc7d4ef5'`  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to set the columns on any user.  *  Permission to access Jira, to set the calling user's columns.
  ///
  /// Parameters:
  ///
  /// * [UserColumnRequestBody] userColumnRequestBody (required):
  ///   The ID of a column to set. To set multiple columns, send multiple `columns` parameters.
  ///
  /// * [String] accountId:
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  Future<Object?> setUserColumns(UserColumnRequestBody userColumnRequestBody, { String? accountId, Future<void>? abortTrigger, }) async {
    final response = await setUserColumnsWithHttpInfo(userColumnRequestBody, accountId: accountId, abortTrigger: abortTrigger,);
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
}
