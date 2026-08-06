//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WorkflowTransitionRulesApi {
  WorkflowTransitionRulesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete workflow transition rule configurations
  ///
  /// Deletes workflow transition rules from one or more workflows. These rule types are supported:   *  [post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/)  *  [conditions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-condition/)  *  [validators](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-validator/)  Only rules created by the calling Connect app can be deleted.  **Note:** The `draft` parameter in the request body WorkflowId is deprecated and will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).  **[Permissions](#permissions) required:** Only Connect apps can use this operation.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowsWithTransitionRulesDetails] workflowsWithTransitionRulesDetails (required):
  Future<Response> deleteWorkflowTransitionRuleConfigurationsWithHttpInfo(WorkflowsWithTransitionRulesDetails workflowsWithTransitionRulesDetails, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/rule/config/delete';

    // ignore: prefer_final_locals
    Object? postBody = workflowsWithTransitionRulesDetails;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Delete workflow transition rule configurations
  ///
  /// Deletes workflow transition rules from one or more workflows. These rule types are supported:   *  [post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/)  *  [conditions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-condition/)  *  [validators](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-validator/)  Only rules created by the calling Connect app can be deleted.  **Note:** The `draft` parameter in the request body WorkflowId is deprecated and will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).  **[Permissions](#permissions) required:** Only Connect apps can use this operation.
  ///
  /// Parameters:
  ///
  /// * [WorkflowsWithTransitionRulesDetails] workflowsWithTransitionRulesDetails (required):
  Future<WorkflowTransitionRulesUpdateErrors?> deleteWorkflowTransitionRuleConfigurations(WorkflowsWithTransitionRulesDetails workflowsWithTransitionRulesDetails, { Future<void>? abortTrigger, }) async {
    final response = await deleteWorkflowTransitionRuleConfigurationsWithHttpInfo(workflowsWithTransitionRulesDetails, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowTransitionRulesUpdateErrors',) as WorkflowTransitionRulesUpdateErrors;
    
    }
    return null;
  }

  /// Get workflow transition rule configurations
  ///
  /// Returns a [paginated](#pagination) list of workflows with transition rules. The workflows can be filtered to return only those containing workflow transition rules:   *  of one or more transition rule types, such as [workflow post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/).  *  matching one or more transition rule keys.  Only workflows containing transition rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app are returned.  Due to server-side optimizations, workflows with an empty list of rules may be returned; these workflows can be ignored.  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [List<String>] types (required):
  ///   The types of the transition rules to return.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] keys:
  ///   The transition rule class keys, as defined in the Connect or the Forge app descriptor, of the transition rules to return.
  ///
  /// * [List<String>] workflowNames:
  ///   The list of workflow names to filter by.
  ///
  /// * [List<String>] withTags:
  ///   The list of `tags` to filter by.
  ///
  /// * [bool] draft:
  ///   **Deprecated:** Whether draft or published workflows are returned. If not provided, both workflow types are returned. The 'draft' parameter will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts `transition`, which, for each rule, returns information about the transition the rule is assigned to.
  Future<Response> getWorkflowTransitionRuleConfigurationsWithHttpInfo(List<String> types, { int? startAt, int? maxResults, List<String>? keys, List<String>? workflowNames, List<String>? withTags, bool? draft, String? expand, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/rule/config';

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
      queryParams.addAll(_queryParams('multi', 'types', types));
    if (keys != null) {
      queryParams.addAll(_queryParams('multi', 'keys', keys));
    }
    if (workflowNames != null) {
      queryParams.addAll(_queryParams('multi', 'workflowNames', workflowNames));
    }
    if (withTags != null) {
      queryParams.addAll(_queryParams('multi', 'withTags', withTags));
    }
    if (draft != null) {
      queryParams.addAll(_queryParams('', 'draft', draft));
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

  /// Get workflow transition rule configurations
  ///
  /// Returns a [paginated](#pagination) list of workflows with transition rules. The workflows can be filtered to return only those containing workflow transition rules:   *  of one or more transition rule types, such as [workflow post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/).  *  matching one or more transition rule keys.  Only workflows containing transition rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app are returned.  Due to server-side optimizations, workflows with an empty list of rules may be returned; these workflows can be ignored.  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.
  ///
  /// Parameters:
  ///
  /// * [List<String>] types (required):
  ///   The types of the transition rules to return.
  ///
  /// * [int] startAt:
  ///   The index of the first item to return in a page of results (page offset).
  ///
  /// * [int] maxResults:
  ///   The maximum number of items to return per page.
  ///
  /// * [List<String>] keys:
  ///   The transition rule class keys, as defined in the Connect or the Forge app descriptor, of the transition rules to return.
  ///
  /// * [List<String>] workflowNames:
  ///   The list of workflow names to filter by.
  ///
  /// * [List<String>] withTags:
  ///   The list of `tags` to filter by.
  ///
  /// * [bool] draft:
  ///   **Deprecated:** Whether draft or published workflows are returned. If not provided, both workflow types are returned. The 'draft' parameter will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).
  ///
  /// * [String] expand:
  ///   Use [expand](#expansion) to include additional information in the response. This parameter accepts `transition`, which, for each rule, returns information about the transition the rule is assigned to.
  Future<PageBeanWorkflowTransitionRules?> getWorkflowTransitionRuleConfigurations(List<String> types, { int? startAt, int? maxResults, List<String>? keys, List<String>? workflowNames, List<String>? withTags, bool? draft, String? expand, Future<void>? abortTrigger, }) async {
    final response = await getWorkflowTransitionRuleConfigurationsWithHttpInfo(types, startAt: startAt, maxResults: maxResults, keys: keys, workflowNames: workflowNames, withTags: withTags, draft: draft, expand: expand, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'PageBeanWorkflowTransitionRules',) as PageBeanWorkflowTransitionRules;
    
    }
    return null;
  }

  /// Update workflow transition rule configurations
  ///
  /// Updates configuration of workflow transition rules. The following rule types are supported:   *  [post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/)  *  [conditions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-condition/)  *  [validators](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-validator/)  Only rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app can be updated.  To assist with app migration, this operation can be used to:   *  Disable a rule.  *  Add a `tag`. Use this to filter rules in the [Get workflow transition rule configurations](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflow-transition-rules/#api-rest-api-3-workflow-rule-config-get).  Rules are enabled if the `disabled` parameter is not provided.  **Note:** The `draft` parameter in the request body WorkflowId is deprecated and will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [WorkflowTransitionRulesUpdate] workflowTransitionRulesUpdate (required):
  Future<Response> updateWorkflowTransitionRuleConfigurationsWithHttpInfo(WorkflowTransitionRulesUpdate workflowTransitionRulesUpdate, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/workflow/rule/config';

    // ignore: prefer_final_locals
    Object? postBody = workflowTransitionRulesUpdate;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


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

  /// Update workflow transition rule configurations
  ///
  /// Updates configuration of workflow transition rules. The following rule types are supported:   *  [post functions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-post-function/)  *  [conditions](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-condition/)  *  [validators](https://developer.atlassian.com/cloud/jira/platform/modules/workflow-validator/)  Only rules created by the calling [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) app can be updated.  To assist with app migration, this operation can be used to:   *  Disable a rule.  *  Add a `tag`. Use this to filter rules in the [Get workflow transition rule configurations](https://developer.atlassian.com/cloud/jira/platform/rest/v3/api-group-workflow-transition-rules/#api-rest-api-3-workflow-rule-config-get).  Rules are enabled if the `disabled` parameter is not provided.  **Note:** The `draft` parameter in the request body WorkflowId is deprecated and will be removed from this API on [November 2, 2026](https://developer.atlassian.com/cloud/jira/platform/changelog/#CHANGE-3147).  **[Permissions](#permissions) required:** Only [Connect](https://developer.atlassian.com/cloud/jira/platform/index/#connect-apps) or [Forge](https://developer.atlassian.com/cloud/jira/platform/index/#forge-apps) apps can use this operation.
  ///
  /// Parameters:
  ///
  /// * [WorkflowTransitionRulesUpdate] workflowTransitionRulesUpdate (required):
  Future<WorkflowTransitionRulesUpdateErrors?> updateWorkflowTransitionRuleConfigurations(WorkflowTransitionRulesUpdate workflowTransitionRulesUpdate, { Future<void>? abortTrigger, }) async {
    final response = await updateWorkflowTransitionRuleConfigurationsWithHttpInfo(workflowTransitionRulesUpdate, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'WorkflowTransitionRulesUpdateErrors',) as WorkflowTransitionRulesUpdateErrors;
    
    }
    return null;
  }
}
