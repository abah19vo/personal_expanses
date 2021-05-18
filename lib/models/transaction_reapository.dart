import 'package:flutter/material.dart';

import './transaction.dart';

class TransactionReapository {
  final List<Transaction> _userTransactions =[
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
        id: DateTime.now().toString());
    return _userTransactions.add(newTx);
  }

  void deleteTransaction(Transaction tx) => _userTransactions.remove(tx);

  void updateTransaction(Transaction newTx) {
    Transaction tx = _userTransactions[_userTransactions.indexOf(newTx)];
    tx.title = newTx.title;
    tx.ammount = newTx.ammount;
    tx.date = newTx.date;
  }

  get transactionList {
    return _userTransactions;
  }
}
