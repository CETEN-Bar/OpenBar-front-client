import 'package:flutter/material.dart';
import 'package:openbar/basket/basket_bar.widget.dart';
import 'package:openbar/basket/basket_content.widget.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: BasketBar(), body: BasketContent());
  }
}
