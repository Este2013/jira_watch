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

Future<(bool, String?, Map?)> fetchNewUpdateData({
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
    return onEmpty?.call(context).then((value) => (false, null, null)) ?? (false, null, null);
  }

  Map<String, dynamic> data = jsonDecode(resp.body);
  MapEntry? mostRecent = data.entries.firstOrNull;
  if (mostRecent == null && SettingsModel().updateTrack.value == UpdateTrack.main) {
    return onNoData?.call(context).then((value) => (false, null, null)) ?? (false, null, null);
  }

  // if beta track is enabled: fetch beta track
  if (SettingsModel().updateTrack.value == UpdateTrack.beta) {
    final betaresp = await http.get(latestBetaDataUri);

    if (mostRecent == null && betaresp.statusCode != 200 || betaresp.bodyBytes.isEmpty) {
      return onEmpty?.call(context).then((value) => (false, null, null)) ?? (false, null, null);
    }

    Map<String, dynamic> data = jsonDecode(betaresp.body);
    MapEntry? mostRecentFromBeta = data.entries.firstOrNull;
    if (mostRecentFromBeta != null) {
      if (isVersioStrictlyAbove(mostRecentFromBeta.key, baseline: mostRecent?.key ?? '0.0.0')) {
        mostRecent = mostRecentFromBeta;
      }
    }
  }
  if (mostRecent == null) {
    return onNoData?.call(context).then((value) => (false, null, null)) ?? (false, null, null);
  }

  if (!isVersioStrictlyAbove(mostRecent.key, baseline: currentVersion)) {
    if (isVersioStrictlyAbove(currentVersion, baseline: mostRecent.key)) {
      return onAheadOfServer?.call(context, mostRecent.key).then((value) => (false, null, null)) ?? (false, null, null);
    }
    return onLatest?.call(context, mostRecent.key).then((value) => (false, null, null)) ?? (false, null, null);
  }

  return (true, mostRecent.key as String, mostRecent.value as Map);
}

bool isVersioStrictlyAbove(String version, {required String baseline}) {
  var versionL = version.split('.').map(int.parse);
  var baselineL = baseline.split('.').map(int.parse).toList();
  for (var v in versionL.indexed) {
    if (baselineL.length == v.$1) baselineL.add(0);
    if (v.$2 > baselineL[v.$1]) {
      return true;
    }
    if (v.$2 < baselineL[v.$1]) {
      return false;
    }
  }
  return false;
}
