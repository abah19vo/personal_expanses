import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionFirebase {
  CollectionReference transaction =
      FirebaseFirestore.instance.collection('transactions');

  Future<DocumentReference<Object>> addTransaction(
      String id,
       String txTitle,
        double txAmount, 
        DateTime date) {
    return transaction.add({
      'id': id,
      'title': txTitle,
      'amount': txAmount,
      'date': Timestamp.fromDate(date,),
    },
    );
  }
}
