import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/expense_tracker_app/chart/chart_bar.dart';
import 'package:lam_quen_flutter/expense_tracker_app/models/expense.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<Expense> expenses;

  /// Generates expense buckets for each category.
  List<ExpenseBucket> _generateBuckets() {
    return Category.values
        .map((category) => ExpenseBucket.forCategory(expenses, category))
        .toList();
  }

  /// Computes the maximum total expense among all categories.
  double _computeMaxTotalExpense(List<ExpenseBucket> buckets) {
    return buckets.fold(
        0,
        (max, bucket) =>
            bucket.totalExpenses > max ? bucket.totalExpenses : max);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final buckets = _generateBuckets();
    final maxTotalExpense = _computeMaxTotalExpense(buckets);

    final boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      gradient: LinearGradient(
        colors: [
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.primary,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    );

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: 180,
      decoration: boxDecoration,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                buckets.length,
                (index) => ChartBar(
                  fill: maxTotalExpense == 0
                      ? 0
                      : buckets[index].totalExpenses / maxTotalExpense,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(
              buckets.length,
              (index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Icon(
                    CategoryIcons[buckets[index].category],
                    color: isDarkMode
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
