import 'dart:convert';

import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/prodcut_entity.dart';
 import 'cart_item_with_product.dart';

class SaleHistoryEntity {
  final int id;
  final List<CartItemWithProduct> items;
  final double totalAmount;
  final DateTime date;

  SaleHistoryEntity({
    required this.id,
    required this.items,
    required this.totalAmount,
    required this.date,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'totalAmount': totalAmount,
      'date': date.toIso8601String(),
       'items': jsonEncode(items.map((e) => {
        'productId': e.product.id,
        'name': e.product.name,
        'amount': e.product.amount,
        'quantity': e.cart.quantity,
      }).toList()),
    };
  }

   factory SaleHistoryEntity.fromJson(
      Map<String, dynamic> json, List<ProductEntity> products) {
    final itemsList = jsonDecode(json['items'] as String) as List;

    final items = itemsList.map((item) {
      final product =
      products.firstWhere((p) => p.id == item['productId']);
      return CartItemWithProduct(
        cart: CartEntity(
          id: item['productId'],
          productId: item['productId'],
          quantity: item['quantity'],
        ),
        product: product,
      );
    }).toList();
    return SaleHistoryEntity(
      id: json['id'],
      items: items,
      totalAmount: json['totalAmount'],
      date: DateTime.parse(json['date']),
    );
  }
}
