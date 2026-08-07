//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class IssueAttachmentsApi {
  IssueAttachmentsApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Add attachment
  ///
  /// Adds one or more attachments to an issue. Attachments are posted as multipart/form-data ([RFC 1867](https://www.ietf.org/rfc/rfc1867.txt)).  Note that:   *  The request must have a `X-Atlassian-Token: no-check` header, if not it is blocked. See [Special headers](#special-request-headers) for more information.  *  The name of the multipart/form-data parameter that contains the attachments must be `file`.  The following examples upload a file called *myfile.txt* to the issue *TEST-123*:  #### curl ####      curl --location --request POST 'https://your-domain.atlassian.net/rest/api/3/issue/TEST-123/attachments'      -u 'email@example.com:<api_token>'      -H 'X-Atlassian-Token: no-check'      --form 'file=@\"myfile.txt\"'  #### Node.js ####      // This code sample uses the 'node-fetch' and 'form-data' libraries:      // https://www.npmjs.com/package/node-fetch      // https://www.npmjs.com/package/form-data      const fetch = require('node-fetch');      const FormData = require('form-data');      const fs = require('fs');           const filePath = 'myfile.txt';      const form = new FormData();      const stats = fs.statSync(filePath);      const fileSizeInBytes = stats.size;      const fileStream = fs.createReadStream(filePath);           form.append('file', fileStream, {knownLength: fileSizeInBytes});           fetch('https://your-domain.atlassian.net/rest/api/3/issue/TEST-123/attachments', {          method: 'POST',          body: form,          headers: {              'Authorization': `Basic ${Buffer.from(                  'email@example.com:'              ).toString('base64')}`,              'Accept': 'application/json',              'X-Atlassian-Token': 'no-check'          }      })          .then(response => {              console.log(                  `Response: ${response.status} ${response.statusText}`              );              return response.text();          })          .then(text => console.log(text))          .catch(err => console.error(err));  #### Java ####      // This code sample uses the  'Unirest' library:      // http://unirest.io/java.html      HttpResponse response = Unirest.post(\"https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments\")              .basicAuth(\"email@example.com\", \"\")              .header(\"Accept\", \"application/json\")              .header(\"X-Atlassian-Token\", \"no-check\")              .field(\"file\", new File(\"myfile.txt\"))              .asJson();                   System.out.println(response.getBody());  #### Python ####      # This code sample uses the 'requests' library:      # http://docs.python-requests.org      import requests      from requests.auth import HTTPBasicAuth      import json           url = \"https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments\"           auth = HTTPBasicAuth(\"email@example.com\", \"\")           headers = {         \"Accept\": \"application/json\",         \"X-Atlassian-Token\": \"no-check\"      }           response = requests.request(         \"POST\",         url,         headers = headers,         auth = auth,         files = {              \"file\": (\"myfile.txt\", open(\"myfile.txt\",\"rb\"), \"application-type\")         }      )           print(json.dumps(json.loads(response.text), sort_keys=True, indent=4, separators=(\",\", \": \")))  #### PHP ####      // This code sample uses the 'Unirest' library:      // http://unirest.io/php.html      Unirest\\Request::auth('email@example.com', '');           $headers = array(        'Accept' => 'application/json',        'X-Atlassian-Token' => 'no-check'      );           $parameters = array(        'file' => File::add('myfile.txt')      );           $response = Unirest\\Request::post(        'https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments',        $headers,        $parameters      );           var_dump($response)  #### Forge ####      // This sample uses Atlassian Forge and the `form-data` library.      // https://developer.atlassian.com/platform/forge/      // https://www.npmjs.com/package/form-data      import api from \"@forge/api\";      import FormData from \"form-data\";           const form = new FormData();      form.append('file', fileStream, {knownLength: fileSizeInBytes});           const response = await api.asApp().requestJira('/rest/api/2/issue/{issueIdOrKey}/attachments', {          method: 'POST',          body: form,          headers: {              'Accept': 'application/json',              'X-Atlassian-Token': 'no-check'          }      });           console.log(`Response: ${response.status} ${response.statusText}`);      console.log(await response.json());  Tip: Use a client library. Many client libraries have classes for handling multipart POST operations. For example, in Java, the Apache HTTP Components library provides a [MultiPartEntity](http://hc.apache.org/httpcomponents-client-ga/httpmime/apidocs/org/apache/http/entity/mime/MultipartEntity.html) class for multipart POST operations.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**    *  *Browse Projects* and *Create attachments* [ project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue that attachments are added to.
  Future<Response> addAttachmentWithHttpInfo(String issueIdOrKey, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/issue/{issueIdOrKey}/attachments'
      .replaceAll('{issueIdOrKey}', issueIdOrKey);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['multipart/form-data'];

    bool hasFields = false;
    final mp = MultipartRequest('POST', Uri.parse(path));
    if (hasFields) {
      postBody = mp;
    }

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

  /// Add attachment
  ///
  /// Adds one or more attachments to an issue. Attachments are posted as multipart/form-data ([RFC 1867](https://www.ietf.org/rfc/rfc1867.txt)).  Note that:   *  The request must have a `X-Atlassian-Token: no-check` header, if not it is blocked. See [Special headers](#special-request-headers) for more information.  *  The name of the multipart/form-data parameter that contains the attachments must be `file`.  The following examples upload a file called *myfile.txt* to the issue *TEST-123*:  #### curl ####      curl --location --request POST 'https://your-domain.atlassian.net/rest/api/3/issue/TEST-123/attachments'      -u 'email@example.com:<api_token>'      -H 'X-Atlassian-Token: no-check'      --form 'file=@\"myfile.txt\"'  #### Node.js ####      // This code sample uses the 'node-fetch' and 'form-data' libraries:      // https://www.npmjs.com/package/node-fetch      // https://www.npmjs.com/package/form-data      const fetch = require('node-fetch');      const FormData = require('form-data');      const fs = require('fs');           const filePath = 'myfile.txt';      const form = new FormData();      const stats = fs.statSync(filePath);      const fileSizeInBytes = stats.size;      const fileStream = fs.createReadStream(filePath);           form.append('file', fileStream, {knownLength: fileSizeInBytes});           fetch('https://your-domain.atlassian.net/rest/api/3/issue/TEST-123/attachments', {          method: 'POST',          body: form,          headers: {              'Authorization': `Basic ${Buffer.from(                  'email@example.com:'              ).toString('base64')}`,              'Accept': 'application/json',              'X-Atlassian-Token': 'no-check'          }      })          .then(response => {              console.log(                  `Response: ${response.status} ${response.statusText}`              );              return response.text();          })          .then(text => console.log(text))          .catch(err => console.error(err));  #### Java ####      // This code sample uses the  'Unirest' library:      // http://unirest.io/java.html      HttpResponse response = Unirest.post(\"https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments\")              .basicAuth(\"email@example.com\", \"\")              .header(\"Accept\", \"application/json\")              .header(\"X-Atlassian-Token\", \"no-check\")              .field(\"file\", new File(\"myfile.txt\"))              .asJson();                   System.out.println(response.getBody());  #### Python ####      # This code sample uses the 'requests' library:      # http://docs.python-requests.org      import requests      from requests.auth import HTTPBasicAuth      import json           url = \"https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments\"           auth = HTTPBasicAuth(\"email@example.com\", \"\")           headers = {         \"Accept\": \"application/json\",         \"X-Atlassian-Token\": \"no-check\"      }           response = requests.request(         \"POST\",         url,         headers = headers,         auth = auth,         files = {              \"file\": (\"myfile.txt\", open(\"myfile.txt\",\"rb\"), \"application-type\")         }      )           print(json.dumps(json.loads(response.text), sort_keys=True, indent=4, separators=(\",\", \": \")))  #### PHP ####      // This code sample uses the 'Unirest' library:      // http://unirest.io/php.html      Unirest\\Request::auth('email@example.com', '');           $headers = array(        'Accept' => 'application/json',        'X-Atlassian-Token' => 'no-check'      );           $parameters = array(        'file' => File::add('myfile.txt')      );           $response = Unirest\\Request::post(        'https://your-domain.atlassian.net/rest/api/2/issue/{issueIdOrKey}/attachments',        $headers,        $parameters      );           var_dump($response)  #### Forge ####      // This sample uses Atlassian Forge and the `form-data` library.      // https://developer.atlassian.com/platform/forge/      // https://www.npmjs.com/package/form-data      import api from \"@forge/api\";      import FormData from \"form-data\";           const form = new FormData();      form.append('file', fileStream, {knownLength: fileSizeInBytes});           const response = await api.asApp().requestJira('/rest/api/2/issue/{issueIdOrKey}/attachments', {          method: 'POST',          body: form,          headers: {              'Accept': 'application/json',              'X-Atlassian-Token': 'no-check'          }      });           console.log(`Response: ${response.status} ${response.statusText}`);      console.log(await response.json());  Tip: Use a client library. Many client libraries have classes for handling multipart POST operations. For example, in Java, the Apache HTTP Components library provides a [MultiPartEntity](http://hc.apache.org/httpcomponents-client-ga/httpmime/apidocs/org/apache/http/entity/mime/MultipartEntity.html) class for multipart POST operations.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**    *  *Browse Projects* and *Create attachments* [ project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.
  ///
  /// Parameters:
  ///
  /// * [String] issueIdOrKey (required):
  ///   The ID or key of the issue that attachments are added to.
  Future<List<Attachment>?> addAttachment(String issueIdOrKey, { Future<void>? abortTrigger, }) async {
    final response = await addAttachmentWithHttpInfo(issueIdOrKey, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      final responseBody = await _decodeBodyBytes(response);
      return (await apiClient.deserializeAsync(responseBody, 'List<Attachment>') as List)
        .cast<Attachment>()
        .toList(growable: false);

    }
    return null;
  }

  /// Get all metadata for an expanded attachment
  ///
  /// Returns the metadata for the contents of an attachment, if it is an archive, and metadata for the attachment itself. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned and metadata for the ZIP archive. Currently, only the ZIP archive format is supported.  Use this operation to retrieve data that is presented to the user, as this operation returns the metadata for the attachment itself, such as the attachment's ID and name. Otherwise, use [ Get contents metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-raw-get), which only returns the metadata for the attachment's contents.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<Response> expandAttachmentForHumansWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/{id}/expand/human'
      .replaceAll('{id}', id);

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

  /// Get all metadata for an expanded attachment
  ///
  /// Returns the metadata for the contents of an attachment, if it is an archive, and metadata for the attachment itself. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned and metadata for the ZIP archive. Currently, only the ZIP archive format is supported.  Use this operation to retrieve data that is presented to the user, as this operation returns the metadata for the attachment itself, such as the attachment's ID and name. Otherwise, use [ Get contents metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-raw-get), which only returns the metadata for the attachment's contents.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<AttachmentArchiveMetadataReadable?> expandAttachmentForHumans(String id, { Future<void>? abortTrigger, }) async {
    final response = await expandAttachmentForHumansWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AttachmentArchiveMetadataReadable',) as AttachmentArchiveMetadataReadable;
    
    }
    return null;
  }

  /// Get contents metadata for an expanded attachment
  ///
  /// Returns the metadata for the contents of an attachment, if it is an archive. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned. Currently, only the ZIP archive format is supported.  Use this operation if you are processing the data without presenting it to the user, as this operation only returns the metadata for the contents of the attachment. Otherwise, to retrieve data to present to the user, use [ Get all metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-human-get) which also returns the metadata for the attachment itself, such as the attachment's ID and name.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<Response> expandAttachmentForMachinesWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/{id}/expand/raw'
      .replaceAll('{id}', id);

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

  /// Get contents metadata for an expanded attachment
  ///
  /// Returns the metadata for the contents of an attachment, if it is an archive. For example, if the attachment is a ZIP archive, then information about the files in the archive is returned. Currently, only the ZIP archive format is supported.  Use this operation if you are processing the data without presenting it to the user, as this operation only returns the metadata for the contents of the attachment. Otherwise, to retrieve data to present to the user, use [ Get all metadata for an expanded attachment](#api-rest-api-3-attachment-id-expand-human-get) which also returns the metadata for the attachment itself, such as the attachment's ID and name.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<AttachmentArchiveImpl?> expandAttachmentForMachines(String id, { Future<void>? abortTrigger, }) async {
    final response = await expandAttachmentForMachinesWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AttachmentArchiveImpl',) as AttachmentArchiveImpl;
    
    }
    return null;
  }

  /// Get attachment metadata
  ///
  /// Returns the metadata for an attachment. Note that the attachment itself is not returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<Response> getAttachmentWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/{id}'
      .replaceAll('{id}', id);

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

  /// Get attachment metadata
  ///
  /// Returns the metadata for an attachment. Note that the attachment itself is not returned.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:**   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<AttachmentMetadata?> getAttachment(String id, { Future<void>? abortTrigger, }) async {
    final response = await getAttachmentWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AttachmentMetadata',) as AttachmentMetadata;
    
    }
    return null;
  }

  /// Get attachment content
  ///
  /// Returns the contents of an attachment. A `Range` header can be set to define a range of bytes within the attachment to download. See the [HTTP Range header standard](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range) for details.  To return a thumbnail of the attachment, use [Get attachment thumbnail](#api-rest-api-3-attachment-thumbnail-id-get).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  ///
  /// * [bool] redirect:
  ///   Whether a redirect is provided for the attachment download. Clients that do not automatically follow redirects can set this to `false` to avoid making multiple requests to download the attachment.
  Future<Response> getAttachmentContentWithHttpInfo(String id, { bool? redirect, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/content/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (redirect != null) {
      queryParams.addAll(_queryParams('', 'redirect', redirect));
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

  /// Get attachment content
  ///
  /// Returns the contents of an attachment. A `Range` header can be set to define a range of bytes within the attachment to download. See the [HTTP Range header standard](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Range) for details.  To return a thumbnail of the attachment, use [Get attachment thumbnail](#api-rest-api-3-attachment-thumbnail-id-get).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  ///
  /// * [bool] redirect:
  ///   Whether a redirect is provided for the attachment download. Clients that do not automatically follow redirects can set this to `false` to avoid making multiple requests to download the attachment.
  Future<void> getAttachmentContent(String id, { bool? redirect, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentContentWithHttpInfo(id, redirect: redirect, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get Jira attachment settings
  ///
  /// Returns the attachment settings, that is, whether attachments are enabled and the maximum attachment size allowed.  Note that there are also [project permissions](https://confluence.atlassian.com/x/yodKLg) that restrict whether users can create and delete attachments.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  ///
  /// Note: This method returns the HTTP [Response].
  Future<Response> getAttachmentMetaWithHttpInfo({ Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/meta';

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

  /// Get Jira attachment settings
  ///
  /// Returns the attachment settings, that is, whether attachments are enabled and the maximum attachment size allowed.  Note that there are also [project permissions](https://confluence.atlassian.com/x/yodKLg) that restrict whether users can create and delete attachments.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** None.
  Future<AttachmentSettings?> getAttachmentMeta({ Future<void>? abortTrigger, }) async {
    final response = await getAttachmentMetaWithHttpInfo(abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'AttachmentSettings',) as AttachmentSettings;
    
    }
    return null;
  }

  /// Get attachment thumbnail
  ///
  /// Returns the thumbnail of an attachment.  To return the attachment contents, use [Get attachment content](#api-rest-api-3-attachment-content-id-get).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  ///
  /// * [bool] redirect:
  ///   Whether a redirect is provided for the attachment download. Clients that do not automatically follow redirects can set this to `false` to avoid making multiple requests to download the attachment.
  ///
  /// * [bool] fallbackToDefault:
  ///   Whether a default thumbnail is returned when the requested thumbnail is not found.
  ///
  /// * [int] width:
  ///   The maximum width to scale the thumbnail to.
  ///
  /// * [int] height:
  ///   The maximum height to scale the thumbnail to.
  Future<Response> getAttachmentThumbnailWithHttpInfo(String id, { bool? redirect, bool? fallbackToDefault, int? width, int? height, Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/thumbnail/{id}'
      .replaceAll('{id}', id);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (redirect != null) {
      queryParams.addAll(_queryParams('', 'redirect', redirect));
    }
    if (fallbackToDefault != null) {
      queryParams.addAll(_queryParams('', 'fallbackToDefault', fallbackToDefault));
    }
    if (width != null) {
      queryParams.addAll(_queryParams('', 'width', width));
    }
    if (height != null) {
      queryParams.addAll(_queryParams('', 'height', height));
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

  /// Get attachment thumbnail
  ///
  /// Returns the thumbnail of an attachment.  To return the attachment contents, use [Get attachment content](#api-rest-api-3-attachment-content-id-get).  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the issue containing the attachment:   *  *Browse projects* [project permission](https://confluence.atlassian.com/x/yodKLg) for the project that the issue is in.  *  If [issue-level security](https://confluence.atlassian.com/x/J4lKLg) is configured, issue-level security permission to view the issue.  *  If attachments are added in private comments, the comment-level restriction will be applied.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  ///
  /// * [bool] redirect:
  ///   Whether a redirect is provided for the attachment download. Clients that do not automatically follow redirects can set this to `false` to avoid making multiple requests to download the attachment.
  ///
  /// * [bool] fallbackToDefault:
  ///   Whether a default thumbnail is returned when the requested thumbnail is not found.
  ///
  /// * [int] width:
  ///   The maximum width to scale the thumbnail to.
  ///
  /// * [int] height:
  ///   The maximum height to scale the thumbnail to.
  Future<void> getAttachmentThumbnail(String id, { bool? redirect, bool? fallbackToDefault, int? width, int? height, Future<void>? abortTrigger, }) async {
    final response = await getAttachmentThumbnailWithHttpInfo(id, redirect: redirect, fallbackToDefault: fallbackToDefault, width: width, height: height, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Delete attachment
  ///
  /// Deletes an attachment from an issue.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the project holding the issue containing the attachment:   *  *Delete own attachments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete an attachment created by the calling user.  *  *Delete all attachments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete an attachment created by any user.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<Response> removeAttachmentWithHttpInfo(String id, { Future<void>? abortTrigger, }) async {
    // ignore: prefer_const_declarations
    final path = r'/rest/api/3/attachment/{id}'
      .replaceAll('{id}', id);

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

  /// Delete attachment
  ///
  /// Deletes an attachment from an issue.  This operation can be accessed anonymously.  **[Permissions](#permissions) required:** For the project holding the issue containing the attachment:   *  *Delete own attachments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete an attachment created by the calling user.  *  *Delete all attachments* [project permission](https://confluence.atlassian.com/x/yodKLg) to delete an attachment created by any user.
  ///
  /// Parameters:
  ///
  /// * [String] id (required):
  ///   The ID of the attachment.
  Future<void> removeAttachment(String id, { Future<void>? abortTrigger, }) async {
    final response = await removeAttachmentWithHttpInfo(id, abortTrigger: abortTrigger,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
