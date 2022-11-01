import 'dart:collection';
import 'package:flutter/cupertino.dart';

import '../product/product.model.dart';


abstract class BasketContent {
  String name;
  int amount;
  num price;
  BasketContent(this.name, this.amount, this.price);
}

class BasketItem extends BasketContent {
  Product product;
  @override
  String get name => product.name;
  @override
  num get price => product.price;

  BasketItem(this.product, int amount) : super('', amount, 0);
}



class Basket extends ChangeNotifier {
  final Map<Product, int> _products = {};
  num get price => getTotalPrice();
  int get productNumber => _products.length;
  UnmodifiableListView<BasketItem> get items =>
      UnmodifiableListView<BasketItem>(getItemList());

  List<BasketItem> getItemList() {
    List<BasketItem> items = [];
    for (MapEntry<Product, int> item in _products.entries) {
      items.add(BasketItem(item.key, item.value));
    }
    return items;
  }

  void addProduct(Product product, int number) {
    _products[product] = number;
    notifyListeners();
  }

  void addOne(Product product) {
    if (_products.containsKey(product)) {
      _products[product] = _products[product]! + 1;
    } else {
      _products[product] = 1;
    }
    notifyListeners();
  }

  void removeOne(Product product) {
    if (_products.containsKey(product)) {
      _products[product] = _products[product]! - 1;
      if (_products[product] == 0) {
        removeProduct(product);
      }
    }
    notifyListeners();
  }

  void removeProduct(Product product) {   
    _products.remove(product);
    notifyListeners();
  }

  void empty() {
    _products.clear();
    notifyListeners();
  }

  num getTotalPrice() {
    num total = 0;
    _products.forEach((key, value) {
      total += key.price * value;
    });
    return total;
  }

  bool isEmpty() {
    return _products.isEmpty;
  }

  bool isInBasket(Product product) {
    return _products.containsKey(product);
  }

  int getItemNumber(Product product) {
    if (isInBasket(product)) {
      return _products[product]!;
    } else {
      return -1;
    }
  }
}
