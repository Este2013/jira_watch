//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class GroupAndUserPickerApi {
  GroupAndUserPickerApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Find users and groups
  ///
  /// Returns a list of users and groups matching a string. The string is used:   *  for users, to find a case-insensitive match with display name and e-mail address. Note that if a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.  *  for groups, to find a case-sensitive match with group name.  For example, if the string *tin* is used, records with the display name *Tina*, email address *sarah@tinplatetraining.com*, and the group *accounting* would be returned.  Optionally, the search can be refined to:   *  the projects and issue types associated with a custom field, such as a user picker. The search can then be further refined to return only users and groups that have permission to view specific:           *  projects.      *  issue types.          If multiple projects or issue types are specified, they must be a subset of those enabled for the custom field or no results are returned. For example, if a field is enabled for projects A, B, and C then the search could be limited to projects B and C. However, if the search is limited to projects B and D, nothing is returned.  *  not return Connect app users and groups.  *  return groups that have a case-insensitive match with the query.  The primary use case for this resource is to populate a picker field suggestion list with users or groups. To this end, the returned object includes an `html` field for each list. This field highlights the matched query term in the item name with the HTML strong tag. Also, each list is wrapped in a response object that contains a header for use in a picker, specifically *Showing X of Y matching groups*.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   The search string.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return in each list.
  ///
  /// * [bool] showAvatar:
  ///   Whether the user avatar should be returned. If an invalid value is provided, the default value is used.
  ///
  /// * [String] fieldId:
  ///   The custom field ID of the field this request is for.
  ///
  /// * [List<String>] projectId:
  ///   The ID of a project that returned users and groups must have permission to view. To include multiple projects, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`. This parameter is only used when `fieldId` is present.
  ///
  /// * [List<String>] issueTypeId:
  ///   The ID of an issue type that returned users and groups must have permission to view. To include multiple issue types, provide an ampersand-separated list. For example, `issueTypeId=10000&issueTypeId=10001`. Special values, such as `-1` (all standard issue types) and `-2` (all subtask issue types), are supported. This parameter is only used when `fieldId` is present.
  ///
  /// * [String] avatarSize:
  ///   The size of the avatar to return. If an invalid value is provided, the default value is used.
  ///
  /// * [bool] caseInsensitive:
  ///   Whether the search for groups should be case insensitive.
  ///
  /// * [bool] excludeConnectAddons:
  ///   Whether Connect app users and groups should be excluded from the search results. If an invalid value is provided, the default value is used.
  ///
  /// * [bool] includeAiAgents:
  ///   Whether AI Agents should be included in the search results. If an invalid value is provided, the default value is used.
  Future<Response> findUsersAndGroupsWithHttpInfo(String query, { int? maxResults, bool? showAvatar, String? fieldId, List<String>? projectId, List<String>? issueTypeId, String? avatarSize, bool? caseInsensitive, bool? excludeConnectAddons, bool? includeAiAgents, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/groupuserpicker';

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
    if (fieldId != null) {
      queryParams.addAll(_queryParams('', 'fieldId', fieldId));
    }
    if (projectId != null) {
      queryParams.addAll(_queryParams('multi', 'projectId', projectId));
    }
    if (issueTypeId != null) {
      queryParams.addAll(_queryParams('multi', 'issueTypeId', issueTypeId));
    }
    if (avatarSize != null) {
      queryParams.addAll(_queryParams('', 'avatarSize', avatarSize));
    }
    if (caseInsensitive != null) {
      queryParams.addAll(_queryParams('', 'caseInsensitive', caseInsensitive));
    }
    if (excludeConnectAddons != null) {
      queryParams.addAll(_queryParams('', 'excludeConnectAddons', excludeConnectAddons));
    }
    if (includeAiAgents != null) {
      queryParams.addAll(_queryParams('', 'includeAiAgents', includeAiAgents));
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

  /// Find users and groups
  ///
  /// Returns a list of users and groups matching a string. The string is used:   *  for users, to find a case-insensitive match with display name and e-mail address. Note that if a user has hidden their email address in their user profile, partial matches of the email address will not find the user. An exact match is required.  *  for groups, to find a case-sensitive match with group name.  For example, if the string *tin* is used, records with the display name *Tina*, email address *sarah@tinplatetraining.com*, and the group *accounting* would be returned.  Optionally, the search can be refined to:   *  the projects and issue types associated with a custom field, such as a user picker. The search can then be further refined to return only users and groups that have permission to view specific:           *  projects.      *  issue types.          If multiple projects or issue types are specified, they must be a subset of those enabled for the custom field or no results are returned. For example, if a field is enabled for projects A, B, and C then the search could be limited to projects B and C. However, if the search is limited to projects B and D, nothing is returned.  *  not return Connect app users and groups.  *  return groups that have a case-insensitive match with the query.  The primary use case for this resource is to populate a picker field suggestion list with users or groups. To this end, the returned object includes an `html` field for each list. This field highlights the matched query term in the item name with the HTML strong tag. Also, each list is wrapped in a response object that contains a header for use in a picker, specifically *Showing X of Y matching groups*.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** *Browse users and groups* [global permission](https://confluence.atlassian.com/x/yodKLg).
  ///
  /// Parameters:
  ///
  /// * [String] query (required):
  ///   The search string.
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return in each list.
  ///
  /// * [bool] showAvatar:
  ///   Whether the user avatar should be returned. If an invalid value is provided, the default value is used.
  ///
  /// * [String] fieldId:
  ///   The custom field ID of the field this request is for.
  ///
  /// * [List<String>] projectId:
  ///   The ID of a project that returned users and groups must have permission to view. To include multiple projects, provide an ampersand-separated list. For example, `projectId=10000&projectId=10001`. This parameter is only used when `fieldId` is present.
  ///
  /// * [List<String>] issueTypeId:
  ///   The ID of an issue type that returned users and groups must have permission to view. To include multiple issue types, provide an ampersand-separated list. For example, `issueTypeId=10000&issueTypeId=10001`. Special values, such as `-1` (all standard issue types) and `-2` (all subtask issue types), are supported. This parameter is only used when `fieldId` is present.
  ///
  /// * [String] avatarSize:
  ///   The size of the avatar to return. If an invalid value is provided, the default value is used.
  ///
  /// * [bool] caseInsensitive:
  ///   Whether the search for groups should be case insensitive.
  ///
  /// * [bool] excludeConnectAddons:
  ///   Whether Connect app users and groups should be excluded from the search results. If an invalid value is provided, the default value is used.
  ///
  /// * [bool] includeAiAgents:
  ///   Whether AI Agents should be included in the search results. If an invalid value is provided, the default value is used.
  Future<FoundUsersAndGroups?> findUsersAndGroups(String query, { int? maxResults, bool? showAvatar, String? fieldId, List<String>? projectId, List<String>? issueTypeId, String? avatarSize, bool? caseInsensitive, bool? excludeConnectAddons, bool? includeAiAgents, Future<void>? abortTrigger, }) async {
    final response = await findUsersAndGroupsWithHttpInfo(query, maxResults: maxResults, showAvatar: showAvatar, fieldId: fieldId, projectId: projectId, issueTypeId: issueTypeId, avatarSize: avatarSize, caseInsensitive: caseInsensitive, excludeConnectAddons: excludeConnectAddons, includeAiAgents: includeAiAgents, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'FoundUsersAndGroups',) as FoundUsersAndGroups;
    
    }
    return null;
  }
}
