import 'package:flutter/material.dart';

/// A widget representing a single bar in a bar chart.
/// The bar height is determined by the [fill] value (0.0 - 1.0).
class ChartBar extends StatelessWidget {
  const ChartBar({
    super.key,
    required this.fill,
  });

  /// The fill level of the bar, ranging from 0.0 (empty) to 1.0 (full).
  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final barDecoration = BoxDecoration(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
      color: isDarkMode
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.primary,
    );

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(decoration: barDecoration),
        ),
      ),
    );
  }
}
