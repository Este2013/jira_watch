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
        case 'ActorInputBean':
          return ActorInputBean.fromJson(value);
        case 'ActorsMap':
          return ActorsMap.fromJson(value);
        case 'AddAtlassianTeamRequest':
          return AddAtlassianTeamRequest.fromJson(value);
        case 'AddFieldBean':
          return AddFieldBean.fromJson(value);
        case 'AddGroupBean':
          return AddGroupBean.fromJson(value);
        case 'AddNotificationsDetails':
          return AddNotificationsDetails.fromJson(value);
        case 'AddSecuritySchemeLevelsRequestBean':
          return AddSecuritySchemeLevelsRequestBean.fromJson(value);
        case 'AnnouncementBannerConfiguration':
          return AnnouncementBannerConfiguration.fromJson(value);
        case 'AnnouncementBannerConfigurationUpdate':
          return AnnouncementBannerConfigurationUpdate.fromJson(value);
        case 'AppWorkflowTransitionRule':
          return AppWorkflowTransitionRule.fromJson(value);
        case 'Application':
          return Application.fromJson(value);
        case 'ApplicationProperty':
          return ApplicationProperty.fromJson(value);
        case 'ApplicationRole':
          return ApplicationRole.fromJson(value);
        case 'ApprovalConfiguration':
          return ApprovalConfiguration.fromJson(value);
        case 'ApprovalConfigurationPreview':
          return ApprovalConfigurationPreview.fromJson(value);
        case 'ArchiveIssueAsyncRequest':
          return ArchiveIssueAsyncRequest.fromJson(value);
        case 'ArchivedIssuesFilterRequest':
          return ArchivedIssuesFilterRequest.fromJson(value);
        case 'AssociateFieldConfigurationsWithIssueTypesRequest':
          return AssociateFieldConfigurationsWithIssueTypesRequest.fromJson(value);
        case 'AssociateSecuritySchemeWithProjectDetails':
          return AssociateSecuritySchemeWithProjectDetails.fromJson(value);
        case 'AssociatedItemBean':
          return AssociatedItemBean.fromJson(value);
        case 'AssociationContextObject':
          return AssociationContextObject.fromJson(value);
        case 'Attachment':
          return Attachment.fromJson(value);
        case 'AttachmentArchive':
          return AttachmentArchive.fromJson(value);
        case 'AttachmentArchiveEntry':
          return AttachmentArchiveEntry.fromJson(value);
        case 'AttachmentArchiveImpl':
          return AttachmentArchiveImpl.fromJson(value);
        case 'AttachmentArchiveItemReadable':
          return AttachmentArchiveItemReadable.fromJson(value);
        case 'AttachmentArchiveMetadataReadable':
          return AttachmentArchiveMetadataReadable.fromJson(value);
        case 'AttachmentMetadata':
          return AttachmentMetadata.fromJson(value);
        case 'AttachmentSettings':
          return AttachmentSettings.fromJson(value);
        case 'AuditRecordBean':
          return AuditRecordBean.fromJson(value);
        case 'AuditRecords':
          return AuditRecords.fromJson(value);
        case 'AutoCompleteSuggestion':
          return AutoCompleteSuggestion.fromJson(value);
        case 'AutoCompleteSuggestions':
          return AutoCompleteSuggestions.fromJson(value);
        case 'AvailableDashboardGadget':
          return AvailableDashboardGadget.fromJson(value);
        case 'AvailableDashboardGadgetsResponse':
          return AvailableDashboardGadgetsResponse.fromJson(value);
        case 'AvailableWorkflowConnectRule':
          return AvailableWorkflowConnectRule.fromJson(value);
        case 'AvailableWorkflowForgeRule':
          return AvailableWorkflowForgeRule.fromJson(value);
        case 'AvailableWorkflowSystemRule':
          return AvailableWorkflowSystemRule.fromJson(value);
        case 'AvailableWorkflowTriggerTypes':
          return AvailableWorkflowTriggerTypes.fromJson(value);
        case 'AvailableWorkflowTriggers':
          return AvailableWorkflowTriggers.fromJson(value);
        case 'Avatar':
          return Avatar.fromJson(value);
        case 'AvatarUrlsBean':
          return AvatarUrlsBean.fromJson(value);
        case 'Avatars':
          return Avatars.fromJson(value);
        case 'BoardColumnPayload':
          return BoardColumnPayload.fromJson(value);
        case 'BoardFeaturePayload':
          return BoardFeaturePayload.fromJson(value);
        case 'BoardFeaturesPayload':
          return BoardFeaturesPayload.fromJson(value);
        case 'BoardPayload':
          return BoardPayload.fromJson(value);
        case 'BoardsPayload':
          return BoardsPayload.fromJson(value);
        case 'BulkChangeOwnerDetails':
          return BulkChangeOwnerDetails.fromJson(value);
        case 'BulkChangelogRequestBean':
          return BulkChangelogRequestBean.fromJson(value);
        case 'BulkChangelogResponseBean':
          return BulkChangelogResponseBean.fromJson(value);
        case 'BulkContextualConfiguration':
          return BulkContextualConfiguration.fromJson(value);
        case 'BulkCustomFieldOptionCreateRequest':
          return BulkCustomFieldOptionCreateRequest.fromJson(value);
        case 'BulkCustomFieldOptionUpdateRequest':
          return BulkCustomFieldOptionUpdateRequest.fromJson(value);
        case 'BulkEditActionError':
          return BulkEditActionError.fromJson(value);
        case 'BulkEditGetFields':
          return BulkEditGetFields.fromJson(value);
        case 'BulkEditShareableEntityRequest':
          return BulkEditShareableEntityRequest.fromJson(value);
        case 'BulkEditShareableEntityResponse':
          return BulkEditShareableEntityResponse.fromJson(value);
        case 'BulkFetchIssueRequestBean':
          return BulkFetchIssueRequestBean.fromJson(value);
        case 'BulkIssueIsWatching':
          return BulkIssueIsWatching.fromJson(value);
        case 'BulkIssuePropertyUpdateRequest':
          return BulkIssuePropertyUpdateRequest.fromJson(value);
        case 'BulkIssueResults':
          return BulkIssueResults.fromJson(value);
        case 'BulkOperationErrorResponse':
          return BulkOperationErrorResponse.fromJson(value);
        case 'BulkOperationErrorResult':
          return BulkOperationErrorResult.fromJson(value);
        case 'BulkOperationProgress':
          return BulkOperationProgress.fromJson(value);
        case 'BulkPermissionGrants':
          return BulkPermissionGrants.fromJson(value);
        case 'BulkPermissionsRequestBean':
          return BulkPermissionsRequestBean.fromJson(value);
        case 'BulkProjectPermissionGrants':
          return BulkProjectPermissionGrants.fromJson(value);
        case 'BulkProjectPermissions':
          return BulkProjectPermissions.fromJson(value);
        case 'BulkRedactionRequest':
          return BulkRedactionRequest.fromJson(value);
        case 'BulkRedactionResponse':
          return BulkRedactionResponse.fromJson(value);
        case 'BulkTransitionGetAvailableTransitions':
          return BulkTransitionGetAvailableTransitions.fromJson(value);
        case 'BulkTransitionSubmitInput':
          return BulkTransitionSubmitInput.fromJson(value);
        case 'BulkWorklogKeyRequestBean':
          return BulkWorklogKeyRequestBean.fromJson(value);
        case 'BulkWorklogKeyResponseBean':
          return BulkWorklogKeyResponseBean.fromJson(value);
        case 'CardLayout':
          return CardLayout.fromJson(value);
        case 'CardLayoutField':
          return CardLayoutField.fromJson(value);
        case 'ChangeDetails':
          return ChangeDetails.fromJson(value);
        case 'ChangeFilterOwner':
          return ChangeFilterOwner.fromJson(value);
        case 'ChangedValueBean':
          return ChangedValueBean.fromJson(value);
        case 'ChangedWorklog':
          return ChangedWorklog.fromJson(value);
        case 'ChangedWorklogs':
          return ChangedWorklogs.fromJson(value);
        case 'Changelog':
          return Changelog.fromJson(value);
        case 'ColumnItem':
          return ColumnItem.fromJson(value);
        case 'ColumnRequestBody':
          return ColumnRequestBody.fromJson(value);
        case 'Comment':
          return Comment.fromJson(value);
        case 'ComponentIssuesCount':
          return ComponentIssuesCount.fromJson(value);
        case 'ComponentJsonBean':
          return ComponentJsonBean.fromJson(value);
        case 'ComponentWithIssueCount':
          return ComponentWithIssueCount.fromJson(value);
        case 'CompoundClause':
          return CompoundClause.fromJson(value);
        case 'ConditionGroupConfiguration':
          return ConditionGroupConfiguration.fromJson(value);
        case 'ConditionGroupPayload':
          return ConditionGroupPayload.fromJson(value);
        case 'ConditionGroupUpdate':
          return ConditionGroupUpdate.fromJson(value);
        case 'Configuration':
          return Configuration.fromJson(value);
        case 'ConfigurationsListParameters':
          return ConfigurationsListParameters.fromJson(value);
        case 'ConnectCustomFieldValue':
          return ConnectCustomFieldValue.fromJson(value);
        case 'ConnectCustomFieldValues':
          return ConnectCustomFieldValues.fromJson(value);
        case 'ConnectModules':
          return ConnectModules.fromJson(value);
        case 'ConnectWorkflowTransitionRule':
          return ConnectWorkflowTransitionRule.fromJson(value);
        case 'ContainerForProjectFeatures':
          return ContainerForProjectFeatures.fromJson(value);
        case 'ContainerForRegisteredWebhooks':
          return ContainerForRegisteredWebhooks.fromJson(value);
        case 'ContainerForWebhookIDs':
          return ContainerForWebhookIDs.fromJson(value);
        case 'ContainerOfWorkflowSchemeAssociations':
          return ContainerOfWorkflowSchemeAssociations.fromJson(value);
        case 'ContentItem':
          return ContentItem.fromJson(value);
        case 'Context':
          return Context.fromJson(value);
        case 'ContextDefaultValues':
          return ContextDefaultValues.fromJson(value);
        case 'ContextForProjectAndIssueType':
          return ContextForProjectAndIssueType.fromJson(value);
        case 'ContextualConfiguration':
          return ContextualConfiguration.fromJson(value);
        case 'ConvertedJQLQueries':
          return ConvertedJQLQueries.fromJson(value);
        case 'CreateCrossProjectReleaseRequest':
          return CreateCrossProjectReleaseRequest.fromJson(value);
        case 'CreateCustomFieldContext':
          return CreateCustomFieldContext.fromJson(value);
        case 'CreateCustomFieldRequest':
          return CreateCustomFieldRequest.fromJson(value);
        case 'CreateDateFieldRequest':
          return CreateDateFieldRequest.fromJson(value);
        case 'CreateExclusionRulesRequest':
          return CreateExclusionRulesRequest.fromJson(value);
        case 'CreateFieldAssociationSchemeLinksBean':
          return CreateFieldAssociationSchemeLinksBean.fromJson(value);
        case 'CreateFieldAssociationSchemeRequest':
          return CreateFieldAssociationSchemeRequest.fromJson(value);
        case 'CreateFieldAssociationSchemeResponse':
          return CreateFieldAssociationSchemeResponse.fromJson(value);
        case 'CreateIssueSecuritySchemeDetails':
          return CreateIssueSecuritySchemeDetails.fromJson(value);
        case 'CreateIssueSourceRequest':
          return CreateIssueSourceRequest.fromJson(value);
        case 'CreateNotificationSchemeDetails':
          return CreateNotificationSchemeDetails.fromJson(value);
        case 'CreatePermissionHolderRequest':
          return CreatePermissionHolderRequest.fromJson(value);
        case 'CreatePermissionRequest':
          return CreatePermissionRequest.fromJson(value);
        case 'CreatePlanOnlyTeamRequest':
          return CreatePlanOnlyTeamRequest.fromJson(value);
        case 'CreatePlanRequest':
          return CreatePlanRequest.fromJson(value);
        case 'CreatePriorityDetails':
          return CreatePriorityDetails.fromJson(value);
        case 'CreatePrioritySchemeDetails':
          return CreatePrioritySchemeDetails.fromJson(value);
        case 'CreateProjectDetails':
          return CreateProjectDetails.fromJson(value);
        case 'CreateResolutionDetails':
          return CreateResolutionDetails.fromJson(value);
        case 'CreateSchedulingRequest':
          return CreateSchedulingRequest.fromJson(value);
        case 'CreateUiModificationDetails':
          return CreateUiModificationDetails.fromJson(value);
        case 'CreateUpdateRoleRequestBean':
          return CreateUpdateRoleRequestBean.fromJson(value);
        case 'CreatedIssue':
          return CreatedIssue.fromJson(value);
        case 'CreatedIssues':
          return CreatedIssues.fromJson(value);
        case 'CustomContextVariable':
          return CustomContextVariable.fromJson(value);
        case 'CustomFieldConfigurations':
          return CustomFieldConfigurations.fromJson(value);
        case 'CustomFieldContext':
          return CustomFieldContext.fromJson(value);
        case 'CustomFieldContextDefaultValue':
          return CustomFieldContextDefaultValue.fromJson(value);
        case 'CustomFieldContextDefaultValueCascadingOption':
          return CustomFieldContextDefaultValueCascadingOption.fromJson(value);
        case 'CustomFieldContextDefaultValueDate':
          return CustomFieldContextDefaultValueDate.fromJson(value);
        case 'CustomFieldContextDefaultValueDateTime':
          return CustomFieldContextDefaultValueDateTime.fromJson(value);
        case 'CustomFieldContextDefaultValueFloat':
          return CustomFieldContextDefaultValueFloat.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeDateTimeField':
          return CustomFieldContextDefaultValueForgeDateTimeField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeGroupField':
          return CustomFieldContextDefaultValueForgeGroupField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeMultiGroupField':
          return CustomFieldContextDefaultValueForgeMultiGroupField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeMultiStringField':
          return CustomFieldContextDefaultValueForgeMultiStringField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeMultiUserField':
          return CustomFieldContextDefaultValueForgeMultiUserField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeNumberField':
          return CustomFieldContextDefaultValueForgeNumberField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeObjectField':
          return CustomFieldContextDefaultValueForgeObjectField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeStringField':
          return CustomFieldContextDefaultValueForgeStringField.fromJson(value);
        case 'CustomFieldContextDefaultValueForgeUserField':
          return CustomFieldContextDefaultValueForgeUserField.fromJson(value);
        case 'CustomFieldContextDefaultValueLabels':
          return CustomFieldContextDefaultValueLabels.fromJson(value);
        case 'CustomFieldContextDefaultValueMultiUserPicker':
          return CustomFieldContextDefaultValueMultiUserPicker.fromJson(value);
        case 'CustomFieldContextDefaultValueMultipleGroupPicker':
          return CustomFieldContextDefaultValueMultipleGroupPicker.fromJson(value);
        case 'CustomFieldContextDefaultValueMultipleOption':
          return CustomFieldContextDefaultValueMultipleOption.fromJson(value);
        case 'CustomFieldContextDefaultValueMultipleVersionPicker':
          return CustomFieldContextDefaultValueMultipleVersionPicker.fromJson(value);
        case 'CustomFieldContextDefaultValueProject':
          return CustomFieldContextDefaultValueProject.fromJson(value);
        case 'CustomFieldContextDefaultValueReadOnly':
          return CustomFieldContextDefaultValueReadOnly.fromJson(value);
        case 'CustomFieldContextDefaultValueSingleGroupPicker':
          return CustomFieldContextDefaultValueSingleGroupPicker.fromJson(value);
        case 'CustomFieldContextDefaultValueSingleOption':
          return CustomFieldContextDefaultValueSingleOption.fromJson(value);
        case 'CustomFieldContextDefaultValueSingleVersionPicker':
          return CustomFieldContextDefaultValueSingleVersionPicker.fromJson(value);
        case 'CustomFieldContextDefaultValueTextArea':
          return CustomFieldContextDefaultValueTextArea.fromJson(value);
        case 'CustomFieldContextDefaultValueTextField':
          return CustomFieldContextDefaultValueTextField.fromJson(value);
        case 'CustomFieldContextDefaultValueURL':
          return CustomFieldContextDefaultValueURL.fromJson(value);
        case 'CustomFieldContextDefaultValueUpdate':
          return CustomFieldContextDefaultValueUpdate.fromJson(value);
        case 'CustomFieldContextOption':
          return CustomFieldContextOption.fromJson(value);
        case 'CustomFieldContextProjectMapping':
          return CustomFieldContextProjectMapping.fromJson(value);
        case 'CustomFieldContextSingleUserPickerDefaults':
          return CustomFieldContextSingleUserPickerDefaults.fromJson(value);
        case 'CustomFieldContextUpdateDetails':
          return CustomFieldContextUpdateDetails.fromJson(value);
        case 'CustomFieldCreatedContextOptionsList':
          return CustomFieldCreatedContextOptionsList.fromJson(value);
        case 'CustomFieldDefinitionJsonBean':
          return CustomFieldDefinitionJsonBean.fromJson(value);
        case 'CustomFieldOption':
          return CustomFieldOption.fromJson(value);
        case 'CustomFieldOptionCreate':
          return CustomFieldOptionCreate.fromJson(value);
        case 'CustomFieldOptionUpdate':
          return CustomFieldOptionUpdate.fromJson(value);
        case 'CustomFieldPayload':
          return CustomFieldPayload.fromJson(value);
        case 'CustomFieldReplacement':
          return CustomFieldReplacement.fromJson(value);
        case 'CustomFieldUpdatedContextOptionsList':
          return CustomFieldUpdatedContextOptionsList.fromJson(value);
        case 'CustomFieldValueUpdate':
          return CustomFieldValueUpdate.fromJson(value);
        case 'CustomFieldValueUpdateDetails':
          return CustomFieldValueUpdateDetails.fromJson(value);
        case 'CustomTemplateOptions':
          return CustomTemplateOptions.fromJson(value);
        case 'CustomTemplateRequestDTO':
          return CustomTemplateRequestDTO.fromJson(value);
        case 'CustomTemplatesProjectDetails':
          return CustomTemplatesProjectDetails.fromJson(value);
        case 'Dashboard':
          return Dashboard.fromJson(value);
        case 'DashboardDetails':
          return DashboardDetails.fromJson(value);
        case 'DashboardGadget':
          return DashboardGadget.fromJson(value);
        case 'DashboardGadgetPosition':
          return DashboardGadgetPosition.fromJson(value);
        case 'DashboardGadgetResponse':
          return DashboardGadgetResponse.fromJson(value);
        case 'DashboardGadgetSettings':
          return DashboardGadgetSettings.fromJson(value);
        case 'DashboardGadgetUpdateRequest':
          return DashboardGadgetUpdateRequest.fromJson(value);
        case 'DataClassificationLevelsBean':
          return DataClassificationLevelsBean.fromJson(value);
        case 'DataClassificationTagBean':
          return DataClassificationTagBean.fromJson(value);
        case 'DateRangeFilterRequest':
          return DateRangeFilterRequest.fromJson(value);
        case 'DefaultLevelValue':
          return DefaultLevelValue.fromJson(value);
        case 'DefaultShareScope':
          return DefaultShareScope.fromJson(value);
        case 'DefaultWorkflow':
          return DefaultWorkflow.fromJson(value);
        case 'DefaultWorkflowEditorResponse':
          return DefaultWorkflowEditorResponse.fromJson(value);
        case 'DeleteAndReplaceVersionBean':
          return DeleteAndReplaceVersionBean.fromJson(value);
        case 'DeleteFieldAssociationSchemeResponse':
          return DeleteFieldAssociationSchemeResponse.fromJson(value);
        case 'DetailedErrorCollection':
          return DetailedErrorCollection.fromJson(value);
        case 'DocumentVersion':
          return DocumentVersion.fromJson(value);
        case 'DuplicatePlanRequest':
          return DuplicatePlanRequest.fromJson(value);
        case 'EditTemplateRequest':
          return EditTemplateRequest.fromJson(value);
        case 'EntityProperty':
          return EntityProperty.fromJson(value);
        case 'EntityPropertyDetails':
          return EntityPropertyDetails.fromJson(value);
        case 'Error':
          return Error.fromJson(value);
        case 'ErrorCollection':
          return ErrorCollection.fromJson(value);
        case 'ErrorMessage':
          return ErrorMessage.fromJson(value);
        case 'Errors':
          return Errors.fromJson(value);
        case 'EventNotification':
          return EventNotification.fromJson(value);
        case 'ExpandPrioritySchemeBean':
          return ExpandPrioritySchemeBean.fromJson(value);
        case 'ExpandPrioritySchemePage':
          return ExpandPrioritySchemePage.fromJson(value);
        case 'ExportArchivedIssuesTaskProgressResponse':
          return ExportArchivedIssuesTaskProgressResponse.fromJson(value);
        case 'FailedWebhook':
          return FailedWebhook.fromJson(value);
        case 'FailedWebhooks':
          return FailedWebhooks.fromJson(value);
        case 'Field':
          return Field.fromJson(value);
        case 'FieldAssociationItemPayload':
          return FieldAssociationItemPayload.fromJson(value);
        case 'FieldAssociationParameters':
          return FieldAssociationParameters.fromJson(value);
        case 'FieldAssociationSchemeFieldSearchResult':
          return FieldAssociationSchemeFieldSearchResult.fromJson(value);
        case 'FieldAssociationSchemeLinks':
          return FieldAssociationSchemeLinks.fromJson(value);
        case 'FieldAssociationSchemeLinksBean':
          return FieldAssociationSchemeLinksBean.fromJson(value);
        case 'FieldAssociationSchemeMatchedFilters':
          return FieldAssociationSchemeMatchedFilters.fromJson(value);
        case 'FieldAssociationSchemeProjectSearchResult':
          return FieldAssociationSchemeProjectSearchResult.fromJson(value);
        case 'FieldAssociationsRequest':
          return FieldAssociationsRequest.fromJson(value);
        case 'FieldCapabilityPayload':
          return FieldCapabilityPayload.fromJson(value);
        case 'FieldChangedClause':
          return FieldChangedClause.fromJson(value);
        case 'FieldConfiguration':
          return FieldConfiguration.fromJson(value);
        case 'FieldConfigurationDetails':
          return FieldConfigurationDetails.fromJson(value);
        case 'FieldConfigurationIssueTypeItem':
          return FieldConfigurationIssueTypeItem.fromJson(value);
        case 'FieldConfigurationItem':
          return FieldConfigurationItem.fromJson(value);
        case 'FieldConfigurationItemsDetails':
          return FieldConfigurationItemsDetails.fromJson(value);
        case 'FieldConfigurationScheme':
          return FieldConfigurationScheme.fromJson(value);
        case 'FieldConfigurationSchemeProjectAssociation':
          return FieldConfigurationSchemeProjectAssociation.fromJson(value);
        case 'FieldConfigurationSchemeProjects':
          return FieldConfigurationSchemeProjects.fromJson(value);
        case 'FieldConfigurationToIssueTypeMapping':
          return FieldConfigurationToIssueTypeMapping.fromJson(value);
        case 'FieldCreateMetadata':
          return FieldCreateMetadata.fromJson(value);
        case 'FieldDetails':
          return FieldDetails.fromJson(value);
        case 'FieldIdIdentifier':
          return FieldIdIdentifier.fromJson(value);
        case 'FieldIdentifierObject':
          return FieldIdentifierObject.fromJson(value);
        case 'FieldLastUsed':
          return FieldLastUsed.fromJson(value);
        case 'FieldLayoutConfiguration':
          return FieldLayoutConfiguration.fromJson(value);
        case 'FieldLayoutPayload':
          return FieldLayoutPayload.fromJson(value);
        case 'FieldLayoutSchemePayload':
          return FieldLayoutSchemePayload.fromJson(value);
        case 'FieldMetadata':
          return FieldMetadata.fromJson(value);
        case 'FieldProjectAssociation':
          return FieldProjectAssociation.fromJson(value);
        case 'FieldReferenceData':
          return FieldReferenceData.fromJson(value);
        case 'FieldSchemePayload':
          return FieldSchemePayload.fromJson(value);
        case 'FieldSchemeToFieldsPartialFailure':
          return FieldSchemeToFieldsPartialFailure.fromJson(value);
        case 'FieldSchemeToFieldsResponse':
          return FieldSchemeToFieldsResponse.fromJson(value);
        case 'FieldSchemeToProjectsPartialFailure':
          return FieldSchemeToProjectsPartialFailure.fromJson(value);
        case 'FieldSchemeToProjectsRequest':
          return FieldSchemeToProjectsRequest.fromJson(value);
        case 'FieldSchemeToProjectsResponse':
          return FieldSchemeToProjectsResponse.fromJson(value);
        case 'FieldUpdateOperation':
          return FieldUpdateOperation.fromJson(value);
        case 'FieldValueClause':
          return FieldValueClause.fromJson(value);
        case 'FieldWasClause':
          return FieldWasClause.fromJson(value);
        case 'Fields':
          return Fields.fromJson(value);
        case 'FieldsSchemeItemParameter':
          return FieldsSchemeItemParameter.fromJson(value);
        case 'FieldsSchemeItemWorkTypeParameter':
          return FieldsSchemeItemWorkTypeParameter.fromJson(value);
        case 'Filter':
          return Filter.fromJson(value);
        case 'FilterDetails':
          return FilterDetails.fromJson(value);
        case 'FilterSubscription':
          return FilterSubscription.fromJson(value);
        case 'FilterSubscriptionsList':
          return FilterSubscriptionsList.fromJson(value);
        case 'ForgePanelProjectPinAsyncResponse':
          return ForgePanelProjectPinAsyncResponse.fromJson(value);
        case 'ForgePanelProjectPinRequest':
          return ForgePanelProjectPinRequest.fromJson(value);
        case 'FoundGroup':
          return FoundGroup.fromJson(value);
        case 'FoundGroups':
          return FoundGroups.fromJson(value);
        case 'FoundUsers':
          return FoundUsers.fromJson(value);
        case 'FoundUsersAndGroups':
          return FoundUsersAndGroups.fromJson(value);
        case 'FromLayoutPayload':
          return FromLayoutPayload.fromJson(value);
        case 'FunctionOperand':
          return FunctionOperand.fromJson(value);
        case 'FunctionReferenceData':
          return FunctionReferenceData.fromJson(value);
        case 'GetAtlassianTeamResponse':
          return GetAtlassianTeamResponse.fromJson(value);
        case 'GetCrossProjectReleaseResponse':
          return GetCrossProjectReleaseResponse.fromJson(value);
        case 'GetCustomFieldResponse':
          return GetCustomFieldResponse.fromJson(value);
        case 'GetDateFieldResponse':
          return GetDateFieldResponse.fromJson(value);
        case 'GetExclusionRulesResponse':
          return GetExclusionRulesResponse.fromJson(value);
        case 'GetFieldAssociationParametersResponse':
          return GetFieldAssociationParametersResponse.fromJson(value);
        case 'GetFieldAssociationSchemeByIdResponse':
          return GetFieldAssociationSchemeByIdResponse.fromJson(value);
        case 'GetFieldAssociationSchemeResponse':
          return GetFieldAssociationSchemeResponse.fromJson(value);
        case 'GetForgeAppProperty200Response':
          return GetForgeAppProperty200Response.fromJson(value);
        case 'GetForgeAppPropertyKeys200Response':
          return GetForgeAppPropertyKeys200Response.fromJson(value);
        case 'GetForgeAppPropertyKeys200ResponseKeysInner':
          return GetForgeAppPropertyKeys200ResponseKeysInner.fromJson(value);
        case 'GetIssueSourceResponse':
          return GetIssueSourceResponse.fromJson(value);
        case 'GetPermissionHolderResponse':
          return GetPermissionHolderResponse.fromJson(value);
        case 'GetPermissionResponse':
          return GetPermissionResponse.fromJson(value);
        case 'GetPlanOnlyTeamResponse':
          return GetPlanOnlyTeamResponse.fromJson(value);
        case 'GetPlanResponse':
          return GetPlanResponse.fromJson(value);
        case 'GetPlanResponseForPage':
          return GetPlanResponseForPage.fromJson(value);
        case 'GetProjectsWithFieldSchemesResponse':
          return GetProjectsWithFieldSchemesResponse.fromJson(value);
        case 'GetRemoteIssueLinks200Response':
          return GetRemoteIssueLinks200Response.fromJson(value);
        case 'GetSchedulingResponse':
          return GetSchedulingResponse.fromJson(value);
        case 'GetTeamResponseForPage':
          return GetTeamResponseForPage.fromJson(value);
        case 'GlobalScopeBean':
          return GlobalScopeBean.fromJson(value);
        case 'Group':
          return Group.fromJson(value);
        case 'GroupDetails':
          return GroupDetails.fromJson(value);
        case 'GroupLabel':
          return GroupLabel.fromJson(value);
        case 'GroupName':
          return GroupName.fromJson(value);
        case 'HealthCheckResult':
          return HealthCheckResult.fromJson(value);
        case 'Hierarchy':
          return Hierarchy.fromJson(value);
        case 'HistoryMetadata':
          return HistoryMetadata.fromJson(value);
        case 'HistoryMetadataParticipant':
          return HistoryMetadataParticipant.fromJson(value);
        case 'Icon':
          return Icon.fromJson(value);
        case 'IconBean':
          return IconBean.fromJson(value);
        case 'IdBean':
          return IdBean.fromJson(value);
        case 'IdOrKeyBean':
          return IdOrKeyBean.fromJson(value);
        case 'IncludedFields':
          return IncludedFields.fromJson(value);
        case 'InputStreamSource':
          return InputStreamSource.fromJson(value);
        case 'IssueArchivalSyncRequest':
          return IssueArchivalSyncRequest.fromJson(value);
        case 'IssueArchivalSyncResponse':
          return IssueArchivalSyncResponse.fromJson(value);
        case 'IssueBean':
          return IssueBean.fromJson(value);
        case 'IssueBulkDeletePayload':
          return IssueBulkDeletePayload.fromJson(value);
        case 'IssueBulkEditField':
          return IssueBulkEditField.fromJson(value);
        case 'IssueBulkEditPayload':
          return IssueBulkEditPayload.fromJson(value);
        case 'IssueBulkMovePayload':
          return IssueBulkMovePayload.fromJson(value);
        case 'IssueBulkTransitionForWorkflow':
          return IssueBulkTransitionForWorkflow.fromJson(value);
        case 'IssueBulkTransitionPayload':
          return IssueBulkTransitionPayload.fromJson(value);
        case 'IssueBulkWatchOrUnwatchPayload':
          return IssueBulkWatchOrUnwatchPayload.fromJson(value);
        case 'IssueChangeLog':
          return IssueChangeLog.fromJson(value);
        case 'IssueChangelogIds':
          return IssueChangelogIds.fromJson(value);
        case 'IssueCommentListRequestBean':
          return IssueCommentListRequestBean.fromJson(value);
        case 'IssueContextVariable':
          return IssueContextVariable.fromJson(value);
        case 'IssueCreateMetadata':
          return IssueCreateMetadata.fromJson(value);
        case 'IssueEntityProperties':
          return IssueEntityProperties.fromJson(value);
        case 'IssueEntityPropertiesForMultiUpdate':
          return IssueEntityPropertiesForMultiUpdate.fromJson(value);
        case 'IssueError':
          return IssueError.fromJson(value);
        case 'IssueEvent':
          return IssueEvent.fromJson(value);
        case 'IssueFieldOption':
          return IssueFieldOption.fromJson(value);
        case 'IssueFieldOptionConfiguration':
          return IssueFieldOptionConfiguration.fromJson(value);
        case 'IssueFieldOptionCreateBean':
          return IssueFieldOptionCreateBean.fromJson(value);
        case 'IssueFieldOptionScopeBean':
          return IssueFieldOptionScopeBean.fromJson(value);
        case 'IssueFilterForBulkPropertyDelete':
          return IssueFilterForBulkPropertyDelete.fromJson(value);
        case 'IssueFilterForBulkPropertySet':
          return IssueFilterForBulkPropertySet.fromJson(value);
        case 'IssueLayoutItemPayload':
          return IssueLayoutItemPayload.fromJson(value);
        case 'IssueLayoutPayload':
          return IssueLayoutPayload.fromJson(value);
        case 'IssueLimitReportResponseBean':
          return IssueLimitReportResponseBean.fromJson(value);
        case 'IssueLink':
          return IssueLink.fromJson(value);
        case 'IssueLinkType':
          return IssueLinkType.fromJson(value);
        case 'IssueLinkTypes':
          return IssueLinkTypes.fromJson(value);
        case 'IssueList':
          return IssueList.fromJson(value);
        case 'IssueMatches':
          return IssueMatches.fromJson(value);
        case 'IssueMatchesForJQL':
          return IssueMatchesForJQL.fromJson(value);
        case 'IssuePickerSuggestions':
          return IssuePickerSuggestions.fromJson(value);
        case 'IssuePickerSuggestionsIssueType':
          return IssuePickerSuggestionsIssueType.fromJson(value);
        case 'IssueSecurityLevelMember':
          return IssueSecurityLevelMember.fromJson(value);
        case 'IssueSecuritySchemeToProjectMapping':
          return IssueSecuritySchemeToProjectMapping.fromJson(value);
        case 'IssueTransition':
          return IssueTransition.fromJson(value);
        case 'IssueTransitionStatus':
          return IssueTransitionStatus.fromJson(value);
        case 'IssueTypeCreateBean':
          return IssueTypeCreateBean.fromJson(value);
        case 'IssueTypeDefaultValue':
          return IssueTypeDefaultValue.fromJson(value);
        case 'IssueTypeDetails':
          return IssueTypeDetails.fromJson(value);
        case 'IssueTypeHierarchyPayload':
          return IssueTypeHierarchyPayload.fromJson(value);
        case 'IssueTypeIds':
          return IssueTypeIds.fromJson(value);
        case 'IssueTypeIdsToRemove':
          return IssueTypeIdsToRemove.fromJson(value);
        case 'IssueTypeInfo':
          return IssueTypeInfo.fromJson(value);
        case 'IssueTypeIssueCreateMetadata':
          return IssueTypeIssueCreateMetadata.fromJson(value);
        case 'IssueTypePayload':
          return IssueTypePayload.fromJson(value);
        case 'IssueTypeProjectCreatePayload':
          return IssueTypeProjectCreatePayload.fromJson(value);
        case 'IssueTypeScheme':
          return IssueTypeScheme.fromJson(value);
        case 'IssueTypeSchemeDetails':
          return IssueTypeSchemeDetails.fromJson(value);
        case 'IssueTypeSchemeID':
          return IssueTypeSchemeID.fromJson(value);
        case 'IssueTypeSchemeMapping':
          return IssueTypeSchemeMapping.fromJson(value);
        case 'IssueTypeSchemePayload':
          return IssueTypeSchemePayload.fromJson(value);
        case 'IssueTypeSchemeProjectAssociation':
          return IssueTypeSchemeProjectAssociation.fromJson(value);
        case 'IssueTypeSchemeProjects':
          return IssueTypeSchemeProjects.fromJson(value);
        case 'IssueTypeSchemeUpdateDetails':
          return IssueTypeSchemeUpdateDetails.fromJson(value);
        case 'IssueTypeScreenScheme':
          return IssueTypeScreenScheme.fromJson(value);
        case 'IssueTypeScreenSchemeDetails':
          return IssueTypeScreenSchemeDetails.fromJson(value);
        case 'IssueTypeScreenSchemeId':
          return IssueTypeScreenSchemeId.fromJson(value);
        case 'IssueTypeScreenSchemeItem':
          return IssueTypeScreenSchemeItem.fromJson(value);
        case 'IssueTypeScreenSchemeMapping':
          return IssueTypeScreenSchemeMapping.fromJson(value);
        case 'IssueTypeScreenSchemeMappingDetails':
          return IssueTypeScreenSchemeMappingDetails.fromJson(value);
        case 'IssueTypeScreenSchemePayload':
          return IssueTypeScreenSchemePayload.fromJson(value);
        case 'IssueTypeScreenSchemeProjectAssociation':
          return IssueTypeScreenSchemeProjectAssociation.fromJson(value);
        case 'IssueTypeScreenSchemeUpdateDetails':
          return IssueTypeScreenSchemeUpdateDetails.fromJson(value);
        case 'IssueTypeScreenSchemesProjects':
          return IssueTypeScreenSchemesProjects.fromJson(value);
        case 'IssueTypeToContextMapping':
          return IssueTypeToContextMapping.fromJson(value);
        case 'IssueTypeUpdateBean':
          return IssueTypeUpdateBean.fromJson(value);
        case 'IssueTypeWithStatus':
          return IssueTypeWithStatus.fromJson(value);
        case 'IssueTypeWorkflowMapping':
          return IssueTypeWorkflowMapping.fromJson(value);
        case 'IssueTypesWorkflowMapping':
          return IssueTypesWorkflowMapping.fromJson(value);
        case 'IssueUpdateDetails':
          return IssueUpdateDetails.fromJson(value);
        case 'IssueUpdateMetadata':
          return IssueUpdateMetadata.fromJson(value);
        case 'IssuesAndJQLQueries':
          return IssuesAndJQLQueries.fromJson(value);
        case 'IssuesJqlMetaDataBean':
          return IssuesJqlMetaDataBean.fromJson(value);
        case 'IssuesMetaBean':
          return IssuesMetaBean.fromJson(value);
        case 'IssuesUpdateBean':
          return IssuesUpdateBean.fromJson(value);
        case 'JExpEvaluateIssuesJqlMetaDataBean':
          return JExpEvaluateIssuesJqlMetaDataBean.fromJson(value);
        case 'JExpEvaluateIssuesMetaBean':
          return JExpEvaluateIssuesMetaBean.fromJson(value);
        case 'JExpEvaluateJiraExpressionResultBean':
          return JExpEvaluateJiraExpressionResultBean.fromJson(value);
        case 'JExpEvaluateMetaDataBean':
          return JExpEvaluateMetaDataBean.fromJson(value);
        case 'JQLCountRequestBean':
          return JQLCountRequestBean.fromJson(value);
        case 'JQLCountResultsBean':
          return JQLCountResultsBean.fromJson(value);
        case 'JQLPersonalDataMigrationRequest':
          return JQLPersonalDataMigrationRequest.fromJson(value);
        case 'JQLQueryWithUnknownUsers':
          return JQLQueryWithUnknownUsers.fromJson(value);
        case 'JQLReferenceData':
          return JQLReferenceData.fromJson(value);
        case 'JexpEvaluateCtxIssues':
          return JexpEvaluateCtxIssues.fromJson(value);
        case 'JexpEvaluateCtxJqlIssues':
          return JexpEvaluateCtxJqlIssues.fromJson(value);
        case 'JexpIssues':
          return JexpIssues.fromJson(value);
        case 'JexpJqlIssues':
          return JexpJqlIssues.fromJson(value);
        case 'JiraCascadingSelectField':
          return JiraCascadingSelectField.fromJson(value);
        case 'JiraColorField':
          return JiraColorField.fromJson(value);
        case 'JiraColorInput':
          return JiraColorInput.fromJson(value);
        case 'JiraComponentField':
          return JiraComponentField.fromJson(value);
        case 'JiraDateField':
          return JiraDateField.fromJson(value);
        case 'JiraDateInput':
          return JiraDateInput.fromJson(value);
        case 'JiraDateTimeField':
          return JiraDateTimeField.fromJson(value);
        case 'JiraDateTimeInput':
          return JiraDateTimeInput.fromJson(value);
        case 'JiraDurationField':
          return JiraDurationField.fromJson(value);
        case 'JiraExpressionAnalysis':
          return JiraExpressionAnalysis.fromJson(value);
        case 'JiraExpressionComplexity':
          return JiraExpressionComplexity.fromJson(value);
        case 'JiraExpressionEvalContextBean':
          return JiraExpressionEvalContextBean.fromJson(value);
        case 'JiraExpressionEvalRequestBean':
          return JiraExpressionEvalRequestBean.fromJson(value);
        case 'JiraExpressionEvaluateContextBean':
          return JiraExpressionEvaluateContextBean.fromJson(value);
        case 'JiraExpressionEvaluateRequestBean':
          return JiraExpressionEvaluateRequestBean.fromJson(value);
        case 'JiraExpressionEvaluationMetaDataBean':
          return JiraExpressionEvaluationMetaDataBean.fromJson(value);
        case 'JiraExpressionForAnalysis':
          return JiraExpressionForAnalysis.fromJson(value);
        case 'JiraExpressionResult':
          return JiraExpressionResult.fromJson(value);
        case 'JiraExpressionValidationError':
          return JiraExpressionValidationError.fromJson(value);
        case 'JiraExpressionsAnalysis':
          return JiraExpressionsAnalysis.fromJson(value);
        case 'JiraExpressionsComplexityBean':
          return JiraExpressionsComplexityBean.fromJson(value);
        case 'JiraExpressionsComplexityValueBean':
          return JiraExpressionsComplexityValueBean.fromJson(value);
        case 'JiraGroupInput':
          return JiraGroupInput.fromJson(value);
        case 'JiraIssueFields':
          return JiraIssueFields.fromJson(value);
        case 'JiraIssueTypeField':
          return JiraIssueTypeField.fromJson(value);
        case 'JiraLabelPropertiesInputJackson1':
          return JiraLabelPropertiesInputJackson1.fromJson(value);
        case 'JiraLabelsField':
          return JiraLabelsField.fromJson(value);
        case 'JiraLabelsInput':
          return JiraLabelsInput.fromJson(value);
        case 'JiraMultiSelectComponentField':
          return JiraMultiSelectComponentField.fromJson(value);
        case 'JiraMultipleGroupPickerField':
          return JiraMultipleGroupPickerField.fromJson(value);
        case 'JiraMultipleSelectField':
          return JiraMultipleSelectField.fromJson(value);
        case 'JiraMultipleSelectUserPickerField':
          return JiraMultipleSelectUserPickerField.fromJson(value);
        case 'JiraMultipleVersionPickerField':
          return JiraMultipleVersionPickerField.fromJson(value);
        case 'JiraNumberField':
          return JiraNumberField.fromJson(value);
        case 'JiraPriorityField':
          return JiraPriorityField.fromJson(value);
        case 'JiraRichTextField':
          return JiraRichTextField.fromJson(value);
        case 'JiraRichTextInput':
          return JiraRichTextInput.fromJson(value);
        case 'JiraSelectedOptionField':
          return JiraSelectedOptionField.fromJson(value);
        case 'JiraSingleGroupPickerField':
          return JiraSingleGroupPickerField.fromJson(value);
        case 'JiraSingleLineTextField':
          return JiraSingleLineTextField.fromJson(value);
        case 'JiraSingleSelectField':
          return JiraSingleSelectField.fromJson(value);
        case 'JiraSingleSelectUserPickerField':
          return JiraSingleSelectUserPickerField.fromJson(value);
        case 'JiraSingleVersionPickerField':
          return JiraSingleVersionPickerField.fromJson(value);
        case 'JiraStatus':
          return JiraStatus.fromJson(value);
        case 'JiraStatusInput':
          return JiraStatusInput.fromJson(value);
        case 'JiraTimeTrackingField':
          return JiraTimeTrackingField.fromJson(value);
        case 'JiraUrlField':
          return JiraUrlField.fromJson(value);
        case 'JiraUserField':
          return JiraUserField.fromJson(value);
        case 'JiraVersionField':
          return JiraVersionField.fromJson(value);
        case 'JiraWorkflow':
          return JiraWorkflow.fromJson(value);
        case 'JiraWorkflowPreviewStatus':
          return JiraWorkflowPreviewStatus.fromJson(value);
        case 'JiraWorkflowStatus':
          return JiraWorkflowStatus.fromJson(value);
        case 'JqlFunctionPrecomputationBean':
          return JqlFunctionPrecomputationBean.fromJson(value);
        case 'JqlFunctionPrecomputationGetByIdRequest':
          return JqlFunctionPrecomputationGetByIdRequest.fromJson(value);
        case 'JqlFunctionPrecomputationGetByIdResponse':
          return JqlFunctionPrecomputationGetByIdResponse.fromJson(value);
        case 'JqlFunctionPrecomputationUpdateBean':
          return JqlFunctionPrecomputationUpdateBean.fromJson(value);
        case 'JqlFunctionPrecomputationUpdateErrorResponse':
          return JqlFunctionPrecomputationUpdateErrorResponse.fromJson(value);
        case 'JqlFunctionPrecomputationUpdateRequestBean':
          return JqlFunctionPrecomputationUpdateRequestBean.fromJson(value);
        case 'JqlFunctionPrecomputationUpdateResponse':
          return JqlFunctionPrecomputationUpdateResponse.fromJson(value);
        case 'JqlQueriesToParse':
          return JqlQueriesToParse.fromJson(value);
        case 'JqlQueriesToSanitize':
          return JqlQueriesToSanitize.fromJson(value);
        case 'JqlQuery':
          return JqlQuery.fromJson(value);
        case 'JqlQueryClause':
          return JqlQueryClause.fromJson(value);
        case 'JqlQueryClauseOperand':
          return JqlQueryClauseOperand.fromJson(value);
        case 'JqlQueryClauseTimePredicate':
          return JqlQueryClauseTimePredicate.fromJson(value);
        case 'JqlQueryField':
          return JqlQueryField.fromJson(value);
        case 'JqlQueryFieldEntityProperty':
          return JqlQueryFieldEntityProperty.fromJson(value);
        case 'JqlQueryOrderByClause':
          return JqlQueryOrderByClause.fromJson(value);
        case 'JqlQueryOrderByClauseElement':
          return JqlQueryOrderByClauseElement.fromJson(value);
        case 'JqlQueryToSanitize':
          return JqlQueryToSanitize.fromJson(value);
        case 'JqlQueryUnitaryOperand':
          return JqlQueryUnitaryOperand.fromJson(value);
        case 'JsonContextVariable':
          return JsonContextVariable.fromJson(value);
        case 'JsonNode':
          return JsonNode.fromJson(value);
        case 'JsonTypeBean':
          return JsonTypeBean.fromJson(value);
        case 'KeywordOperand':
          return KeywordOperand.fromJson(value);
        case 'License':
          return License.fromJson(value);
        case 'LicenseMetric':
          return LicenseMetric.fromJson(value);
        case 'LicensedApplication':
          return LicensedApplication.fromJson(value);
        case 'LinkGroup':
          return LinkGroup.fromJson(value);
        case 'LinkIssueRequestJsonBean':
          return LinkIssueRequestJsonBean.fromJson(value);
        case 'LinkedIssue':
          return LinkedIssue.fromJson(value);
        case 'ListOperand':
          return ListOperand.fromJson(value);
        case 'Locale':
          return Locale.fromJson(value);
        case 'MandatoryFieldValue':
          return MandatoryFieldValue.fromJson(value);
        case 'MandatoryFieldValueForADF':
          return MandatoryFieldValueForADF.fromJson(value);
        case 'MappingsByIssueTypeOverride':
          return MappingsByIssueTypeOverride.fromJson(value);
        case 'MappingsByWorkflow':
          return MappingsByWorkflow.fromJson(value);
        case 'MinimalFieldSchemeToFieldsPartialFailure':
          return MinimalFieldSchemeToFieldsPartialFailure.fromJson(value);
        case 'MinimalFieldSchemeToFieldsResponse':
          return MinimalFieldSchemeToFieldsResponse.fromJson(value);
        case 'MoveFieldBean':
          return MoveFieldBean.fromJson(value);
        case 'MultiIssueEntityProperties':
          return MultiIssueEntityProperties.fromJson(value);
        case 'MultipleCustomFieldValuesUpdate':
          return MultipleCustomFieldValuesUpdate.fromJson(value);
        case 'MultipleCustomFieldValuesUpdateDetails':
          return MultipleCustomFieldValuesUpdateDetails.fromJson(value);
        case 'NestedResponse':
          return NestedResponse.fromJson(value);
        case 'NewUserDetails':
          return NewUserDetails.fromJson(value);
        case 'NonWorkingDay':
          return NonWorkingDay.fromJson(value);
        case 'Notification':
          return Notification.fromJson(value);
        case 'NotificationEvent':
          return NotificationEvent.fromJson(value);
        case 'NotificationRecipients':
          return NotificationRecipients.fromJson(value);
        case 'NotificationRecipientsRestrictions':
          return NotificationRecipientsRestrictions.fromJson(value);
        case 'NotificationScheme':
          return NotificationScheme.fromJson(value);
        case 'NotificationSchemeAndProjectMappingJsonBean':
          return NotificationSchemeAndProjectMappingJsonBean.fromJson(value);
        case 'NotificationSchemeEvent':
          return NotificationSchemeEvent.fromJson(value);
        case 'NotificationSchemeEventDetails':
          return NotificationSchemeEventDetails.fromJson(value);
        case 'NotificationSchemeEventIDPayload':
          return NotificationSchemeEventIDPayload.fromJson(value);
        case 'NotificationSchemeEventPayload':
          return NotificationSchemeEventPayload.fromJson(value);
        case 'NotificationSchemeEventTypeId':
          return NotificationSchemeEventTypeId.fromJson(value);
        case 'NotificationSchemeId':
          return NotificationSchemeId.fromJson(value);
        case 'NotificationSchemeNotificationDetails':
          return NotificationSchemeNotificationDetails.fromJson(value);
        case 'NotificationSchemeNotificationDetailsPayload':
          return NotificationSchemeNotificationDetailsPayload.fromJson(value);
        case 'NotificationSchemePayload':
          return NotificationSchemePayload.fromJson(value);
        case 'OldToNewSecurityLevelMappingsBean':
          return OldToNewSecurityLevelMappingsBean.fromJson(value);
        case 'OperationMessage':
          return OperationMessage.fromJson(value);
        case 'Operations':
          return Operations.fromJson(value);
        case 'OrderOfCustomFieldOptions':
          return OrderOfCustomFieldOptions.fromJson(value);
        case 'OrderOfIssueTypes':
          return OrderOfIssueTypes.fromJson(value);
        case 'PageBean2ComponentJsonBean':
          return PageBean2ComponentJsonBean.fromJson(value);
        case 'PageBean2FieldAssociationSchemeFieldSearchResult':
          return PageBean2FieldAssociationSchemeFieldSearchResult.fromJson(value);
        case 'PageBean2FieldAssociationSchemeProjectSearchResult':
          return PageBean2FieldAssociationSchemeProjectSearchResult.fromJson(value);
        case 'PageBean2GetFieldAssociationSchemeResponse':
          return PageBean2GetFieldAssociationSchemeResponse.fromJson(value);
        case 'PageBean2GetProjectsWithFieldSchemesResponse':
          return PageBean2GetProjectsWithFieldSchemesResponse.fromJson(value);
        case 'PageBean2JqlFunctionPrecomputationBean':
          return PageBean2JqlFunctionPrecomputationBean.fromJson(value);
        case 'PageBean2ProjectFieldBean':
          return PageBean2ProjectFieldBean.fromJson(value);
        case 'PageBeanBulkContextualConfiguration':
          return PageBeanBulkContextualConfiguration.fromJson(value);
        case 'PageBeanChangelog':
          return PageBeanChangelog.fromJson(value);
        case 'PageBeanComment':
          return PageBeanComment.fromJson(value);
        case 'PageBeanComponentWithIssueCount':
          return PageBeanComponentWithIssueCount.fromJson(value);
        case 'PageBeanContext':
          return PageBeanContext.fromJson(value);
        case 'PageBeanContextDefaultValues':
          return PageBeanContextDefaultValues.fromJson(value);
        case 'PageBeanContextForProjectAndIssueType':
          return PageBeanContextForProjectAndIssueType.fromJson(value);
        case 'PageBeanContextualConfiguration':
          return PageBeanContextualConfiguration.fromJson(value);
        case 'PageBeanCustomFieldContext':
          return PageBeanCustomFieldContext.fromJson(value);
        case 'PageBeanCustomFieldContextDefaultValue':
          return PageBeanCustomFieldContextDefaultValue.fromJson(value);
        case 'PageBeanCustomFieldContextOption':
          return PageBeanCustomFieldContextOption.fromJson(value);
        case 'PageBeanCustomFieldContextProjectMapping':
          return PageBeanCustomFieldContextProjectMapping.fromJson(value);
        case 'PageBeanDashboard':
          return PageBeanDashboard.fromJson(value);
        case 'PageBeanField':
          return PageBeanField.fromJson(value);
        case 'PageBeanFieldConfigurationDetails':
          return PageBeanFieldConfigurationDetails.fromJson(value);
        case 'PageBeanFieldConfigurationIssueTypeItem':
          return PageBeanFieldConfigurationIssueTypeItem.fromJson(value);
        case 'PageBeanFieldConfigurationItem':
          return PageBeanFieldConfigurationItem.fromJson(value);
        case 'PageBeanFieldConfigurationScheme':
          return PageBeanFieldConfigurationScheme.fromJson(value);
        case 'PageBeanFieldConfigurationSchemeProjects':
          return PageBeanFieldConfigurationSchemeProjects.fromJson(value);
        case 'PageBeanFieldProjectAssociation':
          return PageBeanFieldProjectAssociation.fromJson(value);
        case 'PageBeanFilterDetails':
          return PageBeanFilterDetails.fromJson(value);
        case 'PageBeanGroupDetails':
          return PageBeanGroupDetails.fromJson(value);
        case 'PageBeanIssueFieldOption':
          return PageBeanIssueFieldOption.fromJson(value);
        case 'PageBeanIssueSecurityLevelMember':
          return PageBeanIssueSecurityLevelMember.fromJson(value);
        case 'PageBeanIssueSecuritySchemeToProjectMapping':
          return PageBeanIssueSecuritySchemeToProjectMapping.fromJson(value);
        case 'PageBeanIssueTypeScheme':
          return PageBeanIssueTypeScheme.fromJson(value);
        case 'PageBeanIssueTypeSchemeMapping':
          return PageBeanIssueTypeSchemeMapping.fromJson(value);
        case 'PageBeanIssueTypeSchemeProjects':
          return PageBeanIssueTypeSchemeProjects.fromJson(value);
        case 'PageBeanIssueTypeScreenScheme':
          return PageBeanIssueTypeScreenScheme.fromJson(value);
        case 'PageBeanIssueTypeScreenSchemeItem':
          return PageBeanIssueTypeScreenSchemeItem.fromJson(value);
        case 'PageBeanIssueTypeScreenSchemesProjects':
          return PageBeanIssueTypeScreenSchemesProjects.fromJson(value);
        case 'PageBeanIssueTypeToContextMapping':
          return PageBeanIssueTypeToContextMapping.fromJson(value);
        case 'PageBeanNotificationScheme':
          return PageBeanNotificationScheme.fromJson(value);
        case 'PageBeanNotificationSchemeAndProjectMappingJsonBean':
          return PageBeanNotificationSchemeAndProjectMappingJsonBean.fromJson(value);
        case 'PageBeanPriority':
          return PageBeanPriority.fromJson(value);
        case 'PageBeanPrioritySchemeWithPaginatedPrioritiesAndProjects':
          return PageBeanPrioritySchemeWithPaginatedPrioritiesAndProjects.fromJson(value);
        case 'PageBeanPriorityWithSequence':
          return PageBeanPriorityWithSequence.fromJson(value);
        case 'PageBeanProject':
          return PageBeanProject.fromJson(value);
        case 'PageBeanProjectDetails':
          return PageBeanProjectDetails.fromJson(value);
        case 'PageBeanResolutionJsonBean':
          return PageBeanResolutionJsonBean.fromJson(value);
        case 'PageBeanScreen':
          return PageBeanScreen.fromJson(value);
        case 'PageBeanScreenScheme':
          return PageBeanScreenScheme.fromJson(value);
        case 'PageBeanScreenWithTab':
          return PageBeanScreenWithTab.fromJson(value);
        case 'PageBeanSecurityLevel':
          return PageBeanSecurityLevel.fromJson(value);
        case 'PageBeanSecurityLevelMember':
          return PageBeanSecurityLevelMember.fromJson(value);
        case 'PageBeanSecuritySchemeWithProjects':
          return PageBeanSecuritySchemeWithProjects.fromJson(value);
        case 'PageBeanString':
          return PageBeanString.fromJson(value);
        case 'PageBeanUiModificationDetails':
          return PageBeanUiModificationDetails.fromJson(value);
        case 'PageBeanUser':
          return PageBeanUser.fromJson(value);
        case 'PageBeanUserDetails':
          return PageBeanUserDetails.fromJson(value);
        case 'PageBeanUserKey':
          return PageBeanUserKey.fromJson(value);
        case 'PageBeanVersion':
          return PageBeanVersion.fromJson(value);
        case 'PageBeanWebhook':
          return PageBeanWebhook.fromJson(value);
        case 'PageBeanWorkflow':
          return PageBeanWorkflow.fromJson(value);
        case 'PageBeanWorkflowScheme':
          return PageBeanWorkflowScheme.fromJson(value);
        case 'PageBeanWorkflowTransitionRules':
          return PageBeanWorkflowTransitionRules.fromJson(value);
        case 'PageOfChangelogs':
          return PageOfChangelogs.fromJson(value);
        case 'PageOfComments':
          return PageOfComments.fromJson(value);
        case 'PageOfCreateMetaIssueTypeWithField':
          return PageOfCreateMetaIssueTypeWithField.fromJson(value);
        case 'PageOfCreateMetaIssueTypes':
          return PageOfCreateMetaIssueTypes.fromJson(value);
        case 'PageOfDashboards':
          return PageOfDashboards.fromJson(value);
        case 'PageOfStatuses':
          return PageOfStatuses.fromJson(value);
        case 'PageOfWorklogs':
          return PageOfWorklogs.fromJson(value);
        case 'PageWithCursorGetPlanResponseForPage':
          return PageWithCursorGetPlanResponseForPage.fromJson(value);
        case 'PageWithCursorGetTeamResponseForPage':
          return PageWithCursorGetTeamResponseForPage.fromJson(value);
        case 'PagedListUserDetailsApplicationUser':
          return PagedListUserDetailsApplicationUser.fromJson(value);
        case 'PaginatedResponseComment':
          return PaginatedResponseComment.fromJson(value);
        case 'PaginatedResponseFieldCreateMetadata':
          return PaginatedResponseFieldCreateMetadata.fromJson(value);
        case 'PaginatedResponseIssueTypeIssueCreateMetadata':
          return PaginatedResponseIssueTypeIssueCreateMetadata.fromJson(value);
        case 'ParameterRemovalDetails':
          return ParameterRemovalDetails.fromJson(value);
        case 'ParsedJqlQueries':
          return ParsedJqlQueries.fromJson(value);
        case 'ParsedJqlQuery':
          return ParsedJqlQuery.fromJson(value);
        case 'PermissionDetails':
          return PermissionDetails.fromJson(value);
        case 'PermissionGrant':
          return PermissionGrant.fromJson(value);
        case 'PermissionGrantDTO':
          return PermissionGrantDTO.fromJson(value);
        case 'PermissionGrants':
          return PermissionGrants.fromJson(value);
        case 'PermissionHolder':
          return PermissionHolder.fromJson(value);
        case 'PermissionPayloadDTO':
          return PermissionPayloadDTO.fromJson(value);
        case 'PermissionScheme':
          return PermissionScheme.fromJson(value);
        case 'PermissionSchemes':
          return PermissionSchemes.fromJson(value);
        case 'Permissions':
          return Permissions.fromJson(value);
        case 'PermissionsKeysBean':
          return PermissionsKeysBean.fromJson(value);
        case 'PermittedProjects':
          return PermittedProjects.fromJson(value);
        case 'PreviewConditionGroupConfiguration':
          return PreviewConditionGroupConfiguration.fromJson(value);
        case 'PreviewRuleConfiguration':
          return PreviewRuleConfiguration.fromJson(value);
        case 'PreviewTrigger':
          return PreviewTrigger.fromJson(value);
        case 'Priority':
          return Priority.fromJson(value);
        case 'PriorityId':
          return PriorityId.fromJson(value);
        case 'PriorityMapping':
          return PriorityMapping.fromJson(value);
        case 'PrioritySchemeChangesWithoutMappings':
          return PrioritySchemeChangesWithoutMappings.fromJson(value);
        case 'PrioritySchemeId':
          return PrioritySchemeId.fromJson(value);
        case 'PrioritySchemeWithPaginatedPrioritiesAndProjects':
          return PrioritySchemeWithPaginatedPrioritiesAndProjects.fromJson(value);
        case 'PriorityWithSequence':
          return PriorityWithSequence.fromJson(value);
        case 'Project':
          return Project.fromJson(value);
        case 'ProjectAndIssueTypePair':
          return ProjectAndIssueTypePair.fromJson(value);
        case 'ProjectArchetype':
          return ProjectArchetype.fromJson(value);
        case 'ProjectAvatars':
          return ProjectAvatars.fromJson(value);
        case 'ProjectCategory':
          return ProjectCategory.fromJson(value);
        case 'ProjectComponent':
          return ProjectComponent.fromJson(value);
        case 'ProjectCreateResourceIdentifier':
          return ProjectCreateResourceIdentifier.fromJson(value);
        case 'ProjectCustomTemplateCreateRequestDTO':
          return ProjectCustomTemplateCreateRequestDTO.fromJson(value);
        case 'ProjectDataPolicies':
          return ProjectDataPolicies.fromJson(value);
        case 'ProjectDataPolicy':
          return ProjectDataPolicy.fromJson(value);
        case 'ProjectDetails':
          return ProjectDetails.fromJson(value);
        case 'ProjectEmailAddress':
          return ProjectEmailAddress.fromJson(value);
        case 'ProjectFeature':
          return ProjectFeature.fromJson(value);
        case 'ProjectFeatureState':
          return ProjectFeatureState.fromJson(value);
        case 'ProjectFieldBean':
          return ProjectFieldBean.fromJson(value);
        case 'ProjectId':
          return ProjectId.fromJson(value);
        case 'ProjectIdAssociationContext':
          return ProjectIdAssociationContext.fromJson(value);
        case 'ProjectIdentifierBean':
          return ProjectIdentifierBean.fromJson(value);
        case 'ProjectIdentifiers':
          return ProjectIdentifiers.fromJson(value);
        case 'ProjectIds':
          return ProjectIds.fromJson(value);
        case 'ProjectInsight':
          return ProjectInsight.fromJson(value);
        case 'ProjectIssueCreateMetadata':
          return ProjectIssueCreateMetadata.fromJson(value);
        case 'ProjectIssueSecurityLevels':
          return ProjectIssueSecurityLevels.fromJson(value);
        case 'ProjectIssueTypeHierarchy':
          return ProjectIssueTypeHierarchy.fromJson(value);
        case 'ProjectIssueTypeMapping':
          return ProjectIssueTypeMapping.fromJson(value);
        case 'ProjectIssueTypeMappings':
          return ProjectIssueTypeMappings.fromJson(value);
        case 'ProjectIssueTypeQueryContext':
          return ProjectIssueTypeQueryContext.fromJson(value);
        case 'ProjectIssueTypesHierarchyLevel':
          return ProjectIssueTypesHierarchyLevel.fromJson(value);
        case 'ProjectLandingPageInfo':
          return ProjectLandingPageInfo.fromJson(value);
        case 'ProjectPayload':
          return ProjectPayload.fromJson(value);
        case 'ProjectPermissions':
          return ProjectPermissions.fromJson(value);
        case 'ProjectPinAction':
          return ProjectPinAction.fromJson(value);
        case 'ProjectRole':
          return ProjectRole.fromJson(value);
        case 'ProjectRoleActorsUpdateBean':
          return ProjectRoleActorsUpdateBean.fromJson(value);
        case 'ProjectRoleDetails':
          return ProjectRoleDetails.fromJson(value);
        case 'ProjectRoleGroup':
          return ProjectRoleGroup.fromJson(value);
        case 'ProjectRoleUser':
          return ProjectRoleUser.fromJson(value);
        case 'ProjectScopeBean':
          return ProjectScopeBean.fromJson(value);
        case 'ProjectTemplateKey':
          return ProjectTemplateKey.fromJson(value);
        case 'ProjectTemplateModel':
          return ProjectTemplateModel.fromJson(value);
        case 'ProjectType':
          return ProjectType.fromJson(value);
        case 'ProjectUsage':
          return ProjectUsage.fromJson(value);
        case 'ProjectUsagePage':
          return ProjectUsagePage.fromJson(value);
        case 'ProjectWithDataPolicy':
          return ProjectWithDataPolicy.fromJson(value);
        case 'PropertyKey':
          return PropertyKey.fromJson(value);
        case 'PropertyKeys':
          return PropertyKeys.fromJson(value);
        case 'PublishDraftWorkflowScheme':
          return PublishDraftWorkflowScheme.fromJson(value);
        case 'PublishedWorkflowId':
          return PublishedWorkflowId.fromJson(value);
        case 'QuickFilterPayload':
          return QuickFilterPayload.fromJson(value);
        case 'RedactionJobStatusResponse':
          return RedactionJobStatusResponse.fromJson(value);
        case 'RedactionPosition':
          return RedactionPosition.fromJson(value);
        case 'RegisteredWebhook':
          return RegisteredWebhook.fromJson(value);
        case 'RemoteIssueLink':
          return RemoteIssueLink.fromJson(value);
        case 'RemoteIssueLinkIdentifies':
          return RemoteIssueLinkIdentifies.fromJson(value);
        case 'RemoteIssueLinkRequest':
          return RemoteIssueLinkRequest.fromJson(value);
        case 'RemoteObject':
          return RemoteObject.fromJson(value);
        case 'RemoveFieldAssociationsRequestItem':
          return RemoveFieldAssociationsRequestItem.fromJson(value);
        case 'RemoveFieldParametersResult':
          return RemoveFieldParametersResult.fromJson(value);
        case 'RemoveFieldParametersResultError':
          return RemoveFieldParametersResultError.fromJson(value);
        case 'RemoveOptionFromIssuesResult':
          return RemoveOptionFromIssuesResult.fromJson(value);
        case 'ReorderIssuePriorities':
          return ReorderIssuePriorities.fromJson(value);
        case 'ReorderIssueResolutionsRequest':
          return ReorderIssueResolutionsRequest.fromJson(value);
        case 'RequiredMappingByIssueType':
          return RequiredMappingByIssueType.fromJson(value);
        case 'RequiredMappingByWorkflows':
          return RequiredMappingByWorkflows.fromJson(value);
        case 'Resolution':
          return Resolution.fromJson(value);
        case 'ResolutionId':
          return ResolutionId.fromJson(value);
        case 'ResolutionJsonBean':
          return ResolutionJsonBean.fromJson(value);
        case 'Resource':
          return Resource.fromJson(value);
        case 'RestrictedPermission':
          return RestrictedPermission.fromJson(value);
        case 'RichText':
          return RichText.fromJson(value);
        case 'RoleActor':
          return RoleActor.fromJson(value);
        case 'RolePayload':
          return RolePayload.fromJson(value);
        case 'RolesCapabilityPayload':
          return RolesCapabilityPayload.fromJson(value);
        case 'RuleConfiguration':
          return RuleConfiguration.fromJson(value);
        case 'RulePayload':
          return RulePayload.fromJson(value);
        case 'SanitizedJqlQueries':
          return SanitizedJqlQueries.fromJson(value);
        case 'SanitizedJqlQuery':
          return SanitizedJqlQuery.fromJson(value);
        case 'SaveProjectTemplateRequest':
          return SaveProjectTemplateRequest.fromJson(value);
        case 'SaveTemplateRequest':
          return SaveTemplateRequest.fromJson(value);
        case 'SaveTemplateResponse':
          return SaveTemplateResponse.fromJson(value);
        case 'Scope':
          return Scope.fromJson(value);
        case 'ScopePayload':
          return ScopePayload.fromJson(value);
        case 'Screen':
          return Screen.fromJson(value);
        case 'ScreenDetails':
          return ScreenDetails.fromJson(value);
        case 'ScreenPayload':
          return ScreenPayload.fromJson(value);
        case 'ScreenScheme':
          return ScreenScheme.fromJson(value);
        case 'ScreenSchemeDetails':
          return ScreenSchemeDetails.fromJson(value);
        case 'ScreenSchemeId':
          return ScreenSchemeId.fromJson(value);
        case 'ScreenSchemePayload':
          return ScreenSchemePayload.fromJson(value);
        case 'ScreenTypes':
          return ScreenTypes.fromJson(value);
        case 'ScreenWithTab':
          return ScreenWithTab.fromJson(value);
        case 'ScreenableField':
          return ScreenableField.fromJson(value);
        case 'ScreenableTab':
          return ScreenableTab.fromJson(value);
        case 'SearchAndReconcileRequestBean':
          return SearchAndReconcileRequestBean.fromJson(value);
        case 'SearchAndReconcileResults':
          return SearchAndReconcileResults.fromJson(value);
        case 'SearchAutoCompleteFilter':
          return SearchAutoCompleteFilter.fromJson(value);
        case 'SearchRequestBean':
          return SearchRequestBean.fromJson(value);
        case 'SearchResultFieldParameters':
          return SearchResultFieldParameters.fromJson(value);
        case 'SearchResultWorkTypeParameters':
          return SearchResultWorkTypeParameters.fromJson(value);
        case 'SearchResults':
          return SearchResults.fromJson(value);
        case 'SearchWarning':
          return SearchWarning.fromJson(value);
        case 'SearchWarningLimitDetails':
          return SearchWarningLimitDetails.fromJson(value);
        case 'SecurityLevel':
          return SecurityLevel.fromJson(value);
        case 'SecurityLevelMember':
          return SecurityLevelMember.fromJson(value);
        case 'SecurityLevelMemberPayload':
          return SecurityLevelMemberPayload.fromJson(value);
        case 'SecurityLevelPayload':
          return SecurityLevelPayload.fromJson(value);
        case 'SecurityScheme':
          return SecurityScheme.fromJson(value);
        case 'SecuritySchemeId':
          return SecuritySchemeId.fromJson(value);
        case 'SecuritySchemeLevelBean':
          return SecuritySchemeLevelBean.fromJson(value);
        case 'SecuritySchemeLevelMemberBean':
          return SecuritySchemeLevelMemberBean.fromJson(value);
        case 'SecuritySchemeMembersRequest':
          return SecuritySchemeMembersRequest.fromJson(value);
        case 'SecuritySchemePayload':
          return SecuritySchemePayload.fromJson(value);
        case 'SecuritySchemeWithProjects':
          return SecuritySchemeWithProjects.fromJson(value);
        case 'SecuritySchemes':
          return SecuritySchemes.fromJson(value);
        case 'ServerInformation':
          return ServerInformation.fromJson(value);
        case 'ServiceManagementNavigationInfo':
          return ServiceManagementNavigationInfo.fromJson(value);
        case 'ServiceRegistry':
          return ServiceRegistry.fromJson(value);
        case 'ServiceRegistryTier':
          return ServiceRegistryTier.fromJson(value);
        case 'SetDefaultLevelsRequest':
          return SetDefaultLevelsRequest.fromJson(value);
        case 'SetDefaultPriorityRequest':
          return SetDefaultPriorityRequest.fromJson(value);
        case 'SetDefaultResolutionRequest':
          return SetDefaultResolutionRequest.fromJson(value);
        case 'SharePermission':
          return SharePermission.fromJson(value);
        case 'SharePermissionInputBean':
          return SharePermissionInputBean.fromJson(value);
        case 'SimpleApplicationPropertyBean':
          return SimpleApplicationPropertyBean.fromJson(value);
        case 'SimpleErrorCollection':
          return SimpleErrorCollection.fromJson(value);
        case 'SimpleLink':
          return SimpleLink.fromJson(value);
        case 'SimpleListWrapperApplicationRole':
          return SimpleListWrapperApplicationRole.fromJson(value);
        case 'SimpleListWrapperGroupName':
          return SimpleListWrapperGroupName.fromJson(value);
        case 'SimplifiedHierarchyLevel':
          return SimplifiedHierarchyLevel.fromJson(value);
        case 'SimplifiedIssueTransition':
          return SimplifiedIssueTransition.fromJson(value);
        case 'SingleRedactionRequest':
          return SingleRedactionRequest.fromJson(value);
        case 'SingleRedactionResponse':
          return SingleRedactionResponse.fromJson(value);
        case 'SoftwareNavigationInfo':
          return SoftwareNavigationInfo.fromJson(value);
        case 'Status':
          return Status.fromJson(value);
        case 'StatusCategory':
          return StatusCategory.fromJson(value);
        case 'StatusCreate':
          return StatusCreate.fromJson(value);
        case 'StatusCreateRequest':
          return StatusCreateRequest.fromJson(value);
        case 'StatusDetails':
          return StatusDetails.fromJson(value);
        case 'StatusLayoutUpdate':
          return StatusLayoutUpdate.fromJson(value);
        case 'StatusMapping':
          return StatusMapping.fromJson(value);
        case 'StatusMappingDTO':
          return StatusMappingDTO.fromJson(value);
        case 'StatusMetadata':
          return StatusMetadata.fromJson(value);
        case 'StatusMigration':
          return StatusMigration.fromJson(value);
        case 'StatusPayload':
          return StatusPayload.fromJson(value);
        case 'StatusProjectIssueTypeUsage':
          return StatusProjectIssueTypeUsage.fromJson(value);
        case 'StatusProjectIssueTypeUsageDTO':
          return StatusProjectIssueTypeUsageDTO.fromJson(value);
        case 'StatusProjectIssueTypeUsagePage':
          return StatusProjectIssueTypeUsagePage.fromJson(value);
        case 'StatusProjectUsage':
          return StatusProjectUsage.fromJson(value);
        case 'StatusProjectUsageDTO':
          return StatusProjectUsageDTO.fromJson(value);
        case 'StatusProjectUsagePage':
          return StatusProjectUsagePage.fromJson(value);
        case 'StatusScope':
          return StatusScope.fromJson(value);
        case 'StatusUpdate':
          return StatusUpdate.fromJson(value);
        case 'StatusUpdateRequest':
          return StatusUpdateRequest.fromJson(value);
        case 'StatusWorkflowUsageDTO':
          return StatusWorkflowUsageDTO.fromJson(value);
        case 'StatusWorkflowUsagePage':
          return StatusWorkflowUsagePage.fromJson(value);
        case 'StatusWorkflowUsageWorkflow':
          return StatusWorkflowUsageWorkflow.fromJson(value);
        case 'StatusesPerWorkflow':
          return StatusesPerWorkflow.fromJson(value);
        case 'SubmittedBulkOperation':
          return SubmittedBulkOperation.fromJson(value);
        case 'SuccessOrErrorResults':
          return SuccessOrErrorResults.fromJson(value);
        case 'SuggestedIssue':
          return SuggestedIssue.fromJson(value);
        case 'SuggestedMappingsForPrioritiesRequestBean':
          return SuggestedMappingsForPrioritiesRequestBean.fromJson(value);
        case 'SuggestedMappingsForProjectsRequestBean':
          return SuggestedMappingsForProjectsRequestBean.fromJson(value);
        case 'SuggestedMappingsRequestBean':
          return SuggestedMappingsRequestBean.fromJson(value);
        case 'SwimlanePayload':
          return SwimlanePayload.fromJson(value);
        case 'SwimlanesPayload':
          return SwimlanesPayload.fromJson(value);
        case 'SystemAvatars':
          return SystemAvatars.fromJson(value);
        case 'TabPayload':
          return TabPayload.fromJson(value);
        case 'TargetClassification':
          return TargetClassification.fromJson(value);
        case 'TargetMandatoryFields':
          return TargetMandatoryFields.fromJson(value);
        case 'TargetStatus':
          return TargetStatus.fromJson(value);
        case 'TargetToSourcesMapping':
          return TargetToSourcesMapping.fromJson(value);
        case 'TaskProgress':
          return TaskProgress.fromJson(value);
        case 'TaskProgressBeanJsonNode':
          return TaskProgressBeanJsonNode.fromJson(value);
        case 'TaskProgressBeanObject':
          return TaskProgressBeanObject.fromJson(value);
        case 'TaskProgressBeanRemoveOptionFromIssuesResult':
          return TaskProgressBeanRemoveOptionFromIssuesResult.fromJson(value);
        case 'TimeTrackingConfiguration':
          return TimeTrackingConfiguration.fromJson(value);
        case 'TimeTrackingDetails':
          return TimeTrackingDetails.fromJson(value);
        case 'TimeTrackingProvider':
          return TimeTrackingProvider.fromJson(value);
        case 'ToLayoutPayload':
          return ToLayoutPayload.fromJson(value);
        case 'Transition':
          return Transition.fromJson(value);
        case 'TransitionLink':
          return TransitionLink.fromJson(value);
        case 'TransitionPayload':
          return TransitionPayload.fromJson(value);
        case 'TransitionPreview':
          return TransitionPreview.fromJson(value);
        case 'TransitionScreenDetails':
          return TransitionScreenDetails.fromJson(value);
        case 'TransitionUpdateDTO':
          return TransitionUpdateDTO.fromJson(value);
        case 'Transitions':
          return Transitions.fromJson(value);
        case 'UiModificationContextDetails':
          return UiModificationContextDetails.fromJson(value);
        case 'UiModificationDetails':
          return UiModificationDetails.fromJson(value);
        case 'UiModificationIdentifiers':
          return UiModificationIdentifiers.fromJson(value);
        case 'UnrestrictedUserEmail':
          return UnrestrictedUserEmail.fromJson(value);
        case 'UpdateCustomFieldDetails':
          return UpdateCustomFieldDetails.fromJson(value);
        case 'UpdateDefaultProjectClassificationBean':
          return UpdateDefaultProjectClassificationBean.fromJson(value);
        case 'UpdateDefaultScreenScheme':
          return UpdateDefaultScreenScheme.fromJson(value);
        case 'UpdateFieldAssociationSchemeLinksBean':
          return UpdateFieldAssociationSchemeLinksBean.fromJson(value);
        case 'UpdateFieldAssociationSchemeRequest':
          return UpdateFieldAssociationSchemeRequest.fromJson(value);
        case 'UpdateFieldAssociationSchemeResponse':
          return UpdateFieldAssociationSchemeResponse.fromJson(value);
        case 'UpdateFieldAssociationsRequestItem':
          return UpdateFieldAssociationsRequestItem.fromJson(value);
        case 'UpdateFieldConfigurationSchemeDetails':
          return UpdateFieldConfigurationSchemeDetails.fromJson(value);
        case 'UpdateFieldSchemeParametersPartialFailure':
          return UpdateFieldSchemeParametersPartialFailure.fromJson(value);
        case 'UpdateFieldSchemeParametersRequest':
          return UpdateFieldSchemeParametersRequest.fromJson(value);
        case 'UpdateFieldSchemeParametersResponse':
          return UpdateFieldSchemeParametersResponse.fromJson(value);
        case 'UpdateIssueSecurityLevelDetails':
          return UpdateIssueSecurityLevelDetails.fromJson(value);
        case 'UpdateIssueSecuritySchemeRequestBean':
          return UpdateIssueSecuritySchemeRequestBean.fromJson(value);
        case 'UpdateNotificationSchemeDetails':
          return UpdateNotificationSchemeDetails.fromJson(value);
        case 'UpdatePrioritiesInSchemeRequestBean':
          return UpdatePrioritiesInSchemeRequestBean.fromJson(value);
        case 'UpdatePriorityDetails':
          return UpdatePriorityDetails.fromJson(value);
        case 'UpdatePrioritySchemeRequestBean':
          return UpdatePrioritySchemeRequestBean.fromJson(value);
        case 'UpdatePrioritySchemeResponseBean':
          return UpdatePrioritySchemeResponseBean.fromJson(value);
        case 'UpdateProjectDetails':
          return UpdateProjectDetails.fromJson(value);
        case 'UpdateProjectsInSchemeRequestBean':
          return UpdateProjectsInSchemeRequestBean.fromJson(value);
        case 'UpdateResolutionDetails':
          return UpdateResolutionDetails.fromJson(value);
        case 'UpdateScreenDetails':
          return UpdateScreenDetails.fromJson(value);
        case 'UpdateScreenSchemeDetails':
          return UpdateScreenSchemeDetails.fromJson(value);
        case 'UpdateScreenTypes':
          return UpdateScreenTypes.fromJson(value);
        case 'UpdateUiModificationDetails':
          return UpdateUiModificationDetails.fromJson(value);
        case 'UpdateUserToGroupBean':
          return UpdateUserToGroupBean.fromJson(value);
        case 'UpdatedProjectCategory':
          return UpdatedProjectCategory.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'UserBean':
          return UserBean.fromJson(value);
        case 'UserBeanAvatarUrls':
          return UserBeanAvatarUrls.fromJson(value);
        case 'UserColumnRequestBody':
          return UserColumnRequestBody.fromJson(value);
        case 'UserContextVariable':
          return UserContextVariable.fromJson(value);
        case 'UserDetails':
          return UserDetails.fromJson(value);
        case 'UserFilter':
          return UserFilter.fromJson(value);
        case 'UserKey':
          return UserKey.fromJson(value);
        case 'UserList':
          return UserList.fromJson(value);
        case 'UserMigrationBean':
          return UserMigrationBean.fromJson(value);
        case 'UserPermission':
          return UserPermission.fromJson(value);
        case 'UserPickerUser':
          return UserPickerUser.fromJson(value);
        case 'ValidationOptionsForCreate':
          return ValidationOptionsForCreate.fromJson(value);
        case 'ValidationOptionsForUpdate':
          return ValidationOptionsForUpdate.fromJson(value);
        case 'ValueOperand':
          return ValueOperand.fromJson(value);
        case 'Version':
          return Version.fromJson(value);
        case 'VersionApprover':
          return VersionApprover.fromJson(value);
        case 'VersionIssueCounts':
          return VersionIssueCounts.fromJson(value);
        case 'VersionIssuesStatus':
          return VersionIssuesStatus.fromJson(value);
        case 'VersionMoveBean':
          return VersionMoveBean.fromJson(value);
        case 'VersionRelatedWork':
          return VersionRelatedWork.fromJson(value);
        case 'VersionUnresolvedIssuesCount':
          return VersionUnresolvedIssuesCount.fromJson(value);
        case 'VersionUsageInCustomField':
          return VersionUsageInCustomField.fromJson(value);
        case 'Visibility':
          return Visibility.fromJson(value);
        case 'Votes':
          return Votes.fromJson(value);
        case 'WarningCollection':
          return WarningCollection.fromJson(value);
        case 'Watchers':
          return Watchers.fromJson(value);
        case 'Webhook':
          return Webhook.fromJson(value);
        case 'WebhookDetails':
          return WebhookDetails.fromJson(value);
        case 'WebhookRegistrationDetails':
          return WebhookRegistrationDetails.fromJson(value);
        case 'WebhooksExpirationDate':
          return WebhooksExpirationDate.fromJson(value);
        case 'WorkManagementNavigationInfo':
          return WorkManagementNavigationInfo.fromJson(value);
        case 'WorkTypeParameters':
          return WorkTypeParameters.fromJson(value);
        case 'Workflow':
          return Workflow.fromJson(value);
        case 'WorkflowAssociationStatusMapping':
          return WorkflowAssociationStatusMapping.fromJson(value);
        case 'WorkflowCapabilities':
          return WorkflowCapabilities.fromJson(value);
        case 'WorkflowCapabilityPayload':
          return WorkflowCapabilityPayload.fromJson(value);
        case 'WorkflowCompoundCondition':
          return WorkflowCompoundCondition.fromJson(value);
        case 'WorkflowCondition':
          return WorkflowCondition.fromJson(value);
        case 'WorkflowCreate':
          return WorkflowCreate.fromJson(value);
        case 'WorkflowCreateRequest':
          return WorkflowCreateRequest.fromJson(value);
        case 'WorkflowCreateResponse':
          return WorkflowCreateResponse.fromJson(value);
        case 'WorkflowCreateValidateRequest':
          return WorkflowCreateValidateRequest.fromJson(value);
        case 'WorkflowDocumentDTO':
          return WorkflowDocumentDTO.fromJson(value);
        case 'WorkflowDocumentStatusDTO':
          return WorkflowDocumentStatusDTO.fromJson(value);
        case 'WorkflowDocumentVersionBean':
          return WorkflowDocumentVersionBean.fromJson(value);
        case 'WorkflowElementReference':
          return WorkflowElementReference.fromJson(value);
        case 'WorkflowHistoryItemDTO':
          return WorkflowHistoryItemDTO.fromJson(value);
        case 'WorkflowHistoryListRequest':
          return WorkflowHistoryListRequest.fromJson(value);
        case 'WorkflowHistoryListResponseDTO':
          return WorkflowHistoryListResponseDTO.fromJson(value);
        case 'WorkflowHistoryReadRequest':
          return WorkflowHistoryReadRequest.fromJson(value);
        case 'WorkflowHistoryReadResponseDTO':
          return WorkflowHistoryReadResponseDTO.fromJson(value);
        case 'WorkflowId':
          return WorkflowId.fromJson(value);
        case 'WorkflowLayout':
          return WorkflowLayout.fromJson(value);
        case 'WorkflowMetadataAndIssueTypeRestModel':
          return WorkflowMetadataAndIssueTypeRestModel.fromJson(value);
        case 'WorkflowMetadataRestModel':
          return WorkflowMetadataRestModel.fromJson(value);
        case 'WorkflowOperations':
          return WorkflowOperations.fromJson(value);
        case 'WorkflowPayload':
          return WorkflowPayload.fromJson(value);
        case 'WorkflowPreview':
          return WorkflowPreview.fromJson(value);
        case 'WorkflowPreviewLayout':
          return WorkflowPreviewLayout.fromJson(value);
        case 'WorkflowPreviewRequest':
          return WorkflowPreviewRequest.fromJson(value);
        case 'WorkflowPreviewResponse':
          return WorkflowPreviewResponse.fromJson(value);
        case 'WorkflowPreviewScope':
          return WorkflowPreviewScope.fromJson(value);
        case 'WorkflowPreviewStatus':
          return WorkflowPreviewStatus.fromJson(value);
        case 'WorkflowProjectIdScope':
          return WorkflowProjectIdScope.fromJson(value);
        case 'WorkflowProjectIssueTypeUsage':
          return WorkflowProjectIssueTypeUsage.fromJson(value);
        case 'WorkflowProjectIssueTypeUsageDTO':
          return WorkflowProjectIssueTypeUsageDTO.fromJson(value);
        case 'WorkflowProjectIssueTypeUsagePage':
          return WorkflowProjectIssueTypeUsagePage.fromJson(value);
        case 'WorkflowProjectUsageDTO':
          return WorkflowProjectUsageDTO.fromJson(value);
        case 'WorkflowReadRequest':
          return WorkflowReadRequest.fromJson(value);
        case 'WorkflowReadResponse':
          return WorkflowReadResponse.fromJson(value);
        case 'WorkflowReferenceStatus':
          return WorkflowReferenceStatus.fromJson(value);
        case 'WorkflowRuleConfiguration':
          return WorkflowRuleConfiguration.fromJson(value);
        case 'WorkflowRules':
          return WorkflowRules.fromJson(value);
        case 'WorkflowRulesSearch':
          return WorkflowRulesSearch.fromJson(value);
        case 'WorkflowRulesSearchDetails':
          return WorkflowRulesSearchDetails.fromJson(value);
        case 'WorkflowScheme':
          return WorkflowScheme.fromJson(value);
        case 'WorkflowSchemeAssociation':
          return WorkflowSchemeAssociation.fromJson(value);
        case 'WorkflowSchemeAssociations':
          return WorkflowSchemeAssociations.fromJson(value);
        case 'WorkflowSchemeIdName':
          return WorkflowSchemeIdName.fromJson(value);
        case 'WorkflowSchemePayload':
          return WorkflowSchemePayload.fromJson(value);
        case 'WorkflowSchemeProjectAssociation':
          return WorkflowSchemeProjectAssociation.fromJson(value);
        case 'WorkflowSchemeProjectSwitchBean':
          return WorkflowSchemeProjectSwitchBean.fromJson(value);
        case 'WorkflowSchemeProjectUsageDTO':
          return WorkflowSchemeProjectUsageDTO.fromJson(value);
        case 'WorkflowSchemeReadRequest':
          return WorkflowSchemeReadRequest.fromJson(value);
        case 'WorkflowSchemeReadResponse':
          return WorkflowSchemeReadResponse.fromJson(value);
        case 'WorkflowSchemeUpdateRequest':
          return WorkflowSchemeUpdateRequest.fromJson(value);
        case 'WorkflowSchemeUpdateRequiredMappingsRequest':
          return WorkflowSchemeUpdateRequiredMappingsRequest.fromJson(value);
        case 'WorkflowSchemeUpdateRequiredMappingsResponse':
          return WorkflowSchemeUpdateRequiredMappingsResponse.fromJson(value);
        case 'WorkflowSchemeUsage':
          return WorkflowSchemeUsage.fromJson(value);
        case 'WorkflowSchemeUsageDTO':
          return WorkflowSchemeUsageDTO.fromJson(value);
        case 'WorkflowSchemeUsagePage':
          return WorkflowSchemeUsagePage.fromJson(value);
        case 'WorkflowScope':
          return WorkflowScope.fromJson(value);
        case 'WorkflowSearchResponse':
          return WorkflowSearchResponse.fromJson(value);
        case 'WorkflowSimpleCondition':
          return WorkflowSimpleCondition.fromJson(value);
        case 'WorkflowStatus':
          return WorkflowStatus.fromJson(value);
        case 'WorkflowStatusLayout':
          return WorkflowStatusLayout.fromJson(value);
        case 'WorkflowStatusLayoutPayload':
          return WorkflowStatusLayoutPayload.fromJson(value);
        case 'WorkflowStatusPayload':
          return WorkflowStatusPayload.fromJson(value);
        case 'WorkflowStatusUpdate':
          return WorkflowStatusUpdate.fromJson(value);
        case 'WorkflowTransition':
          return WorkflowTransition.fromJson(value);
        case 'WorkflowTransitionLinks':
          return WorkflowTransitionLinks.fromJson(value);
        case 'WorkflowTransitionRule':
          return WorkflowTransitionRule.fromJson(value);
        case 'WorkflowTransitionRules':
          return WorkflowTransitionRules.fromJson(value);
        case 'WorkflowTransitionRulesDetails':
          return WorkflowTransitionRulesDetails.fromJson(value);
        case 'WorkflowTransitionRulesUpdate':
          return WorkflowTransitionRulesUpdate.fromJson(value);
        case 'WorkflowTransitionRulesUpdateErrorDetails':
          return WorkflowTransitionRulesUpdateErrorDetails.fromJson(value);
        case 'WorkflowTransitionRulesUpdateErrors':
          return WorkflowTransitionRulesUpdateErrors.fromJson(value);
        case 'WorkflowTransitions':
          return WorkflowTransitions.fromJson(value);
        case 'WorkflowTrigger':
          return WorkflowTrigger.fromJson(value);
        case 'WorkflowUpdate':
          return WorkflowUpdate.fromJson(value);
        case 'WorkflowUpdateRequest':
          return WorkflowUpdateRequest.fromJson(value);
        case 'WorkflowUpdateResponse':
          return WorkflowUpdateResponse.fromJson(value);
        case 'WorkflowUpdateValidateRequestBean':
          return WorkflowUpdateValidateRequestBean.fromJson(value);
        case 'WorkflowValidationError':
          return WorkflowValidationError.fromJson(value);
        case 'WorkflowValidationErrorList':
          return WorkflowValidationErrorList.fromJson(value);
        case 'WorkflowsWithTransitionRulesDetails':
          return WorkflowsWithTransitionRulesDetails.fromJson(value);
        case 'WorkingDaysConfig':
          return WorkingDaysConfig.fromJson(value);
        case 'Worklog':
          return Worklog.fromJson(value);
        case 'WorklogCompositeKey':
          return WorklogCompositeKey.fromJson(value);
        case 'WorklogIdsRequestBean':
          return WorklogIdsRequestBean.fromJson(value);
        case 'WorklogKeyResult':
          return WorklogKeyResult.fromJson(value);
        case 'WorklogsMoveRequestBean':
          return WorklogsMoveRequestBean.fromJson(value);
        case 'WorkspaceDataPolicy':
          return WorkspaceDataPolicy.fromJson(value);
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
