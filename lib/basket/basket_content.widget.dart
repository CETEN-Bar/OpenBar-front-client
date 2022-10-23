import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'basket.model.dart';

class BasketContent extends StatelessWidget {
  const BasketContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Basket>(
        builder: (context, basket, child) => Column(children: [
              Expanded(
                  child: ListView.builder(
                itemCount: basket.productNumber,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (context, i) {
                  return Card(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: [
                            Wrap(
                              direction: Axis.horizontal,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(basket.items[i].product.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer)),
                                    Text(
                                        "Prix unitaire : ${basket.items[i].product.price.toStringAsFixed(2)}€",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer)),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (basket
                                              .items[i].product.availableLater)
                                            Chip(
                                              label: Text(
                                                  'Disponible plus tard',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .onPrimary)),
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              shadowColor: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            )
                                        ])
                                  ],
                                ),
                                Row(children: [
                                  IconButton(
                                    icon:
                                        const Icon(Icons.remove_circle_outline),
                                    tooltip: "Remove one",
                                    onPressed: () => {
                                      basket.removeOne(basket.items[i].product)
                                    },
                                  ),
                                  Chip(
                                      label: Text("${basket.items[i].amount}")),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    tooltip: "Add one",
                                    onPressed: () => {
                                      basket.addOne(basket.items[i].product)
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    tooltip: "Remove",
                                    onPressed: () => {
                                      basket.removeProduct(
                                          basket.items[i].product)
                                    },
                                  )
                                ])
                              ],
                            ),
                          ])));
                },
              )),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                    Text("Total: ${basket.price.toStringAsFixed(2)}€",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground)),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary),
                      child: Text("Valider",
                          style: TextStyle(
                              fontSize: 24,
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold)),
                    )
                  ]))
            ]));
  }
}
