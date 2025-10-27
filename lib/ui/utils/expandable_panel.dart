import 'package:flutter/material.dart';

class ExpandablePanel extends StatefulWidget {
  const ExpandablePanel(this.name, {super.key, required this.content, this.isInitiallyExpanded = true});

  final String name;
  final Widget content;
  final bool isInitiallyExpanded;

  @override
  State<ExpandablePanel> createState() => _ExpandablePanelState();
}

class _ExpandablePanelState extends State<ExpandablePanel> {
  late bool isExpanded;

  @override
  void initState() {
    isExpanded = widget.isInitiallyExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.hardEdge,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              key: Key('${widget.name}-header'),
              children: [
                IconButton(
                  onPressed: () => setState(() => isExpanded = !isExpanded),
                  icon: AnimatedRotation(
                    turns: isExpanded ? 0.0 : -0.25,
                    duration: Durations.medium1,
                    curve: Curves.easeInOut,
                    child: const Icon(Icons.expand_more),
                  ),
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        AnimatedSize(
          duration: Durations.medium1,
          curve: Curves.easeInOut,
          child: isExpanded
              ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.content,
                )
              : const SizedBox.shrink(),
        ),
      ],
    ),
  );
}
