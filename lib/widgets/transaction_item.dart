import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionItem({Key? key, required this.transaction, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('R\$${transaction.value}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? TextButton(
                onPressed: () => onRemove(transaction.id),
                child: const Text(
                  'Excluir',
                  style: TextStyle(color: Colors.deepOrange),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => onRemove(transaction.id),
                color: Colors.deepOrange,
              ),
      ),
    );
  }
}
