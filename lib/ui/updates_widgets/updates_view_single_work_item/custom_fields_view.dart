import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:material_symbols_icons/symbols.dart';
import 'package:jira_watcher/models/data_model.dart';
import 'package:jira_watcher/models/jira_development_field.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';
import 'package:jira_watcher/ui/utils/expandable_panel.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_doc_renderer.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_images.dart';
import 'package:jira_watcher/ui/utils/json_viewer.dart';
import 'package:jira_watcher/ui/utils/labelled_text_presenter.dart';

import 'development_field_view.dart';
import 'work_item_details_view.dart';

/// Jira's own LexoRank custom field type (the "Rank" field) — an internal
/// sort key for backlog/board ordering, never meant to be read by a human
/// ("0|i0ary3:" is a complete, correct answer for what it says — just not
/// one worth showing).
const _lexoRankSchemaType = 'com.pyxis.greenhopper.jira:gh-lexo-rank';

/// The "Epic Link" field — redundant with the epic already shown via the
/// issue's `parent` elsewhere (the breadcrumb, the Details view), so this
/// would just be saying the same thing twice.
const _epicLinkSchemaType = 'com.pyxis.greenhopper.jira:gh-epic-link';

/// True for a value this proof-of-concept has no business trying to show as
/// though it were readable text.
bool _isOpaqueCustomField(dynamic value, jira.FieldDetails? metadata) {
  if (metadata?.schema?.custom == _lexoRankSchemaType) return true;
  // A handful of third-party apps (time-in-status trackers, chiefly) encode
  // their own report data as an opaque delimited blob. Nothing in Jira's
  // public field schema identifies these — this is a value-shape heuristic,
  // matched against delimiters that are vanishingly unlikely to appear in
  // real user-entered text.
  if (value is String && (value.contains('_*:*_') || value.contains('_*|*_'))) return true;
  return false;
}

/// Which way [classifyCustomField] decided to render a custom field's
/// value — the single source of truth both [CustomFieldValue] (what a
/// reader sees) and the Debug tab's Custom fields view (why it looks that
/// way) are built from, so the two can never disagree about a field.
enum CustomFieldRenderKind {
  /// Hidden entirely — see [_isOpaqueCustomField].
  hiddenOpaque('Hidden — opaque internal value'),

  /// Hidden entirely — already shown elsewhere in the issue view (e.g. the
  /// Epic Link, which is just the issue's own parent again).
  hiddenRedundant('Hidden — redundant with data shown elsewhere'),

  /// Routed to [DevelopmentFieldCard] instead of [CustomFieldValue].
  development('Development field'),
  adf('Rich text (ADF document)'),
  user('User'),

  /// A single option/version/component/team-shaped value — see
  /// [CustomFieldValue]'s own handling for which of `value`/`name` supplies
  /// the label and how an `avatarUrl`, when present, gets shown.
  option('Single option / version / component'),
  list('Multi-value (array)'),
  boolean('Boolean'),
  date('Date / date-time'),
  text('Plain text or number'),
  fallbackJson('Unrecognized shape — raw JSON');

  const CustomFieldRenderKind(this.description);
  final String description;
}

/// Whether a field value has nothing to say, so the Details tab can treat
/// it as absent rather than drawing a row that reads as broken.
///
/// Null is the obvious case, but a field is just as often present and
/// empty: an option list nobody picked from, an empty object, or the
/// literal `{}` some integrations write in place of one. Jira itself
/// distinguishes these; a reader has no reason to.
bool isEmptyJiraValue(dynamic value) {
  if (value == null) return true;
  if (value is String) {
    final trimmed = value.trim();
    return trimmed.isEmpty || trimmed == '{}' || trimmed == '[]';
  }
  if (value is Iterable) return value.isEmpty;
  if (value is Map) return value.isEmpty;
  return false;
}

/// Decides how a custom field's value would be rendered, from its actual
/// shape first and [metadata]'s schema only where shape alone is ambiguous
/// (a plain string could be a date, or just text) — see [CustomFieldValue]
/// for why shape leads.
CustomFieldRenderKind classifyCustomField(dynamic value, jira.FieldDetails? metadata) {
  if (metadata?.schema?.custom == _epicLinkSchemaType) return CustomFieldRenderKind.hiddenRedundant;
  if (_isOpaqueCustomField(value, metadata)) return CustomFieldRenderKind.hiddenOpaque;
  if (value is String && DevelopmentFieldSummary.parse(value) != null) return CustomFieldRenderKind.development;

  final v = value;
  if (v is Map && v['type'] == 'doc' && v['content'] is List) return CustomFieldRenderKind.adf;
  if (v is Map && v['accountId'] != null) return CustomFieldRenderKind.user;
  if (v is Map && (v['value'] != null || v['name'] != null)) return CustomFieldRenderKind.option;
  if (v is List) return CustomFieldRenderKind.list;
  if (v is bool) return CustomFieldRenderKind.boolean;
  if (v is String && (metadata?.schema?.type == 'date' || metadata?.schema?.type == 'datetime')) return CustomFieldRenderKind.date;
  if (v is String || v is num) return CustomFieldRenderKind.text;
  return CustomFieldRenderKind.fallbackJson;
}

/// One custom field's label + value, formatted according to its value's
/// actual shape — [metadata]'s schema type is used for the label and to
/// pick a date format, but the shape checks below are what really decide
/// how to render, since a handful of custom field types (e.g. any
/// multi-value field) share the same schema `type: "array"` regardless of
/// what's actually inside.
class CustomFieldValue extends StatelessWidget {
  const CustomFieldValue({super.key, required this.fieldId, required this.value, required this.metadata, this.attachments});

  final String fieldId;
  final dynamic value;
  final jira.FieldDetails? metadata;
  final List? attachments;

  String get _label => metadata?.name ?? fieldId;

  @override
  Widget build(BuildContext context) {
    final v = value;

    return switch (classifyCustomField(v, metadata)) {
      // Atlassian Document Format is self-describing — its root is always
      // {"type": "doc", "content": [...]} — which is what
      // classifyCustomField actually keyed off, not schema metadata (that
      // doesn't distinguish a rich-text field from a plain multi-line one).
      CustomFieldRenderKind.adf => ExpandablePanel(
        _label,
        content: AdfRenderer(adf: (v as Map).cast<String, dynamic>(), attachments: attachments),
      ),

      // A single Jira user.
      CustomFieldRenderKind.user => _LabeledRow(
        label: _label,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            if ((v as Map)['avatarUrls']?['24x24'] != null) ClipOval(child: JiraAvatar(url: v['avatarUrls']['24x24'], size: 20)) else const Icon(Symbols.person),
            Flexible(child: Text(v['displayName']?.toString() ?? fieldId, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),

      // A single option/version/component/team-shaped value — Jira spells
      // the display text as `value` for an option field, `name` for most
      // others. A handful of these (Team, notably) also carry their own
      // avatarUrl, shown the same leading-icon way Priority already is in
      // the Details view's own default fields.
      CustomFieldRenderKind.option => _textField(
        (v as Map)['value']?.toString() ?? v['name'].toString(),
        avatarUrl: v['avatarUrl'] as String?,
      ),

      // Every multi-value field (multi-select, checkboxes, labels, a
      // cascading select's children, ...) is schema type "array" — rendered
      // as chips regardless of what the individual items look like.
      CustomFieldRenderKind.list => ListingTypeField<dynamic>(
        _label,
        itemList: v as List,
        itemToString: (item) => item is Map ? (item['value'] ?? item['name'] ?? item.toString()).toString() : item.toString(),
      ),

      CustomFieldRenderKind.boolean => _textField(v == true ? 'Yes' : 'No'),
      CustomFieldRenderKind.date => DateDisplay(_label, dateString: v as String),
      CustomFieldRenderKind.text => _textField(v.toString()),

      // Something this POC didn't plan for — a JSON viewer beats either
      // crashing or dumping Dart's own Map.toString() at the reader.
      CustomFieldRenderKind.fallbackJson => ExpandablePanel(_label, isInitiallyExpanded: false, content: JsonViewer(data: v)),

      // CustomFieldsSection routes development fields to
      // DevelopmentFieldCard, and drops hidden ones, before a
      // CustomFieldValue is ever built for either.
      CustomFieldRenderKind.development || CustomFieldRenderKind.hiddenOpaque || CustomFieldRenderKind.hiddenRedundant => const SizedBox.shrink(),
    };
  }

  Widget _textField(String text, {String? avatarUrl}) => LabeledPopupTextField(
    label: _label,
    controller: TextEditingController(text: text),
    readOnly: true,
    prefixIcon: avatarUrl == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
            child: ClipOval(child: JiraAvatar(url: avatarUrl)),
          ),
  );
}

class _LabeledRow extends StatelessWidget {
  const _LabeledRow({required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    spacing: 12,
    children: [
      Text(label, style: Theme.of(context).textTheme.labelMedium),
      Flexible(child: child),
    ],
  );
}

/// The Debug tab's "Custom fields" view: every `customfield_*` on this
/// issue with its raw key/value pair, its evaluated title, which way
/// [classifyCustomField] rendered it (and why, via its schema), all
/// searchable by key, title, or raw value — so a field that renders wrong
/// (or not at all) can be diagnosed here without leaving the app.
class CustomFieldsDebugView extends StatefulWidget {
  const CustomFieldsDebugView({super.key, required this.workItem});

  final JiraWorkItemData workItem;

  @override
  State<CustomFieldsDebugView> createState() => _CustomFieldsDebugViewState();
}

class _CustomFieldsDebugViewState extends State<CustomFieldsDebugView> {
  final _search = TextEditingController();

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final values = widget.workItem.customFields;
    final emptyKeys = widget.workItem.emptyCustomFieldKeys;

    return FutureBuilder<Map<String, jira.FieldDetails>>(
      future: DataModel().fieldMetadata(),
      builder: (context, snapshot) {
        final metadata = snapshot.data ?? const {};
        return Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              autofocus: true,
              controller: _search,
              decoration: const InputDecoration(border: OutlineInputBorder(), icon: Icon(Symbols.search), hintText: 'Search by key, title, or raw value'),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _search,
                builder: (context, _) {
                  final query = _search.text.toLowerCase();
                  bool matches(String key) {
                    if (query.isEmpty) return true;
                    final name = metadata[key]?.name?.toLowerCase() ?? '';
                    return key.toLowerCase().contains(query) || name.contains(query);
                  }

                  final entries = values.entries.where((e) => matches(e.key) || e.value.toString().toLowerCase().contains(query)).toList()..sort((a, b) => a.key.compareTo(b.key));
                  final emptyEntries = emptyKeys.where(matches).toList()..sort();

                  if (values.isEmpty && emptyKeys.isEmpty) return const Center(child: Text('No custom fields on this issue.'));
                  if (entries.isEmpty && emptyEntries.isEmpty) return const Center(child: Text('No custom fields match that search.'));

                  return ListView(
                    children: [
                      for (final entry in entries) _CustomFieldDebugTile(key: Key(entry.key), fieldId: entry.key, value: entry.value, metadata: metadata[entry.key]),
                      if (emptyEntries.isNotEmpty) ...[
                        const Padding(padding: EdgeInsets.symmetric(vertical: 12), child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Text('Empty on this issue (${emptyEntries.length})', style: Theme.of(context).textTheme.titleSmall),
                        ),
                        for (final key in emptyEntries) _EmptyCustomFieldTile(key: Key(key), fieldId: key, metadata: metadata[key]),
                      ],
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CustomFieldDebugTile extends StatelessWidget {
  const _CustomFieldDebugTile({super.key, required this.fieldId, required this.value, required this.metadata});

  final String fieldId;
  final dynamic value;
  final jira.FieldDetails? metadata;

  @override
  Widget build(BuildContext context) {
    final kind = classifyCustomField(value, metadata);
    final schema = metadata?.schema;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ExpansionTile(
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: metadata?.name ?? '(no metadata — unknown field)', style: Theme.of(context).textTheme.titleSmall),
              TextSpan(
                text: '   $fieldId',
                style: TextStyle(color: Theme.of(context).hintColor, fontFamily: 'RobotoMono'),
              ),
            ],
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              _InfoChip('renders as: ${kind.description}'),
              _InfoChip('Dart type: ${value.runtimeType}'),
              // Why a field with a value in it is nonetheless treated as
              // blank by the Details tab — otherwise the two views look
              // like they disagree.
              if (isEmptyJiraValue(value)) const _InfoChip('counts as: empty'),
              if (schema?.type != null) _InfoChip('schema.type: ${schema!.type}'),
              if (schema?.custom != null) _InfoChip('schema.custom: ${schema!.custom}'),
              if (schema?.items != null) _InfoChip('schema.items: ${schema!.items}'),
            ],
          ),
        ),
        trailing: IconButton(
          tooltip: 'Copy key/value as JSON',
          icon: const Icon(Symbols.content_copy, size: 18),
          visualDensity: VisualDensity.compact,
          onPressed: () => Clipboard.setData(ClipboardData(text: const JsonEncoder.withIndent('  ').convert({fieldId: value}))),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                const JsonEncoder.withIndent('  ').convert(value),
                style: const TextStyle(fontFamily: 'RobotoMono', fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip(this.text);
  final String text;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainerHighest, borderRadius: BorderRadius.circular(4)),
    child: Text(text, style: const TextStyle(fontSize: 11)),
  );
}

/// A `customfield_*` this issue has no value for — nothing to classify or
/// copy, so just enough to answer "is this field even attached to this
/// issue" (yes, but empty) without cluttering the main list above.
class _EmptyCustomFieldTile extends StatelessWidget {
  const _EmptyCustomFieldTile({super.key, required this.fieldId, required this.metadata});

  final String fieldId;
  final jira.FieldDetails? metadata;

  @override
  Widget build(BuildContext context) {
    final hintColor = Theme.of(context).hintColor;
    final schemaType = metadata?.schema?.type;
    return ListTile(
      dense: true,
      title: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: metadata?.name ?? '(no metadata — unknown field)',
              style: TextStyle(color: hintColor),
            ),
            TextSpan(
              text: '   $fieldId',
              style: TextStyle(color: hintColor, fontFamily: 'RobotoMono', fontSize: 12),
            ),
          ],
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: schemaType == null ? null : _InfoChip('schema.type: $schemaType'),
    );
  }
}
