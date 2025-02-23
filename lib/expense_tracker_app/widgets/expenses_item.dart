import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lam_quen_flutter/expense_tracker_app/models/expense.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final formattedAmount = NumberFormat.currency(locale: 'en_US', symbol: '\$')
        .format(expense.amount);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: textTheme.titleLarge),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(formattedAmount),
                const Spacer(),
                Row(
                  children: [
                    Icon(CategoryIcons[expense.category]),
                    const SizedBox(width: 8),
                    Text(expense.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
