import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final String title;
  final double ammount;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.ammount,
    @required this.title,
    @required this.date,
  });
}
