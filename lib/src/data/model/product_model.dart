
import '../../domain/entity/prodcut_entity.dart';
extension ProductEntityX on ProductEntity {
  ProductModel toModel() {
    return ProductModel(
      id: id,
      name: name,
      amount: amount,
      stock: stock,
      photoUrl: photoUrl,
    );
  }ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
      amount: amount,
      stock: stock,
      photoUrl: photoUrl,
    );
  }
}
class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.name,
    required super.amount,
    required super.stock,
    required super.photoUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: json['name'] as String,
      amount: (json['amount'] as num).toDouble(),
      stock: json['stock'] as int,
      photoUrl: json['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'stock': stock,
      'photoUrl': photoUrl,
    };
  }

  ProductModel copyWith({
    int? id,
    String? name,
    double? amount,
    int? stock,
    String? photoUrl,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      stock: stock ?? this.stock,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
