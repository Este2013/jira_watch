//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;

class ApiClient {
  ApiClient({this.basePath = 'https://your-domain.atlassian.net', this.authentication,});

  final String basePath;
  final Authentication? authentication;

  var _client = Client();
  final _defaultHeaderMap = <String, String>{};

  /// Returns the current HTTP [Client] instance to use in this class.
  ///
  /// The return value is guaranteed to never be null.
  Client get client => _client;

  /// Requests to use a new HTTP [Client] in this class.
  set client(Client newClient) {
    _client = newClient;
  }

  Map<String, String> get defaultHeaderMap => _defaultHeaderMap;

  void addDefaultHeader(String key, String value) {
     _defaultHeaderMap[key] = value;
  }

  // We don't use a Map<String, String> for queryParams.
  // If collectionFormat is 'multi', a key might appear multiple times.
  Future<Response> invokeAPI(
    String path,
    String method,
    List<QueryParam> queryParams,
    Object? body,
    Map<String, String> headerParams,
    Map<String, String> formParams,
    String? contentType, {
    Future<void>? abortTrigger,
  }) async {
    await authentication?.applyToParams(queryParams, headerParams);

    headerParams.addAll(_defaultHeaderMap);
    if (contentType != null) {
      headerParams['Content-Type'] = contentType;
    }

    final urlEncodedQueryParams = queryParams.map((param) => '$param');
    final queryString = urlEncodedQueryParams.isNotEmpty ? '?${urlEncodedQueryParams.join('&')}' : '';
    final uri = Uri.parse('$basePath$path$queryString');

    try {
      // Special case for uploading a single file which isn't a 'multipart/form-data'.
      if (
        body is MultipartFile && (contentType == null ||
        !contentType.toLowerCase().startsWith('multipart/form-data'))
      ) {
        final request = AbortableStreamedRequest(method, uri, abortTrigger: abortTrigger);
        request.headers.addAll(headerParams);
        request.contentLength = body.length;
        body.finalize().listen(
          request.sink.add,
          onDone: request.sink.close,
          // ignore: avoid_types_on_closure_parameters
          onError: (Object error, StackTrace trace) => request.sink.close(),
          cancelOnError: true,
        );
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      if (body is MultipartRequest) {
        final request = AbortableMultipartRequest(method, uri, abortTrigger: abortTrigger);
        request.fields.addAll(body.fields);
        request.files.addAll(body.files);
        request.headers.addAll(body.headers);
        request.headers.addAll(headerParams);
        final response = await _client.send(request);
        return Response.fromStream(response);
      }

      final msgBody = contentType == 'application/x-www-form-urlencoded'
        ? formParams
        : await serializeAsync(body);
      final nullableHeaderParams = headerParams.isEmpty ? null : headerParams;

      final request = AbortableRequest(method, uri, abortTrigger: abortTrigger);
      if (nullableHeaderParams != null) {
        request.headers.addAll(nullableHeaderParams);
      }
      if (msgBody is String && msgBody.isNotEmpty) {
        request.body = msgBody;
      } else if (msgBody is List<int> && msgBody.isNotEmpty) {
        request.bodyBytes = msgBody;
      } else if (msgBody is Map<String, String>) {
        request.bodyFields = msgBody;
      }
      final response = await _client.send(request);
      return Response.fromStream(response);
    } on SocketException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Socket operation failed: $method $path',
        error,
        trace,
      );
    } on TlsException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'TLS/SSL communication failed: $method $path',
        error,
        trace,
      );
    } on IOException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'I/O operation failed: $method $path',
        error,
        trace,
      );
    } on ClientException catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'HTTP connection failed: $method $path',
        error,
        trace,
      );
    } on Exception catch (error, trace) {
      throw ApiException.withInner(
        HttpStatus.badRequest,
        'Exception occurred: $method $path',
        error,
        trace,
      );
    }
  }

  Future<dynamic> deserializeAsync(String value, String targetType, {bool growable = false,}) async =>
    // ignore: deprecated_member_use_from_same_package
    deserialize(value, targetType, growable: growable);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use deserializeAsync() instead.')
  dynamic deserialize(String value, String targetType, {bool growable = false,}) {
    // Remove all spaces. Necessary for regular expressions as well.
    targetType = targetType.replaceAll(' ', ''); // ignore: parameter_assignments

    // If the expected target type is String, nothing to do...
    return targetType == 'String'
      ? value
      : fromJson(json.decode(value), targetType, growable: growable);
  }

  // ignore: deprecated_member_use_from_same_package
  Future<String> serializeAsync(Object? value) async => serialize(value);

  @Deprecated('Scheduled for removal in OpenAPI Generator 6.x. Use serializeAsync() instead.')
  String serialize(Object? value) => value == null ? '' : json.encode(value);

  /// Returns a native instance of an OpenAPI class matching the [specified type][targetType].
  static dynamic fromJson(dynamic value, String targetType, {bool growable = false,}) {
    try {
      switch (targetType) {
        case 'String':
          return value is String ? value : value.toString();
        case 'int':
          return value is int ? value : int.parse('$value');
        case 'double':
          return value is double ? value : double.parse('$value');
        case 'bool':
          if (value is bool) {
            return value;
          }
          final valueString = '$value'.toLowerCase();
          return valueString == 'true' || valueString == '1';
        case 'DateTime':
          return value is DateTime ? value : DateTime.tryParse(value);
        case 'Associations':
          return Associations.fromJson(value);
        case 'Author':
          return Author.fromJson(value);
        case 'AvatarUrlsBean':
          return AvatarUrlsBean.fromJson(value);
        case 'Board':
          return Board.fromJson(value);
        case 'BoardAdminsBean':
          return BoardAdminsBean.fromJson(value);
        case 'BoardConfigBean':
          return BoardConfigBean.fromJson(value);
        case 'BoardCreateBean':
          return BoardCreateBean.fromJson(value);
        case 'BoardFilterBean':
          return BoardFilterBean.fromJson(value);
        case 'BoardLocationBean':
          return BoardLocationBean.fromJson(value);
        case 'Branch':
          return Branch.fromJson(value);
        case 'BuildCommitReference':
          return BuildCommitReference.fromJson(value);
        case 'BuildData':
          return BuildData.fromJson(value);
        case 'BuildKey':
          return BuildKey.fromJson(value);
        case 'BuildRefReference':
          return BuildRefReference.fromJson(value);
        case 'BuildReferences':
          return BuildReferences.fromJson(value);
        case 'ChangeDetails':
          return ChangeDetails.fromJson(value);
        case 'Changelog':
          return Changelog.fromJson(value);
        case 'ChangelogAuthor':
          return ChangelogAuthor.fromJson(value);
        case 'ChangelogAuthorAllOfAvatarUrls':
          return ChangelogAuthorAllOfAvatarUrls.fromJson(value);
        case 'ChangelogHistoryMetadata':
          return ChangelogHistoryMetadata.fromJson(value);
        case 'ChangelogHistoryMetadataAllOfActor':
          return ChangelogHistoryMetadataAllOfActor.fromJson(value);
        case 'ChangelogHistoryMetadataAllOfCause':
          return ChangelogHistoryMetadataAllOfCause.fromJson(value);
        case 'ChangelogHistoryMetadataAllOfGenerator':
          return ChangelogHistoryMetadataAllOfGenerator.fromJson(value);
        case 'ChangelogItemsInner':
          return ChangelogItemsInner.fromJson(value);
        case 'ColorBean':
          return ColorBean.fromJson(value);
        case 'ColumnBean':
          return ColumnBean.fromJson(value);
        case 'ColumnConfigBean':
          return ColumnConfigBean.fromJson(value);
        case 'Command':
          return Command.fromJson(value);
        case 'Commit':
          return Commit.fromJson(value);
        case 'Commit1':
          return Commit1.fromJson(value);
        case 'Commit2':
          return Commit2.fromJson(value);
        case 'Component':
          return Component.fromJson(value);
        case 'CreateBoardRequest':
          return CreateBoardRequest.fromJson(value);
        case 'CreateBoardRequestLocation':
          return CreateBoardRequestLocation.fromJson(value);
        case 'CreateSprintRequest':
          return CreateSprintRequest.fromJson(value);
        case 'DeploymentData':
          return DeploymentData.fromJson(value);
        case 'DeploymentDataAssociationsInner':
          return DeploymentDataAssociationsInner.fromJson(value);
        case 'DeploymentKey':
          return DeploymentKey.fromJson(value);
        case 'DevInformation':
          return DevInformation.fromJson(value);
        case 'EntityAssociation':
          return EntityAssociation.fromJson(value);
        case 'EntityAssociationValuesInner':
          return EntityAssociationValuesInner.fromJson(value);
        case 'EntityError':
          return EntityError.fromJson(value);
        case 'EntityIds':
          return EntityIds.fromJson(value);
        case 'Entry':
          return Entry.fromJson(value);
        case 'Environment':
          return Environment.fromJson(value);
        case 'EnvironmentDetails':
          return EnvironmentDetails.fromJson(value);
        case 'EpicRankRequestBean':
          return EpicRankRequestBean.fromJson(value);
        case 'EpicUpdateBean':
          return EpicUpdateBean.fromJson(value);
        case 'ErrorMessage':
          return ErrorMessage.fromJson(value);
        case 'ErrorMessage1':
          return ErrorMessage1.fromJson(value);
        case 'ErrorMessages':
          return ErrorMessages.fromJson(value);
        case 'EstimateIssueForBoardRequest':
          return EstimateIssueForBoardRequest.fromJson(value);
        case 'EstimationConfigBean':
          return EstimationConfigBean.fromJson(value);
        case 'EstimationConfigurationBean':
          return EstimationConfigurationBean.fromJson(value);
        case 'EstimationFieldBean':
          return EstimationFieldBean.fromJson(value);
        case 'ExistsForPropertiesResponse':
          return ExistsForPropertiesResponse.fromJson(value);
        case 'FeatureBean':
          return FeatureBean.fromJson(value);
        case 'FeatureFlagData':
          return FeatureFlagData.fromJson(value);
        case 'FeatureFlagDetails':
          return FeatureFlagDetails.fromJson(value);
        case 'FeatureFlagRollout':
          return FeatureFlagRollout.fromJson(value);
        case 'FeatureFlagStatus':
          return FeatureFlagStatus.fromJson(value);
        case 'FeatureFlagSummary':
          return FeatureFlagSummary.fromJson(value);
        case 'FeatureResponseBean':
          return FeatureResponseBean.fromJson(value);
        case 'FeatureToggleRequestBean':
          return FeatureToggleRequestBean.fromJson(value);
        case 'FieldEditBean':
          return FieldEditBean.fromJson(value);
        case 'FieldMetadata':
          return FieldMetadata.fromJson(value);
        case 'FieldMetadataSchema':
          return FieldMetadataSchema.fromJson(value);
        case 'File':
          return File.fromJson(value);
        case 'GetAllBoards200Response':
          return GetAllBoards200Response.fromJson(value);
        case 'GetAllBoards200ResponseValuesInner':
          return GetAllBoards200ResponseValuesInner.fromJson(value);
        case 'GetAllBoards200ResponseValuesInnerAdmins':
          return GetAllBoards200ResponseValuesInnerAdmins.fromJson(value);
        case 'GetAllBoards200ResponseValuesInnerAdminsAllOfGroupsInner':
          return GetAllBoards200ResponseValuesInnerAdminsAllOfGroupsInner.fromJson(value);
        case 'GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInner':
          return GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInner.fromJson(value);
        case 'GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls':
          return GetAllBoards200ResponseValuesInnerAdminsAllOfUsersInnerAvatarUrls.fromJson(value);
        case 'GetAllBoards200ResponseValuesInnerLocation':
          return GetAllBoards200ResponseValuesInnerLocation.fromJson(value);
        case 'GetAllQuickFilters200Response':
          return GetAllQuickFilters200Response.fromJson(value);
        case 'GetAllQuickFilters200ResponseValuesInner':
          return GetAllQuickFilters200ResponseValuesInner.fromJson(value);
        case 'GetBoardByFilterId200Response':
          return GetBoardByFilterId200Response.fromJson(value);
        case 'GetBoardByFilterId200ResponseValuesInner':
          return GetBoardByFilterId200ResponseValuesInner.fromJson(value);
        case 'GetComponentById200Response':
          return GetComponentById200Response.fromJson(value);
        case 'GetConfiguration200Response':
          return GetConfiguration200Response.fromJson(value);
        case 'GetConfiguration200ResponseColumnConfig':
          return GetConfiguration200ResponseColumnConfig.fromJson(value);
        case 'GetConfiguration200ResponseColumnConfigColumnsInner':
          return GetConfiguration200ResponseColumnConfigColumnsInner.fromJson(value);
        case 'GetConfiguration200ResponseColumnConfigColumnsInnerStatusesInner':
          return GetConfiguration200ResponseColumnConfigColumnsInnerStatusesInner.fromJson(value);
        case 'GetConfiguration200ResponseEstimation':
          return GetConfiguration200ResponseEstimation.fromJson(value);
        case 'GetConfiguration200ResponseEstimationField':
          return GetConfiguration200ResponseEstimationField.fromJson(value);
        case 'GetConfiguration200ResponseRanking':
          return GetConfiguration200ResponseRanking.fromJson(value);
        case 'GetConfiguration200ResponseSubQuery':
          return GetConfiguration200ResponseSubQuery.fromJson(value);
        case 'GetFeaturesForBoard200Response':
          return GetFeaturesForBoard200Response.fromJson(value);
        case 'GetFeaturesForBoard200ResponseFeaturesInner':
          return GetFeaturesForBoard200ResponseFeaturesInner.fromJson(value);
        case 'GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner':
          return GetFeaturesForBoard200ResponseFeaturesInnerPermissibleEstimationTypesInner.fromJson(value);
        case 'GetIncidentById200Response':
          return GetIncidentById200Response.fromJson(value);
        case 'GetReportsForBoard200Response':
          return GetReportsForBoard200Response.fromJson(value);
        case 'GetReviewById200Response':
          return GetReviewById200Response.fromJson(value);
        case 'GroupBean':
          return GroupBean.fromJson(value);
        case 'HistoryMetadata':
          return HistoryMetadata.fromJson(value);
        case 'HistoryMetadataParticipant':
          return HistoryMetadataParticipant.fromJson(value);
        case 'Identifier':
          return Identifier.fromJson(value);
        case 'Incident':
          return Incident.fromJson(value);
        case 'IncidentSeverity':
          return IncidentSeverity.fromJson(value);
        case 'IncludedFields':
          return IncludedFields.fromJson(value);
        case 'IssueAssignRequestBean':
          return IssueAssignRequestBean.fromJson(value);
        case 'IssueBean':
          return IssueBean.fromJson(value);
        case 'IssueBeanChangelog':
          return IssueBeanChangelog.fromJson(value);
        case 'IssueBeanChangelogAllOfHistoriesInner':
          return IssueBeanChangelogAllOfHistoriesInner.fromJson(value);
        case 'IssueBeanEditmeta':
          return IssueBeanEditmeta.fromJson(value);
        case 'IssueBeanEditmetaAllOfFieldsValue':
          return IssueBeanEditmetaAllOfFieldsValue.fromJson(value);
        case 'IssueBeanFieldsToInclude':
          return IssueBeanFieldsToInclude.fromJson(value);
        case 'IssueBeanSchemaValue':
          return IssueBeanSchemaValue.fromJson(value);
        case 'IssueBeanTransitionsInner':
          return IssueBeanTransitionsInner.fromJson(value);
        case 'IssueBeanTransitionsInnerTo':
          return IssueBeanTransitionsInnerTo.fromJson(value);
        case 'IssueBeanTransitionsInnerToAllOfScope':
          return IssueBeanTransitionsInnerToAllOfScope.fromJson(value);
        case 'IssueBeanTransitionsInnerToAllOfScopeAllOfProject':
          return IssueBeanTransitionsInnerToAllOfScopeAllOfProject.fromJson(value);
        case 'IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfAvatarUrls':
          return IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfAvatarUrls.fromJson(value);
        case 'IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfProjectCategory':
          return IssueBeanTransitionsInnerToAllOfScopeAllOfProjectAllOfProjectCategory.fromJson(value);
        case 'IssueBeanTransitionsInnerToAllOfStatusCategory':
          return IssueBeanTransitionsInnerToAllOfStatusCategory.fromJson(value);
        case 'IssueCountBean':
          return IssueCountBean.fromJson(value);
        case 'IssueIdOrKeysAssociation':
          return IssueIdOrKeysAssociation.fromJson(value);
        case 'IssueIdOrKeysAssociation1':
          return IssueIdOrKeysAssociation1.fromJson(value);
        case 'IssueRankRequestBean':
          return IssueRankRequestBean.fromJson(value);
        case 'IssueTransition':
          return IssueTransition.fromJson(value);
        case 'IssueUpdateMetadata':
          return IssueUpdateMetadata.fromJson(value);
        case 'JsonTypeBean':
          return JsonTypeBean.fromJson(value);
        case 'LinkGroup':
          return LinkGroup.fromJson(value);
        case 'LinkGroupHeader':
          return LinkGroupHeader.fromJson(value);
        case 'LocationBean':
          return LocationBean.fromJson(value);
        case 'MoveIssuesToBacklogForBoardRequest':
          return MoveIssuesToBacklogForBoardRequest.fromJson(value);
        case 'MoveIssuesToBacklogRequest':
          return MoveIssuesToBacklogRequest.fromJson(value);
        case 'MoveIssuesToBoard207Response':
          return MoveIssuesToBoard207Response.fromJson(value);
        case 'MoveIssuesToBoard207ResponseEntriesInner':
          return MoveIssuesToBoard207ResponseEntriesInner.fromJson(value);
        case 'Operations':
          return Operations.fromJson(value);
        case 'OperationsWorkspaceIds':
          return OperationsWorkspaceIds.fromJson(value);
        case 'PageBeanBoard':
          return PageBeanBoard.fromJson(value);
        case 'PageBeanBoardFilterBean':
          return PageBeanBoardFilterBean.fromJson(value);
        case 'PageBeanQuickFilterBean':
          return PageBeanQuickFilterBean.fromJson(value);
        case 'PageOfChangelogs':
          return PageOfChangelogs.fromJson(value);
        case 'PartialSuccessBean':
          return PartialSuccessBean.fromJson(value);
        case 'PartiallyUpdateEpicRequest':
          return PartiallyUpdateEpicRequest.fromJson(value);
        case 'PartiallyUpdateEpicRequestColor':
          return PartiallyUpdateEpicRequestColor.fromJson(value);
        case 'Pipeline':
          return Pipeline.fromJson(value);
        case 'ProjectDetails':
          return ProjectDetails.fromJson(value);
        case 'ProviderMetadata':
          return ProviderMetadata.fromJson(value);
        case 'ProviderMetadata1':
          return ProviderMetadata1.fromJson(value);
        case 'PullRequest':
          return PullRequest.fromJson(value);
        case 'QuickFilterBean':
          return QuickFilterBean.fromJson(value);
        case 'RankEpicsRequest':
          return RankEpicsRequest.fromJson(value);
        case 'RankingConfigBean':
          return RankingConfigBean.fromJson(value);
        case 'RejectedBuild':
          return RejectedBuild.fromJson(value);
        case 'RejectedDeployment':
          return RejectedDeployment.fromJson(value);
        case 'RelationBean':
          return RelationBean.fromJson(value);
        case 'RemoteLinkData':
          return RemoteLinkData.fromJson(value);
        case 'RemoteLinkDataAssociationsInner':
          return RemoteLinkDataAssociationsInner.fromJson(value);
        case 'RemoteLinkStatus':
          return RemoteLinkStatus.fromJson(value);
        case 'ReportsResponseBean':
          return ReportsResponseBean.fromJson(value);
        case 'Repository':
          return Repository.fromJson(value);
        case 'Repository1':
          return Repository1.fromJson(value);
        case 'RepositoryErrors':
          return RepositoryErrors.fromJson(value);
        case 'Review':
          return Review.fromJson(value);
        case 'Reviewer':
          return Reviewer.fromJson(value);
        case 'Scope':
          return Scope.fromJson(value);
        case 'SearchResults':
          return SearchResults.fromJson(value);
        case 'SecurityWorkspaceIds':
          return SecurityWorkspaceIds.fromJson(value);
        case 'SecurityWorkspaceResponse':
          return SecurityWorkspaceResponse.fromJson(value);
        case 'ServiceIdOrKeysAssociation':
          return ServiceIdOrKeysAssociation.fromJson(value);
        case 'SimpleLink':
          return SimpleLink.fromJson(value);
        case 'SoftwareIssueResults':
          return SoftwareIssueResults.fromJson(value);
        case 'SprintBean':
          return SprintBean.fromJson(value);
        case 'SprintCreateBean':
          return SprintCreateBean.fromJson(value);
        case 'SprintSwapBean':
          return SprintSwapBean.fromJson(value);
        case 'StatusCategory':
          return StatusCategory.fromJson(value);
        case 'StatusDetails':
          return StatusDetails.fromJson(value);
        case 'StoreDevinfoResult':
          return StoreDevinfoResult.fromJson(value);
        case 'SubmitBuildsRequest':
          return SubmitBuildsRequest.fromJson(value);
        case 'SubmitBuildsResponse':
          return SubmitBuildsResponse.fromJson(value);
        case 'SubmitDeploymentRequest':
          return SubmitDeploymentRequest.fromJson(value);
        case 'SubmitDeploymentsResponse':
          return SubmitDeploymentsResponse.fromJson(value);
        case 'SubmitDeploymentsResponse1':
          return SubmitDeploymentsResponse1.fromJson(value);
        case 'SubmitDeploymentsResponse1DetailsInner':
          return SubmitDeploymentsResponse1DetailsInner.fromJson(value);
        case 'SubmitDevopsComponentsRequest':
          return SubmitDevopsComponentsRequest.fromJson(value);
        case 'SubmitDevopsComponentsResponse':
          return SubmitDevopsComponentsResponse.fromJson(value);
        case 'SubmitFeatureFlagRequest':
          return SubmitFeatureFlagRequest.fromJson(value);
        case 'SubmitFeatureFlagsResponse':
          return SubmitFeatureFlagsResponse.fromJson(value);
        case 'SubmitIncidentsRequest':
          return SubmitIncidentsRequest.fromJson(value);
        case 'SubmitIncidentsRequestAnyOf':
          return SubmitIncidentsRequestAnyOf.fromJson(value);
        case 'SubmitIncidentsRequestAnyOf1':
          return SubmitIncidentsRequestAnyOf1.fromJson(value);
        case 'SubmitIncidentsResponse':
          return SubmitIncidentsResponse.fromJson(value);
        case 'SubmitOperationsWorkspacesRequest':
          return SubmitOperationsWorkspacesRequest.fromJson(value);
        case 'SubmitOperationsWorkspacesResponse':
          return SubmitOperationsWorkspacesResponse.fromJson(value);
        case 'SubmitRemoteLinks202Response':
          return SubmitRemoteLinks202Response.fromJson(value);
        case 'SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner':
          return SubmitRemoteLinks202ResponseRejectedRemoteLinksValueInner.fromJson(value);
        case 'SubmitRemoteLinksRequest':
          return SubmitRemoteLinksRequest.fromJson(value);
        case 'SubmitSecurityWorkspacesRequest':
          return SubmitSecurityWorkspacesRequest.fromJson(value);
        case 'SubmitVulnerabilitiesRequest':
          return SubmitVulnerabilitiesRequest.fromJson(value);
        case 'SubmitVulnerabilitiesResponse':
          return SubmitVulnerabilitiesResponse.fromJson(value);
        case 'SubqueryBean':
          return SubqueryBean.fromJson(value);
        case 'SwapSprintRequest':
          return SwapSprintRequest.fromJson(value);
        case 'TestInfo':
          return TestInfo.fromJson(value);
        case 'ToggleFeaturesRequest':
          return ToggleFeaturesRequest.fromJson(value);
        case 'UpdateSprintRequest':
          return UpdateSprintRequest.fromJson(value);
        case 'UpdatedProjectCategory':
          return UpdatedProjectCategory.fromJson(value);
        case 'UserBean':
          return UserBean.fromJson(value);
        case 'UserBeanAvatarUrls':
          return UserBeanAvatarUrls.fromJson(value);
        case 'UserDetails':
          return UserDetails.fromJson(value);
        case 'VulnerabilityAdditionalInfo':
          return VulnerabilityAdditionalInfo.fromJson(value);
        case 'VulnerabilityDetails':
          return VulnerabilityDetails.fromJson(value);
        case 'VulnerabilityDetailsAddAssociationsInner':
          return VulnerabilityDetailsAddAssociationsInner.fromJson(value);
        case 'VulnerabilitySeverity':
          return VulnerabilitySeverity.fromJson(value);
        default:
          dynamic match;
          if (value is List && (match = _regList.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toList(growable: growable);
          }
          if (value is Set && (match = _regSet.firstMatch(targetType)?.group(1)) != null) {
            return value
              .map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,))
              .toSet();
          }
          if (value is Map && (match = _regMap.firstMatch(targetType)?.group(1)) != null) {
            return Map<String, dynamic>.fromIterables(
              value.keys.cast<String>(),
              value.values.map<dynamic>((dynamic v) => fromJson(v, match, growable: growable,)),
            );
          }
      }
    } on Exception catch (error, trace) {
      throw ApiException.withInner(HttpStatus.internalServerError, 'Exception during deserialization.', error, trace,);
    }
    throw ApiException(HttpStatus.internalServerError, 'Could not find a suitable class for deserialization',);
  }
}

/// Primarily intended for use in an isolate.
class DeserializationMessage {
  const DeserializationMessage({
    required this.json,
    required this.targetType,
    this.growable = false,
  });

  /// The JSON value to deserialize.
  final String json;

  /// Target type to deserialize to.
  final String targetType;

  /// Whether to make deserialized lists or maps growable.
  final bool growable;
}

/// Primarily intended for use in an isolate.
Future<dynamic> decodeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : json.decode(message.json);
}

/// Primarily intended for use in an isolate.
Future<dynamic> deserializeAsync(DeserializationMessage message) async {
  // Remove all spaces. Necessary for regular expressions as well.
  final targetType = message.targetType.replaceAll(' ', '');

  // If the expected target type is String, nothing to do...
  return targetType == 'String'
    ? message.json
    : ApiClient.fromJson(
        json.decode(message.json),
        targetType,
        growable: message.growable,
      );
}

/// Primarily intended for use in an isolate.
Future<String> serializeAsync(Object? value) async => value == null ? '' : json.encode(value);
