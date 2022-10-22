import 'package:flutter/material.dart';
import 'package:openbar/product/product.model.dart';
import 'package:provider/provider.dart';

import '../basket/basket.model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _alreadySaved = true;
  bool get _inBasket =>
      Provider.of<Basket>(context, listen: true).isInBasket(widget.product);
  num price = 5.25;

  void toggleBasket() {
    final inBasket =
        Provider.of<Basket>(context, listen: false).isInBasket(widget.product);
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    setState(() {
      if (inBasket) {
        Provider.of<Basket>(context, listen: false)
            .removeProduct(widget.product);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Produit retiré du panier')));
      } else {
        Provider.of<Basket>(context, listen: false)
            .addProduct(widget.product, 1);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Produit ${widget.product.name} ajouté au panier'),
          action: SnackBarAction(
            label: 'Annuler putain !',
            onPressed: () {
              toggleBasket();
            },
          ),
          duration: const Duration(seconds: 5),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  widget.product.image,
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                )),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Chip(
                        label: Text('${widget.product.price} €',
                            style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                                fontWeight: FontWeight.bold)),
                        backgroundColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                        shadowColor:
                            Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      const Spacer(),
                      Text(
                        widget.product.name,
                        style: TextStyle(fontSize: 20),
                      ),
                      const Spacer(),
                      InkWell(
                          child: Icon(
                            // NEW from here ...
                            _alreadySaved
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: _alreadySaved ? Colors.red : null,
                            semanticLabel:
                                _alreadySaved ? 'Remove from saved' : 'Save',
                          ),
                          onTap: () {})
                    ])),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: _inBasket
                              ? OutlinedButton(
                                  child: const Text('Supprimer du panier'),
                                  onPressed: () {
                                    toggleBasket();
                                  },
                                )
                              : ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.shopping_basket_outlined,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      foregroundColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                  label: const Text('Ajouter au panier'),
                                  onPressed: () {
                                    toggleBasket();
                                  },
                                ))
                    ]))
          ],
        ),
      ),
      onDoubleTap: () {},
      onLongPress: () {},
    );
  }
}
