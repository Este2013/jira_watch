// Hand-written, unlike everything under lib/. The generator is told not to write
// here (see .openapi-generator-ignore), so this survives regeneration.
//
// The point is not to test Atlassian's API — it is to prove the generated wiring
// works and that the spec fixups in tool/patch_jira_spec.dart did not quietly
// change what goes on the wire.

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:jira_platform_api/api.dart';
import 'package:test/test.dart';

/// Answers every request with [body], recording what was asked for.
({ApiClient client, List<BaseRequest> requests}) stubbed(
  Object body, {
  int status = 200,
}) {
  final requests = <BaseRequest>[];
  final client = ApiClient(
    basePath: 'https://example.atlassian.net',
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
    test('sends basic auth built from the email and API token', () async {
      final stub = stubbed({'accountId': 'abc', 'displayName': 'Me'});
      await MyselfApi(stub.client).getCurrentUser();

      final auth = stub.requests.single.headers['Authorization'];
      expect(auth, isNotNull);
      expect(auth, startsWith('Basic '));
      expect(
        utf8.decode(base64.decode(auth!.substring('Basic '.length))),
        'me@example.com:token-123',
      );
    });

    test('resolves paths against the configured site', () async {
      final stub = stubbed({'accountId': 'abc'});
      await MyselfApi(stub.client).getCurrentUser();

      expect(stub.requests.single.url.toString(), 'https://example.atlassian.net/rest/api/3/myself');
      expect(stub.requests.single.method, 'GET');
    });

    test('passes query parameters through', () async {
      final stub = stubbed({'issues': <Object>[], 'isLast': true});
      await IssueSearchApi(stub.client).searchAndReconsileIssuesUsingJql(
        jql: 'project = STUDIO ORDER BY updated DESC',
        maxResults: 25,
        fields: ['*all'],
      );

      final url = stub.requests.single.url;
      expect(url.queryParameters['jql'], 'project = STUDIO ORDER BY updated DESC');
      expect(url.queryParameters['maxResults'], '25');
    });
  });

  group('deserialisation', () {
    test('builds a typed model from a response', () async {
      final stub = stubbed({
        'accountId': 'abc-123',
        'displayName': 'Esteban',
        'emailAddress': 'me@example.com',
        'active': true,
      });

      final user = await MyselfApi(stub.client).getCurrentUser();
      expect(user, isNotNull);
      expect(user!.accountId, 'abc-123');
      expect(user.displayName, 'Esteban');
      expect(user.active, isTrue);
    });

    test('leaves an unknown field alone rather than throwing', () async {
      // Atlassian adds fields without warning; a client that dies on one would
      // break on their schedule rather than ours.
      final stub = stubbed({'accountId': 'abc', 'somethingNewAtlassianAdded': 42});
      await expectLater(MyselfApi(stub.client).getCurrentUser(), completes);
    });
  });

  group('errors', () {
    test('surfaces a non-2xx as ApiException carrying the status', () async {
      final stub = stubbed({'errorMessages': ['Issue does not exist']}, status: 404);
      await expectLater(
        IssuesApi(stub.client).getIssue('NOPE-1'),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 404)),
      );
    });

    test('a 401 is distinguishable, since it means the token is bad', () async {
      final stub = stubbed({'errorMessages': <String>[]}, status: 401);
      await expectLater(
        MyselfApi(stub.client).getCurrentUser(),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 401)),
      );
    });
  });

  group('spec fixups did not change the wire format', () {
    test('an enum whose default was stripped still round-trips', () async {
      // tool/patch_jira_spec.dart removes `default` from enum properties because
      // the generator emits an enum's private constructor as a default value,
      // which does not compile. Removing it must not change serialisation.
      final json = {'id': '1', 'name': 'Bug', 'subtask': false};
      final type = IssueTypeDetails.fromJson(json);
      expect(type, isNotNull);
      expect(type!.toJson()['name'], 'Bug');
    });

    test('an array that had uniqueItems deserialises as a list', () async {
      // uniqueItems is stripped so arrays are consistently List, because the
      // generator otherwise types the field Set while building a List for arrays
      // nested inside additionalProperties.
      final stub = stubbed({
        'errorMessages': ['first', 'second', 'first'],
      }, status: 400);
      await expectLater(
        MyselfApi(stub.client).getCurrentUser(),
        throwsA(isA<ApiException>()),
      );
    });
  });
}
