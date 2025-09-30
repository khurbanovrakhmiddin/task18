
import 'package:task18_m24/src/data/model/sale_history_model.dart';
import 'package:task18_m24/src/domain/entity/prodcut_entity.dart';

import '../../data/model/product_model.dart';
// extension SaleEntityX on SaleHistoryModel {
//   SaleHistoryModel toModel() {
//     return SaleHistoryModel(
//       id: id,
//       productId: productId,
//       quantity: quantity,
//       totalAmount: totalAmount,
//       saleDate: saleDate,
//     );
//   }
// }
// class SaleHistoryModel extends SaleHistoryEntity {
//   const SaleHistoryModel({
//     super.id,
//     required super.productId,
//     required super.quantity,
//     required super.totalAmount,
//     required super.saleDate,
//   });
//
//   factory SaleHistoryModel.fromJson(Map<String, dynamic> json) {
//     return SaleHistoryModel(
//       id: json['id'] as int?,
//       productId: json['productId'],
//       quantity: json['quantity'] as int,
//       totalAmount: json['totalAmount'] as int,
//       saleDate: DateTime.parse(json['saleDate'] as String),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'productId': productId,
//       'quantity': quantity,
//       'totalAmount': totalAmount,
//       'saleDate': saleDate.toIso8601String(),
//     };
//   }
//
//   SaleHistoryModel copyWith({
//     int? id,
//     List<int>? productId,
//     int? quantity,
//     int? totalAmount,
//     DateTime? saleDate,
//   }) {
//     return SaleHistoryModel(
//       id: id ?? this.id,
//       productId: productId ?? this.productId,
//       quantity: quantity ?? this.quantity,
//       totalAmount: totalAmount ?? this.totalAmount,
//       saleDate: saleDate ?? this.saleDate,
//     );
//   }
// }
