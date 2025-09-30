import 'package:dartz/dartz.dart';
import 'package:task18_m24/src/data/model/sale_history_model.dart';
import 'package:task18_m24/src/domain/entity/error.dart';

import '../../data/model/cart_item_with_product.dart';

abstract class SaleHistoryRepository {
  Future<Either<SameFailure, SaleHistoryEntity>> addSale(List<CartItemWithProduct> items);
  Future<Either<SameFailure, List<SaleHistoryEntity>>> getSales();
}