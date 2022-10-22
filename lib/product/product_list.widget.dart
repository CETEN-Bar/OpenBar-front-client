import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:openbar/product/product.model.dart';
import 'package:openbar/product/product.widget.dart';
import 'package:openbar/responsive/responsive_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _products = <Product>[];

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        final index = i;

        if (index >= _products.length) {
          for (int j = 0; j < 10; j++) {
            _products.add(Product(
                Random.secure().nextInt(1 << 32),
                WordPair.random().asPascalCase,
                WordPair.random().asPascalCase,
                'https://picsum.photos/500/500?$j',
                10.5,
                j % 6 == 0 ? true : false));
          }
        }

        return ProductCard(product: _products[index]);
      },
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (getScreenSize(context) == ScreenSize.ExtraLarge)
              ? 3
              : ((getScreenSize(context) == ScreenSize.Large) ? 2 : 1)),
    );
  }
}
