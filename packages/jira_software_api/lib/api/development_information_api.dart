//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class DevelopmentInformationApi {
  DevelopmentInformationApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete development information by properties
  ///
  /// Deletes development information entities which have all the provided properties. Repositories which have properties that match ALL of the properties (i.e. treated as an AND), and all their related development information (such as commits, branches and pull requests), will be deleted. For example if request is `DELETE bulk?accountId=123&projectId=ABC` entities which have properties `accountId=123` and `projectId=ABC` will be deleted. Optional param `_updateSequenceId` is no longer supported. Deletion is performed asynchronously: specified entities will eventually be removed from Jira. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property to use to control deletion. Only stored data with an updateSequenceId less than or equal to that provided will be deleted. This can be used to help ensure submit/delete requests are applied correctly if they are issued close together. 
  Future<Response> deleteByPropertiesWithHttpInfo(String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devinfo/0.10/bulkByProperties';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceId != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceId', updateSequenceId));
    }

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete development information by properties
  ///
  /// Deletes development information entities which have all the provided properties. Repositories which have properties that match ALL of the properties (i.e. treated as an AND), and all their related development information (such as commits, branches and pull requests), will be deleted. For example if request is `DELETE bulk?accountId=123&projectId=ABC` entities which have properties `accountId=123` and `projectId=ABC` will be deleted. Optional param `_updateSequenceId` is no longer supported. Deletion is performed asynchronously: specified entities will eventually be removed from Jira. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property to use to control deletion. Only stored data with an updateSequenceId less than or equal to that provided will be deleted. This can be used to help ensure submit/delete requests are applied correctly if they are issued close together. 
  Future<void> deleteByProperties(String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    final response = await deleteByPropertiesWithHttpInfo(authorization, updateSequenceId: updateSequenceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete development information entity
  ///
  /// Deletes particular development information entity. Deletion is performed asynchronously.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] repositoryId (required):
  ///
  /// * [String] entityType (required):
  ///
  /// * [String] entityId (required):
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property to use to control deletion. Only stored data with an updateSequenceId less than or equal to that provided will be deleted. This can be used to help ensure submit/delete requests are applied correctly if they are issued close together. 
  Future<Response> deleteEntityWithHttpInfo(String repositoryId, String entityType, String entityId, String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devinfo/0.10/repository/{repositoryId}/{entityType}/{entityId}'
      .replaceAll('{repositoryId}', repositoryId)
      .replaceAll('{entityType}', entityType)
      .replaceAll('{entityId}', entityId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceId != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceId', updateSequenceId));
    }

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete development information entity
  ///
  /// Deletes particular development information entity. Deletion is performed asynchronously.
  ///
  /// Parameters:
  ///
  /// * [String] repositoryId (required):
  ///
  /// * [String] entityType (required):
  ///
  /// * [String] entityId (required):
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property to use to control deletion. Only stored data with an updateSequenceId less than or equal to that provided will be deleted. This can be used to help ensure submit/delete requests are applied correctly if they are issued close together. 
  Future<void> deleteEntity(String repositoryId, String entityType, String entityId, String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    final response = await deleteEntityWithHttpInfo(repositoryId, entityType, entityId, authorization, updateSequenceId: updateSequenceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete repository
  ///
  /// Deletes the repository data stored by the given ID and all related development information entities. Deletion is performed asynchronously.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] repositoryId (required):
  ///   The ID of repository to delete
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property to use to control deletion. Only stored data with an updateSequenceId less than or equal to that provided will be deleted. This can be used to help ensure submit/delete requests are applied correctly if they are issued close together. 
  Future<Response> deleteRepositoryWithHttpInfo(String repositoryId, String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devinfo/0.10/repository/{repositoryId}'
      .replaceAll('{repositoryId}', repositoryId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceId != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceId', updateSequenceId));
    }

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Delete repository
  ///
  /// Deletes the repository data stored by the given ID and all related development information entities. Deletion is performed asynchronously.
  ///
  /// Parameters:
  ///
  /// * [String] repositoryId (required):
  ///   The ID of repository to delete
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property to use to control deletion. Only stored data with an updateSequenceId less than or equal to that provided will be deleted. This can be used to help ensure submit/delete requests are applied correctly if they are issued close together. 
  Future<void> deleteRepository(String repositoryId, String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    final response = await deleteRepositoryWithHttpInfo(repositoryId, authorization, updateSequenceId: updateSequenceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Check if data exists for the supplied properties
  ///
  /// Checks if repositories which have all the provided properties exists. For example, if request is `GET existsByProperties?accountId=123&projectId=ABC` then result will be positive only if there is at least one repository with both properties `accountId=123` and `projectId=ABC`. Special property `_updateSequenceId` can be used to filter all entities with updateSequenceId less or equal than the value specified. In addition to the optional `_updateSequenceId`, one or more query params must be supplied to specify properties to search by. 
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property. Filters out entities and repositories which have updateSequenceId greater than specified. 
  Future<Response> existsByPropertiesWithHttpInfo(String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devinfo/0.10/existsByProperties';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (updateSequenceId != null) {
      queryParams.addAll(_queryParams('', '_updateSequenceId', updateSequenceId));
    }

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Check if data exists for the supplied properties
  ///
  /// Checks if repositories which have all the provided properties exists. For example, if request is `GET existsByProperties?accountId=123&projectId=ABC` then result will be positive only if there is at least one repository with both properties `accountId=123` and `projectId=ABC`. Special property `_updateSequenceId` can be used to filter all entities with updateSequenceId less or equal than the value specified. In addition to the optional `_updateSequenceId`, one or more query params must be supplied to specify properties to search by. 
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [int] updateSequenceId:
  ///   An optional property. Filters out entities and repositories which have updateSequenceId greater than specified. 
  Future<ExistsForPropertiesResponse?> existsByProperties(String authorization, { int? updateSequenceId, Future<void>? abortTrigger, }) async {
    final response = await existsByPropertiesWithHttpInfo(authorization, updateSequenceId: updateSequenceId, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'ExistsForPropertiesResponse',) as ExistsForPropertiesResponse;
    
    }
    return null;
  }

  /// Get repository
  ///
  /// For the specified repository ID, retrieves the repository and the most recent 400 development information entities. The result will be what is currently stored, ignoring any pending updates or deletes.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] repositoryId (required):
  ///   The ID of repository to fetch
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  Future<Response> getRepositoryWithHttpInfo(String repositoryId, String authorization, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devinfo/0.10/repository/{repositoryId}'
      .replaceAll('{repositoryId}', repositoryId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Get repository
  ///
  /// For the specified repository ID, retrieves the repository and the most recent 400 development information entities. The result will be what is currently stored, ignoring any pending updates or deletes.
  ///
  /// Parameters:
  ///
  /// * [String] repositoryId (required):
  ///   The ID of repository to fetch
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  Future<Repository?> getRepository(String repositoryId, String authorization, { Future<void>? abortTrigger, }) async {
    final response = await getRepositoryWithHttpInfo(repositoryId, authorization, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Repository',) as Repository;
    
    }
    return null;
  }

  /// Store development information
  ///
  /// Stores development information provided in the request to make it available when viewing issues in Jira. Existing repository and entity data for the same ID will be replaced if the updateSequenceId of existing data is less than the incoming data. Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [DevInformation] devInformation (required):
  ///   Request object, which contains development information
  Future<Response> storeDevelopmentInformationWithHttpInfo(String authorization, DevInformation devInformation, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/devinfo/0.10/bulk';

    // ignore: prefer_final_locals
    Object? postBody = devInformation;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    headerParams[r'Authorization'] = parameterToString(authorization);

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

  /// Store development information
  ///
  /// Stores development information provided in the request to make it available when viewing issues in Jira. Existing repository and entity data for the same ID will be replaced if the updateSequenceId of existing data is less than the incoming data. Submissions are performed asynchronously. Submitted data will eventually be available in Jira; most updates are available within a short period of time, but may take some time during peak load and/or maintenance times.
  ///
  /// Parameters:
  ///
  /// * [String] authorization (required):
  ///   All requests must be signed with either a Connect JWT token or OAuth token for an on-premise integration that corresponds to an app installed in Jira. If the JWT token corresponds to a Connect app that does not define the jiraDevelopmentTool module it will be rejected with a 403. See https://developer.atlassian.com/blog/2015/01/understanding-jwt/ for more details about Connect JWT tokens. See https://developer.atlassian.com/cloud/jira/software/integrate-jsw-cloud-with-onpremises-tools/ for details about on-premise integrations.
  ///
  /// * [DevInformation] devInformation (required):
  ///   Request object, which contains development information
  Future<StoreDevinfoResult?> storeDevelopmentInformation(String authorization, DevInformation devInformation, { Future<void>? abortTrigger, }) async {
    final response = await storeDevelopmentInformationWithHttpInfo(authorization, devInformation, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'StoreDevinfoResult',) as StoreDevinfoResult;
    
    }
    return null;
  }
}
