import 'package:expense_tracker/widget/expenses_list.dart';
import 'package:expense_tracker/widget/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter',
      amount: 1500.0,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 100.0,
      date: DateTime.now(),
      category: Category.leisure,
    )
  ];

  _openAddExpenseOverlay(){
    showModalBottomSheet(
        context: context,
        builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),)
        ],
      ),
      body: Column(
        children: [
          //Toolbar with the Add button => Row
          const Text('The chart'),
          Expanded(
              child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}
