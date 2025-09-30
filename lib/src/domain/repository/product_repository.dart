import 'package:dartz/dartz.dart';
  import 'package:task18_m24/src/domain/entity/prodcut_entity.dart';

import '../entity/error.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, ProductEntity?>> getProductById(int id);
  Future<Either<Failure, void>> addProduct(ProductEntity product);
  Future<Either<Failure, void>> takeProduct(int id);
}