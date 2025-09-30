import 'package:task18_m24/src/domain/entity/sale_history_entity.dart';

import '../../domain/entity/cart_entity.dart';

extension CartModelToSale on CartModel {

  CartModel toModel() {
    return CartModel(id: id, productId: productId, quantity: quantity);
  }
}

class CartModel extends CartEntity {
  const CartModel({
    super.id,
    required super.productId,
    required super.quantity,
  });

  Map<String, dynamic> toJson() {
    return {'id': id, 'productId': productId, 'quantity': quantity};
  }

  factory CartModel.fromJson(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int?,
      productId: map['productId'] as int,
      quantity: map['quantity'] as int,
    );
  }

  CartModel copyWith({int? id, int? productId, int? quantity}) {
    return CartModel(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
}
