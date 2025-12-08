import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef PopupBuilder =
    Widget Function(
      BuildContext context,
      VoidCallback dismiss,
      TextEditingController controller,
    );

class LabeledPopupTextField extends StatefulWidget {
  const LabeledPopupTextField({
    super.key,
    required this.label,
    required this.controller,
    this.focusNode,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.popupBuilder,
    this.showPopupOnTap = true,
    this.showPopupOnFocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.radius = 14,
    this.borderColor,
    this.fillColor,
    this.textStyle,
    this.labelStyle,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters,
    this.screenPadding = const EdgeInsets.fromLTRB(12, 24, 12, 24),
    this.preferBelow = true,
    this.maxPopupWidth = 420,
    this.minPopupHeight = 160,
  });

  final String label;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  /// Build your custom anchored popup here. Return any widget.
  /// Call `dismiss()` when the popup should close.
  final PopupBuilder? popupBuilder;

  final bool showPopupOnTap;
  final bool showPopupOnFocus;

  final bool enabled;
  final bool readOnly;

  final double radius;
  final Color? borderColor;
  final Color? fillColor;

  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  final EdgeInsets screenPadding;
  final bool preferBelow;
  final double maxPopupWidth;
  final double minPopupHeight;

  @override
  State<LabeledPopupTextField> createState() => _LabeledPopupTextFieldState();
}

class _LabeledPopupTextFieldState extends State<LabeledPopupTextField> {
  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;
  late FocusNode _focusNode;
  final GlobalKey _fieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant LabeledPopupTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode && widget.focusNode != null) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = widget.focusNode!;
      _focusNode.addListener(_handleFocusChange);
    }
  }

  void _handleFocusChange() {
    if (widget.showPopupOnFocus && _focusNode.hasFocus) {
      _showPopup();
    } else if (!mounted || !_focusNode.hasFocus) {
      // _dismissPopup();
    }
  }

  void _showPopup() {
    if (_entry != null || widget.popupBuilder == null) return;

    // 1) Measure target & overlay
    final overlayBox = Overlay.of(context).context.findRenderObject() as RenderBox;
    final targetBox = _fieldKey.currentContext!.findRenderObject() as RenderBox;

    final overlaySize = overlayBox.size;
    final targetSize = targetBox.size;
    final targetTopLeft = targetBox.localToGlobal(Offset.zero, ancestor: overlayBox);
    final targetBottomLeft = targetTopLeft + Offset(0, targetSize.height);

    final pad = widget.screenPadding;
    final usableTop = pad.top;
    final usableBottom = overlaySize.height - pad.bottom;
    final usableLeft = pad.left;
    final usableRight = overlaySize.width - pad.right;

    final spaceAbove = (targetTopLeft.dy - usableTop).clamp(0.0, double.infinity);
    final spaceBelow = (usableBottom - targetBottomLeft.dy).clamp(0.0, double.infinity);

    // 2) Decide vertical placement
    final wantBelow = widget.preferBelow;
    final placeBelow = (wantBelow && spaceBelow >= widget.minPopupHeight) || (!wantBelow && spaceAbove < widget.minPopupHeight && spaceBelow >= spaceAbove);

    // 3) Compute width and horizontal clamping
    final maxWidth = widget.maxPopupWidth.clamp(0.0, usableRight - usableLeft);
    // Start aligned with the field’s left edge:
    double left = targetTopLeft.dx;
    // Clamp within screen padding:
    left = left.clamp(usableLeft, usableRight - maxWidth);
    // Offset relative to the field’s left in follower space:
    final dx = left - targetTopLeft.dx;

    // 4) Compute max height and y offset
    const gap = 8.0;
    final maxHeight = (placeBelow ? spaceBelow : spaceAbove) - gap;
    final dy = placeBelow ? (targetSize.height + gap) : -(maxHeight + gap);

    // 5) Build overlay with constraints
    _entry = OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _dismissPopup,
            child: Stack(
              children: [
                CompositedTransformFollower(
                  link: _link,
                  showWhenUnlinked: false,
                  offset: Offset(dx, dy),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      // if maxHeight becomes negative (tiny space), keep at least 80
                      maxHeight: maxHeight > 0 ? maxHeight : 80,
                    ),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.antiAlias,
                      child: widget.popupBuilder!(
                        context,
                        _dismissPopup,
                        widget.controller,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(_entry!);
  }

  void _dismissPopup() {
    _entry?.remove();
    _entry = null;
  }

  @override
  void dispose() {
    _dismissPopup();
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderColor = widget.borderColor ?? theme.colorScheme.primary;
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 2),
      borderRadius: BorderRadius.circular(widget.radius),
    );

    return CompositedTransformTarget(
      link: _link,
      child: KeyedSubtree(
        // lets us measure the field later
        key: _fieldKey,
        child: TextField(
          controller: widget.controller,
          focusNode: _focusNode,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readOnly, // still allows tap for popup
          enabled: widget.enabled,
          style: widget.textStyle,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          onTap: () {
            if (widget.showPopupOnTap) _showPopup();
          },
          decoration: InputDecoration(
            // This produces the “label inset/cut-out” look
            labelText: widget.label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelStyle:
                widget.labelStyle ??
                theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            filled: widget.fillColor != null,
            fillColor: widget.fillColor,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            enabledBorder: baseBorder,
            focusedBorder: baseBorder.copyWith(
              borderSide: BorderSide(color: borderColor, width: 2.4),
            ),
            disabledBorder: baseBorder,
          ),
        ),
      ),
    );
  }
}

typedef IconPopupBuilder =
    Widget Function(
      BuildContext context,
      VoidCallback dismiss,
    );

class PopupIconButton extends StatefulWidget {
  const PopupIconButton({
    super.key,
    required this.icon,
    this.tooltip,
    this.onPressed,
    this.popupBuilder,
    this.showPopupOnPressed = true,
    this.focusNode,
    this.screenPadding = const EdgeInsets.fromLTRB(12, 24, 12, 24),
    this.preferBelow = true,
    this.maxPopupWidth = 420,
    this.minPopupHeight = 160,
    this.iconSize,
    this.padding,
    this.constraints,
    this.color,
    this.disabledColor,
    this.popupColor,
  });

  /// The icon shown in the button.
  final Widget icon;

  /// Standard IconButton bits:
  final String? tooltip;
  final VoidCallback? onPressed;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final BoxConstraints? constraints;
  final Color? color;
  final Color? disabledColor;
  final Color? popupColor;

  /// Build your custom anchored popup here.
  /// Call `dismiss()` when the popup should close.
  final IconPopupBuilder? popupBuilder;

  /// Show popup when the button is pressed.
  final bool showPopupOnPressed;

  final FocusNode? focusNode;

  /// Layout tuning, same as your text field version:
  final EdgeInsets screenPadding;
  final bool preferBelow;
  final double maxPopupWidth;
  final double minPopupHeight;

  @override
  State<PopupIconButton> createState() => _PopupIconButtonState();
}

class _PopupIconButtonState extends State<PopupIconButton> {
  final LayerLink _link = LayerLink();
  OverlayEntry? _entry;
  late FocusNode _focusNode;
  final GlobalKey _buttonKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
  }

  @override
  void didUpdateWidget(covariant PopupIconButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.focusNode != widget.focusNode && widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }
  }

  void _showPopup() {
    if (_entry != null || widget.popupBuilder == null) return;

    final overlay = Overlay.of(context);

    // 1) Measure target & overlay
    final overlayBox = overlay.context.findRenderObject() as RenderBox;
    final targetBox = _buttonKey.currentContext!.findRenderObject() as RenderBox;

    final overlaySize = overlayBox.size;
    final targetSize = targetBox.size;
    final targetTopLeft = targetBox.localToGlobal(Offset.zero, ancestor: overlayBox);
    final targetBottomLeft = targetTopLeft + Offset(0, targetSize.height);

    final pad = widget.screenPadding;
    final usableTop = pad.top;
    final usableBottom = overlaySize.height - pad.bottom;
    final usableLeft = pad.left;
    final usableRight = overlaySize.width - pad.right;

    final spaceAbove = (targetTopLeft.dy - usableTop).clamp(0.0, double.infinity);
    final spaceBelow = (usableBottom - targetBottomLeft.dy).clamp(0.0, double.infinity);

    // 2) Decide vertical placement
    final wantBelow = widget.preferBelow;
    final placeBelow = (wantBelow && spaceBelow >= widget.minPopupHeight) || (!wantBelow && spaceAbove < widget.minPopupHeight && spaceBelow >= spaceAbove);

    // 3) Compute width and horizontal clamping
    final maxWidth = widget.maxPopupWidth.clamp(0.0, usableRight - usableLeft);
    double left = targetTopLeft.dx;
    left = left.clamp(usableLeft, usableRight - maxWidth);
    final dx = left - targetTopLeft.dx;

    // 4) Compute max height and y offset
    const gap = 8.0;
    final maxHeight = (placeBelow ? spaceBelow : spaceAbove) - gap;
    final dy = placeBelow ? (targetSize.height + gap) : -(maxHeight + gap);

    // 5) Build overlay with constraints
    _entry = OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: _dismissPopup,
            child: Stack(
              children: [
                CompositedTransformFollower(
                  link: _link,
                  showWhenUnlinked: false,
                  offset: Offset(dx, dy),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: maxWidth,
                      maxHeight: maxHeight > 0 ? maxHeight : 80,
                    ),
                    child: Material(
                      color: widget.popupColor,
                      elevation: 6,
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.antiAlias,
                      child: widget.popupBuilder!(
                        context,
                        _dismissPopup,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    overlay.insert(_entry!);
  }

  void _dismissPopup() {
    _entry?.remove();
    _entry = null;
  }

  @override
  void dispose() {
    _dismissPopup();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: KeyedSubtree(
        key: _buttonKey,
        child: IconButton(
          icon: widget.icon,
          tooltip: widget.tooltip,
          focusNode: _focusNode,
          iconSize: widget.iconSize ?? 24,
          padding: widget.padding ?? const EdgeInsets.all(8),
          constraints: widget.constraints,
          color: widget.color,
          disabledColor: widget.disabledColor,
          onPressed: (widget.onPressed == null && !widget.showPopupOnPressed)
              ? null
              : () {
                  // call user handler first
                  widget.onPressed?.call();
                  if (widget.showPopupOnPressed) {
                    if (_entry == null) {
                      _showPopup();
                    } else {
                      _dismissPopup();
                    }
                  }
                },
        ),
      ),
    );
  }
}
