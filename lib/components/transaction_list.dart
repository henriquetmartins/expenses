import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) removeTransaction;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Não há transações cadastradas!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (cxt, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 15,
                          child: FittedBox(
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(DateFormat('d MMM y').format(tr.date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => removeTransaction(tr.id),
                    ),
                  ),
                );
              }),
    );
  }
}
