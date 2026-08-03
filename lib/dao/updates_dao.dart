// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:jira_watcher/models/settings_model.dart';

typedef _DialogBuilder = Future Function(BuildContext context);
typedef _DialogWithVersionBuilder = Future Function(BuildContext context, String version);

Uri latestDataUri = Uri.parse("https://este2013.github.io/jira_watch/latest.json");
Uri latestBetaDataUri = Uri.parse("https://este2013.github.io/jira_watch/latest_beta.json");

/// (isNewUpdateAvailable, newVersion, versionDataFromServer)
Future<(bool, NewUpdateData?)> fetchNewUpdateData({
  required BuildContext context,
  required String currentVersion,
  _DialogBuilder? onEmpty,
  _DialogBuilder? onNoData,
  _DialogWithVersionBuilder? onLatest,
  _DialogWithVersionBuilder? onAheadOfServer,
}) async {
  // fetch main channel
  final resp = await http.get(latestDataUri);

  if (resp.statusCode != 200 || resp.bodyBytes.isEmpty) {
    return onEmpty?.call(context).then((value) => (false, null)) ?? (false, null);
  }

  final data = _decodeVersionMap(resp.body);
  if (data == null) {
    return onEmpty?.call(context).then((value) => (false, null)) ?? (false, null);
  }
  MapEntry? mostRecent = data.entries.firstOrNull;
  if (mostRecent == null && SettingsModel().updateTrack.value == UpdateTrack.main) {
    return onNoData?.call(context).then((value) => (false, null)) ?? (false, null);
  }

  bool isMostRecentFromBeta = false;
  // if beta track is enabled: fetch beta track
  if (SettingsModel().updateTrack.value == UpdateTrack.beta) {
    final betaresp = await http.get(latestBetaDataUri);

    // A failed beta fetch is only fatal when there is no main-channel entry to
    // fall back on. Note the parentheses: without them this read as
    // `(a && b) || c`, so a beta 404 with a usable main entry fell through and
    // then tried to jsonDecode GitHub's HTML error page.
    final betaUnusable = betaresp.statusCode != 200 || betaresp.bodyBytes.isEmpty;
    if (mostRecent == null && betaUnusable) {
      return onEmpty?.call(context).then((value) => (false, null)) ?? (false, null);
    }

    // The beta channel is a bonus; if it is unreadable, carry on with main.
    final betaData = betaUnusable ? null : _decodeVersionMap(betaresp.body);
    MapEntry? mostRecentFromBeta = betaData?.entries.firstOrNull;
    if (mostRecentFromBeta != null) {
      if (isVersionStrictlyAbove(mostRecentFromBeta.key, baseline: mostRecent?.key ?? '0.0.0')) {
        isMostRecentFromBeta = true;
        mostRecent = mostRecentFromBeta;
      }
    }
  }
  if (mostRecent == null) {
    return onNoData?.call(context).then((value) => (false, null)) ?? (false, null);
  }

  if (!isVersionStrictlyAbove(mostRecent.key, baseline: currentVersion)) {
    if (isVersionStrictlyAbove(currentVersion, baseline: mostRecent.key)) {
      return onAheadOfServer?.call(context, mostRecent.key).then((value) => (false, null)) ?? (false, null);
    }
    return onLatest?.call(context, mostRecent.key).then((value) => (false, null)) ?? (false, null);
  }

  return (
    true,
    NewUpdateData(
      version: mostRecent.key as String,
      metadata: mostRecent.value as Map,
      isBeta: isMostRecentFromBeta,
    ),
  );
}

/// Decodes a `latest*.json` body, or null when it is not a usable version map.
///
/// The server is a static host, so a hiccup answers with an HTML error page
/// rather than JSON; decoding that used to throw straight out of the update check.
Map<String, dynamic>? _decodeVersionMap(String body) {
  try {
    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) return null;
    return decoded;
  } on FormatException {
    return null;
  }
}

/// Whether [version] is strictly newer than [baseline].
///
/// Both are dotted numeric strings; a shorter baseline is zero-padded, so
/// `1.8.0.1` (a beta) correctly ranks above `1.8.0`. Anything non-numeric
/// compares as not-newer rather than throwing — a single bad key published to
/// the server would otherwise break the update check for every user.
bool isVersionStrictlyAbove(String version, {required String baseline}) {
  final versionL = version.split('.').map(int.tryParse).toList();
  final baselineL = baseline.split('.').map(int.tryParse).toList();
  if (versionL.contains(null) || baselineL.contains(null)) return false;

  for (var i = 0; i < versionL.length; i++) {
    if (baselineL.length == i) baselineL.add(0);
    if (versionL[i]! > baselineL[i]!) return true;
    if (versionL[i]! < baselineL[i]!) return false;
  }
  return false;
}

class NewUpdateData {
  const NewUpdateData({required this.version, required this.metadata, this.isBeta = false});
  final String version;

  /// The raw per-version object from the server. Prefer the typed accessors below.
  final Map metadata;
  final bool isBeta;

  /// Where relative asset paths in [metadata] are resolved against.
  static final Uri assetBase = Uri.parse('https://este2013.github.io/jira_watch/');

  String? get changelog => metadata['changelog'] as String?;

  /// Lowercased hex SHA-256 of the Windows zip, when the release publishes one.
  ///
  /// Self-install refuses to run without it: it is what distinguishes a complete
  /// download from a truncated one, and a truncated zip would half-extract.
  String? get windowsSha256 => (metadata['x64Sha256'] as String?)?.toLowerCase();

  int? get windowsSizeBytes => (metadata['x64Size'] as num?)?.toInt();

  Uri? get windowsAssetUri => _assetUri('x64');
  Uri? get macAssetUri => _assetUri('osX');

  /// Resolves an asset for [key], preferring an absolute `<key>Url` when the
  /// release publishes one so assets can move off GitHub Pages later.
  ///
  /// Built segment-wise rather than by interpolation: the asset filename is
  /// `Binaries (x64).zip`, and the raw space and parentheses that `launchUrl`
  /// tolerates would make `http.get` throw.
  Uri? _assetUri(String key) {
    final absolute = metadata['${key}Url'] as String?;
    if (absolute != null && absolute.isNotEmpty) return Uri.tryParse(absolute);

    final relative = metadata[key] as String?;
    if (relative == null || relative.isEmpty) return null;
    return assetBase.replace(
      pathSegments: [
        ...assetBase.pathSegments.where((s) => s.isNotEmpty),
        ...relative.split('/').where((s) => s.isNotEmpty),
      ],
    );
  }

  Object? toJson() => {
    'version': version,
    'metadata': metadata,
    'isBeta': isBeta,
  };
}
