//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class GroupsApi {
  GroupsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add user to group
  ///
  /// Adds a user to a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [UpdateUserToGroupBean] updateUserToGroupBean (required):
  ///   The user to add to the group.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  Future<Response> addUserToGroupWithHttpInfo(UpdateUserToGroupBean updateUserToGroupBean, { String? groupname, String? groupId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group/user';

    // ignore: prefer_final_locals
    Object? postBody = updateUserToGroupBean;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }

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

  /// Add user to group
  ///
  /// Adds a user to a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Parameters:
  ///
  /// * [UpdateUserToGroupBean] updateUserToGroupBean (required):
  ///   The user to add to the group.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  Future<Group?> addUserToGroup(UpdateUserToGroupBean updateUserToGroupBean, { String? groupname, String? groupId, Future<void>? abortTrigger, }) async {
    final response = await addUserToGroupWithHttpInfo(updateUserToGroupBean, groupname: groupname, groupId: groupId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Group',) as Group;
    
    }
    return null;
  }

  /// Bulk get groups
  ///
  /// Returns a [paginated](#pagination) list of groups.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
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
  /// * [List<String>] groupId:
  ///   The ID of a group. To specify multiple IDs, pass multiple `groupId` parameters. For example, `groupId=5b10a2844c20165700ede21g&groupId=5b10ac8d82e05b22cc7d4ef5`.
  ///
  /// * [List<String>] groupName:
  ///   The name of a group. To specify multiple names, pass multiple `groupName` parameters. For example, `groupName=administrators&groupName=jira-software-users`.
  ///
  /// * [String] accessType:
  ///   The access level of a group. Valid values: 'site-admin', 'admin', 'user'.
  ///
  /// * [String] applicationKey:
  ///   The application key of the product user groups to search for. Valid values: 'jira-servicedesk', 'jira-software', 'jira-product-discovery', 'jira-core'.
  Future<Response> bulkGetGroupsWithHttpInfo({ int? startAt, int? maxResults, List<String>? groupId, List<String>? groupName, String? accessType, String? applicationKey, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group/bulk';

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
    if (groupId != null) {
      queryParams.addAll(_queryParams('multi', 'groupId', groupId));
    }
    if (groupName != null) {
      queryParams.addAll(_queryParams('multi', 'groupName', groupName));
    }
    if (accessType != null) {
      queryParams.addAll(_queryParams('', 'accessType', accessType));
    }
    if (applicationKey != null) {
      queryParams.addAll(_queryParams('', 'applicationKey', applicationKey));
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

  /// Bulk get groups
  ///
  /// Returns a [paginated](#pagination) list of groups.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] groupId:
  ///   The ID of a group. To specify multiple IDs, pass multiple `groupId` parameters. For example, `groupId=5b10a2844c20165700ede21g&groupId=5b10ac8d82e05b22cc7d4ef5`.
  ///
  /// * [List<String>] groupName:
  ///   The name of a group. To specify multiple names, pass multiple `groupName` parameters. For example, `groupName=administrators&groupName=jira-software-users`.
  ///
  /// * [String] accessType:
  ///   The access level of a group. Valid values: 'site-admin', 'admin', 'user'.
  ///
  /// * [String] applicationKey:
  ///   The application key of the product user groups to search for. Valid values: 'jira-servicedesk', 'jira-software', 'jira-product-discovery', 'jira-core'.
  Future<PageBeanGroupDetails?> bulkGetGroups({ int? startAt, int? maxResults, List<String>? groupId, List<String>? groupName, String? accessType, String? applicationKey, Future<void>? abortTrigger, }) async {
    final response = await bulkGetGroupsWithHttpInfo(startAt: startAt, maxResults: maxResults, groupId: groupId, groupName: groupName, accessType: accessType, applicationKey: applicationKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanGroupDetails',) as PageBeanGroupDetails;
    
    }
    return null;
  }

  /// Create group
  ///
  /// Creates a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [AddGroupBean] addGroupBean (required):
  ///   The name of the group.
  Future<Response> createGroupWithHttpInfo(AddGroupBean addGroupBean, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group';

    // ignore: prefer_final_locals
    Object? postBody = addGroupBean;

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

  /// Create group
  ///
  /// Creates a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Parameters:
  ///
  /// * [AddGroupBean] addGroupBean (required):
  ///   The name of the group.
  Future<Group?> createGroup(AddGroupBean addGroupBean, { Future<void>? abortTrigger, }) async {
    final response = await createGroupWithHttpInfo(addGroupBean, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Group',) as Group;
    
    }
    return null;
  }

  /// Find groups
  ///
  /// Returns a list of groups whose names contain a query string. A list of group names can be provided to exclude groups from the results.  The primary use case for this resource is to populate a group picker suggestions list. To this end, the returned object includes the `html` field where the matched query term is highlighted in the group name with the HTML strong tag. Also, the groups list is wrapped in a response object that contains a header for use in the picker, specifically *Showing X of Y matching groups*.  The list returns with the groups sorted. If no groups match the list criteria, an empty list is returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg). Anonymous calls and calls by users without the required permission return an empty list.  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Without this permission, calls where query is not an exact match to an existing group will return an empty list.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   This parameter is deprecated, setting it does not affect the results. To find groups containing a particular user, use [Get user groups](#api-rest-api-3-user-groups-get).
  ///
  /// * [String] query:
  ///   The string to find in group names.
  ///
  /// * [List<String>] exclude:
  ///   As a group's name can change, use of `excludeGroupIds` is recommended to identify a group.   A group to exclude from the result. To exclude multiple groups, provide an ampersand-separated list. For example, `exclude=group1&exclude=group2`. This parameter cannot be used with the `excludeGroupIds` parameter.
  ///
  /// * [List<String>] excludeId:
  ///   A group ID to exclude from the result. To exclude multiple groups, provide an ampersand-separated list. For example, `excludeId=group1-id&excludeId=group2-id`. This parameter cannot be used with the `excludeGroups` parameter.
  ///
  /// * [int] maxResults:
  ///   The maximum number of groups to return. The maximum number of groups that can be returned is limited by the system property `jira.ajax.autocomplete.limit`.
  ///
  /// * [bool] caseInsensitive:
  ///   Whether the search for groups should be case insensitive.
  ///
  /// * [String] userName:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> findGroupsWithHttpInfo({ String? accountId, String? query, List<String>? exclude, List<String>? excludeId, int? maxResults, bool? caseInsensitive, String? userName, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/groups/picker';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (accountId != null) {
      queryParams.addAll(_queryParams('', 'accountId', accountId));
    }
    if (query != null) {
      queryParams.addAll(_queryParams('', 'query', query));
    }
    if (exclude != null) {
      queryParams.addAll(_queryParams('multi', 'exclude', exclude));
    }
    if (excludeId != null) {
      queryParams.addAll(_queryParams('multi', 'excludeId', excludeId));
    }
    if (maxResults != null) {
      queryParams.addAll(_queryParams('', 'maxResults', maxResults));
    }
    if (caseInsensitive != null) {
      queryParams.addAll(_queryParams('', 'caseInsensitive', caseInsensitive));
    }
    if (userName != null) {
      queryParams.addAll(_queryParams('', 'userName', userName));
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

  /// Find groups
  ///
  /// Returns a list of groups whose names contain a query string. A list of group names can be provided to exclude groups from the results.  The primary use case for this resource is to populate a group picker suggestions list. To this end, the returned object includes the `html` field where the matched query term is highlighted in the group name with the HTML strong tag. Also, the groups list is wrapped in a response object that contains a header for use in the picker, specifically *Showing X of Y matching groups*.  The list returns with the groups sorted. If no groups match the list criteria, an empty list is returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg). Anonymous calls and calls by users without the required permission return an empty list.  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg). Without this permission, calls where query is not an exact match to an existing group will return an empty list.
  ///
  /// Parameters:
  ///
  /// * [String] accountId:
  ///   This parameter is deprecated, setting it does not affect the results. To find groups containing a particular user, use [Get user groups](#api-rest-api-3-user-groups-get).
  ///
  /// * [String] query:
  ///   The string to find in group names.
  ///
  /// * [List<String>] exclude:
  ///   As a group's name can change, use of `excludeGroupIds` is recommended to identify a group.   A group to exclude from the result. To exclude multiple groups, provide an ampersand-separated list. For example, `exclude=group1&exclude=group2`. This parameter cannot be used with the `excludeGroupIds` parameter.
  ///
  /// * [List<String>] excludeId:
  ///   A group ID to exclude from the result. To exclude multiple groups, provide an ampersand-separated list. For example, `excludeId=group1-id&excludeId=group2-id`. This parameter cannot be used with the `excludeGroups` parameter.
  ///
  /// * [int] maxResults:
  ///   The maximum number of groups to return. The maximum number of groups that can be returned is limited by the system property `jira.ajax.autocomplete.limit`.
  ///
  /// * [bool] caseInsensitive:
  ///   Whether the search for groups should be case insensitive.
  ///
  /// * [String] userName:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<FoundGroups?> findGroups({ String? accountId, String? query, List<String>? exclude, List<String>? excludeId, int? maxResults, bool? caseInsensitive, String? userName, Future<void>? abortTrigger, }) async {
    final response = await findGroupsWithHttpInfo(accountId: accountId, query: query, exclude: exclude, excludeId: excludeId, maxResults: maxResults, caseInsensitive: caseInsensitive, userName: userName, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FoundGroups',) as FoundGroups;
    
    }
    return null;
  }

  /// Get group
  ///
  /// This operation is deprecated, use [`group/member`](#api-rest-api-3-group-member-get).  Returns all users in a group.  **[Permissions](#permissions) required:** either of:   *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  ///
  /// * [String] expand:
  ///   List of fields to expand.
  Future<Response> getGroupWithHttpInfo({ String? groupname, String? groupId, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
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

  /// Get group
  ///
  /// This operation is deprecated, use [`group/member`](#api-rest-api-3-group-member-get).  Returns all users in a group.  **[Permissions](#permissions) required:** either of:   *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  ///
  /// * [String] expand:
  ///   List of fields to expand.
  Future<Group?> getGroup({ String? groupname, String? groupId, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getGroupWithHttpInfo(groupname: groupname, groupId: groupId, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Group',) as Group;
    
    }
    return null;
  }

  /// Get users from group
  ///
  /// Returns a [paginated](#pagination) list of all users in a group.  Note that users are ordered by username, however the username is not returned in the results due to privacy reasons.  **[Permissions](#permissions) required:** either of:   *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  ///
  /// * [bool] includeInactiveUsers:
  ///   Include inactive users.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page (number should be between 1 and 50).
  Future<Response> getUsersFromGroupWithHttpInfo({ String? groupname, String? groupId, bool? includeInactiveUsers, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group/member';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }
    if (includeInactiveUsers != null) {
      queryParams.addAll(_queryParams('', 'includeInactiveUsers', includeInactiveUsers));
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

  /// Get users from group
  ///
  /// Returns a [paginated](#pagination) list of all users in a group.  Note that users are ordered by username, however the username is not returned in the results due to privacy reasons.  **[Permissions](#permissions) required:** either of:   *  *Browse users and groups* [global permission](https://confluence.atlassian.com/x/x4dKLg).  *  *Administer Jira* [global permission](https://confluence.atlassian.com/x/x4dKLg).
  ///
  /// Parameters:
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  ///
  /// * [bool] includeInactiveUsers:
  ///   Include inactive users.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page (number should be between 1 and 50).
  Future<PageBeanUserDetails?> getUsersFromGroup({ String? groupname, String? groupId, bool? includeInactiveUsers, int? startAt, int? maxResults, Future<void>? abortTrigger, }) async {
    final response = await getUsersFromGroupWithHttpInfo(groupname: groupname, groupId: groupId, includeInactiveUsers: includeInactiveUsers, startAt: startAt, maxResults: maxResults, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanUserDetails',) as PageBeanUserDetails;
    
    }
    return null;
  }

  /// Remove group
  ///
  /// Deletes a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* strategic [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] groupname:
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupname` parameter.
  ///
  /// * [String] swapGroup:
  ///   As a group's name can change, use of `swapGroupId` is recommended to identify a group.   The group to transfer restrictions to. Only comments and worklogs are transferred. If restrictions are not transferred, comments and worklogs are inaccessible after the deletion. This parameter cannot be used with the `swapGroupId` parameter.
  ///
  /// * [String] swapGroupId:
  ///   The ID of the group to transfer restrictions to. Only comments and worklogs are transferred. If restrictions are not transferred, comments and worklogs are inaccessible after the deletion. This parameter cannot be used with the `swapGroup` parameter.
  Future<Response> removeGroupWithHttpInfo({ String? groupname, String? groupId, String? swapGroup, String? swapGroupId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }
    if (swapGroup != null) {
      queryParams.addAll(_queryParams('', 'swapGroup', swapGroup));
    }
    if (swapGroupId != null) {
      queryParams.addAll(_queryParams('', 'swapGroupId', swapGroupId));
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

  /// Remove group
  ///
  /// Deletes a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* strategic [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Parameters:
  ///
  /// * [String] groupname:
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupname` parameter.
  ///
  /// * [String] swapGroup:
  ///   As a group's name can change, use of `swapGroupId` is recommended to identify a group.   The group to transfer restrictions to. Only comments and worklogs are transferred. If restrictions are not transferred, comments and worklogs are inaccessible after the deletion. This parameter cannot be used with the `swapGroupId` parameter.
  ///
  /// * [String] swapGroupId:
  ///   The ID of the group to transfer restrictions to. Only comments and worklogs are transferred. If restrictions are not transferred, comments and worklogs are inaccessible after the deletion. This parameter cannot be used with the `swapGroup` parameter.
  Future<void> removeGroup({ String? groupname, String? groupId, String? swapGroup, String? swapGroupId, Future<void>? abortTrigger, }) async {
    final response = await removeGroupWithHttpInfo(groupname: groupname, groupId: groupId, swapGroup: swapGroup, swapGroupId: swapGroupId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Remove user from group
  ///
  /// Removes a user from a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<Response> removeUserFromGroupWithHttpInfo(String accountId, { String? groupname, String? groupId, String? username, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/group/user';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (groupname != null) {
      queryParams.addAll(_queryParams('', 'groupname', groupname));
    }
    if (groupId != null) {
      queryParams.addAll(_queryParams('', 'groupId', groupId));
    }
    if (username != null) {
      queryParams.addAll(_queryParams('', 'username', username));
    }
      queryParams.addAll(_queryParams('', 'accountId', accountId));

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

  /// Remove user from group
  ///
  /// Removes a user from a group.  **[Permissions](#permissions) required:** Site administration (that is, member of the *site-admin* [group](https://confluence.atlassian.com/x/24xjL)).
  ///
  /// Parameters:
  ///
  /// * [String] accountId (required):
  ///   The account ID of the user, which uniquely identifies the user across all Atlassian products. For example, *5b10ac8d82e05b22cc7d4ef5*.
  ///
  /// * [String] groupname:
  ///   As a group's name can change, use of `groupId` is recommended to identify a group.   The name of the group. This parameter cannot be used with the `groupId` parameter.
  ///
  /// * [String] groupId:
  ///   The ID of the group. This parameter cannot be used with the `groupName` parameter.
  ///
  /// * [String] username:
  ///   This parameter is no longer available. See the [deprecation notice](https://developer.atlassian.com/cloud/jira/platform/deprecation-notice-user-privacy-api-migration-guide/) for details.
  Future<void> removeUserFromGroup(String accountId, { String? groupname, String? groupId, String? username, Future<void>? abortTrigger, }) async {
    final response = await removeUserFromGroupWithHttpInfo(accountId, groupname: groupname, groupId: groupId, username: username, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
