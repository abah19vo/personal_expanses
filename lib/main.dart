import 'package:flutter/material.dart';

import './widgets/user_transactions.dart';
import './widgets/new_transactions.dart';
import './widgets/transaction_list.dart';
import './models/transaction_reapository.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TransactionReapository transactionRepository = TransactionReapository();

  final titleController = TextEditingController();

  final amountController = TextEditingController();

  addTransaction(String title, double amount) {
    setState(() {
      transactionRepository.addTransaction(title, amount);
    });
  }

  void startAddNewTranslation(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bContext) {
          return GestureDetector(
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            child: NewTransactions(addTransaction)
          );
        },
      elevation: 5,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTranslation(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            TransactionList(transactionRepository.transactionList),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => startAddNewTranslation(context),
         child: Icon(Icons.add)
      ),
    );
  }
}
