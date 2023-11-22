import 'package:flutter/material.dart';
import 'package:meals/models/expense.dart';
import 'package:meals/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (buildContext, index) {
          return Dismissible(
            key: ValueKey(expenses[index]),
            background: Container(
              color: Theme.of(context).colorScheme.error.withOpacity(0.2),
              margin: Theme.of(context).cardTheme.margin,
            ),
            onDismissed: (dismissDirection) {
              onRemoveExpense(expenses[index]);
            },
            child: ExpenseItem(expenses[index]),
          );
        });
  }
}
