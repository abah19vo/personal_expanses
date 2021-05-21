import './transaction_firebase.dart';

import './transaction.dart';

class TransactionReapository {
  TransactionFirebase transactionFirebase = new TransactionFirebase();

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
    try {
      final newTx = Transaction(
          title: txTitle,
          ammount: txAmount,
          date: DateTime.now(),
          id: DateTime.now().toString());
      transactionFirebase
          .addTransaction(
            newTx.id,
            newTx.title,
            newTx.ammount,
            newTx.date,
          ).catchError((error, skTrace) =>throw error);
      _userTransactions.add(newTx);
    } catch (e) {
      throw e;
    }
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
