/// The navigator: one node held in the middle, everything adjacent to it
/// arranged in a ring around it.
///
/// There is no canvas to arrange and no node to drag into place. That is the
/// point — a map you have to lay out by hand is a second job, and the whole
/// feature exists to save work rather than make more. Position is derived from
/// the graph every time, so the only thing a reader ever does is decide what is
/// related to what.
///
/// Clicking a node in the ring re-centres the whole constellation on it: the
/// clicked node travels inward, the old centre swings out to a slot of its own,
/// and anything shared between the two views slides from where it was to where
/// it now belongs rather than blinking out and back. That continuity is what
/// makes a jump feel like moving through one place instead of loading a new
/// screen.
library;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jira_watcher/models/mind_map_model.dart';
import 'package:jira_watcher/models/mind_map_suggestions.dart';
import 'package:material_symbols_icons/symbols.dart';

/// One thing drawn in the ring: a real neighbour, or a ghost Jira knows about
/// that the map does not have yet.
///
/// Kept as one type so the layout does not have to care which it is — a ghost
/// takes a slot like anything else, it is just drawn as not-quite-there.
class _Satellite {
  _Satellite.node(this.neighbour) : ghost = null, overflow = const [];
  _Satellite.ghost(this.ghost) : neighbour = null, overflow = const [];
  _Satellite.overflow(this.overflow) : neighbour = null, ghost = null;

  final MindMapNeighbour? neighbour;
  final MindMapGhost? ghost;

  /// The neighbours that did not fit, on the "+N more" chip.
  final List<MindMapNeighbour> overflow;

  bool get isGhost => ghost != null;
  bool get isOverflow => overflow.isNotEmpty;

  /// Stable across rebuilds, so the animation can tell which chip is which.
  String get id => neighbour?.node.id ?? (ghost != null ? 'ghost:${ghost!.workItemKey}' : 'overflow');
}

class MindMapNavigator extends StatefulWidget {
  const MindMapNavigator({
    super.key,
    required this.focused,
    required this.neighbours,
    required this.ghosts,
    required this.onFocus,
    required this.onAcceptGhost,
    required this.onNodeMenu,
    required this.onCentreTap,
    required this.onAddChild,
    required this.onEditCurrent,
    required this.onGoBack,
    this.onShowOverflow,
  });

  /// The node in the middle, or null for the home constellation of roots.
  final MindMapNode? focused;

  final List<MindMapNeighbour> neighbours;
  final List<MindMapGhost> ghosts;

  final void Function(String? nodeId) onFocus;
  final void Function(MindMapGhost ghost) onAcceptGhost;
  final void Function(MindMapNode node, Offset globalPosition) onNodeMenu;

  /// Tapping the middle opens it — the inspector, on a narrow window.
  final VoidCallback onCentreTap;

  /// `+`: a new topic inside whatever is in the middle.
  final VoidCallback onAddChild;

  /// `Enter` with nothing in the ring picked: edit the middle one.
  final VoidCallback onEditCurrent;

  /// `Escape` or `Backspace`: up a level.
  final VoidCallback onGoBack;

  final void Function(List<MindMapNeighbour> hidden)? onShowOverflow;

  /// Past this many, the ring stops being readable and the rest go behind a
  /// "+N more" chip. Ten is about where the labels start colliding at a
  /// sensible radius.
  static const int maxSatellites = 10;

  /// Ghosts are advice, not content, so they never crowd out the real ring.
  static const int maxGhosts = 5;

  @override
  State<MindMapNavigator> createState() => _MindMapNavigatorState();
}

class _MindMapNavigatorState extends State<MindMapNavigator> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 460), value: 1);

  /// Where each chip sat when the current move began, and where it is this
  /// frame. A chip present in both constellations travels between its two
  /// slots; one that is new to this view has no entry in [_from] and arrives
  /// from the middle instead.
  Map<String, Offset> _from = {};
  final Map<String, Offset> _current = {};
  Map<String, double> _fromScale = {};
  final Map<String, double> _currentScale = {};

  /// What the last laid-out constellation was centred on, so a *change* of
  /// focus can be told apart from any other rebuild.
  String? _lastFocusId;
  bool _focusInitialised = false;

  String? _hovered;

  /// Which chip in the ring the keyboard has picked out, as an index into the
  /// satellites of the constellation currently drawn. Null means the keyboard
  /// is "on" the middle node, which is where it starts and where Escape
  /// returns it.
  int? _highlight;

  /// The arrow last pressed and which way round the ring it turned.
  ///
  /// Held so that holding one arrow down walks the whole ring the same way
  /// instead of reversing halfway round and bouncing between two chips. A
  /// *different* arrow works its direction out afresh from where the pick now
  /// sits — see [_turnFor].
  LogicalKeyboardKey? _lastArrow;
  int? _lastTurn;

  /// Where each chip is headed this layout, kept from the last build so the
  /// arrow keys can ask which one actually lies to the right.
  Map<String, Offset> _targets = const {};

  final FocusNode _keyboard = FocusNode(debugLabel: 'Mind map navigator');

  @override
  void initState() {
    super.initState();
    _lastFocusId = widget.focused?.id;
    _focusInitialised = true;
  }

  @override
  void didUpdateWidget(MindMapNavigator old) {
    super.didUpdateWidget(old);
    final focusId = widget.focused?.id;
    if (!_focusInitialised || focusId != _lastFocusId) {
      // Freeze where everything is right now and travel from there — taking
      // the positions mid-flight rather than their old targets, so a second
      // click during the animation continues from what is on screen instead
      // of snapping back.
      _from = Map.of(_current);
      _fromScale = Map.of(_currentScale);
      _lastFocusId = focusId;
      _focusInitialised = true;
      // A new constellation: the old index would point at whichever node
      // happens to sit in that slot now, which is not what anyone picked.
      _letGoOfThePick();
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _keyboard.dispose();
    _controller.dispose();
    super.dispose();
  }

  // KEYBOARD //////////////////////////////////////////////////////////////////

  /// The keys that drive the map without the mouse.
  ///
  /// Two modes, and which one you are in is visible: with nothing picked out in
  /// the ring the keyboard acts on the node in the middle, and once an arrow
  /// has picked one it acts on that. Escape steps back out of the inner mode
  /// before it steps back up a level, so there is never a press that does
  /// something bigger than the reader expected.
  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent) return KeyEventResult.ignored;

    final key = event.logicalKey;

    // Arrows repeat, because holding one to go round the ring is the obvious
    // thing to try.
    if (key == LogicalKeyboardKey.arrowRight) return _move(const Offset(1, 0), 1, key);
    if (key == LogicalKeyboardKey.arrowDown) return _move(const Offset(0, 1), 1, key);
    if (key == LogicalKeyboardKey.arrowLeft) return _move(const Offset(-1, 0), -1, key);
    if (key == LogicalKeyboardKey.arrowUp) return _move(const Offset(0, -1), -1, key);

    // Nothing below this line should fire again just because a key is held
    // down: every one of them opens something or moves the whole map.
    if (event is KeyRepeatEvent) return KeyEventResult.ignored;

    // Matched on the character first, since `+` is a shifted key on some
    // layouts and a key of its own on others, and the logical key that arrives
    // differs accordingly. The two named keys are belt and braces.
    if (event.character == '+' || key == LogicalKeyboardKey.add || key == LogicalKeyboardKey.numpadAdd) {
      widget.onAddChild();
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.enter || key == LogicalKeyboardKey.numpadEnter) {
      final picked = _highlighted;
      if (picked == null) {
        widget.onEditCurrent();
      } else {
        _activate(picked);
      }
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.escape) {
      // Out of the ring first, up a level only once already there.
      if (_highlight != null) {
        setState(_letGoOfThePick);
      } else {
        widget.onGoBack();
      }
      return KeyEventResult.handled;
    }

    if (key == LogicalKeyboardKey.backspace) {
      widget.onGoBack();
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  /// Back to the middle, forgetting which way the arrows were turning — the
  /// next ring pick starts its own direction rather than inheriting one from
  /// a ring that is no longer on screen.
  void _letGoOfThePick() {
    _highlight = null;
    _lastArrow = null;
    _lastTurn = null;
  }

  /// The chip the keyboard has picked, or null — including when the ring has
  /// changed under it and the index no longer points at anything.
  _Satellite? get _highlighted {
    final index = _highlight;
    if (index == null) return null;
    final satellites = _satellites();
    return index < satellites.length ? satellites[index] : null;
  }

  /// Picks a chip out of the ring, or moves to the next one.
  ///
  /// The first press goes by direction, so pressing right lands on something
  /// that is actually to the right. After that the ring is a loop and the
  /// arrows walk it — but which way round an arrow means depends on where on
  /// the ring the pick is sitting, which is what [_turnFor] works out.
  KeyEventResult _move(Offset direction, int fallback, LogicalKeyboardKey key) {
    final satellites = _satellites();
    if (satellites.isEmpty) return KeyEventResult.ignored;

    final current = _highlight;
    if (current == null || current >= satellites.length) {
      setState(() {
        _highlight = _nearestTo(direction, satellites);
        _lastArrow = key;
        // That pick was made by direction, not by turning: which way round
        // this key means from where it landed is not settled until it is
        // pressed a second time.
        _lastTurn = null;
      });
      return KeyEventResult.handled;
    }

    // The same arrow held down keeps turning the way it already was; a
    // different one is read afresh against where the pick now sits.
    final turn = (key == _lastArrow && _lastTurn != null) ? _lastTurn! : _turnFor(direction, current, satellites, fallback);
    setState(() {
      _highlight = (current + turn + satellites.length) % satellites.length;
      _lastArrow = key;
      _lastTurn = turn;
    });
    return KeyEventResult.handled;
  }

  /// Which way round the ring [direction] means from the chip at [index].
  ///
  /// There is no one answer for a circle: up is counter-clockwise on the right
  /// of the ring and clockwise on the left, which is why a fixed mapping made
  /// the up arrow move the pick downwards for half of every ring. So the two
  /// chips either side are compared on where they actually are, and whichever
  /// genuinely lies that way wins.
  int _turnFor(Offset direction, int index, List<_Satellite> satellites, int fallback) {
    final here = _targets[satellites[index].id];
    final count = satellites.length;
    if (here == null || count < 2) return fallback;

    double scoreFor(int turn) {
      final there = _targets[satellites[(index + turn + count) % count].id];
      if (there == null) return double.negativeInfinity;
      final travel = there - here;
      if (travel.distance == 0) return double.negativeInfinity;
      final unit = travel / travel.distance;
      return unit.dx * direction.dx + unit.dy * direction.dy;
    }

    final forward = scoreFor(1);
    final back = scoreFor(-1);
    // Pressing up at the very top of the ring, or right at the far right:
    // both ways lead away from what was asked for, equally. Rather than
    // inventing an answer, carry on the way this arrow was already turning.
    if ((forward - back).abs() < 0.02) return _lastTurn ?? fallback;
    return forward > back ? 1 : -1;
  }

  /// The chip lying most nearly in [direction] from the middle.
  int _nearestTo(Offset direction, List<_Satellite> satellites) {
    var best = 0;
    // Below every real dot product, so the first candidate always wins against
    // it even when every chip lies the other way.
    var bestScore = -2.0;
    for (var i = 0; i < satellites.length; i++) {
      final offset = _targets[satellites[i].id];
      if (offset == null || offset.distance == 0) continue;
      final unit = offset / offset.distance;
      final score = unit.dx * direction.dx + unit.dy * direction.dy;
      if (score > bestScore) {
        bestScore = score;
        best = i;
      }
    }
    return best;
  }

  /// Does whatever a chip is for — the same act whether it was clicked or
  /// chosen with the keyboard, so the two can never drift apart.
  void _activate(_Satellite satellite) {
    _keyboard.requestFocus();
    setState(_letGoOfThePick);

    if (satellite.isOverflow) {
      widget.onShowOverflow?.call(satellite.overflow);
      return;
    }
    if (satellite.ghost case final ghost?) {
      widget.onAcceptGhost(ghost);
      return;
    }
    widget.onFocus(satellite.neighbour!.node.id);
  }

  /// The ring, in a deliberate order: the parent first so it always takes the
  /// top slot, then what is inside, then what is merely related.
  List<_Satellite> _satellites() {
    final shown = widget.neighbours.take(MindMapNavigator.maxSatellites).toList();
    final hidden = widget.neighbours.skip(MindMapNavigator.maxSatellites).toList();

    return [
      for (final neighbour in shown) _Satellite.node(neighbour),
      if (hidden.isNotEmpty) _Satellite.overflow(hidden),
      // Ghosts only once the ring is not already full: advice is worth less
      // than the map's own content, and a crowded ring is worth nothing.
      if (hidden.isEmpty)
        for (final ghost in widget.ghosts.take(MindMapNavigator.maxGhosts)) _Satellite.ghost(ghost),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final satellites = _satellites();
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        final centre = Offset(size.width / 2, size.height / 2);

        final realCount = satellites.where((s) => !s.isGhost).length;
        final radius = _radiusFor(size, realCount);

        // Targets: the real ring first, then ghosts further out, offset by half
        // a step so they sit in the gaps rather than directly behind anything.
        final targets = <String, Offset>{};
        final ghostList = satellites.where((s) => s.isGhost).toList();
        final realList = satellites.where((s) => !s.isGhost).toList();

        for (var i = 0; i < realList.length; i++) {
          targets[realList[i].id] = Offset.fromDirection(-pi / 2 + i * 2 * pi / max(realList.length, 1), radius);
        }
        for (var i = 0; i < ghostList.length; i++) {
          final step = 2 * pi / max(ghostList.length, 1);
          targets[ghostList[i].id] = Offset.fromDirection(-pi / 2 + step * i + step / 2, radius * 1.46);
        }
        targets[_centreId] = Offset.zero;
        _targets = targets;

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final t = Curves.easeOutCubic.transform(_controller.value);

            Offset positionOf(String id) {
              final target = targets[id] ?? Offset.zero;
              // Arriving from the middle, so a node that was not in the last
              // view appears to come out of the one that was just opened.
              final from = _from[id] ?? Offset.zero;
              final at = Offset.lerp(from, target, t)!;
              _current[id] = at;
              return at + centre;
            }

            double scaleOf(String id, double target) {
              final from = _fromScale[id] ?? 0.72;
              final at = from + (target - from) * t;
              _currentScale[id] = at;
              return at;
            }

            final placed = <String, Offset>{for (final satellite in satellites) satellite.id: positionOf(satellite.id)};
            final centrePosition = positionOf(_centreId);

            // Only what is on screen is remembered. Left to accumulate, these
            // would hold a position for every node visited all session — and
            // the next move would animate from a slot that node had in some
            // constellation three jumps ago.
            final onScreen = {...placed.keys, _centreId};
            _current.removeWhere((id, _) => !onScreen.contains(id));
            _currentScale.removeWhere((id, _) => !onScreen.contains(id));

            final highlighted = _highlighted?.id;

            return Focus(
              focusNode: _keyboard,
              // Claimed on arrival so the map answers the keyboard without
              // being clicked first. A text field taking focus — the search
              // box, the notes — takes these keys with it, which is exactly
              // right: typing a `+` into a note must not create a topic.
              autofocus: true,
              onKeyEvent: _onKey,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _SpokesPainter(
                        centre: centrePosition,
                        satellites: satellites,
                        positions: placed,
                        // The pointer wins when both are on something: it is
                        // the more deliberate of the two.
                        emphasised: _hovered ?? highlighted,
                        colour: Theme.of(context).colorScheme.outline,
                        focusColour: widget.focused?.color ?? Theme.of(context).colorScheme.primary,
                        opacity: t,
                      ),
                    ),
                  ),
                  for (final satellite in satellites)
                    _placed(
                      position: placed[satellite.id]!,
                      scale: scaleOf(satellite.id, satellite.isGhost ? 0.88 : 1),
                      child: _satelliteChip(satellite, isHighlighted: satellite.id == highlighted),
                    ),
                  _placed(
                    position: centrePosition,
                    scale: scaleOf(_centreId, 1.16),
                    // The middle is where the keyboard is whenever the ring is
                    // not, so it says so — otherwise Enter would be a guess.
                    child: _centreChip(isHighlighted: highlighted == null),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Center(child: _KeyboardHint(inTheRing: highlighted != null)),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// The id the middle chip animates under. A real node keeps its own id, so
  /// the node being opened is recognised as the same chip travelling inward
  /// rather than one vanishing and another appearing.
  String get _centreId => widget.focused?.id ?? 'home';

  /// Big enough that the chips in the ring do not touch, small enough to stay
  /// on screen. With few neighbours the ring stays compact rather than flinging
  /// three nodes into the far corners.
  double _radiusFor(Size size, int count) {
    final room = (min(size.width, size.height) / 2) - 70;
    if (count <= 1) return max(130, room * 0.52);
    // The radius at which [count] chips of this width sit side by side without
    // overlapping — pure trigonometry, and the reason a busy node spreads its
    // ring out instead of stacking labels on top of each other.
    final needed = (_satelliteWidth / 2 + 14) / sin(pi / count);
    return needed.clamp(140.0, max(150.0, room)).toDouble();
  }

  static const double _satelliteWidth = 158;

  Widget _placed({required Offset position, required double scale, required Widget child}) => Positioned(
    left: position.dx - _satelliteWidth / 2,
    top: position.dy - 44,
    width: _satelliteWidth,
    height: 88,
    child: Center(
      child: Transform.scale(scale: scale, child: child),
    ),
  );

  Widget _centreChip({required bool isHighlighted}) {
    final node = widget.focused;
    if (node == null) {
      return _MindMapChip(
        title: 'Your map',
        subtitle: widget.neighbours.isEmpty ? 'Nothing on it yet' : '${widget.neighbours.length} topics',
        icon: Symbols.workspaces,
        colour: Theme.of(context).colorScheme.primary,
        emphasis: _ChipEmphasis.centre,
        isHighlighted: isHighlighted,
        onTap: widget.onCentreTap,
      );
    }
    return _MindMapChip(
      title: node.title,
      subtitle: node.workItemKey ?? (node.tags.isNotEmpty ? node.tags.map((t) => '#$t').join(' ') : null),
      icon: node.kind.icon,
      colour: node.color,
      emphasis: _ChipEmphasis.centre,
      isHighlighted: isHighlighted,
      showsInterior: node.hasInterior,
      onTap: widget.onCentreTap,
      onSecondaryTap: (position) => widget.onNodeMenu(node, position),
    );
  }

  Widget _satelliteChip(_Satellite satellite, {required bool isHighlighted}) {
    // Every chip goes through _activate, so a click and an Enter are the same
    // act rather than two implementations of it.
    void activate() => _activate(satellite);
    void hover(bool hovering) => setState(() => _hovered = hovering ? satellite.id : null);

    if (satellite.isOverflow) {
      return _MindMapChip(
        title: '+${satellite.overflow.length} more',
        subtitle: 'Too many to show',
        icon: Symbols.more_horiz,
        colour: Theme.of(context).colorScheme.outline,
        emphasis: _ChipEmphasis.satellite,
        isHighlighted: isHighlighted,
        onTap: activate,
        onHover: hover,
      );
    }

    if (satellite.ghost case final ghost?) {
      return _MindMapChip(
        title: ghost.title,
        subtitle: '${ghost.relation} · ${ghost.workItemKey}',
        icon: Symbols.add_circle,
        colour: Theme.of(context).colorScheme.outline,
        emphasis: _ChipEmphasis.ghost,
        isHighlighted: isHighlighted,
        tooltip: 'Jira links this one. Click to put it on the map.',
        onTap: activate,
        onHover: hover,
      );
    }

    final neighbour = satellite.neighbour!;
    final node = neighbour.node;
    return _MindMapChip(
      title: node.title,
      subtitle: switch (neighbour.relation) {
        MindMapRelation.parent => 'Up a level',
        MindMapRelation.child => node.workItemKey ?? 'Inside',
        MindMapRelation.connected => neighbour.edge?.label ?? 'Connected',
      },
      icon: neighbour.relation == MindMapRelation.parent ? Symbols.arrow_upward : node.kind.icon,
      colour: node.color,
      emphasis: _ChipEmphasis.satellite,
      isHighlighted: isHighlighted,
      showsInterior: node.hasInterior,
      onTap: activate,
      onSecondaryTap: (position) => widget.onNodeMenu(node, position),
      onHover: hover,
    );
  }
}

/// The line along the bottom saying what the keyboard does from here.
///
/// Shown rather than left to be discovered: a shortcut nobody knows about is a
/// shortcut nobody uses, and the map is meant to be driven without the mouse.
/// It says different things in the two modes, which is also how a reader can
/// tell which one they are in.
class _KeyboardHint extends StatelessWidget {
  const _KeyboardHint({required this.inTheRing});

  final bool inTheRing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hints = inTheRing
        ? const [('Enter', 'open'), ('↑ ↓ ← →', 'next'), ('Esc', 'back to the middle')]
        : const [('+', 'new topic'), ('Enter', 'edit'), ('↑ ↓ ← →', 'pick one'), ('Esc', 'up a level')];

    return DefaultTextStyle(
      style: theme.textTheme.labelSmall!.copyWith(color: theme.hintColor),
      child: Wrap(
        spacing: 14,
        runSpacing: 4,
        alignment: WrapAlignment.center,
        children: [
          for (final (key, what) in hints)
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.dividerColor),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(key),
                ),
                Text(what),
              ],
            ),
        ],
      ),
    );
  }
}

enum _ChipEmphasis { centre, satellite, ghost }

/// One node as drawn on the map.
class _MindMapChip extends StatelessWidget {
  const _MindMapChip({
    required this.title,
    required this.icon,
    required this.colour,
    required this.emphasis,
    this.isHighlighted = false,
    this.subtitle,
    this.tooltip,
    this.showsInterior = false,
    this.onTap,
    this.onSecondaryTap,
    this.onHover,
  });

  final String title;
  final String? subtitle;
  final IconData icon;
  final Color colour;
  final _ChipEmphasis emphasis;

  /// Where the keyboard is. Drawn as a ring around the chip rather than by
  /// changing its own colours, so it reads as "this is selected" on top of
  /// whatever the chip already looked like.
  final bool isHighlighted;

  final String? tooltip;

  /// Draws the dot that says there is something written inside this node, so a
  /// reader can tell a full node from an empty one without opening it.
  final bool showsInterior;

  final VoidCallback? onTap;
  final void Function(Offset globalPosition)? onSecondaryTap;
  final void Function(bool hovering)? onHover;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isGhost = emphasis == _ChipEmphasis.ghost;
    final isCentre = emphasis == _ChipEmphasis.centre;

    final body = Container(
      constraints: const BoxConstraints(maxWidth: 158),
      padding: EdgeInsets.symmetric(horizontal: isCentre ? 14 : 10, vertical: isCentre ? 10 : 8),
      foregroundDecoration: isHighlighted
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: theme.colorScheme.primary, width: 2.5),
            )
          : null,
      decoration: BoxDecoration(
        color: isGhost ? theme.colorScheme.surface.withValues(alpha: 0.6) : Color.alphaBlend(colour.withValues(alpha: isCentre ? 0.28 : 0.16), theme.colorScheme.surface),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isGhost ? theme.colorScheme.outlineVariant : colour.withValues(alpha: isCentre ? 0.9 : 0.55),
          width: isCentre ? 2 : 1,
          // A ghost is drawn lighter than anything real, so advice never looks
          // like something the reader already decided.
          style: BorderStyle.solid,
        ),
        boxShadow: isCentre
            ? [BoxShadow(color: colour.withValues(alpha: 0.26), blurRadius: 18, spreadRadius: 1)]
            : const [BoxShadow(color: Color(0x14000000), blurRadius: 6, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 6,
            children: [
              Icon(icon, size: isCentre ? 18 : 15, color: isGhost ? theme.hintColor : colour),
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: (isCentre ? theme.textTheme.titleSmall : theme.textTheme.bodySmall)?.copyWith(
                    fontWeight: isCentre ? FontWeight.w700 : FontWeight.w600,
                    color: isGhost ? theme.hintColor : null,
                  ),
                ),
              ),
              if (showsInterior)
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(color: colour, shape: BoxShape.circle),
                ),
            ],
          ),
          if (subtitle != null)
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                subtitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall?.copyWith(color: theme.hintColor),
              ),
            ),
        ],
      ),
    );

    final interactive = MouseRegion(
      onEnter: (_) => onHover?.call(true),
      onExit: (_) => onHover?.call(false),
      child: GestureDetector(
        onTap: onTap,
        onSecondaryTapDown: onSecondaryTap == null ? null : (details) => onSecondaryTap!(details.globalPosition),
        child: body,
      ),
    );

    return tooltip == null ? interactive : Tooltip(message: tooltip!, child: interactive);
  }
}

/// The lines from the middle out to the ring.
///
/// Drawn rather than laid out because they have to follow the chips while the
/// constellation is still moving — a widget-based line would need a frame of
/// its own to catch up and the whole thing would visibly lag behind.
class _SpokesPainter extends CustomPainter {
  _SpokesPainter({
    required this.centre,
    required this.satellites,
    required this.positions,
    required this.emphasised,
    required this.colour,
    required this.focusColour,
    required this.opacity,
  });

  final Offset centre;
  final List<_Satellite> satellites;
  final Map<String, Offset> positions;

  /// The one spoke drawn brighter and thicker: whatever the pointer is over,
  /// or whatever the keyboard has picked.
  final String? emphasised;
  final Color colour;
  final Color focusColour;

  /// Fades the spokes in with the move, so lines never arrive before the chips
  /// they are supposed to join.
  final double opacity;

  @override
  void paint(Canvas canvas, Size size) {
    for (final satellite in satellites) {
      final end = positions[satellite.id];
      if (end == null) continue;

      final isEmphasised = emphasised == satellite.id;
      final relation = satellite.neighbour?.relation;
      final base = satellite.isGhost ? colour : (relation == MindMapRelation.connected ? colour : focusColour);

      final paint = Paint()
        ..color = base.withValues(alpha: (satellite.isGhost ? 0.3 : (isEmphasised ? 0.95 : 0.5)) * opacity)
        ..strokeWidth = isEmphasised ? 2.6 : (satellite.isGhost ? 1.1 : 1.8)
        ..strokeCap = StrokeCap.round;

      // The line stops short of both chips, so it reads as joining them rather
      // than running underneath and out the other side.
      final direction = end - centre;
      final distance = direction.distance;
      if (distance < 1) continue;
      final step = direction / distance;
      final start = centre + step * 44;
      final finish = end - step * 34;
      if ((finish - start).distance <= 0) continue;

      if (satellite.isGhost) {
        _dashed(canvas, start, finish, paint, dash: 3, gap: 5);
      } else if (relation == MindMapRelation.connected) {
        _dashed(canvas, start, finish, paint, dash: 9, gap: 6);
      } else {
        canvas.drawLine(start, finish, paint);
      }
    }
  }

  static void _dashed(Canvas canvas, Offset a, Offset b, Paint paint, {required double dash, required double gap}) {
    final delta = b - a;
    final length = delta.distance;
    if (length <= 0) return;
    final step = delta / length;
    var travelled = 0.0;
    while (travelled < length) {
      final end = min(travelled + dash, length);
      canvas.drawLine(a + step * travelled, a + step * end, paint);
      travelled = end + gap;
    }
  }

  @override
  bool shouldRepaint(_SpokesPainter old) =>
      old.centre != centre || old.positions.length != positions.length || old.emphasised != emphasised || old.opacity != opacity || !_samePositions(old.positions, positions);

  static bool _samePositions(Map<String, Offset> a, Map<String, Offset> b) {
    for (final entry in a.entries) {
      if (b[entry.key] != entry.value) return false;
    }
    return true;
  }
}
