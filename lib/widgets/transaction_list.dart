import 'package:flutter/material.dart';

// Packages Imported.
import 'package:intl/intl.dart';
// My Classes Imported.
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(
    this.transactions,
    this.deleteTx,
  );

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (contex, constrains) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: constrains.maxHeight * 0.1,
                  child: Expanded(
                    child: Container(
                      // color: Colors.red,
                      child: Text(
                        'No Transactions added Yet!',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
                Container(
                  // color: Colors.blue,
                  child: SizedBox(
                    height: constrains.maxHeight * 0.05,
                  ),
                ),
                Container(
                  // color: Colors.yellow,
                  padding: const EdgeInsets.all(10.0),
                  height: constrains.maxHeight * 0.75,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                transaction: transactions,
                deleteTx: deleteTx,
              );
            });
  }
}
