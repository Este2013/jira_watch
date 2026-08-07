// Applies the fixups the Dart generator needs, producing a patched copy of a
// spec without touching the pristine one committed beside the generated code.
//
// Keeping the upstream spec untouched and the changes here as code means the
// diff of a spec update stays meaningful, and every deviation from what Atlassian
// publishes is visible and justified rather than being an unexplained hand-edit
// in generated output.
//
//   dart run tool/patch_jira_spec.dart <input.json> <output.json>

import 'dart:convert';
import 'dart:io';

void main(List<String> args) {
  if (args.length != 2) {
    stderr.writeln('usage: dart run tool/patch_jira_spec.dart <input.json> <output.json>');
    exit(64);
  }

  final input = File(args[0]);
  if (!input.existsSync()) {
    stderr.writeln('error: no spec at ${input.path}');
    exit(1);
  }

  final spec = jsonDecode(input.readAsStringSync()) as Map<String, dynamic>;

  // Reported here rather than from the calling script: PowerShell's
  // ConvertFrom-Json cannot even load the platform spec, which has keys
  // differing only in case (issueType and issuetype).
  const methods = {'get', 'post', 'put', 'delete', 'patch'};
  final paths = (spec['paths'] as Map<String, dynamic>? ?? {});
  final operations = paths.values
      .whereType<Map<String, dynamic>>()
      .expand((path) => path.keys)
      .where((key) => methods.contains(key.toLowerCase()))
      .length;
  stdout.writeln('  spec:  ${(spec['info'] as Map?)?['title']}');
  stdout.writeln('  paths: ${paths.length}   operations: $operations');

  final report = _Report();
  _patch(spec, report);

  File(args[1])
    ..parent.createSync(recursive: true)
    ..writeAsStringSync(jsonEncode(spec));

  stdout.writeln('  removed enum defaults:  ${report.enumDefaults}');
  stdout.writeln('  loosened nested maps:   ${report.nestedMaps}');
  stdout.writeln('  removed uniqueItems:    ${report.uniqueItems}');
  stdout.writeln('  collapsed scalar unions: ${report.scalarUnions}');
}

class _Report {
  int enumDefaults = 0;
  int nestedMaps = 0;
  int uniqueItems = 0;
  int scalarUnions = 0;
}

const _scalarTypes = {'string', 'integer', 'number', 'boolean'};

/// True for an `anyOf`/`oneOf` list whose every branch is a bare scalar — no
/// `$ref`, no properties, nothing to model.
bool _isScalarUnion(Object? branches) =>
    branches is List &&
    branches.isNotEmpty &&
    branches.every((b) => b is Map<String, dynamic> && _scalarTypes.contains(b['type']) && !b.containsKey(r'$ref') && !b.containsKey('properties'));

void _patch(Object? node, _Report report) {
  if (node is Map<String, dynamic>) {
    // An enum property with a default makes the generator emit the enum's
    // private generative constructor as the default value —
    // `const FooEnum._('1.0')` — which Dart rejects outside the enum's own
    // declaration, so the package will not compile. Dropping the default only
    // costs an auto-filled value the caller can pass explicitly.
    if (node.containsKey('enum') && node.containsKey('default')) {
      node.remove('default');
      report.enumDefaults++;
    }

    // `uniqueItems: true` makes the generator type the field as a Set, but the
    // deserialiser it emits for arrays nested inside additionalProperties still
    // builds a List, so the two disagree and the package will not compile.
    // Dropping it means every array becomes a List, consistently; uniqueness is
    // the server's guarantee and nothing a client needs to re-encode in a type.
    if (node['type'] == 'array' && node.containsKey('uniqueItems')) {
      node.remove('uniqueItems');
      report.uniqueItems++;
    }

    // A map whose values are themselves maps of objects is emitted with the
    // field typed `Map<String, Map<String, Object>>` but populated from a
    // `Map<String, dynamic>` cast, which does not assign. Flattening the inner
    // schema to a free-form object keeps the data reachable — the app reads
    // these as raw JSON anyway — and makes the generated types agree.
    final additional = node['additionalProperties'];
    if (node['type'] == 'object' && additional is Map<String, dynamic>) {
      final inner = additional['additionalProperties'];
      if (additional['type'] == 'object' && inner is Map<String, dynamic>) {
        additional.remove('additionalProperties');
        report.nestedMaps++;
      }
    }

    // An `anyOf`/`oneOf` of plain scalars — Confluence uses one for "a built-in
    // content type, or any custom one" — gives the generator nothing to model,
    // and it emits a class with no properties whose `==` and `hashCode` bodies
    // are simply missing, so the package will not parse. Collapsing the union to
    // the type its branches share keeps the wire format identical.
    //
    // The `enum` goes with it: a union of enums is not representable as one, and
    // the whole point of these unions is that a value outside the list is legal.
    for (final keyword in const ['anyOf', 'oneOf']) {
      if (_isScalarUnion(node[keyword])) {
        final branches = (node[keyword] as List).cast<Map<String, dynamic>>();
        final types = branches.map((b) => b['type']).toSet();
        node.remove(keyword);
        node.remove('enum');
        // Branches disagreeing on type leaves it free-form, which the generator
        // maps to Object — still reachable, since the app reads these raw.
        if (types.length == 1) node['type'] = types.first;
        report.scalarUnions++;
      }
    }

    for (final value in node.values) {
      _patch(value, report);
    }
    return;
  }

  if (node is List) {
    for (final value in node) {
      _patch(value, report);
    }
  }
}
