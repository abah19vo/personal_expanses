import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: userTransactions.isEmpty ?
          Column(
            children:<Widget>[
              
             Text(
              'The transaction list is empty',
              style:Theme.of(context).textTheme.title
            ), 
            Image.asset(
              'assets/images/empty.png',
               fit: BoxFit.cover
            ),
            ],
          )
        : ListView.builder(
          itemBuilder: (context, index) {
            return TransactionCard(userTransactions[index]);
          },
          itemCount: userTransactions.length,
      ),
    );
  }
}
