import 'package:dartz/dartz.dart';
import 'package:task18_m24/src/domain/repository/sale_history_repository.dart';
import '../../domain/entity/error.dart';
import '../../domain/entity/prodcut_entity.dart';
import '../model/cart_item_with_product.dart';
import '../model/sale_history_model.dart';
 import '../request/local/sale_history_dao.dart';


class SaleHistoryRepositoryImpl implements SaleHistoryRepository {
  final SaleHistoryDao dao;
  final List<ProductEntity> products;

  SaleHistoryRepositoryImpl({
    required this.dao,
    required this.products,
  });

  @override
  Future<Either<SameFailure, SaleHistoryEntity>> addSale(List<CartItemWithProduct> items) async {
    try {
      final total = items.fold<double>(0, (sum, e) => sum + (e.product.amount * e.cart.quantity));

      final sale = SaleHistoryEntity(
        id: DateTime.now().millisecondsSinceEpoch,
        items: items,
        totalAmount: total,
        date: DateTime.now(),
      );

      await dao.insertSale(sale);
      return Right(sale);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<SameFailure, List<SaleHistoryEntity>>> getSales() async {
    try {
      final sales = await dao.getAllSales(products);
      return Right(sales);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }
}