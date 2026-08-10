import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_doc_renderer.dart';

Map<String, dynamic> heading(int level, String text) => {
  'type': 'heading',
  'attrs': {'level': level},
  'content': [
    {'type': 'text', 'text': text},
  ],
};

Map<String, dynamic> tocMacro() => {
  'type': 'extension',
  'attrs': {
    'extensionType': 'com.atlassian.confluence.macro.core',
    'extensionKey': 'toc',
    'parameters': {'macroParams': <String, dynamic>{}},
  },
};

Map<String, dynamic> doc(List<Map<String, dynamic>> content) => {'type': 'doc', 'version': 1, 'content': content};

/// Headings and paragraphs are built as RichText spans rather than Text
/// widgets, so `find.text` does not see them — which is convenient here: a
/// match on `find.text` means the table of contents listed it, not that the
/// heading rendered.
bool inRichText(WidgetTester tester, String needle) =>
    tester.widgetList<RichText>(find.byType(RichText)).any((w) => w.text.toPlainText().contains(needle));

Future<void> pumpArticle(WidgetTester tester, Map<String, dynamic> adf) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(child: AdfRenderer(adf: adf, attachments: const [])),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  testWidgets('a table of contents lists headings that come after it', (tester) async {
    // The reason headings are scanned before rendering rather than collected as
    // they are built: the macro sits above every heading it has to list, so at
    // the moment it builds, none of them exist yet.
    await pumpArticle(tester, doc([tocMacro(), heading(1, 'Overview'), heading(2, 'Details')]));

    expect(tester.takeException(), isNull);
    expect(find.text('On this page'), findsOneWidget);
    expect(find.text('Overview'), findsOneWidget, reason: 'listed in the contents');
    expect(find.text('Details'), findsOneWidget, reason: 'listed in the contents');
  });

  testWidgets('a table of contents honours minLevel and maxLevel', (tester) async {
    final macro = tocMacro();
    macro['attrs']['parameters']['macroParams'] = {
      'minLevel': {'value': '2'},
      'maxLevel': {'value': '2'},
    };

    await pumpArticle(tester, doc([macro, heading(1, 'Too shallow'), heading(2, 'Just right'), heading(3, 'Too deep')]));

    expect(find.text('Just right'), findsOneWidget, reason: 'the only level in range');
    expect(find.text('Too shallow'), findsNothing, reason: 'below minLevel');
    expect(find.text('Too deep'), findsNothing, reason: 'above maxLevel');
    // All three still render as headings; only the listing is filtered.
    expect(inRichText(tester, 'Too shallow'), isTrue);
    expect(inRichText(tester, 'Too deep'), isTrue);
  });

  testWidgets('a table of contents on a page with no headings renders nothing', (tester) async {
    await pumpArticle(tester, doc([tocMacro()]));

    expect(tester.takeException(), isNull);
    expect(find.text('On this page'), findsNothing);
  });

  testWidgets('an unknown macro still shows that something is there', (tester) async {
    // The behaviour that replaced silently dropping the node.
    await pumpArticle(tester, doc([
      {
        'type': 'extension',
        'attrs': {
          'extensionKey': 'jira-issues',
          'parameters': {
            'macroMetadata': {'title': 'Jira issues'},
          },
        },
      },
    ]));

    expect(tester.takeException(), isNull);
    expect(find.text('Jira issues'), findsOneWidget);
  });

  testWidgets('ordered lists are numbered, not bulleted', (tester) async {
    await pumpArticle(tester, doc([
      {
        'type': 'orderedList',
        'attrs': {'order': 3},
        'content': [
          {
            'type': 'listItem',
            'content': [
              {
                'type': 'paragraph',
                'content': [
                  {'type': 'text', 'text': 'third'},
                ],
              },
            ],
          },
          {
            'type': 'listItem',
            'content': [
              {
                'type': 'paragraph',
                'content': [
                  {'type': 'text', 'text': 'fourth'},
                ],
              },
            ],
          },
        ],
      },
    ]));

    // Numbering starts at the list's own `order`, which Confluence uses for a
    // list continued after an interruption. The marker is a span, not a Text.
    expect(inRichText(tester, '3.'), isTrue);
    expect(inRichText(tester, '4.'), isTrue);
  });
}
