// Hand-written, unlike everything under lib/. The generator is told not to write
// here (see .openapi-generator-ignore), so this survives regeneration.

import 'dart:convert';

import 'package:confluence_api/api.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:test/test.dart';

/// The whole `/wiki/api/v2` prefix belongs in the base path: this spec's paths
/// are relative to its declared server, unlike the Jira specs whose paths are
/// absolute from the site root.
const _basePath = 'https://example.atlassian.net/wiki/api/v2';

({ApiClient client, List<BaseRequest> requests}) stubbed(Object body, {int status = 200}) {
  final requests = <BaseRequest>[];
  final client = ApiClient(
    basePath: _basePath,
    authentication: HttpBasicAuth(username: 'me@example.com', password: 'token-123'),
  );
  client.client = MockClient((request) async {
    requests.add(request);
    return Response(jsonEncode(body), status, headers: {'content-type': 'application/json'});
  });
  return (client: client, requests: requests);
}

void main() {
  group('request construction', () {
    test('sends basic auth and keeps the /wiki/api/v2 prefix', () async {
      final stub = stubbed({'results': <Object>[]});
      await SpaceApi(stub.client).getSpaces();

      final request = stub.requests.single;
      expect(request.url.toString(), startsWith('$_basePath/spaces'));
      expect(request.headers['Authorization'], startsWith('Basic '));
    });

    test('puts a path parameter in the path, not the query', () async {
      final stub = stubbed({'id': '123'});
      await PageApi(stub.client).getPageById(123);

      expect(stub.requests.single.url.path, endsWith('/wiki/api/v2/pages/123'));
      expect(stub.requests.single.url.queryParameters, isNot(contains('id')));
    });

    test('asks for the body format the app renders', () async {
      // The app reads pages as ADF so AdfRenderer can consume them unchanged.
      // If this parameter stopped being sent, Confluence would answer with
      // storage XHTML and every page would fail to render.
      final stub = stubbed({'id': '123'});
      await PageApi(stub.client).getPageById(123, bodyFormat: PrimaryBodyRepresentationSingle.atlasDocFormat);

      expect(stub.requests.single.url.queryParameters['body-format'], 'atlas_doc_format');
    });
  });

  group('deserialisation', () {
    test('reads a page and its ADF body', () async {
      final stub = stubbed({
        'id': '190942862',
        'title': 'EyeTV for Android',
        'spaceId': '190942859',
        'version': {'number': 7, 'createdAt': '2014-05-09T10:00:00.000Z', 'message': 'tidied up'},
        'body': {
          'atlas_doc_format': {
            'representation': 'atlas_doc_format',
            // Confluence sends ADF as a JSON *string*, not as an object.
            'value': '{"type":"doc","version":1,"content":[]}',
          },
        },
      });

      final page = await PageApi(stub.client).getPageById(190942862);

      expect(page, isNotNull);
      expect(page!.title, 'EyeTV for Android');
      expect(page.version?.number, 7);
      expect(page.body?.atlasDocFormat?.representation, 'atlas_doc_format');
      expect(jsonDecode(page.body!.atlasDocFormat!.value!), containsPair('type', 'doc'));
    });

    test('tolerates fields the spec does not describe', () async {
      // Atlassian adds response fields without a spec update; an unknown one
      // must be ignored rather than throw.
      final stub = stubbed({'id': '1', 'title': 'x', 'somethingNewAtlassianAdded': true});

      expect(await PageApi(stub.client).getPageById(1), isNotNull);
    });
  });

  group('the scalar-union fixup did not change the wire format', () {
    // The response typing a map's values as `anyOf` two strings made the
    // generator emit a class with no properties and no `==` body, which would
    // not parse. It is collapsed to the type both branches share — so a custom
    // content type, the reason the union existed, still has to survive.
    test('a built-in and a custom content type both round-trip', () {
      final response = ContentIdToContentTypeResponse.fromJson({
        'results': {'123': 'page', '456': 'my-custom-type'},
      });

      expect(response!.results['123'], 'page');
      expect(response.results['456'], 'my-custom-type');
      expect(response.toJson()['results'], {'123': 'page', '456': 'my-custom-type'});
    });
  });

  group('errors', () {
    test('surfaces a non-2xx as ApiException carrying the status', () async {
      final stub = stubbed({'errors': <Object>[]}, status: 404);
      await expectLater(
        PageApi(stub.client).getPageById(999),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 404)),
      );
    });

    test('a 401 is distinguishable, since it means the token was rejected', () async {
      final stub = stubbed({'errors': <Object>[]}, status: 401);
      await expectLater(
        SpaceApi(stub.client).getSpaces(),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 401)),
      );
    });
  });
}
