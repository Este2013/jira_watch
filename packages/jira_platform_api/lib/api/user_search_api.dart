//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class UserSearchApi {
  UserSearchApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Find users assignable to issues
  ///
  /// Returns a list of users that can be assigned to an issue. Use this operation to find the list of users who can be assigned to:   *  a new issue, by providing the `projectKeyOrId`.  *  an updated issue, by providing the `issueKey` or `issueId`.  *  to an issue during a transition (workflow action), by providing the `issueKey` or `issueId` and the transition id in `actionDescriptorId`. You can obtain the IDs of an issue's valid transitions using the `transitions` option in the `expand` parameter of [ Get issue](#api-rest-api-3-issue-issueIdOrKey-get).  In all these cases, you can pass an account ID to determine if a user can be assigned to an issue. The user is returned in the response if they can be assigned to the issue or issue transition.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that can be assigned the issue. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who can be assigned the issue, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Assign issues* [project permission](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName`, and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `username` or `accountId` is specified.
  ///
  /// * [String] sessionId:
  ///   The sessionId of this request. SessionId is the same until the assignee is set.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [String] project:
  ///   The project ID or project key (case sensitive). Required, unless `issueKey` or `issueId` is specified.
  ///
  /// * [String] issueKey:
  ///   The key of the issue. Required, unless `issueId` or `project` is specified.
  ///
  /// * [String] issueId:
  ///   The ID of the issue. Required, unless `issueKey` or `project` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return. This operation may return less than the maximum number of items even if more are available. The operation fetches users up to the maximum and then, from the fetched users, returns only the users that can be assigned to the issue.
  ///
  /// * [int] actionDescriptorId:
  ///   The ID of the transition.
  ///
  /// * [bool] recommend:
  ///
  /// * [List<String>] accountType:
  ///
  /// * [List<String>] appType:
  Future<Response> findAssignableUsersWithHttpInfo({ String? query, String? sessionId, String? username, String? accountId, String? project, String? issueKey, String? issueId, int? startAt, int? maxResults, int? actionDescriptorId, bool? recommend, List<String>? accountType, List<String>? appType, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/assignable/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (sessionId != null) {
      queryParams.addAll(_queryParams('', 'sessionId', sessionId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (project != null) {
      queryParams.addAll(_queryParams('', 'project', project));
    }
    if (issueKey != null) {
      queryParams.addAll(_queryParams('', 'issueKey', issueKey));
    }
    if (issueId != null) {
      queryParams.addAll(_queryParams('', 'issueId', issueId));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (actionDescriptorId != null) {
      queryParams.addAll(_queryParams('', 'actionDescriptorId', actionDescriptorId));
    }
    if (recommend != null) {
      queryParams.addAll(_queryParams('', 'recommend', recommend));
    }
    if (accountType != null) {
      queryParams.addAll(_queryParams('multi', 'accountType', accountType));
    }
    if (appType != null) {
      queryParams.addAll(_queryParams('multi', 'appType', appType));
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

  /// Find users assignable to issues
  ///
  /// Returns a list of users that can be assigned to an issue. Use this operation to find the list of users who can be assigned to:   *  a new issue, by providing the `projectKeyOrId`.  *  an updated issue, by providing the `issueKey` or `issueId`.  *  to an issue during a transition (workflow action), by providing the `issueKey` or `issueId` and the transition id in `actionDescriptorId`. You can obtain the IDs of an issue's valid transitions using the `transitions` option in the `expand` parameter of [ Get issue](#api-rest-api-3-issue-issueIdOrKey-get).  In all these cases, you can pass an account ID to determine if a user can be assigned to an issue. The user is returned in the response if they can be assigned to the issue or issue transition.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that can be assigned the issue. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who can be assigned the issue, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg) or *Assign issues* [project permission](https://confluence.atlassian.com/x/yodKLg)
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName`, and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `username` or `accountId` is specified.
  ///
  /// * [String] sessionId:
  ///   The sessionId of this request. SessionId is the same until the assignee is set.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [String] project:
  ///   The project ID or project key (case sensitive). Required, unless `issueKey` or `issueId` is specified.
  ///
  /// * [String] issueKey:
  ///   The key of the issue. Required, unless `issueId` or `project` is specified.
  ///
  /// * [String] issueId:
  ///   The ID of the issue. Required, unless `issueKey` or `project` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return. This operation may return less than the maximum number of items even if more are available. The operation fetches users up to the maximum and then, from the fetched users, returns only the users that can be assigned to the issue.
  ///
  /// * [int] actionDescriptorId:
  ///   The ID of the transition.
  ///
  /// * [bool] recommend:
  ///
  /// * [List<String>] accountType:
  ///
  /// * [List<String>] appType:
  Future<List<User>?> findAssignableUsers({ String? query, String? sessionId, String? username, String? accountId, String? project, String? issueKey, String? issueId, int? startAt, int? maxResults, int? actionDescriptorId, bool? recommend, List<String>? accountType, List<String>? appType, Future<void>? abortTrigger, }) async {
    final response = await findAssignableUsersWithHttpInfo(query: query, sessionId: sessionId, username: username, accountId: accountId, project: project, issueKey: issueKey, issueId: issueId, startAt: startAt, maxResults: maxResults, actionDescriptorId: actionDescriptorId, recommend: recommend, accountType: accountType, appType: appType, abortTrigger: abortTrigger,);
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

  /// Find users assignable to projects
  ///
  /// Returns a list of users who can be assigned issues in one or more projects. The list may be restricted to users whose attributes match a string.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that can be assigned issues in the projects. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who can be assigned issues in the projects, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for each project specified in `projectKeys`.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] projectKeys (required):
  ///   A list of project keys (case sensitive). This parameter accepts a comma-separated list.
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> findBulkAssignableUsersWithHttpInfo(String projectKeys, { String? query, String? username, String? accountId, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/assignable/multiProjectSearch';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
      queryParams.addAll(_queryParams('', 'projectKeys', projectKeys));
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Find users assignable to projects
  ///
  /// Returns a list of users who can be assigned issues in one or more projects. The list may be restricted to users whose attributes match a string.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that can be assigned issues in the projects. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who can be assigned issues in the projects, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for each project specified in `projectKeys`.
  ///
  /// Parameters:
  ///
  /// * [String] projectKeys (required):
  ///   A list of project keys (case sensitive). This parameter accepts a comma-separated list.
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<List<User>?> findBulkAssignableUsers(String projectKeys, { String? query, String? username, String? accountId, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await findBulkAssignableUsersWithHttpInfo(projectKeys, query: query, username: username, accountId: accountId, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
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

  /// Find user keys by query
  ///
  /// Finds users with a structured query and returns a [paginated](#pagination) list of user keys.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  The query statements are:   *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.  *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.  *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.  *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.  *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.  *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.  *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.  *  `[propertyKey].entity.property.path is \"property value\"` Returns users with the entity property value. For example, if user property `location` is set to value `{\"office\": {\"country\": \"AU\", \"city\": \"Sydney\"}}`, then it's possible to use `[location].office.city is \"Sydney\"` to match the user.  The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:  `is assignee of PROJ AND [propertyKey].entity.property.path is \"property value\"`
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   The search query.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResult:
  ///   The maximum number of items to return per page.
  Future<Response> findUserKeysByQueryWithHttpInfo(String query, { int? startAt, int? maxResult, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/search/query/key';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'query', query));
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResult != null) {
      queryParams.addAll(_queryParams('', 'maxResult', maxResult));
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

  /// Find user keys by query
  ///
  /// Finds users with a structured query and returns a [paginated](#pagination) list of user keys.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  The query statements are:   *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.  *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.  *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.  *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.  *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.  *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.  *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.  *  `[propertyKey].entity.property.path is \"property value\"` Returns users with the entity property value. For example, if user property `location` is set to value `{\"office\": {\"country\": \"AU\", \"city\": \"Sydney\"}}`, then it's possible to use `[location].office.city is \"Sydney\"` to match the user.  The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:  `is assignee of PROJ AND [propertyKey].entity.property.path is \"property value\"`
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   The search query.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResult:
  ///   The maximum number of items to return per page.
  Future<PageBeanUserKey?> findUserKeysByQuery(String query, { int? startAt, int? maxResult, Future<void>? abortTrigger, }) async {
    final response = await findUserKeysByQueryWithHttpInfo(query, startAt: startAt, maxResult: maxResult, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanUserKey',) as PageBeanUserKey;
    
    }
    return null;
  }

  /// Find users
  ///
  /// Returns a list of active users that match the search string and property.  This operation first applies a filter to match the search string and property, and then takes the filtered users in the range defined by `startAt` and `maxResults`, up to the thousandth user. To get all the users who match the search string and property, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  This operation can be accessed anonymously.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls or calls by users without the required permission return empty search results.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes ( `displayName`, and `emailAddress`) to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` or `property` is specified.
  ///
  /// * [String] username:
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against a user `accountId`. Required, unless `query` or `property` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of filtered results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] property:
  ///   A query string used to search properties. Property keys are specified by path, so property keys containing dot (.) or equals (=) characters cannot be used. The query string cannot be specified using a JSON object. Example: To search for the value of `nested` from `{\"something\":{\"nested\":1,\"other\":2}}` use `thepropertykey.something.nested=1`. Required, unless `accountId` or `query` is specified.
  Future<Response> findUsersWithHttpInfo({ String? query, String? username, String? accountId, int? startAt, int? maxResults, String? property, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (property != null) {
      queryParams.addAll(_queryParams('', 'property', property));
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

  /// Find users
  ///
  /// Returns a list of active users that match the search string and property.  This operation first applies a filter to match the search string and property, and then takes the filtered users in the range defined by `startAt` and `maxResults`, up to the thousandth user. To get all the users who match the search string and property, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  This operation can be accessed anonymously.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls or calls by users without the required permission return empty search results.
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes ( `displayName`, and `emailAddress`) to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` or `property` is specified.
  ///
  /// * [String] username:
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against a user `accountId`. Required, unless `query` or `property` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of filtered results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [String] property:
  ///   A query string used to search properties. Property keys are specified by path, so property keys containing dot (.) or equals (=) characters cannot be used. The query string cannot be specified using a JSON object. Example: To search for the value of `nested` from `{\"something\":{\"nested\":1,\"other\":2}}` use `thepropertykey.something.nested=1`. Required, unless `accountId` or `query` is specified.
  Future<List<User>?> findUsers({ String? query, String? username, String? accountId, int? startAt, int? maxResults, String? property, Future<void>? abortTrigger, }) async {
    final response = await findUsersWithHttpInfo(query: query, username: username, accountId: accountId, startAt: startAt, maxResults: maxResults, property: property, abortTrigger: abortTrigger,);
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

  /// Find users by query
  ///
  /// Finds users with a structured query and returns a [paginated](#pagination) list of user details.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  The query statements are:   *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.  *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.  *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.  *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.  *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.  *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.  *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.  *  `[propertyKey].entity.property.path is \"property value\"` Returns users with the entity property value. For example, if user property `location` is set to value `{\"office\": {\"country\": \"AU\", \"city\": \"Sydney\"}}`, then it's possible to use `[location].office.city is \"Sydney\"` to match the user.  The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:  `is assignee of PROJ AND [propertyKey].entity.property.path is \"property value\"`
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   The search query.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> findUsersByQueryWithHttpInfo(String query, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/search/query';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'query', query));
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Find users by query
  ///
  /// Finds users with a structured query and returns a [paginated](#pagination) list of user details.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the structured query. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the structured query, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  The query statements are:   *  `is assignee of PROJ` Returns the users that are assignees of at least one issue in project *PROJ*.  *  `is assignee of (PROJ-1, PROJ-2)` Returns users that are assignees on the issues *PROJ-1* or *PROJ-2*.  *  `is reporter of (PROJ-1, PROJ-2)` Returns users that are reporters on the issues *PROJ-1* or *PROJ-2*.  *  `is watcher of (PROJ-1, PROJ-2)` Returns users that are watchers on the issues *PROJ-1* or *PROJ-2*.  *  `is voter of (PROJ-1, PROJ-2)` Returns users that are voters on the issues *PROJ-1* or *PROJ-2*.  *  `is commenter of (PROJ-1, PROJ-2)` Returns users that have posted a comment on the issues *PROJ-1* or *PROJ-2*.  *  `is transitioner of (PROJ-1, PROJ-2)` Returns users that have performed a transition on issues *PROJ-1* or *PROJ-2*.  *  `[propertyKey].entity.property.path is \"property value\"` Returns users with the entity property value. For example, if user property `location` is set to value `{\"office\": {\"country\": \"AU\", \"city\": \"Sydney\"}}`, then it's possible to use `[location].office.city is \"Sydney\"` to match the user.  The list of issues can be extended as needed, as in *(PROJ-1, PROJ-2, ... PROJ-n)*. Statements can be combined using the `AND` and `OR` operators to form more complex queries. For example:  `is assignee of PROJ AND [propertyKey].entity.property.path is \"property value\"`
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   The search query.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<PageBeanUser?> findUsersByQuery(String query, { int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await findUsersByQueryWithHttpInfo(query, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
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

  /// Find users for picker
  ///
  /// Returns a list of users whose attributes match the query term. The returned object includes the `html` field where the matched query term is highlighted with the HTML strong tag. A list of account IDs can be provided to exclude users from the results.  This operation takes the users in the range defined by `maxResults`, up to the thousandth user, and then returns only the users from that range that match the query term. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the query term, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return search results for an exact name match only.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   A query string that is matched against user attributes, such as `displayName`, and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return. The total number of matched users is returned in `total`.
  ///
  /// * [bool] showAvatar:
  ///   Include the URI to the user's avatar.
  ///
  /// * [List<String>] exclude:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [List<String>] excludeAccountIds:
  ///   A list of account IDs to exclude from the search results. This parameter accepts a comma-separated list. Multiple account IDs can also be provided using an ampersand-separated list. For example, `excludeAccountIds=5b10a2844c20165700ede21g,5b10a0effa615349cb016cd8&excludeAccountIds=5b10ac8d82e05b22cc7d4ef5`. Cannot be provided with `exclude`.
  ///
  /// * [String] avatarSize:
  ///
  /// * [bool] excludeConnectUsers:
  Future<Response> findUsersForPickerWithHttpInfo(String query, { int? maxResults, bool? showAvatar, List<String>? exclude, List<String>? excludeAccountIds, String? avatarSize, bool? excludeConnectUsers, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/picker';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

      queryParams.addAll(_queryParams('', 'query', query));
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (showAvatar != null) {
      queryParams.addAll(_queryParams('', 'showAvatar', showAvatar));
    }
    if (exclude != null) {
      queryParams.addAll(_queryParams('multi', 'exclude', exclude));
    }
    if (excludeAccountIds != null) {
      queryParams.addAll(_queryParams('multi', 'excludeAccountIds', excludeAccountIds));
    }
    if (avatarSize != null) {
      queryParams.addAll(_queryParams('', 'avatarSize', avatarSize));
    }
    if (excludeConnectUsers != null) {
      queryParams.addAll(_queryParams('', 'excludeConnectUsers', excludeConnectUsers));
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

  /// Find users for picker
  ///
  /// Returns a list of users whose attributes match the query term. The returned object includes the `html` field where the matched query term is highlighted with the HTML strong tag. A list of account IDs can be provided to exclude users from the results.  This operation takes the users in the range defined by `maxResults`, up to the thousandth user, and then returns only the users from that range that match the query term. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the query term, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return search results for an exact name match only.
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   A query string that is matched against user attributes, such as `displayName`, and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return. The total number of matched users is returned in `total`.
  ///
  /// * [bool] showAvatar:
  ///   Include the URI to the user's avatar.
  ///
  /// * [List<String>] exclude:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [List<String>] excludeAccountIds:
  ///   A list of account IDs to exclude from the search results. This parameter accepts a comma-separated list. Multiple account IDs can also be provided using an ampersand-separated list. For example, `excludeAccountIds=5b10a2844c20165700ede21g,5b10a0effa615349cb016cd8&excludeAccountIds=5b10ac8d82e05b22cc7d4ef5`. Cannot be provided with `exclude`.
  ///
  /// * [String] avatarSize:
  ///
  /// * [bool] excludeConnectUsers:
  Future<FoundUsers?> findUsersForPicker(String query, { int? maxResults, bool? showAvatar, List<String>? exclude, List<String>? excludeAccountIds, String? avatarSize, bool? excludeConnectUsers, Future<void>? abortTrigger, }) async {
    final response = await findUsersForPickerWithHttpInfo(query, maxResults: maxResults, showAvatar: showAvatar, exclude: exclude, excludeAccountIds: excludeAccountIds, avatarSize: avatarSize, excludeConnectUsers: excludeConnectUsers, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FoundUsers',) as FoundUsers;
    
    }
    return null;
  }

  /// Find users with permissions
  ///
  /// Returns a list of users who fulfill these criteria:   *  their user attributes match a search string.  *  they have a set of permissions for a project or issue.  If no search string is provided, a list of all users with the permissions is returned.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the search string and have permission for the project or issue. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the search string and have permission for the project or issue, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to get users for any project.  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project, to get users for that project.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] permissions (required):
  ///   A comma separated list of permissions. Permissions can be specified as any:   *  permission returned by [Get all permissions](#api-rest-api-3-permissions-get).  *  custom project permission added by Connect apps.  *  (deprecated) one of the following:           *  ASSIGNABLE\\_USER      *  ASSIGN\\_ISSUE      *  ATTACHMENT\\_DELETE\\_ALL      *  ATTACHMENT\\_DELETE\\_OWN      *  BROWSE      *  CLOSE\\_ISSUE      *  COMMENT\\_DELETE\\_ALL      *  COMMENT\\_DELETE\\_OWN      *  COMMENT\\_EDIT\\_ALL      *  COMMENT\\_EDIT\\_OWN      *  COMMENT\\_ISSUE      *  CREATE\\_ATTACHMENT      *  CREATE\\_ISSUE      *  DELETE\\_ISSUE      *  EDIT\\_ISSUE      *  LINK\\_ISSUE      *  MANAGE\\_WATCHER\\_LIST      *  MODIFY\\_REPORTER      *  MOVE\\_ISSUE      *  PROJECT\\_ADMIN      *  RESOLVE\\_ISSUE      *  SCHEDULE\\_ISSUE      *  SET\\_ISSUE\\_SECURITY      *  TRANSITION\\_ISSUE      *  VIEW\\_VERSION\\_CONTROL      *  VIEW\\_VOTERS\\_AND\\_WATCHERS      *  VIEW\\_WORKFLOW\\_READONLY      *  WORKLOG\\_DELETE\\_ALL      *  WORKLOG\\_DELETE\\_OWN      *  WORKLOG\\_EDIT\\_ALL      *  WORKLOG\\_EDIT\\_OWN      *  WORK\\_ISSUE
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [String] issueKey:
  ///   The issue key for the issue.
  ///
  /// * [String] projectKey:
  ///   The project key for the project (case sensitive).
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> findUsersWithAllPermissionsWithHttpInfo(String permissions, { String? query, String? username, String? accountId, String? issueKey, String? projectKey, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/permission/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
      queryParams.addAll(_queryParams('', 'permissions', permissions));
    if (issueKey != null) {
      queryParams.addAll(_queryParams('', 'issueKey', issueKey));
    }
    if (projectKey != null) {
      queryParams.addAll(_queryParams('', 'projectKey', projectKey));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Find users with permissions
  ///
  /// Returns a list of users who fulfill these criteria:   *  their user attributes match a search string.  *  they have a set of permissions for a project or issue.  If no search string is provided, a list of all users with the permissions is returned.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the search string and have permission for the project or issue. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the search string and have permission for the project or issue, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg), to get users for any project.  *  *Administer Projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for a project, to get users for that project.
  ///
  /// Parameters:
  ///
  /// * [String] permissions (required):
  ///   A comma separated list of permissions. Permissions can be specified as any:   *  permission returned by [Get all permissions](#api-rest-api-3-permissions-get).  *  custom project permission added by Connect apps.  *  (deprecated) one of the following:           *  ASSIGNABLE\\_USER      *  ASSIGN\\_ISSUE      *  ATTACHMENT\\_DELETE\\_ALL      *  ATTACHMENT\\_DELETE\\_OWN      *  BROWSE      *  CLOSE\\_ISSUE      *  COMMENT\\_DELETE\\_ALL      *  COMMENT\\_DELETE\\_OWN      *  COMMENT\\_EDIT\\_ALL      *  COMMENT\\_EDIT\\_OWN      *  COMMENT\\_ISSUE      *  CREATE\\_ATTACHMENT      *  CREATE\\_ISSUE      *  DELETE\\_ISSUE      *  EDIT\\_ISSUE      *  LINK\\_ISSUE      *  MANAGE\\_WATCHER\\_LIST      *  MODIFY\\_REPORTER      *  MOVE\\_ISSUE      *  PROJECT\\_ADMIN      *  RESOLVE\\_ISSUE      *  SCHEDULE\\_ISSUE      *  SET\\_ISSUE\\_SECURITY      *  TRANSITION\\_ISSUE      *  VIEW\\_VERSION\\_CONTROL      *  VIEW\\_VOTERS\\_AND\\_WATCHERS      *  VIEW\\_WORKFLOW\\_READONLY      *  WORKLOG\\_DELETE\\_ALL      *  WORKLOG\\_DELETE\\_OWN      *  WORKLOG\\_EDIT\\_ALL      *  WORKLOG\\_EDIT\\_OWN      *  WORK\\_ISSUE
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [String] issueKey:
  ///   The issue key for the issue.
  ///
  /// * [String] projectKey:
  ///   The project key for the project (case sensitive).
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<List<User>?> findUsersWithAllPermissions(String permissions, { String? query, String? username, String? accountId, String? issueKey, String? projectKey, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await findUsersWithAllPermissionsWithHttpInfo(permissions, query: query, username: username, accountId: accountId, issueKey: issueKey, projectKey: projectKey, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
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

  /// Find users with browse permission
  ///
  /// Returns a list of users who fulfill these criteria:   *  their user attributes match a search string.  *  they have permission to browse issues.  Use this resource to find users who can browse:   *  an issue, by providing the `issueKey`.  *  any issue in a project, by providing the `projectKey`.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the search string and have permission to browse issues. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the search string and have permission to browse issues, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return empty search results.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [String] issueKey:
  ///   The issue key for the issue. Required, unless `projectKey` is specified.
  ///
  /// * [String] projectKey:
  ///   The project key for the project (case sensitive). Required, unless `issueKey` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<Response> findUsersWithBrowsePermissionWithHttpInfo({ String? query, String? username, String? accountId, String? issueKey, String? projectKey, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/user/viewissue/search';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (issueKey != null) {
      queryParams.addAll(_queryParams('', 'issueKey', issueKey));
    }
    if (projectKey != null) {
      queryParams.addAll(_queryParams('', 'projectKey', projectKey));
    }
    if (startAt != null) {
      queryParams.addAll(_queryParams('', 'startAt', startAt));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
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

  /// Find users with browse permission
  ///
  /// Returns a list of users who fulfill these criteria:   *  their user attributes match a search string.  *  they have permission to browse issues.  Use this resource to find users who can browse:   *  an issue, by providing the `issueKey`.  *  any issue in a project, by providing the `projectKey`.  This operation takes the users in the range defined by `startAt` and `maxResults`, up to the thousandth user, and then returns only the users from that range that match the search string and have permission to browse issues. This means the operation usually returns fewer users than specified in `maxResults`. To get all the users who match the search string and have permission to browse issues, use [Get all users](#api-rest-api-3-users-search-get) and filter the records in your code.  Privacy controls are applied to the response based on the users' preferences. This could mean, for example, that the user's email address is hidden. See the [Profile visibility overview](https://developer.atlassian.com/cloud/jira/platform/profile-visibility/) for more details.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Anonymous calls and calls by users without the required permission return empty search results.
  ///
  /// Parameters:
  ///
  /// * [String] query:
  ///   A query string that is matched against user attributes, such as `displayName` and `emailAddress`, to find relevant users. The string can match the prefix of the attribute's value. For example, *query=john* matches a user with a `displayName` of *John Smith* and a user with an `emailAddress` of *johnson@example.com*. Required, unless `accountId` is specified.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  ///
  /// * [String] accountId:
  ///   A query string that is matched exactly against user `accountId`. Required, unless `query` is specified.
  ///
  /// * [String] issueKey:
  ///   The issue key for the issue. Required, unless `projectKey` is specified.
  ///
  /// * [String] projectKey:
  ///   The project key for the project (case sensitive). Required, unless `issueKey` is specified.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  Future<List<User>?> findUsersWithBrowsePermission({ String? query, String? username, String? accountId, String? issueKey, String? projectKey, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await findUsersWithBrowsePermissionWithHttpInfo(query: query, username: username, accountId: accountId, issueKey: issueKey, projectKey: projectKey, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
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
}
