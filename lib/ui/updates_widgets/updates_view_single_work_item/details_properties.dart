import 'package:flutter/material.dart';
import 'package:jira_platform_api/api.dart' as jira;
import 'package:jira_watcher/models/jira_development_field.dart';
import 'package:jira_watcher/models/jira_work_item_data.dart';

import 'custom_fields_view.dart';
import 'development_field_view.dart';
import 'work_item_details_view.dart';

/// One thing the Details tab can show, and that the reader can move, group
/// or hide.
///
/// Identified by its Jira field key — `attachment`, `created`,
/// `customfield_10056` — so a saved layout means the same thing across
/// issues and projects without inventing an id scheme of its own.
class DetailsProperty {
  const DetailsProperty({
    required this.id,
    required this.name,
    required this.hasValue,
    required this.build,
    this.isFullWidth = false,
    this.isLocked = false,
    this.isFooter = false,
    this.canHide = true,
  });

  final String id;

  /// What the reader calls it — a built-in's own label, or a custom field's
  /// name from Jira's field metadata rather than its raw id.
  final String name;

  /// Whether this issue actually has anything to show here — absent, but
  /// also present-and-empty (see [isEmptyJiraValue]). False ones are only
  /// rendered when the reader asks to see empty properties, so that a group
  /// can be arranged around a field this particular ticket left blank.
  final bool hasValue;

  /// Never tiled beside anything else. Related work items is the one of
  /// these: it is a list of rows, and a half-width column of them reads
  /// badly.
  final bool isFullWidth;

  /// Rendered as a unit the reader cannot rearrange the insides of —
  /// Development, and any other integration whose card is really an external
  /// app's own view rather than a Jira field.
  final bool isLocked;

  /// Belongs to the run of dates at the very bottom of the tab. Those stay
  /// where they are: they are the issue's own provenance rather than
  /// something to arrange, and reading them in a group beside a custom
  /// field would be stranger than leaving them be.
  final bool isFooter;

  /// False for the sections that carry an issue's actual substance —
  /// attachments and links — which there is never a good reason to lose
  /// track of, and which would be alarming to have vanish.
  final bool canHide;

  final WidgetBuilder build;

  /// Whether this can be lifted into a pinned row at the top of the tab.
  /// The footer stays the footer, and a full-width section has no business
  /// in a row of columns.
  bool get canPin => !isFullWidth && !isFooter;
}

/// Field keys the Details tab lays out itself, above anything the reader
/// arranges: the identity row, labels/components, versions, and the two
/// long-form documents. Excluded from the property pool so they cannot be
/// moved or hidden — they are the part of the view that stays put.
const fixedDetailsFieldKeys = {
  'assignee',
  'reporter',
  'priority',
  'watches',
  'labels',
  'components',
  'versions',
  'fixVersions',
  'description',
  'environment',
};

/// Every property this issue can show: the arrangeable ones first —
/// attachments, links, then custom fields by name — and the dates that make
/// up the footer last.
///
/// [metadata] is Jira's field metadata, which supplies custom field names;
/// while it is still loading an empty map is fine — those fields fall back
/// to their raw ids for one frame.
List<DetailsProperty> buildDetailsProperties(JiraWorkItemData workItem, Map<String, jira.FieldDetails> metadata) {
  final fields = workItem.fields;
  if (fields == null) return const [];

  final attachments = (fields['attachment'] as List?) ?? const [];
  final creator = fields['creator']?['displayName'];

  return [
    DetailsProperty(
      id: 'attachment',
      name: 'Attachments',
      hasValue: !isEmptyJiraValue(attachments),
      canHide: false,
      build: (context) => AttachmentsField(attachmentsData: attachments),
    ),
    DetailsProperty(
      id: 'issuelinks',
      name: 'Related work items',
      // Web links are fetched separately and arrive after this is built, so
      // emptiness isn't knowable here; the section hides itself once it
      // knows it has nothing, which is the only moment anyone can tell.
      hasValue: true,
      isFullWidth: true,
      canHide: false,
      build: (context) => RelatedWorkItemsSection(workItem: workItem),
    ),
    ..._customFieldProperties(workItem, metadata, attachments),
    _dateProperty(fields, id: 'created', name: creator == null ? 'Created' : 'Created by $creator'),
    _dateProperty(fields, id: 'updated', name: 'Updated'),
    _dateProperty(fields, id: 'resolutiondate', name: 'Resolution date'),
    _dateProperty(fields, id: 'statuscategorychangedate', name: 'Last status category change'),
    _dateProperty(fields, id: 'lastViewed', name: 'Last viewed'),
  ];
}

DetailsProperty _dateProperty(Map fields, {required String id, required String name}) {
  final dateString = fields[id];
  final hasValue = !isEmptyJiraValue(dateString);
  return DetailsProperty(
    id: id,
    name: name,
    hasValue: hasValue,
    isFooter: true,
    build: (context) => hasValue ? DateDisplay(name, dateString: dateString) : _EmptyProperty(name: name),
  );
}

/// This issue's custom fields, set and unset alike, minus the ones with
/// nothing worth reading (see [classifyCustomField]). Sorted by name, since
/// their ids carry no meaning to sort by.
List<DetailsProperty> _customFieldProperties(JiraWorkItemData workItem, Map<String, jira.FieldDetails> metadata, List attachments) {
  final properties = <DetailsProperty>[];

  void addIfShowable(String fieldId, dynamic value) {
    final fieldMetadata = metadata[fieldId];
    final kind = classifyCustomField(value, fieldMetadata);
    if (kind == CustomFieldRenderKind.hiddenOpaque || kind == CustomFieldRenderKind.hiddenRedundant) return;

    final name = fieldMetadata?.name ?? fieldId;
    final hasValue = !isEmptyJiraValue(value);
    properties.add(
      DetailsProperty(
        id: fieldId,
        name: name,
        hasValue: hasValue,
        isLocked: kind == CustomFieldRenderKind.development,
        build: (context) {
          if (!hasValue) return _EmptyProperty(name: name);
          if (kind == CustomFieldRenderKind.development) {
            return DevelopmentFieldCard(label: name, summary: DevelopmentFieldSummary.parse(value as String)!, workItem: workItem);
          }
          return CustomFieldValue(fieldId: fieldId, value: value, metadata: fieldMetadata, attachments: attachments);
        },
      ),
    );
  }

  workItem.customFields.forEach(addIfShowable);
  for (final fieldId in workItem.emptyCustomFieldKeys) {
    addIfShowable(fieldId, null);
  }

  properties.sort((a, b) => a.name.compareTo(b.name));
  return properties;
}

/// A property this issue has no value for, shown only while the reader has
/// asked to see empty ones — enough to drag and group, and to make its
/// absence legible rather than looking like a rendering failure.
class _EmptyProperty extends StatelessWidget {
  const _EmptyProperty({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) => Text.rich(
    TextSpan(
      children: [
        TextSpan(text: '$name: '),
        TextSpan(
          text: 'not set',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    ),
    style: TextStyle(color: Theme.of(context).disabledColor),
  );
}
