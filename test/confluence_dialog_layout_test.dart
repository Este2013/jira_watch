import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_search_dialog.dart';
import 'package:jira_watcher/ui/confluence_widgets/confluence_space_picker.dart';

/// Both dialogs put a lazy ListView inside an AlertDialog. Constraining that
/// dialog with a `minWidth` makes it ask the content how wide it wants to be,
/// and a viewport cannot answer without building every child — so it throws
/// "RenderViewport does not support returning intrinsic dimensions" the moment
/// the dialog opens.
///
/// Nothing about that is visible in the source, and the analyzer cannot see it,
/// so it is pinned here: these pump the real dialogs and fail if laying one out
/// throws.
/// Opened through [showDialog], not built directly into the tree: a dialog
/// placed in a Scaffold body gets tight constraints from its parent and lays
/// out fine either way. It is the loose constraints of the dialog route that
/// make a minWidth reach for the content's intrinsic width, so anything less
/// than a real showDialog would pass while the app still threw.
Future<void> pumpDialog(WidgetTester tester, Widget dialog) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => showDialog(context: context, builder: (_) => dialog),
            child: const Text('open'),
          ),
        ),
      ),
    ),
  );

  await tester.tap(find.text('open'));
  // One frame past the route push: the assertion fires during performLayout.
  await tester.pump();
  await tester.pump();
}

/// The list only exists once data has loaded, and a widget test's clock never
/// lets these dialogs' fetches complete — so pumping one shows a spinner, with
/// no viewport present to throw. Rather than build a fake Confluence to reach
/// the state that crashes, this asserts the rule that prevents it: no minWidth.
///
/// That pins the fix rather than the symptom, which is worth being explicit
/// about. It still fails if anyone puts the constraint back, which is the way
/// this bug would return.
void expectNoMinWidth(WidgetTester tester) {
  final dialog = tester.widget<AlertDialog>(find.byType(AlertDialog));
  expect(
    dialog.constraints?.minWidth ?? 0,
    0,
    reason: 'a minWidth makes the dialog measure the intrinsic width of its lazy ListView, which throws',
  );
}

void main() {
  // Deliberately not pumpAndSettle: both dialogs fetch in initState, and a
  // widget test's clock never lets that complete, so settling would time out.
  testWidgets('the space picker lays out, and constrains no minimum width', (tester) async {
    await pumpDialog(tester, const ConfluenceSpacePickerDialog());

    expect(tester.takeException(), isNull);
    expect(find.text('Open a space'), findsOneWidget);
    expectNoMinWidth(tester);
  });

  testWidgets('the search dialog lays out, and constrains no minimum width', (tester) async {
    await pumpDialog(tester, const ConfluenceSearchDialog());

    expect(tester.takeException(), isNull);
    expect(find.text('Search Confluence'), findsOneWidget);
    expectNoMinWidth(tester);
  });

  testWidgets('the space picker lays out in a small window', (tester) async {
    // The dialog's own maxWidth is 650; a window narrower than that is where a
    // fixed content width would overflow instead.
    tester.view.physicalSize = const Size(800, 600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);

    await pumpDialog(tester, const ConfluenceSpacePickerDialog());

    expect(tester.takeException(), isNull);
  });
}
