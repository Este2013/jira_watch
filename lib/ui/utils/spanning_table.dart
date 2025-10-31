import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jira_watcher/ui/utils/json_viewer.dart';
import 'package:jira_watcher/utils/color_utils.dart';

/// Public API -----------------------------------------------------------------

class SpanTable extends MultiChildRenderObjectWidget {
  SpanTable({
    super.key,
    required this.columns,
    this.defaultColumnWidth = const FlexColumnWidth(1),
    this.columnWidths = const <int, TableColumnWidth>{},
    this.textDirection,
    this.border,
    this.cellPadding = EdgeInsets.zero,
    required List<SpanTableCell> cells,
  }) : assert(columns > 0),
       super(children: cells.map((c) => _SpanTableCellWidget(cell: c)).toList());

  factory SpanTable.fromCells(
    List<SpanTableCell> cells, {
    Key? key,
    TableColumnWidth defaultColumnWidth = const FlexColumnWidth(1),
    Map<int, TableColumnWidth> columnWidths = const <int, TableColumnWidth>{},
    TextDirection? textDirection,
    SpanTableBorder? border,
    EdgeInsets cellPadding = EdgeInsets.zero,
  }) {
    int maxReqCol = 0;
    for (var cell in cells) {
      int cellMaxReqcol = cell.col + cell.colSpan;
      if (cellMaxReqcol > maxReqCol) {
        maxReqCol = cellMaxReqcol;
      }
    }
    return SpanTable(
      key: key,
      columns: maxReqCol,
      cells: cells,
      border: border,
      cellPadding: cellPadding,
      columnWidths: columnWidths,
      defaultColumnWidth: defaultColumnWidth,
      textDirection: textDirection,
    );
  }
  factory SpanTable.fromJiraNode(
    Map node, {
    Key? key,
    required BuildContext context,
    TextDirection? textDirection,
    SpanTableBorder? border,
    EdgeInsets cellPadding = EdgeInsets.zero,
    Widget? Function(Map node)? headerCellBuilder,
    required Widget? Function(Map node) cellContentBuilder,
  }) {
    List content = node['content'];
    Map attrs = node['attrs'];
    // - "center" : align the table to the center of page, its width can be larger than the line length
    // = "align-start" : align the table left of the line length, its width cannot be larger than the line length
    String layout = attrs['layout'];
    String displayMode = attrs['displayMode'] ?? 'default'; // 'default', 'fixed'
    // Recommendations from Jira
    // Minimum width
    //  - 1 column table = 48px
    //  - 2 column table = 96px
    //  - 3 column table = 144px
    //  - > 3 column table = 144px
    // Maximum width: 1800
    // int width = attrs['width'];
    bool isNumberColumnEnabled = attrs['isNumberColumnEnabled'] ?? false;

    List<SpanTableCell> cells = [];
    List<List<bool>> occupationMatrix = [];

    for (var (rowID, row) in content.indexed) {
      if (isNumberColumnEnabled) {
        occupationMatrix.add([true]);
        occupationMatrix.last.addAll(List.filled((occupationMatrix.firstOrNull?.length ?? 1) - 1, false, growable: true));
        cells.add(
          SpanTableCell(
            row: rowID,
            col: 0,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: (Theme.of(context).textTheme.bodyMedium?.fontSize ?? 12) * 1.2),
              child: Center(child: Text(rowID.toString())),
            ),
          ),
        );
      } else {
        occupationMatrix.add(List.filled(occupationMatrix.firstOrNull?.length ?? 0, false, growable: true));
      }

      int colID = 0;
      for (var cell in row['content']) {
        // find next available coordinates

        if (occupationMatrix[rowID].isEmpty) {
          occupationMatrix[rowID].add(false);
        }
        while (occupationMatrix[rowID][colID]) {
          colID++;
          if (occupationMatrix[rowID].length <= colID) occupationMatrix[rowID].add(false);
        }

        Color? customBgColor = cell['attrs']?['background'] == null ? null : HexColor.fromHex(cell['attrs']?['background']);
        if (customBgColor != null && Theme.of(context).brightness == Brightness.dark) {
          customBgColor = customBgColor.toDarkMode();
        }
        int colSpan = (cell['attrs']?['colspan'] as int?) ?? 1;
        int rowSpan = (cell['attrs']?['rowspan'] as int?) ?? 1;
        // take note of the spots occupied by this cell
        for (int r = 0; r < rowSpan; r++) {
          if (occupationMatrix.length <= r + rowID) {
            occupationMatrix.add(List.filled(occupationMatrix.first.length, false, growable: true));
            if (isNumberColumnEnabled) occupationMatrix.last.first = true;
          }
          for (int c = 0; c < colSpan; c++) {
            if (occupationMatrix[r + rowID].length <= c + colID) {
              occupationMatrix[r + rowID].add(true);
            } else {
              occupationMatrix[r + rowID][c + colID] = true;
            }
          }
        }
        if (cell['type'] == 'tableHeader') {
          cells.add(
            SpanTableCell(
              row: rowID,
              rowSpan: rowSpan,
              col: colID,
              colSpan: colSpan,
              decoration: BoxDecoration(color: customBgColor ?? Theme.of(context).cardColor),
              child: (headerCellBuilder ?? cellContentBuilder).call(cell) ?? SizedBox.shrink(),
            ),
          );
        } else if (cell['type'] == 'tableCell') {
          cells.add(
            SpanTableCell(
              row: rowID,
              rowSpan: rowSpan,
              col: colID,
              colSpan: colSpan,
              decoration: BoxDecoration(color: customBgColor),
              child: (cellContentBuilder).call(cell) ?? SizedBox.shrink(),
            ),
          );
        } else {
          throw Exception('Unknown table cell type: ${cell['type']}');
        }
      }
      // if this row is longer than the rest, pad the rest
      if (occupationMatrix.last.length > occupationMatrix.first.length) {
        for (var row in occupationMatrix) {
          if (row.length < occupationMatrix.last.length) row.addAll([for (int i = 0; i < (occupationMatrix.last.length - row.length); i++) false]);
        }
      }
    }
    var dividerColor = Theme.of(context).dividerColor;
    var table = SpanTable.fromCells(
      cells,
      defaultColumnWidth: const FlexColumnWidth(1),
      columnWidths: {if (isNumberColumnEnabled) 0: IntrinsicColumnWidth()},
      border: SpanTableBorder(
        inner: BorderSide(color: dividerColor),
        outer: BorderSide(color: dividerColor),
      ),
      cellPadding: const EdgeInsets.all(8),
    );

    return table;
  }

  final int columns;

  /// Like Flutter's [Table.defaultColumnWidth].
  final TableColumnWidth defaultColumnWidth;

  /// Optional per-column overrides like Flutter's [Table.columnWidths].
  final Map<int, TableColumnWidth> columnWidths;

  final TextDirection? textDirection;

  /// Simple track border (outer + inner lines).
  final SpanTableBorder? border;

  /// Default padding inside each cell rect.
  final EdgeInsets cellPadding;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderSpanTable(
      columns: columns,
      defaultColumnWidth: defaultColumnWidth,
      columnWidths: columnWidths,
      textDirection: textDirection ?? Directionality.of(context),
      border: border,
      cellPadding: cellPadding,
    );
  }

  @override
  void updateRenderObject(BuildContext context, covariant RenderSpanTable renderObject) {
    renderObject
      ..columns = columns
      ..defaultColumnWidth = defaultColumnWidth
      ..columnWidths = columnWidths
      ..textDirection = textDirection ?? Directionality.of(context)
      ..border = border
      ..cellPadding = cellPadding;
  }
}

class SpanTableCell {
  const SpanTableCell({
    required this.row,
    required this.col,
    required this.child,
    this.rowSpan = 1,
    this.colSpan = 1,
    this.alignment = Alignment.center,
    this.padding,
    this.decoration,
  });

  final int row;
  final int col;
  final int rowSpan;
  final int colSpan;

  final Alignment alignment;
  final EdgeInsets? padding;
  final Decoration? decoration;

  final Widget child;
}

/// Border configuration
class SpanTableBorder {
  const SpanTableBorder({
    this.outer = const BorderSide(width: 1.0, color: Color(0xFFDDDDDD)),
    this.inner = const BorderSide(width: .5, color: Color(0xFFEEEEEE)),
    this.showInnerVertical = true,
    this.showInnerHorizontal = true,
  });

  final BorderSide outer;
  final BorderSide inner;

  /// Preferred field names
  final bool showInnerVertical;
  final bool showInnerHorizontal;

  /// Back-compat getters (so painter calls to drawInner* also work)
  bool get drawInnerVertical => showInnerVertical;
  bool get drawInnerHorizontal => showInnerHorizontal;
}

/// Internal widgets / parent data --------------------------------------------

class _SpanTableCellWidget extends ParentDataWidget<SpanParentData> {
  _SpanTableCellWidget({required this.cell}) : super(child: cell.child);
  final SpanTableCell cell;

  @override
  void applyParentData(RenderObject renderObject) {
    final d = renderObject.parentData as SpanParentData;
    bool needsLayout = false;

    if (d.row != cell.row) {
      d.row = cell.row;
      needsLayout = true;
    }
    if (d.col != cell.col) {
      d.col = cell.col;
      needsLayout = true;
    }
    if (d.rowSpan != cell.rowSpan) {
      d.rowSpan = cell.rowSpan;
      needsLayout = true;
    }
    if (d.colSpan != cell.colSpan) {
      d.colSpan = cell.colSpan;
      needsLayout = true;
    }
    if (d.alignment != cell.alignment) {
      d.alignment = cell.alignment;
      needsLayout = true;
    }
    if (d.padding != cell.padding) {
      d.padding = cell.padding;
      needsLayout = true;
    }
    if (d.decoration != cell.decoration) {
      d.decoration = cell.decoration;
      needsLayout = true;
    }

    if (needsLayout) {
      final parent = renderObject.parent;
      if (parent is RenderObject) parent.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => SpanTable;
}

class SpanParentData extends ContainerBoxParentData<RenderBox> {
  int row = 0;
  int col = 0;
  int rowSpan = 1;
  int colSpan = 1;

  Alignment alignment = Alignment.center;
  EdgeInsets? padding;
  Decoration? decoration;

  // Computed during layout:
  Rect rect = Rect.zero;
}

/// Render object --------------------------------------------------------------
class _SpanMeasure {
  _SpanMeasure(this.col, this.colSpan, this.child, this.padH);
  final int col;
  final int colSpan;
  final RenderBox child;
  final double padH;
}

class RenderSpanTable extends RenderBox with ContainerRenderObjectMixin<RenderBox, SpanParentData>, RenderBoxContainerDefaultsMixin<RenderBox, SpanParentData> {
  RenderSpanTable({
    required int columns,
    required TableColumnWidth defaultColumnWidth,
    required Map<int, TableColumnWidth> columnWidths,
    required TextDirection textDirection,
    SpanTableBorder? border,
    EdgeInsets cellPadding = EdgeInsets.zero,
  }) : _columnsCount = columns,
       _defaultColumnWidth = defaultColumnWidth,
       _columnWidths = Map<int, TableColumnWidth>.unmodifiable(columnWidths),
       _textDirection = textDirection,
       _border = border,
       _cellPadding = cellPadding;

  int get rowsCount {
    int maxRow = 0;
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      maxRow = math.max(maxRow, d.row + d.rowSpan);
      child = d.nextSibling;
    }
    return maxRow;
  }

  // --- Config state
  int _columnsCount;
  set columns(int v) {
    if (v != _columnsCount) {
      _columnsCount = v;
      markNeedsLayout();
    }
  }

  TableColumnWidth _defaultColumnWidth;
  set defaultColumnWidth(TableColumnWidth v) {
    if (v != _defaultColumnWidth) {
      _defaultColumnWidth = v;
      markNeedsLayout();
    }
  }

  Map<int, TableColumnWidth> _columnWidths;
  set columnWidths(Map<int, TableColumnWidth> v) {
    if (!mapEquals(v, _columnWidths)) {
      _columnWidths = Map.unmodifiable(v);
      markNeedsLayout();
    }
  }

  TextDirection _textDirection;
  set textDirection(TextDirection v) {
    if (v != _textDirection) {
      _textDirection = v;
      markNeedsLayout();
    }
  }

  SpanTableBorder? _border;
  set border(SpanTableBorder? v) {
    if (v != _border) {
      _border = v;
      markNeedsPaint();
    }
  }

  EdgeInsets _cellPadding;
  set cellPadding(EdgeInsets v) {
    if (v != _cellPadding) {
      _cellPadding = v;
      markNeedsLayout();
    }
  }

  // --- Scratch
  late List<double> _colWidths;
  late List<double> _colOffsets;
  late List<double> _rowHeights;
  late List<double> _rowOffsets;

  @override
  void performLayout() {
    final maxW = constraints.hasBoundedWidth ? constraints.maxWidth : double.infinity;

    _colWidths = List<double>.filled(_columnsCount, 0.0);

    // Collect cells for intrinsic sizing
    final perColSingles = List<List<_SpanMeasure>>.generate(_columnsCount, (_) => <_SpanMeasure>[]);
    final spanMeasures = <_SpanMeasure>[];

    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      if (d.col >= 0 && d.col < _columnsCount) {
        if (d.colSpan == 1) {
          final padH = (d.padding ?? _cellPadding).horizontal;
          perColSingles[d.col].add(_SpanMeasure(d.col, 1, child, padH));
        } else if (d.rowSpan == 1 && d.colSpan > 1) {
          // We'll use this to push intrinsic columns inside the span
          final padH = (d.padding ?? _cellPadding).horizontal;
          spanMeasures.add(_SpanMeasure(d.col, d.colSpan, child, padH));
        }
      }
      child = d.nextSibling;
    }

    double fixedTotal = 0.0;
    double flexTotalFactor = 0.0;
    final flexCols = <int, double>{};

    for (int i = 0; i < _columnsCount; i++) {
      final spec = _columnWidths[i] ?? _defaultColumnWidth;
      if (spec is FixedColumnWidth) {
        _colWidths[i] = spec.value;
      } else if (spec is FractionColumnWidth) {
        _colWidths[i] = (maxW.isFinite ? maxW : 0) * spec.value;
      } else if (spec is FlexColumnWidth) {
        flexCols[i] = spec.value; // assigned later
      } else if (spec is IntrinsicColumnWidth) {
        _colWidths[i] = _maxIntrinsicSingles(perColSingles[i]);
      } else {
        _colWidths[i] = _maxIntrinsicSingles(perColSingles[i]); // fallback
      }
      fixedTotal += _colWidths[i];
      if (spec is FlexColumnWidth) flexTotalFactor += spec.value;
    }

    for (final s in spanMeasures) {
      final start = s.col.clamp(0, _columnsCount);
      final end = math.min(_columnsCount, start + s.colSpan);

      // How wide the child would like to be (including padding)
      final want = s.child.getMaxIntrinsicWidth(double.infinity) + s.padH;

      // Current sum width of the spanned columns
      double have = 0;
      final intrinsicCols = <int>[];
      final spanFlexCols = <int, double>{};
      for (int i = start; i < end; i++) {
        have += _colWidths[i];
        final spec = _columnWidths[i] ?? _defaultColumnWidth;
        if (spec is IntrinsicColumnWidth) intrinsicCols.add(i);
        if (spec is FlexColumnWidth) spanFlexCols[i] = spec.value;
      }

      final deficit = want - have;
      if (deficit > 0) {
        double remainingDeficit = deficit;

        // 1) Grow intrinsic columns evenly
        if (intrinsicCols.isNotEmpty) {
          final share = remainingDeficit / intrinsicCols.length;
          for (final i in intrinsicCols) {
            final grown = (_colWidths[i] + share).clamp(0.0, double.infinity);
            remainingDeficit -= (grown - _colWidths[i]);
            _colWidths[i] = grown;
          }
        }

        // 2) If still short, grow flex columns by flex factor
        if (remainingDeficit > 0 && spanFlexCols.isNotEmpty) {
          final localFlexSum = spanFlexCols.values.fold<double>(0, (a, b) => a + b);
          if (localFlexSum > 0) {
            spanFlexCols.forEach((i, f) {
              final delta = remainingDeficit * (f / localFlexSum);
              _colWidths[i] = (_colWidths[i] + delta).clamp(0.0, double.infinity);
            });
            remainingDeficit = 0;
          }
        }

        // 3) Update fixedTotal by what we actually grew
        final newHave = () {
          double sum = 0;
          for (int i = start; i < end; i++) {
            sum += _colWidths[i];
          }
          return sum;
        }();
        fixedTotal += (newHave - have);
      }
    }

    // Distribute remaining space to flex columns (after intrinsic growth)
    final remaining = (maxW.isFinite ? maxW : fixedTotal) - fixedTotal;
    if (remaining > 0 && flexTotalFactor > 0) {
      flexCols.forEach((i, factor) {
        _colWidths[i] = _colWidths[i] + remaining * (factor / flexTotalFactor);
      });
    }

    // Clamp and proceed as before...
    for (int i = 0; i < _columnsCount; i++) {
      _colWidths[i] = _colWidths[i].clamp(0.0, double.infinity);
    }
    _colOffsets = List<double>.filled(_columnsCount + 1, 0.0);
    for (int i = 0; i < _columnsCount; i++) {
      _colOffsets[i + 1] = _colOffsets[i] + _colWidths[i];
    }

    _rowHeights = List.filled(rowsCount, 0);
    _rowOffsets = List.filled(rowsCount, 0);
    _layoutSinglesForRowHeights();
    _layoutMultiRowToExpandRows();

    _rowOffsets = List<double>.filled(rowsCount + 1, 0.0);
    for (int r = 0; r < rowsCount; r++) {
      _rowOffsets[r + 1] = _rowOffsets[r] + _rowHeights[r];
    }

    // Apply parent’s height if it forces us taller than content: grow last row.
    final desiredSize = Size(_colOffsets.last, _rowOffsets.last);
    final finalSize = constraints.constrain(desiredSize);
    final extraH = finalSize.height - desiredSize.height;
    if (extraH > 0 && rowsCount > 0) {
      _rowHeights[rowsCount - 1] += extraH;
      // Recompute offsets with the expanded last row.
      _rowOffsets[0] = 0;
      for (int r = 0; r < rowsCount; r++) {
        _rowOffsets[r + 1] = _rowOffsets[r] + _rowHeights[r];
      }
    }

    // Final positioning
    _positionChildren();

    size = finalSize;
  }

  @override
  void setupParentData(RenderBox child) {
    if (child.parentData is! SpanParentData) {
      child.parentData = SpanParentData();
    }
  }

  double _maxIntrinsicSingles(List<_SpanMeasure> cells) {
    double w = 0.0;
    for (final m in cells) {
      final cw = m.child.getMaxIntrinsicWidth(double.infinity) + m.padH;
      if (cw > w) w = cw;
    }
    return w;
  }

  void _layoutSinglesForRowHeights() {
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      final pad = (d.padding ?? _cellPadding);
      if (d.rowSpan == 1) {
        final w = _spanWidth(d.col, d.colSpan) - pad.horizontal;
        // child.layout(BoxConstraints(maxWidth: w.clamp(0.0, double.infinity)), parentUsesSize: true);
        child.layout(
          BoxConstraints.tightFor(width: w.clamp(0.0, double.infinity)),
          parentUsesSize: true,
        );
        final h = child.size.height + pad.vertical;
        _rowHeights[d.row] = math.max(_rowHeights[d.row], h);
      }
      child = d.nextSibling;
    }
  }

  void _layoutMultiRowToExpandRows() {
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      final pad = (d.padding ?? _cellPadding);
      if (d.rowSpan > 1) {
        final w = _spanWidth(d.col, d.colSpan) - pad.horizontal;
        // child.layout(BoxConstraints(maxWidth: w.clamp(0.0, double.infinity)), parentUsesSize: true);
        child.layout(
          BoxConstraints.tightFor(width: w.clamp(0.0, double.infinity)),
          parentUsesSize: true,
        );
        final need = child.size.height + pad.vertical;
        final have = _spanHeightCurrent(d.row, d.rowSpan);
        if (need > have) {
          _rowHeights[d.row + d.rowSpan - 1] += (need - have);
        }
      }
      child = childParentData(child).nextSibling;
    }
  }

  double _spanWidth(int col, int colSpan) {
    final start = col.clamp(0, _columnsCount);
    final end = math.min(_columnsCount, start + colSpan);
    return _colOffsets[end] - _colOffsets[start];
  }

  double _spanHeightCurrent(int row, int rowSpan) {
    final rCount = _rowHeights.length;
    final start = row.clamp(0, rCount);
    final end = math.min(rCount, start + rowSpan);
    double h = 0.0;
    for (int r = start; r < end; r++) {
      h += _rowHeights[r];
    }
    return h;
  }

  void _positionChildren() {
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      final pad = (d.padding ?? _cellPadding);
      final left = _colOffsets[d.col];
      final top = _rowOffsets[d.row];
      final width = _spanWidth(d.col, d.colSpan);
      final height = _rowOffsets[d.row + d.rowSpan] - _rowOffsets[d.row];
      final inner = Rect.fromLTWH(
        left + pad.left,
        top + pad.top,
        math.max(0, width - pad.horizontal),
        math.max(0, height - pad.vertical),
      );

      // Tight width; height unconstrained (child chose earlier).
      child.layout(BoxConstraints.tightFor(width: inner.width), parentUsesSize: true);

      final offset = d.alignment.alongOffset(
        Offset(
          (inner.width - child.size.width),
          (inner.height - child.size.height),
        ),
      );
      d.offset = Offset(inner.left, inner.top) + offset;

      d.rect = Rect.fromLTWH(left, top, width, height);
      child = d.nextSibling;
    }
  }

  SpanParentData childParentData(RenderBox child) => child.parentData! as SpanParentData;

  @override
  void paint(PaintingContext context, Offset offset) {
    // Decorations under children
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      final deco = d.decoration;
      if (deco != null) {
        final painter = deco.createBoxPainter();
        painter.paint(
          context.canvas,
          d.rect.shift(offset).topLeft,
          ImageConfiguration(size: d.rect.size),
        );
      }
      child = d.nextSibling;
    }

    // Children
    defaultPaint(context, offset);

    // Grid (fixed to respect row/col spans)
    final b = _border;
    if (b != null) {
      final canvas = context.canvas;

      // Keep outer border matching the laid-out widget size.
      final rect = Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);

      // Outer
      if (b.outer.style != BorderStyle.none && b.outer.width > 0) {
        final pOuter = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = b.outer.width
          ..color = b.outer.color;
        canvas.drawRect(rect.deflate(b.outer.width / 2), pOuter);
      }

      // Inner (draw only where not covered by spans)
      if (b.inner.style != BorderStyle.none && b.inner.width > 0) {
        final pInner = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = b.inner.width
          ..color = b.inner.color;

        // Vertical inner lines (between columns)
        if (b.showInnerVertical && _colOffsets.length >= 2) {
          for (int edgeCol = 1; edgeCol < _colOffsets.length - 1; edgeCol++) {
            final x = offset.dx + _colOffsets[edgeCol];
            for (int r = 0; r < rowsCount; r++) {
              if (_shouldDrawVerticalSegment(edgeCol, r)) {
                final y1 = offset.dy + _rowOffsets[r];
                final y2 = offset.dy + _rowOffsets[r + 1];
                canvas.drawLine(Offset(x, y1), Offset(x, y2), pInner);
              }
            }
          }
        }

        // Horizontal inner lines (between rows)
        if (b.showInnerHorizontal && _rowOffsets.length >= 2) {
          for (int edgeRow = 1; edgeRow < _rowOffsets.length - 1; edgeRow++) {
            final y = offset.dy + _rowOffsets[edgeRow];
            for (int c = 0; c < _colOffsets.length - 1; c++) {
              if (_shouldDrawHorizontalSegment(edgeRow, c)) {
                final x1 = offset.dx + _colOffsets[c];
                final x2 = offset.dx + _colOffsets[c + 1];
                canvas.drawLine(Offset(x1, y), Offset(x2, y), pInner);
              }
            }
          }
        }
      }
    }
  }

  // Returns true if there is NO cell spanning across the vertical boundary
  // at column edge `edgeCol` for the row band `rowBand`.
  bool _shouldDrawVerticalSegment(int edgeCol, int rowBand) {
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      final spansAcrossThisEdge = d.col < edgeCol && (d.col + d.colSpan) > edgeCol;
      final coversThisRowBand = d.row <= rowBand && (d.row + d.rowSpan) > rowBand;
      if (spansAcrossThisEdge && coversThisRowBand) {
        return false; // merged cell crosses this vertical edge here
      }
      child = childParentData(child).nextSibling;
    }
    return true;
  }

  // Returns true if there is NO cell spanning across the horizontal boundary
  // at row edge `edgeRow` for the column band `colBand`.
  bool _shouldDrawHorizontalSegment(int edgeRow, int colBand) {
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      final spansAcrossThisEdge = d.row < edgeRow && (d.row + d.rowSpan) > edgeRow;
      final coversThisColBand = d.col <= colBand && (d.col + d.colSpan) > colBand;
      if (spansAcrossThisEdge && coversThisColBand) {
        return false; // merged cell crosses this horizontal edge here
      }
      child = childParentData(child).nextSibling;
    }
    return true;
  }

  @override
  bool hitTestChildren(BoxHitTestResult result, {required Offset position}) {
    return defaultHitTestChildren(result, position: position);
  }

  @override
  double computeMinIntrinsicWidth(double height) => 0;

  @override
  double computeMaxIntrinsicWidth(double height) {
    double sum = 0;
    final perColSingles = List<List<_SpanMeasure>>.generate(_columnsCount, (_) => <_SpanMeasure>[]);
    RenderBox? child = firstChild;
    while (child != null) {
      final d = childParentData(child);
      if (d.colSpan == 1 && d.col >= 0 && d.col < _columnsCount) {
        final padH = (d.padding ?? _cellPadding).horizontal;
        perColSingles[d.col].add(_SpanMeasure(d.col, 1, child, padH));
      }
      child = d.nextSibling;
    }
    for (int i = 0; i < _columnsCount; i++) {
      sum += _maxIntrinsicSingles(perColSingles[i]);
    }
    return sum;
  }

  @override
  double computeMinIntrinsicHeight(double width) => 0;

  @override
  double computeMaxIntrinsicHeight(double width) => double.infinity;
}

//// TEST

class SpanTableTestPage extends StatefulWidget {
  const SpanTableTestPage({super.key, this.providedJiraTableNode, this.providedJiraCellContentBuilder}) : assert(!(providedJiraTableNode != null && providedJiraCellContentBuilder == null));

  final Map? providedJiraTableNode;
  final Widget? Function(Map cell)? providedJiraCellContentBuilder;

  @override
  State<SpanTableTestPage> createState() => _SpanTableTestPageState();
}

enum ColSpec { fixed120, flex1, flex2, fraction20, intrinsic }

class _SpanTableTestPageState extends State<SpanTableTestPage> {
  static const int _columns = 4;

  // Column spec per index
  final List<ColSpec> _specs = List.filled(_columns, ColSpec.flex1);

  bool _showBorder = true;
  bool _rtl = false;
  double _containerWidth = 600; // parent box width to test fraction/flex

  Map<int, TableColumnWidth> _buildColumnWidths() {
    final map = <int, TableColumnWidth>{};
    for (int i = 0; i < _columns; i++) {
      switch (_specs[i]) {
        case ColSpec.fixed120:
          map[i] = const FixedColumnWidth(120);
          break;
        case ColSpec.flex1:
          map[i] = const FlexColumnWidth(1);
          break;
        case ColSpec.flex2:
          map[i] = const FlexColumnWidth(2);
          break;
        case ColSpec.fraction20:
          map[i] = const FractionColumnWidth(.2);
          break;
        case ColSpec.intrinsic:
          map[i] = const IntrinsicColumnWidth();
          break;
      }
    }
    return map;
  }

  List<SpanTableCell> _buildDefaultCells() {
    return [
      // Header spanning all columns
      SpanTableCell(
        row: 0,
        col: 0,
        colSpan: 4,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Color(0xFFEFEFEF)),
        child: const Padding(
          padding: EdgeInsets.all(8),
          child: Text('Sales Report — Q3', style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      ),

      // Left rail spanning 3 rows
      SpanTableCell(
        row: 1,
        col: 0,
        rowSpan: 3,
        alignment: Alignment.centerLeft,
        decoration: const BoxDecoration(color: Color(0xFFF7F7F7)),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Regions'),
        ),
      ),

      // 2x2 KPI block
      SpanTableCell(
        row: 1,
        col: 1,
        rowSpan: 2,
        colSpan: 2,
        decoration: const BoxDecoration(color: Color(0xFFDDEBFF)),
        child: const Center(
          child: Text('Top KPI\n+18%', textAlign: TextAlign.center),
        ),
      ),

      const SpanTableCell(
        row: 1,
        col: 3,
        child: Align(alignment: Alignment.center, child: Text('Notes')),
      ),
      const SpanTableCell(
        row: 2,
        col: 3,
        child: Align(alignment: Alignment.center, child: Text('Owner')),
      ),
      const SpanTableCell(
        row: 3,
        col: 1,
        child: Align(alignment: Alignment.centerLeft, child: Text('West')),
      ),
      const SpanTableCell(
        row: 3,
        col: 2,
        child: Align(alignment: Alignment.centerLeft, child: Text('East')),
      ),
      const SpanTableCell(
        row: 3,
        col: 3,
        child: Align(alignment: Alignment.center, child: Text('Actions')),
      ),

      // Footer spanning last 3 columns
      SpanTableCell(
        row: 4,
        col: 1,
        colSpan: 3,
        alignment: Alignment.centerRight,
        decoration: const BoxDecoration(color: Color(0xFFEFEFEF)),
        child: const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Text('Totals ▶'),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final columnWidths = _buildColumnWidths();
    final border = _showBorder
        ? const SpanTableBorder(
            outer: BorderSide(width: 1, color: Color(0xFFCCCCCC)),
            inner: BorderSide(width: .5, color: Color(0xFFDDDDDD)),
            showInnerHorizontal: true,
            showInnerVertical: true,
          )
        : null;

    final table = Directionality(
      textDirection: _rtl ? TextDirection.rtl : TextDirection.ltr,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: _containerWidth),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SpanTable(
                    columns: _columns,
                    defaultColumnWidth: const FlexColumnWidth(1),
                    columnWidths: columnWidths,
                    border: border,
                    cellPadding: const EdgeInsets.all(8),
                    cells: _buildDefaultCells(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    return DefaultTabController(
      length: widget.providedJiraTableNode == null ? 1 : 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('SpanTable Playground'),
          bottom: TabBar(
            tabs: [
              if (widget.providedJiraTableNode != null) Tab(child: Text('Provided')),
              Tab(child: Text('Exemple')),
            ],
          ),
        ),

        body: TabBarView(
          children: [
            if (widget.providedJiraTableNode != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: JsonViewer(data: widget.providedJiraTableNode, initialExpandDepth: 5),
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Center(
                        child: SpanTable.fromJiraNode(widget.providedJiraTableNode!, context: context, cellContentBuilder: widget.providedJiraCellContentBuilder!),
                      ),
                    ),
                  ],
                ),
              ),
            Column(
              children: [
                // Controls
                Material(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Container width'),
                            const SizedBox(width: 8),
                            SizedBox(
                              width: 220,
                              child: Slider(
                                min: 260,
                                max: 1000,
                                divisions: 37,
                                label: _containerWidth.toStringAsFixed(0),
                                value: _containerWidth,
                                onChanged: (v) => setState(() => _containerWidth = v),
                              ),
                            ),
                            Text('${_containerWidth.toStringAsFixed(0)} px'),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('RTL'),
                            Switch(value: _rtl, onChanged: (v) => setState(() => _rtl = v)),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text('Borders'),
                            Switch(value: _showBorder, onChanged: (v) => setState(() => _showBorder = v)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Column width pickers
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    children: List.generate(_columns, (i) {
                      return _ColPicker(
                        index: i,
                        value: _specs[i],
                        onChanged: (v) {
                          if (v == null) return;
                          setState(() => _specs[i] = v);
                        },
                      );
                    }),
                  ),
                ),

                const Divider(height: 1),
                const SizedBox(height: 8),

                // Table view
                Expanded(child: table),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ColPicker extends StatelessWidget {
  const _ColPicker({required this.index, required this.value, required this.onChanged});
  final int index;
  final ColSpec value;
  final ValueChanged<ColSpec?> onChanged;

  String _label(ColSpec v) {
    switch (v) {
      case ColSpec.fixed120:
        return 'Fixed 120';
      case ColSpec.flex1:
        return 'Flex 1';
      case ColSpec.flex2:
        return 'Flex 2';
      case ColSpec.fraction20:
        return 'Fraction .2';
      case ColSpec.intrinsic:
        return 'Intrinsic';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Col ${index + 1}:'),
        const SizedBox(width: 8),
        DropdownButton<ColSpec>(
          value: value,
          onChanged: onChanged,
          items: ColSpec.values.map((v) {
            return DropdownMenuItem(value: v, child: Text(_label(v)));
          }).toList(),
        ),
      ],
    );
  }
}
