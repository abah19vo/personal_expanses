import 'package:flutter/material.dart';
import './transaction_list.dart';
import 'new_transactions.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: "1",
      ammount: 100,
      title: 'new shoes',
      date: DateTime.now(),
    ),
    Transaction(
      id: "2",
      ammount: 50,
      title: 'new shirt',
      date: DateTime.now(),
    ),
    Transaction(
      id: "3",
      ammount: 40,
      title: 'new shorts',
      date: DateTime.now(),
    ),
    Transaction(
      id: "4",
      ammount: 90,
      title: 'new hat',
      date: DateTime.now(),
    ),
  ];

  void addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        ammount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransactions(addTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
