import 'package:flutter/material.dart';
import 'package:lam_quen_flutter/expense_tracker_app/chart/chart.dart';
import 'package:lam_quen_flutter/expense_tracker_app/models/expense.dart';
import 'package:lam_quen_flutter/expense_tracker_app/new_expenses_screen.dart';
import 'package:lam_quen_flutter/expense_tracker_app/widgets/expenses_list.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.99,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true, // Tránh bị che bởi notch trên iOS
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) => NewExpensesScreen(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() => _registeredExpenses.add(expense));
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() => _registeredExpenses.removeAt(expenseIndex));

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        clipBehavior: Clip.hardEdge, // Tránh lỗi giao diện trên màn hình nhỏ
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() => _registeredExpenses.insert(expenseIndex, expense));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isEmpty = _registeredExpenses.isEmpty;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(
                  child: isEmpty
                      ? const Center(
                          child: Text('No expenses found. Start adding some!'),
                        )
                      : ExpensesList(
                          expenses: _registeredExpenses,
                          onRemoveExpense: _removeExpense,
                        ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(
                  child: isEmpty
                      ? const Center(
                          child: Text('No expenses found. Start adding some!'),
                        )
                      : ExpensesList(
                          expenses: _registeredExpenses,
                          onRemoveExpense: _removeExpense,
                        ),
                ),
              ],
            ),
    );
  }
}
