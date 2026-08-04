import 'dart:convert';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/utils/pkce.dart';

void main() {
  group('PkcePair', () {
    test('matches the RFC 7636 appendix B challenge vector', () async {
      const verifier = 'dBjftJeZ4CVP-mB92K27uhbUJU1p1r_wW1gFWFOEjXk';
      const expectedChallenge = 'E9Melhoa2OwvFrEMTJguCHaoeK1t8URWbuGJSstw-cM';

      final digest = await Sha256().hash(ascii.encode(verifier));
      expect(base64UrlEncode(digest.bytes).replaceAll('=', ''), expectedChallenge);
    });

    test('generates a verifier within the RFC 7636 length bounds', () async {
      final pair = await PkcePair.generate();
      expect(pair.codeVerifier.length, greaterThanOrEqualTo(43));
      expect(pair.codeVerifier.length, lessThanOrEqualTo(128));
    });

    test('emits unpadded url-safe values only', () async {
      final pair = await PkcePair.generate();
      final urlSafe = RegExp(r'^[A-Za-z0-9\-._~]+$');
      expect(urlSafe.hasMatch(pair.codeVerifier), isTrue, reason: pair.codeVerifier);
      expect(urlSafe.hasMatch(pair.codeChallenge), isTrue, reason: pair.codeChallenge);
    });

    test('derives the challenge from the verifier string, not its source bytes', () async {
      final pair = await PkcePair.generate();
      final digest = await Sha256().hash(ascii.encode(pair.codeVerifier));
      expect(pair.codeChallenge, base64UrlEncode(digest.bytes).replaceAll('=', ''));
    });

    test('never repeats a verifier', () async {
      final verifiers = {for (var i = 0; i < 50; i++) (await PkcePair.generate()).codeVerifier};
      expect(verifiers, hasLength(50));
    });
  });
}
