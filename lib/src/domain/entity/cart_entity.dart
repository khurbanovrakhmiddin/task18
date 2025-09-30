import 'package:equatable/equatable.dart';
import 'package:task18_m24/src/data/model/sale_history_model.dart';

class CartEntity extends Equatable {
  final int? id;
  final int productId;
  final int quantity;

  const CartEntity({
    this.id,
    required this.productId,
    required this.quantity,
  });
  CartEntity copyWith({
    int? id,
    int? productId,
    int? quantity,
  }) {
    return CartEntity(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }
  @override
  List<Object?> get props => [id, productId, quantity];
}
