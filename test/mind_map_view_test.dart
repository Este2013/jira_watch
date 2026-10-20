import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira_watcher/models/mind_map_model.dart';
import 'package:jira_watcher/models/mind_map_suggestions.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_navigator.dart';
import 'package:jira_watcher/ui/work_items_widgets/mind_map/mind_map_view.dart';

/// A map and a suggester with no Jira behind it.
(MindMapModel, MindMapSuggestions) emptyMap() {
  final model = MindMapModel.inMemory();
  return (model, MindMapSuggestions(model, fetch: (_) async => null));
}

/// Scoped to the navigator: a node's title legitimately appears both on the
/// map and in the inspector's list of what is inside the focused node, so a
/// bare `find.text` would be ambiguous rather than wrong.
Finder onTheMap(String text) => find.descendant(of: find.byType(MindMapNavigator), matching: find.text(text));

Future<void> pumpView(WidgetTester tester, MindMapModel model, MindMapSuggestions suggestions, {Size size = const Size(1400, 900)}) async {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(body: MindMapView(model: model, suggestions: suggestions)),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('the map before anything is on it', () {
    testWidgets('invites the first topic rather than showing an empty canvas', (tester) async {
      final (model, suggestions) = emptyMap();
      await pumpView(tester, model, suggestions);

      expect(find.text('Nothing on the map yet'), findsOneWidget);
      expect(find.text('Create the first topic'), findsOneWidget);
    });
  });

  group('the navigator', () {
    testWidgets('draws the focused node and everything around it', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.attachWorkItem(key: 'WL-1', title: 'Crackle on launch', parentId: audio.id);
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);

      expect(onTheMap('Audio'), findsOneWidget);
      expect(onTheMap('Wave Link'), findsOneWidget);
      expect(onTheMap('Crackle on launch'), findsOneWidget);
    });

    testWidgets('clicking a node in the ring re-centres the map on it', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      final wave = model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.createTopic(title: 'The mixer', parentId: wave.id);
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await tester.tap(onTheMap('Wave Link'));
      await tester.pumpAndSettle();

      expect(model.focusedNodeId.value, wave.id);
      // What is inside the newly centred node is now in the ring.
      expect(onTheMap('The mixer'), findsOneWidget);
    });

    testWidgets('the home constellation shows the roots and nothing nested', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.createTopic(title: 'Buried', parentId: audio.id);
      model.createTopic(title: 'Video');

      await pumpView(tester, model, suggestions);

      expect(onTheMap('Your map'), findsOneWidget);
      expect(onTheMap('Audio'), findsOneWidget);
      expect(onTheMap('Video'), findsOneWidget);
      expect(onTheMap('Buried'), findsNothing);
    });

    testWidgets('a node with more neighbours than fit puts the rest behind one chip', (tester) async {
      final (model, suggestions) = emptyMap();
      final hub = model.createTopic(title: 'Hub');
      for (var i = 0; i < MindMapNavigator.maxSatellites + 4; i++) {
        model.createTopic(title: 'Child $i', parentId: hub.id);
      }
      model.focus(hub.id);

      await pumpView(tester, model, suggestions);

      expect(onTheMap('+4 more'), findsOneWidget);
    });
  });

  group('search', () {
    testWidgets('replaces the navigator with what it found', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.setNotes(audio.id, 'The USB enumeration one.');
      model.createTopic(title: 'Video');

      await pumpView(tester, model, suggestions);
      await tester.enterText(find.byType(TextField).first, 'enumeration');
      await tester.pumpAndSettle();

      expect(find.text('Audio'), findsOneWidget);
      expect(find.textContaining('in the notes'), findsOneWidget);
      expect(find.text('Video'), findsNothing);
    });

    testWidgets('offers to put a work item key on the map when it is not there', (tester) async {
      final (model, suggestions) = emptyMap();
      model.createTopic(title: 'Audio');

      await pumpView(tester, model, suggestions);
      await tester.enterText(find.byType(TextField).first, 'STUDIO-1234');
      await tester.pumpAndSettle();

      expect(find.text('Put STUDIO-1234 on the map'), findsOneWidget);
    });

    testWidgets('does not offer a key that is already on the map', (tester) async {
      final (model, suggestions) = emptyMap();
      model.attachWorkItem(key: 'STUDIO-1234', title: 'Already here');

      await pumpView(tester, model, suggestions);
      await tester.enterText(find.byType(TextField).first, 'STUDIO-1234');
      await tester.pumpAndSettle();

      expect(find.text('Put STUDIO-1234 on the map'), findsNothing);
      expect(find.text('Already here'), findsOneWidget);
    });

    testWidgets('says so plainly when nothing matches', (tester) async {
      final (model, suggestions) = emptyMap();
      model.createTopic(title: 'Audio');

      await pumpView(tester, model, suggestions);
      await tester.enterText(find.byType(TextField).first, 'zzzzzz');
      await tester.pumpAndSettle();

      expect(find.text('Nothing on the map matches that.'), findsOneWidget);
    });

    testWidgets('a result takes you to that node on the map', (tester) async {
      final (model, suggestions) = emptyMap();
      model.createTopic(title: 'Audio');
      final video = model.createTopic(title: 'Video');

      await pumpView(tester, model, suggestions);
      await tester.enterText(find.byType(TextField).first, 'video');
      await tester.pumpAndSettle();
      await tester.tap(find.text('Video').first);
      await tester.pumpAndSettle();

      expect(model.focusedNodeId.value, video.id);
    });
  });

  group('tags', () {
    testWidgets('are offered as filters once a node carries one', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.addTag(audio.id, 'regression');
      model.createTopic(title: 'Video');

      await pumpView(tester, model, suggestions);
      await tester.tap(find.text('#regression'));
      await tester.pumpAndSettle();

      expect(find.text('Audio'), findsOneWidget);
      expect(find.text('Video'), findsNothing);
    });
  });

  group('the inspector', () {
    testWidgets('opens beside the navigator on a wide window', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);

      expect(find.text('Notes'), findsOneWidget);
      expect(find.text('Inside'), findsOneWidget);
      expect(find.text('Links'), findsOneWidget);
    });

    testWidgets('stays out of the way on a narrow one', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.focus(audio.id);

      await pumpView(tester, model, suggestions, size: const Size(800, 900));

      expect(find.text('Notes'), findsNothing);
    });

    testWidgets('writes notes straight onto the node', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await tester.enterText(find.widgetWithText(TextField, 'What you would want to be told about this in six months.'), 'The flaky one.');
      await tester.pumpAndSettle();

      expect(model.nodeById(audio.id)!.notes, 'The flaky one.');
    });
  });

  group('the keyboard', () {
    /// The navigator claims focus on arrival, so a key can simply be sent.
    Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await tester.pumpAndSettle();
    }

    /// Four children, which the ring lays out at twelve, three, six and nine
    /// o'clock in the order they were created.
    (MindMapModel, MindMapSuggestions, MindMapNode) compass() {
      final (model, suggestions) = emptyMap();
      final hub = model.createTopic(title: 'Hub');
      for (final title in ['North', 'East', 'South', 'West']) {
        model.createTopic(title: title, parentId: hub.id);
      }
      model.focus(hub.id);
      return (model, suggestions, hub);
    }

    testWidgets('an arrow picks the node lying that way, not just the first one', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'East');
    });

    testWidgets('pressing down first picks the node below', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'South');
    });

    testWidgets('a second arrow walks on round the ring', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // East
      await press(tester, LogicalKeyboardKey.arrowRight); // South
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'South');
    });

    testWidgets('and wraps round the end rather than stopping', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // East
      await press(tester, LogicalKeyboardKey.arrowLeft); // back to North
      await press(tester, LogicalKeyboardKey.arrowLeft); // past it, round to West
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'West');
    });

    testWidgets('up from the left of the ring goes up, not down', (tester) async {
      // The reported bug: with a fixed counter-clockwise up, picking the left
      // node first and then pressing up moved the pick downwards.
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowLeft); // West
      await press(tester, LogicalKeyboardKey.arrowUp);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'North');
    });

    testWidgets('up from the right of the ring also goes up', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // East
      await press(tester, LogicalKeyboardKey.arrowUp);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'North');
    });

    testWidgets('down from the left of the ring goes down', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowLeft); // West
      await press(tester, LogicalKeyboardKey.arrowDown);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'South');
    });

    testWidgets('right from the bottom of the ring goes right', (tester) async {
      // The mirror of the same rule: at the bottom, clockwise points left.
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowDown); // South
      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'East');
    });

    testWidgets('left from the top of the ring goes left', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowUp); // North
      await press(tester, LogicalKeyboardKey.arrowLeft);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'West');
    });

    testWidgets('holding one arrow walks the whole ring instead of bouncing', (tester) async {
      // Each press on its own would reverse at the half-way point — right from
      // the bottom node genuinely points back east — so the direction an arrow
      // settled on is kept while that same arrow repeats.
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // East
      await press(tester, LogicalKeyboardKey.arrowRight); // South
      await press(tester, LogicalKeyboardKey.arrowRight); // West, not back to East
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'West');
    });

    testWidgets('letting go of the ring forgets which way it was turning', (tester) async {
      final (model, suggestions, _) = compass();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // East
      await press(tester, LogicalKeyboardKey.arrowRight); // South, turning clockwise
      await press(tester, LogicalKeyboardKey.escape); // back to the middle

      // A fresh pick, then up: read from where it lands rather than from the
      // clockwise turn the last round had settled into.
      await press(tester, LogicalKeyboardKey.arrowLeft); // West
      await press(tester, LogicalKeyboardKey.arrowUp);
      await press(tester, LogicalKeyboardKey.enter);

      expect(model.focusedNode!.title, 'North');
    });

    testWidgets('escape lets go of the ring before it goes anywhere', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.escape);

      // Still here: the first escape only stepped out of the ring.
      expect(model.focusedNodeId.value, audio.id);

      await press(tester, LogicalKeyboardKey.escape);
      expect(model.focusedNodeId.value, isNull);
    });

    testWidgets('escape with nothing picked goes up a level', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      final wave = model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.focus(wave.id);

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.escape);

      expect(model.focusedNodeId.value, audio.id);
    });

    testWidgets('backspace goes up a level even from inside the ring', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      final wave = model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.createTopic(title: 'Mixer', parentId: wave.id);
      model.focus(wave.id);

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight);
      await press(tester, LogicalKeyboardKey.backspace);

      expect(model.focusedNodeId.value, audio.id);
    });

    testWidgets('escape at the home constellation does nothing', (tester) async {
      final (model, suggestions) = emptyMap();
      model.createTopic(title: 'Audio');

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.escape);

      expect(model.focusedNodeId.value, isNull);
    });

    testWidgets('plus opens a new topic inside the current one', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      // The chord a keyboard actually sends: the key is `=`, and the `+` is in
      // the character. LogicalKeyboardKey.add has no physical key to simulate.
      await tester.sendKeyEvent(LogicalKeyboardKey.equal, character: '+');
      await tester.pumpAndSettle();

      expect(find.text('Inside Audio'), findsOneWidget);
    });

    testWidgets('enter with nothing picked edits the node in the middle', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.enter);

      expect(find.text('Edit topic'), findsOneWidget);
    });

    testWidgets('enter at the home constellation has nothing to edit', (tester) async {
      final (model, suggestions) = emptyMap();
      model.createTopic(title: 'Audio');

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.enter);

      expect(find.text('Edit topic'), findsNothing);
    });

    testWidgets('the ring is let go of when the map moves under it', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      final wave = model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.createTopic(title: 'Mixer', parentId: wave.id);
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // picks Wave Link
      await press(tester, LogicalKeyboardKey.enter); // and opens it

      // The second enter must edit the newly centred node rather than open
      // whatever now sits in the slot the last pick was pointing at.
      await press(tester, LogicalKeyboardKey.enter);
      expect(find.text('Edit topic'), findsOneWidget);
      expect(model.focusedNodeId.value, wave.id);
    });

    testWidgets('typing in the search box is not read as a shortcut', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await tester.tap(find.byType(TextField).first);
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).first, 'a+b');
      await tester.pumpAndSettle();

      // The plus landed in the box rather than opening the new-topic dialog.
      expect(find.text('Inside Audio'), findsNothing);
      expect(find.text('Nothing on the map matches that.'), findsOneWidget);
    });
  });

  group('links as nodes', () {
    Future<void> press(WidgetTester tester, LogicalKeyboardKey key) async {
      await tester.sendKeyEvent(key);
      await tester.pumpAndSettle();
    }

    /// Two topics pointing at the same page, plus one link of its own.
    (MindMapModel, MindMapSuggestions, MindMapNode, MindMapNode) shared() {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      final video = model.createTopic(title: 'Video');
      model.addLink(audio.id, url: 'https://app.qase.io/run/42', title: 'Smoke run 42');
      model.addLink(video.id, url: 'https://app.qase.io/run/42/', title: 'Smoke run 42');
      model.addLink(audio.id, url: 'https://gitlab.com/x/-/merge_requests/9', title: 'The fix');
      model.focus(audio.id);
      return (model, suggestions, audio, video);
    }

    testWidgets('are hidden until the mode is turned on', (tester) async {
      final (model, suggestions, _, _) = shared();

      await pumpView(tester, model, suggestions);

      expect(onTheMap('Smoke run 42'), findsNothing);
    });

    testWidgets('alt+L draws the focused node links around it', (tester) async {
      final (model, suggestions, _, _) = shared();

      await pumpView(tester, model, suggestions);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
      await press(tester, LogicalKeyboardKey.keyL);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
      await tester.pumpAndSettle();

      expect(onTheMap('Smoke run 42'), findsOneWidget);
      expect(onTheMap('The fix'), findsOneWidget);
      expect(model.linksAsNodes.value, isTrue);
    });

    testWidgets('alt+L again puts them away', (tester) async {
      final (model, suggestions, _, _) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
      await press(tester, LogicalKeyboardKey.keyL);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
      await tester.pumpAndSettle();

      expect(onTheMap('Smoke run 42'), findsNothing);
      expect(model.linksAsNodes.value, isFalse);
    });

    testWidgets('a link shared by two nodes says so', (tester) async {
      final (model, suggestions, _, _) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);

      expect(onTheMap('in 2 nodes'), findsOneWidget);
    });

    testWidgets('moving to a link shows every node holding it', (tester) async {
      final (model, suggestions, audio, video) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);
      await tester.tap(onTheMap('Smoke run 42'));
      await tester.pumpAndSettle();

      // Both holders are now in the ring — including the one the link was
      // reached from, since the point is seeing the whole web at once.
      expect(onTheMap('Audio'), findsOneWidget);
      expect(onTheMap('Video'), findsOneWidget);
      // And the map itself has not moved: escape comes back here.
      expect(model.focusedNodeId.value, audio.id);
      expect(video.id, isNotEmpty);
    });

    testWidgets('the same URL written two ways is one link', (tester) async {
      // Audio has it without a trailing slash and Video with one.
      final (model, suggestions, _, _) = shared();

      expect(model.nodesLinking('https://app.qase.io/run/42'), hasLength(2));
      expect(suggestions, isNotNull);
    });

    testWidgets('escape from a link comes back to the node', (tester) async {
      final (model, suggestions, audio, _) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);
      await tester.tap(onTheMap('Smoke run 42'));
      await tester.pumpAndSettle();
      await press(tester, LogicalKeyboardKey.escape);

      expect(onTheMap('Smoke run 42'), findsOneWidget); // back in the ring
      expect(find.text('Notes'), findsOneWidget); // the node inspector again
      expect(model.focusedNodeId.value, audio.id);
    });

    testWidgets('a holder in the ring is a way into that node', (tester) async {
      final (model, suggestions, _, video) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);
      await tester.tap(onTheMap('Smoke run 42'));
      await tester.pumpAndSettle();
      await tester.tap(onTheMap('Video'));
      await tester.pumpAndSettle();

      expect(model.focusedNodeId.value, video.id);
    });

    testWidgets('the inspector lists the nodes holding the link', (tester) async {
      final (model, suggestions, _, _) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);
      await tester.tap(onTheMap('Smoke run 42'));
      await tester.pumpAndSettle();

      expect(find.text('Held by 2 nodes'), findsOneWidget);
    });

    testWidgets('turning the mode off while standing on a link steps back out', (tester) async {
      final (model, suggestions, audio, _) = shared();
      model.setLinksAsNodes(true);

      await pumpView(tester, model, suggestions);
      await tester.tap(onTheMap('Smoke run 42'));
      await tester.pumpAndSettle();
      await tester.sendKeyDownEvent(LogicalKeyboardKey.altLeft);
      await press(tester, LogicalKeyboardKey.keyL);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.altLeft);
      await tester.pumpAndSettle();

      expect(find.text('Held by 2 nodes'), findsNothing);
      expect(model.focusedNodeId.value, audio.id);
    });

    testWidgets('ctrl+L adds a link to the node in the middle', (tester) async {
      final (model, suggestions, _, _) = shared();

      await pumpView(tester, model, suggestions);
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await press(tester, LogicalKeyboardKey.keyL);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pumpAndSettle();

      expect(find.text('Add a link'), findsOneWidget);
    });

    testWidgets('ctrl+L adds it to the node picked out of the ring instead', (tester) async {
      final (model, suggestions) = emptyMap();
      final audio = model.createTopic(title: 'Audio');
      model.createTopic(title: 'Wave Link', parentId: audio.id);
      model.focus(audio.id);

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.arrowRight); // picks Wave Link
      await tester.sendKeyDownEvent(LogicalKeyboardKey.controlLeft);
      await press(tester, LogicalKeyboardKey.keyL);
      await tester.sendKeyUpEvent(LogicalKeyboardKey.controlLeft);
      await tester.pumpAndSettle();

      expect(find.text('Add a link'), findsOneWidget);
      // Typing a URL would file it on Wave Link, not on Audio.
      await tester.enterText(find.widgetWithText(TextField, 'https://…'), 'https://example.com/x');
      await tester.tap(find.widgetWithText(FilledButton, 'Add'));
      await tester.pumpAndSettle();

      expect(model.nodes.list.firstWhere((n) => n.title == 'Wave Link').links, hasLength(1));
      expect(model.nodeById(audio.id)!.links, isEmpty);
    });

    testWidgets('a bare L is not a shortcut', (tester) async {
      final (model, suggestions, _, _) = shared();

      await pumpView(tester, model, suggestions);
      await press(tester, LogicalKeyboardKey.keyL);

      expect(find.text('Add a link'), findsNothing);
      expect(model.linksAsNodes.value, isFalse);
    });
  });
}
