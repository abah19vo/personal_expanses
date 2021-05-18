import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentUserTransactions;

  Chart(this.recentUserTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalAmount = 0;
      for (int i = 0; i < recentUserTransactions.length; i++) {
        if ((recentUserTransactions[i].date.day == weekday.day) &&
            (recentUserTransactions[i].date.month == weekday.month) &&
            (recentUserTransactions[i].date.year == weekday.year)) {
          totalAmount += recentUserTransactions[i].ammount;
        }
      }
      return {
        'day': DateFormat.E(weekday),
       'amount': totalAmount};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
