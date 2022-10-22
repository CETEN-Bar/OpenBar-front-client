import 'package:flutter/material.dart';
import 'package:openbar/appbar/appbar.widget.dart';
import 'package:openbar/basket/basket_floating_button.widget.dart';
import 'package:openbar/product/products.page.dart';

import 'menu_tile.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MainBar(),
        floatingActionButton: const BasketButton(),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: const [
            MenuTile(
                title: 'Menus',
                description:
                    'Faites votre choix parmis des menus préselectionnés',
                backgroundColor: Colors.blueGrey,
                nextPage: ProductPage()),
            MenuTile(
                title: 'Tous les produits',
                description: 'Tous les produits par catégories',
                backgroundColor: Colors.deepOrange,
                nextPage: ProductPage()),
            MenuTile(
                title: 'Évenements',
                description: 'Payer votre repas pour un évenement',
                backgroundColor: Colors.cyan,
                nextPage: ProductPage()),
            MenuTile(
                title: 'Favoris',
                description: 'Vos produits préférés dans un seul endroit',
                backgroundColor: Color.fromARGB(255, 50, 0, 13),
                nextPage: ProductPage()),
          ],
        ));
  }
}
