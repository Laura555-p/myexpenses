import 'package:flutter/material.dart';

import '../model/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 15),
      child: SingleChildScrollView(
        child: transactions.isEmpty
            ? LayoutBuilder(
                builder: (ctx, constrains) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'Expenses not added!!!!!',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(20),
                          width: 150,
                          height: MediaQuery.of(context).size.height * 0.26,
                          child: ShaderMask(
                              shaderCallback: (img) {
                                return LinearGradient(
                                  begin: Alignment(0.0, 0.0),
                                  end: Alignment.bottomRight,
                                  colors: [Colors.black, Colors.black],
                                  tileMode: TileMode.clamp,
                                ).createShader(
                                    Rect.fromLTRB(0, 0, img.width, img.height));
                              },
                              child: Image.asset('assets/images/pic5.png'))),
                    ],
                  );
                },
              )
            : Container(
                height: MediaQuery.of(context).size.height * 0.425,
                child: ListView(
                    children: transactions
                        .map(
                          (tx) => TransactionItem(
                            key: ValueKey(tx.id),
                            transaction: tx,
                            deleteTx: deleteTx,
                          ),
                        )
                        .toList()),
              ),
      ),
    );
  }
}
