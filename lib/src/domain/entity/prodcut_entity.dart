import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String name;
  final double amount;
  final int stock;
  final String photoUrl;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.amount,
    required this.stock,
    required this.photoUrl,
  });

  @override
  List<Object?> get props => [id, name, amount, stock, photoUrl];
}