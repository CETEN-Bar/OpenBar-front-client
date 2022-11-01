import 'package:flutter_test/flutter_test.dart';

import 'package:openbar/basket/basket.model.dart';
import 'package:openbar/product/product.model.dart';

void main() {
  group('Basket', () {
    Basket basket = Basket();
    Product sandwich = Product(1, "Sandwich", "A delicious sandwich", "https://example.com", 4.0, false);
    Product banana = Product(2, "Banana", "Banana !", "https://picfiles.alphacoders.com/354/354783.jpg", 1.5, false);

    test('Adding product', () {
      
      expect(basket.price, 0.0);
      expect(basket.productNumber, 0);

      // Adding two sandwiches to the basket
      basket.addProduct(sandwich, 2);

      expect(basket.price, 8.0);
      // We count the number of different items
      expect(basket.productNumber, 1);
      expect(basket.productNumber, basket.items.length);


      basket.addProduct(banana, 1);
      expect(basket.price, 9.5);
      expect(basket.productNumber, 2);
    });


    test('Removing product', () {
      basket.removeProduct(sandwich);

      expect(basket.price, 1.5);
      expect(basket.productNumber, 1);
    });

    test('AddOne product', () {
      basket.addOne(banana);

      expect(basket.price, 3.0);
      expect(basket.productNumber, 1);
      expect(basket.items[0].amount, 2);

      basket.addOne(sandwich);

      expect(basket.price, 7);
      expect(basket.productNumber, 2);
    });


    test('RemoveOne product', () {
      basket.removeOne(banana);
      basket.removeOne(sandwich);

      expect(basket.price, 1.5);
      expect(basket.productNumber, 1);
      expect(basket.items[0].amount, 1);

      basket.removeOne(banana);

      expect(basket.price, 0.0);
      expect(basket.productNumber, 0);
      expect(basket.items.length, 0);

      // There should already be no bananas
      basket.removeOne(banana);

      expect(basket.price, 0.0);
      expect(basket.productNumber, 0);
      expect(basket.items.length, 0);
    });


    test('empty', () {
      basket.addProduct(sandwich, 3);
      basket.addProduct(banana, 66);

      expect(basket.productNumber, 2);

      basket.empty();

      expect(basket.price, 0.0);
      expect(basket.productNumber, 0);
      expect(basket.items.length, 0);
    });
  });

}
