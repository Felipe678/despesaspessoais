import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  const TransactionList(this.transactions, this.onRemove, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: ((ctx, constraints) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Nenhuma Transação cadastrada!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/5a29971ba9e625.6991466915126750996959.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              }),
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index) {
                final tr = transactions[index];
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('R\$${tr.value}'),
                        ),
                      ),
                    ),
                    title: Text(
                      tr.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton.icon(
                            onPressed: () => onRemove(tr.id),
                            icon: Icon(
                              Icons.delete,
                              color: Theme.of(context).colorScheme.error,
                            ),
                            label: Text(
                              'Excluir',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            // color: Theme.of(context).colorScheme.secondary,
                          )
                        : IconButton(
                            onPressed: () => onRemove(tr.id),
                            icon: const Icon(Icons.delete),
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                  ),
                );
                // Card(
                //   child: Row(children: [
                //     Container(
                //       margin: const EdgeInsets.symmetric(
                //         horizontal: 15,
                //         vertical: 10,
                //       ),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //           color: Theme.of(context).colorScheme.primary,
                //           width: 2,
                //         ),
                //       ),
                //       padding: const EdgeInsets.all(10),
                //       child: Text(
                //         'R\$  ${tr.value.toStringAsFixed(2)}',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //           color: Theme.of(context).colorScheme.primary,
                //         ),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           tr.title,
                //           style: Theme.of(context).textTheme.titleMedium,
                //           // style: const TextStyle(
                //           //   fontSize: 16,
                //           //   fontWeight: FontWeight.bold,
                //           // ),
                //         ),
                //         Text(
                //           DateFormat('d MMM y').format(tr.date),
                //           style: const TextStyle(
                //             color: Colors.grey,
                //           ),
                //         ),
                //       ],
                //     )
                //   ]),
                // );
              },
              // children: transactions.map((tr) {

              // }).toList(),
              //
              // -------------------------------------
              //
              // children: [
              //   ..._transactions.map((tr) {
              //     return Card(
              //       child: Text(tr.title),
              //     );
              //   }).toList()
              // ],
            ),
    );
  }
}
