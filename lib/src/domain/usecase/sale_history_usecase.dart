import 'package:dartz/dartz.dart';
import 'package:task18_m24/src/domain/entity/error.dart';

import '../../data/model/cart_item_with_product.dart';
import '../../data/model/sale_history_model.dart';

import '../repository/sale_history_repository.dart';


class SaleUseCase {
  final SaleHistoryRepository repository;

  SaleUseCase(this.repository);

  Future<Either<SameFailure, SaleHistoryEntity>> addSale(List<CartItemWithProduct> items) {
    return repository.addSale(items);
  }

  Future<Either<SameFailure, List<SaleHistoryEntity>>> getSales() {
    return repository.getSales();
  }
}
