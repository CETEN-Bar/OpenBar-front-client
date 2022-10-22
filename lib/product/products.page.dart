import 'package:flutter/material.dart';
import 'package:openbar/appbar/appbar.widget.dart';
import 'package:openbar/basket/basket_content.widget.dart';
import 'package:openbar/basket/basket_floating_button.widget.dart';
import 'package:openbar/product/product_list.widget.dart';
import 'package:openbar/responsive/responsive_layout.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: const BasketButton(),
        appBar: const MainBar(),
        body: ResponsiveLayout(
            mobileBody: ProductList(),
            tabletBody: Row(children: [
              const Expanded(flex: 6, child: ProductList()),
              Expanded(
                  flex: 6,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                          elevation: 2,
                          color: Theme.of(context).colorScheme.background,
                          child: Column(children: [
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Panier',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                )),
                            const Expanded(child: BasketContent())
                          ]))))
            ]),
            desktopBody: Row(children: [
              const Expanded(flex: 8, child: ProductList()),
              Expanded(
                  flex: 4,
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Card(
                          color: Theme.of(context).colorScheme.background,
                          elevation: 2,
                          child: Column(children: [
                            Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Panier',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                )),
                            const Expanded(child: BasketContent())
                          ]))))
            ])));
  }
}
