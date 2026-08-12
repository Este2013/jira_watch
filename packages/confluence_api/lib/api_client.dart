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
  ApiClient({this.basePath = 'https://no-default/wiki/api/v2', this.authentication,});

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
        case 'AbstractPageLinks':
          return AbstractPageLinks.fromJson(value);
        case 'AccountStatus':
          return AccountStatusTypeTransformer().decode(value);
        case 'AccountType':
          return AccountTypeTypeTransformer().decode(value);
        case 'AdminKeyResponse':
          return AdminKeyResponse.fromJson(value);
        case 'Ancestor':
          return Ancestor.fromJson(value);
        case 'AncestorType':
          return AncestorTypeTypeTransformer().decode(value);
        case 'AttachmentBulk':
          return AttachmentBulk.fromJson(value);
        case 'AttachmentCommentModel':
          return AttachmentCommentModel.fromJson(value);
        case 'AttachmentLinks':
          return AttachmentLinks.fromJson(value);
        case 'AttachmentSingle':
          return AttachmentSingle.fromJson(value);
        case 'AttachmentSingleLabels':
          return AttachmentSingleLabels.fromJson(value);
        case 'AttachmentSingleOperations':
          return AttachmentSingleOperations.fromJson(value);
        case 'AttachmentSingleProperties':
          return AttachmentSingleProperties.fromJson(value);
        case 'AttachmentSingleVersions':
          return AttachmentSingleVersions.fromJson(value);
        case 'AttachmentSortOrder':
          return AttachmentSortOrderTypeTransformer().decode(value);
        case 'AttachmentVersion':
          return AttachmentVersion.fromJson(value);
        case 'BlogPostBodyWrite':
          return BlogPostBodyWrite.fromJson(value);
        case 'BlogPostBulk':
          return BlogPostBulk.fromJson(value);
        case 'BlogPostCommentModel':
          return BlogPostCommentModel.fromJson(value);
        case 'BlogPostContentStatus':
          return BlogPostContentStatusTypeTransformer().decode(value);
        case 'BlogPostInlineCommentModel':
          return BlogPostInlineCommentModel.fromJson(value);
        case 'BlogPostNestedBodyWrite':
          return BlogPostNestedBodyWrite.fromJson(value);
        case 'BlogPostSingle':
          return BlogPostSingle.fromJson(value);
        case 'BlogPostSingleLikes':
          return BlogPostSingleLikes.fromJson(value);
        case 'BlogPostSortOrder':
          return BlogPostSortOrderTypeTransformer().decode(value);
        case 'BlogPostVersion':
          return BlogPostVersion.fromJson(value);
        case 'BodyBulk':
          return BodyBulk.fromJson(value);
        case 'BodySingle':
          return BodySingle.fromJson(value);
        case 'BodyType':
          return BodyType.fromJson(value);
        case 'BulkAssignRolesRequest':
          return BulkAssignRolesRequest.fromJson(value);
        case 'BulkRemoveAccessRequest':
          return BulkRemoveAccessRequest.fromJson(value);
        case 'BulkTransitionCombinationEntry':
          return BulkTransitionCombinationEntry.fromJson(value);
        case 'BulkTransitionDecodedPermission':
          return BulkTransitionDecodedPermission.fromJson(value);
        case 'BulkTransitionPrincipalTypeAssignment':
          return BulkTransitionPrincipalTypeAssignment.fromJson(value);
        case 'BulkTransitionRoleAssignment':
          return BulkTransitionRoleAssignment.fromJson(value);
        case 'BulkTransitionSpaceSelection':
          return BulkTransitionSpaceSelection.fromJson(value);
        case 'BulkTransitionSpaceTarget':
          return BulkTransitionSpaceTarget.fromJson(value);
        case 'BulkTransitionTaskResponse':
          return BulkTransitionTaskResponse.fromJson(value);
        case 'BulkTransitionTaskStatusResponse':
          return BulkTransitionTaskStatusResponse.fromJson(value);
        case 'CheckAccessByEmail200Response':
          return CheckAccessByEmail200Response.fromJson(value);
        case 'CheckAccessByEmailRequest':
          return CheckAccessByEmailRequest.fromJson(value);
        case 'ChildCustomContent':
          return ChildCustomContent.fromJson(value);
        case 'ChildCustomContentSortOrder':
          return ChildCustomContentSortOrderTypeTransformer().decode(value);
        case 'ChildPage':
          return ChildPage.fromJson(value);
        case 'ChildPageSortOrder':
          return ChildPageSortOrderTypeTransformer().decode(value);
        case 'ChildrenCommentModel':
          return ChildrenCommentModel.fromJson(value);
        case 'ChildrenResponse':
          return ChildrenResponse.fromJson(value);
        case 'ClassificationLevel':
          return ClassificationLevel.fromJson(value);
        case 'ClassificationLevelColor':
          return ClassificationLevelColorTypeTransformer().decode(value);
        case 'ClassificationLevelStatus':
          return ClassificationLevelStatusTypeTransformer().decode(value);
        case 'CommentBodyWrite':
          return CommentBodyWrite.fromJson(value);
        case 'CommentLinks':
          return CommentLinks.fromJson(value);
        case 'CommentNestedBodyWrite':
          return CommentNestedBodyWrite.fromJson(value);
        case 'CommentSortOrder':
          return CommentSortOrderTypeTransformer().decode(value);
        case 'CommentVersion':
          return CommentVersion.fromJson(value);
        case 'ContentIdToContentTypeResponse':
          return ContentIdToContentTypeResponse.fromJson(value);
        case 'ContentProperty':
          return ContentProperty.fromJson(value);
        case 'ContentPropertyCreateRequest':
          return ContentPropertyCreateRequest.fromJson(value);
        case 'ContentPropertySortOrder':
          return ContentPropertySortOrderTypeTransformer().decode(value);
        case 'ContentPropertyUpdateRequest':
          return ContentPropertyUpdateRequest.fromJson(value);
        case 'ContentPropertyUpdateRequestVersion':
          return ContentPropertyUpdateRequestVersion.fromJson(value);
        case 'ContentSortOrder':
          return ContentSortOrderTypeTransformer().decode(value);
        case 'ContentStatus':
          return ContentStatusTypeTransformer().decode(value);
        case 'ConvertContentIdsToContentTypesRequest':
          return ConvertContentIdsToContentTypesRequest.fromJson(value);
        case 'CreateBlogPost200Response':
          return CreateBlogPost200Response.fromJson(value);
        case 'CreateBlogPostRequest':
          return CreateBlogPostRequest.fromJson(value);
        case 'CreateBlogPostRequestBody':
          return CreateBlogPostRequestBody.fromJson(value);
        case 'CreateBulkUserLookupRequest':
          return CreateBulkUserLookupRequest.fromJson(value);
        case 'CreateCustomContent201Response':
          return CreateCustomContent201Response.fromJson(value);
        case 'CreateCustomContentRequest':
          return CreateCustomContentRequest.fromJson(value);
        case 'CreateCustomContentRequestBody':
          return CreateCustomContentRequestBody.fromJson(value);
        case 'CreateDatabase200Response':
          return CreateDatabase200Response.fromJson(value);
        case 'CreateDatabaseRequest':
          return CreateDatabaseRequest.fromJson(value);
        case 'CreateFolder200Response':
          return CreateFolder200Response.fromJson(value);
        case 'CreateFolderRequest':
          return CreateFolderRequest.fromJson(value);
        case 'CreateFooterComment201Response':
          return CreateFooterComment201Response.fromJson(value);
        case 'CreateFooterCommentModel':
          return CreateFooterCommentModel.fromJson(value);
        case 'CreateFooterCommentModelBody':
          return CreateFooterCommentModelBody.fromJson(value);
        case 'CreateInlineComment201Response':
          return CreateInlineComment201Response.fromJson(value);
        case 'CreateInlineCommentModel':
          return CreateInlineCommentModel.fromJson(value);
        case 'CreateInlineCommentModelInlineCommentProperties':
          return CreateInlineCommentModelInlineCommentProperties.fromJson(value);
        case 'CreatePage200Response':
          return CreatePage200Response.fromJson(value);
        case 'CreatePageRequest':
          return CreatePageRequest.fromJson(value);
        case 'CreatePageRequestBody':
          return CreatePageRequestBody.fromJson(value);
        case 'CreateSmartLink200Response':
          return CreateSmartLink200Response.fromJson(value);
        case 'CreateSmartLinkRequest':
          return CreateSmartLinkRequest.fromJson(value);
        case 'CreateSpace201Response':
          return CreateSpace201Response.fromJson(value);
        case 'CreateSpaceRequest':
          return CreateSpaceRequest.fromJson(value);
        case 'CreateSpaceRequestDescription':
          return CreateSpaceRequestDescription.fromJson(value);
        case 'CreateSpaceRequestRoleAssignmentsInner':
          return CreateSpaceRequestRoleAssignmentsInner.fromJson(value);
        case 'CreateSpaceRoleRequest':
          return CreateSpaceRoleRequest.fromJson(value);
        case 'CreateWhiteboard200Response':
          return CreateWhiteboard200Response.fromJson(value);
        case 'CreateWhiteboardRequest':
          return CreateWhiteboardRequest.fromJson(value);
        case 'CustomContentBodyBulk':
          return CustomContentBodyBulk.fromJson(value);
        case 'CustomContentBodyRepresentation':
          return CustomContentBodyRepresentationTypeTransformer().decode(value);
        case 'CustomContentBodyRepresentationSingle':
          return CustomContentBodyRepresentationSingleTypeTransformer().decode(value);
        case 'CustomContentBodySingle':
          return CustomContentBodySingle.fromJson(value);
        case 'CustomContentBodyWrite':
          return CustomContentBodyWrite.fromJson(value);
        case 'CustomContentBulk':
          return CustomContentBulk.fromJson(value);
        case 'CustomContentCommentModel':
          return CustomContentCommentModel.fromJson(value);
        case 'CustomContentLinks':
          return CustomContentLinks.fromJson(value);
        case 'CustomContentNestedBodyWrite':
          return CustomContentNestedBodyWrite.fromJson(value);
        case 'CustomContentSingle':
          return CustomContentSingle.fromJson(value);
        case 'CustomContentSortOrder':
          return CustomContentSortOrderTypeTransformer().decode(value);
        case 'CustomContentVersion':
          return CustomContentVersion.fromJson(value);
        case 'DataPolicyMetadata':
          return DataPolicyMetadata.fromJson(value);
        case 'DataPolicySpace':
          return DataPolicySpace.fromJson(value);
        case 'DataPolicySpaceDataPolicy':
          return DataPolicySpaceDataPolicy.fromJson(value);
        case 'DatabaseLinks':
          return DatabaseLinks.fromJson(value);
        case 'DatabaseSingle':
          return DatabaseSingle.fromJson(value);
        case 'DeleteSpaceRoleResponse':
          return DeleteSpaceRoleResponse.fromJson(value);
        case 'DescendantsResponse':
          return DescendantsResponse.fromJson(value);
        case 'DetailedVersion':
          return DetailedVersion.fromJson(value);
        case 'EnableAdminKeyRequest':
          return EnableAdminKeyRequest.fromJson(value);
        case 'FolderLinks':
          return FolderLinks.fromJson(value);
        case 'FolderSingle':
          return FolderSingle.fromJson(value);
        case 'FooterCommentModel':
          return FooterCommentModel.fromJson(value);
        case 'GetAttachmentById200Response':
          return GetAttachmentById200Response.fromJson(value);
        case 'GetAttachmentById200ResponseAllOfLinks':
          return GetAttachmentById200ResponseAllOfLinks.fromJson(value);
        case 'GetForgeAppProperty200Response':
          return GetForgeAppProperty200Response.fromJson(value);
        case 'GetSpaceById200Response':
          return GetSpaceById200Response.fromJson(value);
        case 'GetSpaceRoleMode200Response':
          return GetSpaceRoleMode200Response.fromJson(value);
        case 'GetSpaceRolesById200Response':
          return GetSpaceRolesById200Response.fromJson(value);
        case 'Icon':
          return Icon.fromJson(value);
        case 'InlineCommentChildrenModel':
          return InlineCommentChildrenModel.fromJson(value);
        case 'InlineCommentModel':
          return InlineCommentModel.fromJson(value);
        case 'InlineCommentModelProperties':
          return InlineCommentModelProperties.fromJson(value);
        case 'InlineCommentProperties':
          return InlineCommentProperties.fromJson(value);
        case 'InlineCommentResolutionStatus':
          return InlineCommentResolutionStatusTypeTransformer().decode(value);
        case 'Integer':
          return Integer.fromJson(value);
        case 'Label':
          return Label.fromJson(value);
        case 'LabelSortOrder':
          return LabelSortOrderTypeTransformer().decode(value);
        case 'Like':
          return Like.fromJson(value);
        case 'ListSpacePermissionCombinationsResponse':
          return ListSpacePermissionCombinationsResponse.fromJson(value);
        case 'MultiEntityLinks':
          return MultiEntityLinks.fromJson(value);
        case 'MultiEntityResultAncestor':
          return MultiEntityResultAncestor.fromJson(value);
        case 'MultiEntityResultAncestor1':
          return MultiEntityResultAncestor1.fromJson(value);
        case 'MultiEntityResultAppProperty':
          return MultiEntityResultAppProperty.fromJson(value);
        case 'MultiEntityResultAppPropertyResultsInner':
          return MultiEntityResultAppPropertyResultsInner.fromJson(value);
        case 'MultiEntityResultAttachment':
          return MultiEntityResultAttachment.fromJson(value);
        case 'MultiEntityResultAttachmentCommentModel':
          return MultiEntityResultAttachmentCommentModel.fromJson(value);
        case 'MultiEntityResultBlogPost':
          return MultiEntityResultBlogPost.fromJson(value);
        case 'MultiEntityResultBlogPostCommentModel':
          return MultiEntityResultBlogPostCommentModel.fromJson(value);
        case 'MultiEntityResultBlogPostInlineCommentModel':
          return MultiEntityResultBlogPostInlineCommentModel.fromJson(value);
        case 'MultiEntityResultChildCustomContent':
          return MultiEntityResultChildCustomContent.fromJson(value);
        case 'MultiEntityResultChildPage':
          return MultiEntityResultChildPage.fromJson(value);
        case 'MultiEntityResultChildrenCommentModel':
          return MultiEntityResultChildrenCommentModel.fromJson(value);
        case 'MultiEntityResultChildrenResponse':
          return MultiEntityResultChildrenResponse.fromJson(value);
        case 'MultiEntityResultContentProperty':
          return MultiEntityResultContentProperty.fromJson(value);
        case 'MultiEntityResultCustomContent':
          return MultiEntityResultCustomContent.fromJson(value);
        case 'MultiEntityResultCustomContentCommentModel':
          return MultiEntityResultCustomContentCommentModel.fromJson(value);
        case 'MultiEntityResultDataPolicySpace':
          return MultiEntityResultDataPolicySpace.fromJson(value);
        case 'MultiEntityResultDescendantsResponse':
          return MultiEntityResultDescendantsResponse.fromJson(value);
        case 'MultiEntityResultFooterCommentModel':
          return MultiEntityResultFooterCommentModel.fromJson(value);
        case 'MultiEntityResultInlineCommentChildrenModel':
          return MultiEntityResultInlineCommentChildrenModel.fromJson(value);
        case 'MultiEntityResultInlineCommentModel':
          return MultiEntityResultInlineCommentModel.fromJson(value);
        case 'MultiEntityResultLabel':
          return MultiEntityResultLabel.fromJson(value);
        case 'MultiEntityResultPage':
          return MultiEntityResultPage.fromJson(value);
        case 'MultiEntityResultPageCommentModel':
          return MultiEntityResultPageCommentModel.fromJson(value);
        case 'MultiEntityResultPageInlineCommentModel':
          return MultiEntityResultPageInlineCommentModel.fromJson(value);
        case 'MultiEntityResultSpace':
          return MultiEntityResultSpace.fromJson(value);
        case 'MultiEntityResultSpacePermission':
          return MultiEntityResultSpacePermission.fromJson(value);
        case 'MultiEntityResultSpacePermissionAssignment':
          return MultiEntityResultSpacePermissionAssignment.fromJson(value);
        case 'MultiEntityResultSpaceProperty':
          return MultiEntityResultSpaceProperty.fromJson(value);
        case 'MultiEntityResultSpaceRole':
          return MultiEntityResultSpaceRole.fromJson(value);
        case 'MultiEntityResultSpaceRoleAssignment':
          return MultiEntityResultSpaceRoleAssignment.fromJson(value);
        case 'MultiEntityResultString':
          return MultiEntityResultString.fromJson(value);
        case 'MultiEntityResultTask':
          return MultiEntityResultTask.fromJson(value);
        case 'MultiEntityResultUser':
          return MultiEntityResultUser.fromJson(value);
        case 'MultiEntityResultVersion':
          return MultiEntityResultVersion.fromJson(value);
        case 'MultiEntityResultVersion1':
          return MultiEntityResultVersion1.fromJson(value);
        case 'MultiEntityResultVersion2':
          return MultiEntityResultVersion2.fromJson(value);
        case 'MultiEntityResultVersion3':
          return MultiEntityResultVersion3.fromJson(value);
        case 'MultiEntityResultVersion4':
          return MultiEntityResultVersion4.fromJson(value);
        case 'OnlyArchivedAndCurrentContentStatus':
          return OnlyArchivedAndCurrentContentStatusTypeTransformer().decode(value);
        case 'Operation':
          return Operation.fromJson(value);
        case 'OptionalFieldLinks':
          return OptionalFieldLinks.fromJson(value);
        case 'OptionalFieldMeta':
          return OptionalFieldMeta.fromJson(value);
        case 'PageBodyWrite':
          return PageBodyWrite.fromJson(value);
        case 'PageBulk':
          return PageBulk.fromJson(value);
        case 'PageCommentModel':
          return PageCommentModel.fromJson(value);
        case 'PageInlineCommentModel':
          return PageInlineCommentModel.fromJson(value);
        case 'PageNestedBodyWrite':
          return PageNestedBodyWrite.fromJson(value);
        case 'PageSingle':
          return PageSingle.fromJson(value);
        case 'PageSortOrder':
          return PageSortOrderTypeTransformer().decode(value);
        case 'PageVersion':
          return PageVersion.fromJson(value);
        case 'ParentContentType':
          return ParentContentTypeTypeTransformer().decode(value);
        case 'PermittedOperationsResponse':
          return PermittedOperationsResponse.fromJson(value);
        case 'PostPageClassificationLevelRequest':
          return PostPageClassificationLevelRequest.fromJson(value);
        case 'PostRedactPageRequest':
          return PostRedactPageRequest.fromJson(value);
        case 'PostRedactPageRequestBody':
          return PostRedactPageRequestBody.fromJson(value);
        case 'PostWhiteboardClassificationLevelRequest':
          return PostWhiteboardClassificationLevelRequest.fromJson(value);
        case 'PrimaryBodyRepresentation':
          return PrimaryBodyRepresentationTypeTransformer().decode(value);
        case 'PrimaryBodyRepresentationSingle':
          return PrimaryBodyRepresentationSingleTypeTransformer().decode(value);
        case 'Principal':
          return Principal.fromJson(value);
        case 'PrincipalType':
          return PrincipalTypeTypeTransformer().decode(value);
        case 'PutPageClassificationLevelRequest':
          return PutPageClassificationLevelRequest.fromJson(value);
        case 'PutSpaceDefaultClassificationLevelRequest':
          return PutSpaceDefaultClassificationLevelRequest.fromJson(value);
        case 'PutWhiteboardClassificationLevelRequest':
          return PutWhiteboardClassificationLevelRequest.fromJson(value);
        case 'Redaction':
          return Redaction.fromJson(value);
        case 'RedactionPointer':
          return RedactionPointer.fromJson(value);
        case 'RedactionPointerResponse':
          return RedactionPointerResponse.fromJson(value);
        case 'RedactionResponse':
          return RedactionResponse.fromJson(value);
        case 'RedactionSectionResponse':
          return RedactionSectionResponse.fromJson(value);
        case 'RoleType':
          return RoleTypeTypeTransformer().decode(value);
        case 'SetSpaceRoleAssignmentsRequestInner':
          return SetSpaceRoleAssignmentsRequestInner.fromJson(value);
        case 'SmartLinkLinks':
          return SmartLinkLinks.fromJson(value);
        case 'SmartLinkSingle':
          return SmartLinkSingle.fromJson(value);
        case 'SpaceBulk':
          return SpaceBulk.fromJson(value);
        case 'SpaceDescription':
          return SpaceDescription.fromJson(value);
        case 'SpaceDescriptionBodyRepresentation':
          return SpaceDescriptionBodyRepresentationTypeTransformer().decode(value);
        case 'SpaceIcon':
          return SpaceIcon.fromJson(value);
        case 'SpaceLinks':
          return SpaceLinks.fromJson(value);
        case 'SpacePermission':
          return SpacePermission.fromJson(value);
        case 'SpacePermissionAssignment':
          return SpacePermissionAssignment.fromJson(value);
        case 'SpacePermissionAssignmentOperation':
          return SpacePermissionAssignmentOperation.fromJson(value);
        case 'SpacePermissionAssignmentPrincipal':
          return SpacePermissionAssignmentPrincipal.fromJson(value);
        case 'SpaceProperty':
          return SpaceProperty.fromJson(value);
        case 'SpacePropertyCreateRequest':
          return SpacePropertyCreateRequest.fromJson(value);
        case 'SpacePropertyUpdateRequest':
          return SpacePropertyUpdateRequest.fromJson(value);
        case 'SpacePropertyVersion':
          return SpacePropertyVersion.fromJson(value);
        case 'SpaceRole':
          return SpaceRole.fromJson(value);
        case 'SpaceRoleAssignment':
          return SpaceRoleAssignment.fromJson(value);
        case 'SpaceSingle':
          return SpaceSingle.fromJson(value);
        case 'SpaceSinglePermissions':
          return SpaceSinglePermissions.fromJson(value);
        case 'SpaceSingleProperties':
          return SpaceSingleProperties.fromJson(value);
        case 'SpaceSortOrder':
          return SpaceSortOrderTypeTransformer().decode(value);
        case 'SpaceStatus':
          return SpaceStatusTypeTransformer().decode(value);
        case 'SpaceType':
          return SpaceTypeTypeTransformer().decode(value);
        case 'Task':
          return Task.fromJson(value);
        case 'TaskBodySingle':
          return TaskBodySingle.fromJson(value);
        case 'UpdateBlogPostRequest':
          return UpdateBlogPostRequest.fromJson(value);
        case 'UpdateBlogPostRequestVersion':
          return UpdateBlogPostRequestVersion.fromJson(value);
        case 'UpdateCustomContentRequest':
          return UpdateCustomContentRequest.fromJson(value);
        case 'UpdateCustomContentRequestVersion':
          return UpdateCustomContentRequestVersion.fromJson(value);
        case 'UpdateFooterCommentModel':
          return UpdateFooterCommentModel.fromJson(value);
        case 'UpdateFooterCommentModelVersion':
          return UpdateFooterCommentModelVersion.fromJson(value);
        case 'UpdateFooterCommentRequest':
          return UpdateFooterCommentRequest.fromJson(value);
        case 'UpdateInlineCommentModel':
          return UpdateInlineCommentModel.fromJson(value);
        case 'UpdatePageRequest':
          return UpdatePageRequest.fromJson(value);
        case 'UpdatePageRequestVersion':
          return UpdatePageRequestVersion.fromJson(value);
        case 'UpdatePageTitleRequest':
          return UpdatePageTitleRequest.fromJson(value);
        case 'UpdateSpaceRoleRequest':
          return UpdateSpaceRoleRequest.fromJson(value);
        case 'UpdateSpaceRoleResponse':
          return UpdateSpaceRoleResponse.fromJson(value);
        case 'UpdateTaskRequest':
          return UpdateTaskRequest.fromJson(value);
        case 'User':
          return User.fromJson(value);
        case 'Version':
          return Version.fromJson(value);
        case 'VersionSortOrder':
          return VersionSortOrderTypeTransformer().decode(value);
        case 'VersionedEntity':
          return VersionedEntity.fromJson(value);
        case 'WhiteboardLinks':
          return WhiteboardLinks.fromJson(value);
        case 'WhiteboardSingle':
          return WhiteboardSingle.fromJson(value);
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
