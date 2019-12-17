import 'package:flutter/material.dart';

import '../model/transaction.dart';
import 'new_transaction.dart';
import 'transaction_list.dart';
import 'chart.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
    print(_userTransactions);
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              margin: EdgeInsets.only(left: 10, top: 0, right: 0, bottom: 0),
              width: 160,
              //height: 160,
              child: Image.asset('assets/images/pic3.png'),
            ),
            NewTransaction(_addNewTransaction),
          ],
        ),
        TransactionList(_userTransactions, _deleteTransaction),
        Container(child: Chart(_recentTransaction)),
      ],
    );
  }
}
