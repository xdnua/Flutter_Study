import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/expense_tracker_app/models/expense.dart';
import 'package:lam_quen_flutter/expense_tracker_app/widgets/expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        direction:
            DismissDirection.endToStart, // Chỉ cho phép vuốt từ phải sang trái
        background: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          color: theme.colorScheme.error,
          margin: EdgeInsets.symmetric(
            horizontal: theme.cardTheme.margin?.horizontal ?? 0,
          ),
          child: const Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
        onDismissed: (direction) => onRemoveExpense(expenses[index]),
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
