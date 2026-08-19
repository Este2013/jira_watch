import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/utils/jira_ui_utils/jira_doc_renderer.dart';

Map<String, dynamic> doc(List<Map<String, dynamic>> content) => {'type': 'doc', 'version': 1, 'content': content};

Map<String, dynamic> paragraphWith(Map<String, dynamic> inlineNode) => {
  'type': 'paragraph',
  'content': [
    {'type': 'text', 'text': 'See '},
    inlineNode,
  ],
};

/// The shape Confluence actually emits for an inline attachment: an id and a
/// collection, and no `type` at all.
Map<String, dynamic> confluenceMediaInline() => {
  'type': 'mediaInline',
  'attrs': {'id': '27784982-2441-4671-8f99-1ef4969cac4d', 'collection': 'contentId-3886743715'},
};

Future<void> pump(WidgetTester tester, Map<String, dynamic> adf, {Widget Function(BuildContext, Map<String, dynamic>)? inlineBuilder}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: AdfRenderer(adf: adf, attachments: const [], mediaInlineBuilder: inlineBuilder),
        ),
      ),
    ),
  );
  await tester.pump();
}

void main() {
  group('mediaInline', () {
    testWidgets('a node with no type attribute renders instead of throwing', (tester) async {
      // The regression: `type` is optional on mediaInline and Confluence omits
      // it, which used to fall through to a thrown Exception and take the whole
      // document down with it.
      await pump(tester, doc([paragraphWith(confluenceMediaInline())]));

      expect(tester.takeException(), isNull);
    });

    testWidgets('a node with an explicit file type also renders', (tester) async {
      await pump(
        tester,
        doc([
          paragraphWith({
            'type': 'mediaInline',
            'attrs': {'type': 'file', 'id': 'abc', 'collection': 'contentId-1'},
          }),
        ]),
      );

      expect(tester.takeException(), isNull);
    });

    testWidgets('an unhandled type degrades to a placeholder rather than throwing', (tester) async {
      await pump(
        tester,
        doc([
          paragraphWith({
            'type': 'mediaInline',
            'attrs': {'type': 'link', 'id': 'abc'},
          }),
        ]),
      );

      expect(tester.takeException(), isNull);
      expect(find.byTooltip('This inline attachment cannot be shown.'), findsOneWidget);
    });

    testWidgets('a node with no id degrades to a placeholder', (tester) async {
      await pump(
        tester,
        doc([
          paragraphWith({
            'type': 'mediaInline',
            'attrs': {'collection': 'contentId-1'},
          }),
        ]),
      );

      expect(tester.takeException(), isNull);
      expect(find.byTooltip('This inline attachment has no id.'), findsOneWidget);
    });

    testWidgets('mediaInlineBuilder takes over resolution when given', (tester) async {
      // What the Confluence article view relies on: its attachments cannot be
      // matched out of the Jira-shaped `attachments` list, so it supplies its
      // own resolver and that must be what gets used.
      var receivedId = '';
      await pump(
        tester,
        doc([paragraphWith(confluenceMediaInline())]),
        inlineBuilder: (context, attrs) {
          receivedId = attrs['id'] as String;
          return const Text('built-by-hook');
        },
      );

      expect(receivedId, '27784982-2441-4671-8f99-1ef4969cac4d');
      expect(find.text('built-by-hook'), findsOneWidget);
    });
  });
}
