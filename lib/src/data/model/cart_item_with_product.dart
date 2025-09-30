import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/prodcut_entity.dart';

class CartItemWithProduct {
  final CartEntity cart;
  final ProductEntity product;

  CartItemWithProduct({
    required this.cart,
    required this.product,
  });
}