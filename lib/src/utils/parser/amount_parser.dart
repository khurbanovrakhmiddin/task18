import 'package:task18_m24/src/data/model/cart_item_with_product.dart';

class AmountParser{
  static String parser(num value){
    return value.toString();
  }


  static String total(List<CartItemWithProduct> items) {
    final totalAmount = items.fold<double>(
      0,
          (sum, e) => sum + (e.product.amount * e.cart.quantity),
    );
    return totalAmount.toStringAsFixed(0);
  }
}