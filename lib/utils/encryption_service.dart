import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A small, self-contained encryption service:
/// - First run: generates a 256-bit key and stores it in the OS keystore.
/// - Later runs: loads the key and uses AES-GCM for authenticated encryption.
///
/// Output format (base64url-encoded bytes):
/// [version:1][nonce:12][ciphertext:...][tag:16]
class EncryptionService {
  static const _storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true), // harmless on desktop
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
    mOptions: MacOsOptions(), // stores in Keychain
    wOptions: WindowsOptions(), // stores in Credential Manager
    lOptions: LinuxOptions(), // (if you ever target linux) libsecret
    webOptions: WebOptions(), // ignored on desktop
  );

  static const _keyStorageKey = 'encryption_key_v1';
  static const _versionByte = 1;
  static const _nonceLength = 12; // AES-GCM standard nonce length
  static const _tagLength = 16; // AES-GCM tag length in bytes
  static final _algorithm = AesGcm.with256bits();

  /// Encrypts a UTF-8 string and returns a base64url string safe for storage.
  static Future<String> encrypt(String plaintext) async {
    final rawKey = await _getOrCreateKey(); // 32 bytes
    final secretKey = SecretKey(rawKey);

    final nonce = _secureRandomBytes(_nonceLength);

    final secretBox = await _algorithm.encrypt(
      utf8.encode(plaintext),
      secretKey: secretKey,
      nonce: nonce,
    );

    // Build payload: version | nonce | ciphertext | tag
    final ct = secretBox.cipherText;
    final tag = secretBox.mac.bytes; // 16 bytes

    final payload = Uint8List(1 + _nonceLength + ct.length + _tagLength);
    var o = 0;
    payload[o++] = _versionByte;
    payload.setRange(o, o + _nonceLength, nonce);
    o += _nonceLength;
    payload.setRange(o, o + ct.length, ct);
    o += ct.length;
    payload.setRange(o, o + _tagLength, tag);

    return base64UrlEncode(payload);
  }

  /// Decrypts a base64url string produced by [encrypt] back to a UTF-8 string.
  static Future<String> decrypt(String b64) async {
    final bytes = base64Url.decode(b64);

    if (bytes.isEmpty || bytes[0] != _versionByte) {
      throw StateError('Unsupported payload version or malformed data.');
    }
    if (bytes.length < 1 + _nonceLength + _tagLength) {
      throw StateError('Malformed payload (too short).');
    }

    var o = 1;
    final nonce = bytes.sublist(o, o + _nonceLength);
    o += _nonceLength;

    final ctLen = bytes.length - 1 - _nonceLength - _tagLength;
    if (ctLen < 0) throw StateError('Malformed payload (bad lengths).');

    final ct = bytes.sublist(o, o + ctLen);
    o += ctLen;
    final tag = bytes.sublist(o, o + _tagLength);

    final rawKey = await _getOrCreateKey();
    final secretKey = SecretKey(rawKey);

    final box = SecretBox(
      ct,
      nonce: nonce,
      mac: Mac(tag),
    );

    final clear = await _algorithm.decrypt(
      box,
      secretKey: secretKey,
    );

    return utf8.decode(clear);
  }

  // ---- internals -----------------------------------------------------------

  /// Loads the 32-byte AES key from secure storage, creating it if missing.
  static Future<Uint8List> _getOrCreateKey() async {
    final existing = await _storage.read(key: _keyStorageKey);
    if (existing != null && existing.isNotEmpty) {
      return Uint8List.fromList(base64Url.decode(existing));
    }

    final key = _secureRandomBytes(32); // 256-bit
    await _storage.write(
      key: _keyStorageKey,
      value: base64UrlEncode(key),
    );
    return key;
  }

  static Uint8List _secureRandomBytes(int length) {
    final rnd = Random.secure();
    final b = Uint8List(length);
    for (var i = 0; i < b.length; i++) {
      b[i] = rnd.nextInt(256);
    }
    return b;
  }
}
