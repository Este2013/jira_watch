// Hand-written, unlike everything under lib/. The generator is told not to write
// here (see .openapi-generator-ignore), so this survives regeneration.

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:jira_software_api/api.dart';
import 'package:test/test.dart';

({ApiClient client, List<BaseRequest> requests}) stubbed(Object body, {int status = 200}) {
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
    test('sends basic auth and resolves the agile path', () async {
      final stub = stubbed({'values': <Object>[], 'isLast': true});
      await BoardApi(stub.client).getAllBoards();

      final request = stub.requests.single;
      expect(request.url.toString(), startsWith('https://example.atlassian.net/rest/agile/1.0/board'));
      expect(request.headers['Authorization'], startsWith('Basic '));
    });

    test('puts a path parameter in the path, not the query', () async {
      final stub = stubbed({'values': <Object>[]});
      await BoardApi(stub.client).getAllSprints(42);

      expect(stub.requests.single.url.path, contains('/board/42/sprint'));
      expect(stub.requests.single.url.queryParameters, isNot(contains('boardId')));
    });
  });

  group('the toString rename', () {
    // Jira genuinely has a property named `toString` on changelog entries, which
    // collides with Object.toString and stops the package compiling. The generator
    // is told to call the Dart field `toStringValue` while keeping the original
    // name on the wire — so both directions are checked here, because getting this
    // wrong would silently drop the field rather than fail loudly.
    test('reads the wire name `toString` into toStringValue', () {
      final change = ChangeDetails.fromJson({
        'field': 'status',
        'fieldtype': 'jira',
        'from': '1',
        'fromString': 'To Do',
        'to': '3',
        'toString': 'In Progress',
      });

      expect(change, isNotNull);
      expect(change!.toStringValue, 'In Progress');
      expect(change.fromString, 'To Do');
    });

    test('writes toStringValue back out as `toString`', () {
      final json = ChangeDetails.fromJson({'field': 'status', 'toString': 'Done'})!.toJson();

      expect(json['toString'], 'Done');
      expect(json.containsKey('toStringValue'), isFalse, reason: 'the Dart name must not leak onto the wire');
    });

    test('the class still has a working toString() of its own', () {
      // The collision this rename avoids: a field named toString would have
      // shadowed Object.toString.
      final change = ChangeDetails.fromJson({'field': 'status', 'toString': 'Done'})!;
      expect(change.toString(), contains('ChangeDetails'));
    });
  });

  group('errors', () {
    test('surfaces a non-2xx as ApiException carrying the status', () async {
      final stub = stubbed({'errorMessages': ['Board does not exist']}, status: 404);
      await expectLater(
        BoardApi(stub.client).getAllSprints(999),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 404)),
      );
    });
  });
}
