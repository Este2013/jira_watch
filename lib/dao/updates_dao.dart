// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

typedef _DialogBuilder = Future Function(BuildContext context);
typedef _DialogWithVersionBuilder = Future Function(BuildContext context, String version);

Uri latestDataUri = Uri.parse("https://este2013.github.io/jira_watch/latest.json");

Future<(bool, String?, Map?)> fetchNewUpdateData({
  required BuildContext context,
  required String currentVersion,
  _DialogBuilder? onEmpty,
  _DialogBuilder? onNoData,
  _DialogWithVersionBuilder? onLatest,
}) async {
  final resp = await http.get(latestDataUri);

  if (resp.statusCode != 200 || resp.bodyBytes.isEmpty) {
    return onEmpty?.call(context).then((value) => (false, null, null)) ?? (false, null, null);
  }

  Map<String, dynamic> data = jsonDecode(resp.body);
  MapEntry? mostRecent = data.entries.firstOrNull;
  if (mostRecent == null) {
    return onNoData?.call(context).then((value) => (false, null, null)) ?? (false, null, null);
  }

  if (!isVersioStrictlyAbove(mostRecent.key, baseline: currentVersion)) {
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
