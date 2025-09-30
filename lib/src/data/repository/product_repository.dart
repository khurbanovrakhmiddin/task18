import 'package:dartz/dartz.dart';
import 'package:task18_m24/src/data/model/product_model.dart';
import 'package:task18_m24/src/data/request/local/product_dao.dart';

import '../../domain/entity/error.dart';
import '../../domain/entity/prodcut_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../request/local/app_db.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDao dao;

  ProductRepositoryImpl(this.dao);

  @override
  Future<Either<SameFailure, void>> addProduct(ProductEntity product) async {
    try {
       await dao.insertProduct(product.toModel());
      return const Right(null);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<SameFailure, List<ProductEntity>>> getAllProducts() async {
    try {
       final models = await dao.getAllProducts();
      return Right(models.map((m) => m.toEntity()).toList());
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<SameFailure, ProductEntity?>> getProductById(int id) async {
    try {
       final model = await dao.getProductById(id);
      return Right(model?.toEntity());
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> takeProduct(int id) async{
    try {
       final model = await dao.takeProductById(id);
      return Right(model);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }
}
