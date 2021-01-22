import 'package:flutter/material.dart';

// Packages Imported.
import 'package:intl/intl.dart';
// My Classes Imported.
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'No Transactions added Yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text('\$${transactions[index].amount}'),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      (DateFormat.yMMMd().format(
                        transactions[index].date,
                      )),
                    ),
                    trailing: IconButton(
                      color: Theme.of(context).errorColor,
                      icon: Icon(Icons.delete),
                      onPressed: () => deleteTx(
                        transactions[index].id,
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
