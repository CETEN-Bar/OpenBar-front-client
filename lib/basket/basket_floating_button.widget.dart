import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'basket.model.dart';
import 'basket.page.dart';

class BasketButton extends StatelessWidget {
  const BasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Badge(
        badgeContent: Consumer<Basket>(
            builder: (context, basket, child) => Text("${basket.productNumber}",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onTertiary))),
        position: BadgePosition.bottomEnd(),
        badgeColor: Theme.of(context).colorScheme.tertiary,
        child: const Icon(Icons.shopping_basket),
      ),
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BasketPage()),
        )
      },
    );
  }
}
