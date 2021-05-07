import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  String title;
  double ammount;
  DateTime date;

  Transaction({
    @required this.id,
    @required this.ammount,
    @required this.title,
    @required this.date,
  });

  
}
