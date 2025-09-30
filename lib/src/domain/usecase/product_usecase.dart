import 'package:dartz/dartz.dart';
import 'package:task18_m24/src/domain/entity/error.dart';

import '../entity/prodcut_entity.dart';
import '../repository/product_repository.dart';


class ProductUseCase {
  final ProductRepository repository;

  ProductUseCase(this.repository);

  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      return await repository.getAllProducts();
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }

  Future<Either<Failure, ProductEntity?>> getProductById(int id) async {
    try {
      return await repository.getProductById(id);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }

  Future<Either<Failure, void>> addProduct(ProductEntity product) async {
    try {
      return await repository.addProduct(product);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }
  Future<Either<Failure, void>> takeProduct(int id) async {
    try {
      return await repository.takeProduct(id);
    } catch (e) {
      return Left(SameFailure(msg: e.toString()));
    }
  }
}
