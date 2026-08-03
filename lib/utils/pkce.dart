import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

/// A PKCE verifier/challenge pair for an OAuth2 authorization code flow (RFC 7636).
///
/// Both values are single-use: generate a fresh pair for every authorization
/// attempt, so a cancelled-then-retried flow cannot accept a stale code.
class PkcePair {
  const PkcePair({required this.codeVerifier, required this.codeChallenge});

  final String codeVerifier;
  final String codeChallenge;

  static Future<PkcePair> generate() async {
    final verifier = randomUrlSafeString(32);
    // The challenge hashes the ASCII bytes of the verifier *string*, not the
    // random bytes it was encoded from.
    final digest = await Sha256().hash(ascii.encode(verifier));
    return PkcePair(
      codeVerifier: verifier,
      codeChallenge: _base64UrlUnpadded(digest.bytes),
    );
  }

  /// Also used to generate the OAuth `state` parameter.
  static String randomUrlSafeString(int byteLength) => _base64UrlUnpadded(_secureRandomBytes(byteLength));

  static String _base64UrlUnpadded(List<int> bytes) => base64UrlEncode(bytes).replaceAll('=', '');

  static Uint8List _secureRandomBytes(int length) {
    final rnd = Random.secure();
    final b = Uint8List(length);
    for (var i = 0; i < b.length; i++) {
      b[i] = rnd.nextInt(256);
    }
    return b;
  }
}
