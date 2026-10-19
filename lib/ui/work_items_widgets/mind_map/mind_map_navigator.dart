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
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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

            return Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: _SpokesPainter(
                      centre: centrePosition,
                      satellites: satellites,
                      positions: placed,
                      hovered: _hovered,
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
                    child: _satelliteChip(satellite),
                  ),
                _placed(
                  position: centrePosition,
                  scale: scaleOf(_centreId, 1.16),
                  child: _centreChip(),
                ),
              ],
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

  Widget _centreChip() {
    final node = widget.focused;
    if (node == null) {
      return _MindMapChip(
        title: 'Your map',
        subtitle: widget.neighbours.isEmpty ? 'Nothing on it yet' : '${widget.neighbours.length} topics',
        icon: Symbols.workspaces,
        colour: Theme.of(context).colorScheme.primary,
        emphasis: _ChipEmphasis.centre,
        onTap: widget.onCentreTap,
      );
    }
    return _MindMapChip(
      title: node.title,
      subtitle: node.workItemKey ?? (node.tags.isNotEmpty ? node.tags.map((t) => '#$t').join(' ') : null),
      icon: node.kind.icon,
      colour: node.color,
      emphasis: _ChipEmphasis.centre,
      showsInterior: node.hasInterior,
      onTap: widget.onCentreTap,
      onSecondaryTap: (position) => widget.onNodeMenu(node, position),
    );
  }

  Widget _satelliteChip(_Satellite satellite) {
    if (satellite.isOverflow) {
      return _MindMapChip(
        title: '+${satellite.overflow.length} more',
        subtitle: 'Too many to show',
        icon: Symbols.more_horiz,
        colour: Theme.of(context).colorScheme.outline,
        emphasis: _ChipEmphasis.satellite,
        onTap: () => widget.onShowOverflow?.call(satellite.overflow),
      );
    }

    if (satellite.ghost case final ghost?) {
      return _MindMapChip(
        title: ghost.title,
        subtitle: '${ghost.relation} · ${ghost.workItemKey}',
        icon: Symbols.add_circle,
        colour: Theme.of(context).colorScheme.outline,
        emphasis: _ChipEmphasis.ghost,
        tooltip: 'Jira links this one. Click to put it on the map.',
        onTap: () => widget.onAcceptGhost(ghost),
        onHover: (hovering) => setState(() => _hovered = hovering ? satellite.id : null),
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
      showsInterior: node.hasInterior,
      onTap: () => widget.onFocus(node.id),
      onSecondaryTap: (position) => widget.onNodeMenu(node, position),
      onHover: (hovering) => setState(() => _hovered = hovering ? satellite.id : null),
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
    required this.hovered,
    required this.colour,
    required this.focusColour,
    required this.opacity,
  });

  final Offset centre;
  final List<_Satellite> satellites;
  final Map<String, Offset> positions;
  final String? hovered;
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

      final isHovered = hovered == satellite.id;
      final relation = satellite.neighbour?.relation;
      final base = satellite.isGhost ? colour : (relation == MindMapRelation.connected ? colour : focusColour);

      final paint = Paint()
        ..color = base.withValues(alpha: (satellite.isGhost ? 0.3 : (isHovered ? 0.95 : 0.5)) * opacity)
        ..strokeWidth = isHovered ? 2.6 : (satellite.isGhost ? 1.1 : 1.8)
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
      old.centre != centre || old.positions.length != positions.length || old.hovered != hovered || old.opacity != opacity || !_samePositions(old.positions, positions);

  static bool _samePositions(Map<String, Offset> a, Map<String, Offset> b) {
    for (final entry in a.entries) {
      if (b[entry.key] != entry.value) return false;
    }
    return true;
  }
}
