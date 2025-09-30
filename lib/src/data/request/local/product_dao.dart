import 'package:sqflite/sqflite.dart';

import '../../model/product_model.dart';

class ProductDao {
  final Database db;

  ProductDao(this.db);

  Future<int> insertProduct(ProductModel product) async {
    return await db.insert('products', product.toJson());
  }

  Future<List<ProductModel>> getAllProducts() async {
    final result = await db.query('products');
    return result.map((map) => ProductModel.fromJson(map)).toList();
  }

  Future<ProductModel?> getProductById(int id) async {
    final result = await db.query('products', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return ProductModel.fromJson(result.first);
    }
    return null;
  }

  Future<ProductModel?> takeProductById(int id) async {
    final result = await db.query('products', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) {
      return ProductModel.fromJson(result.first);
    }
    return null;
  }

  Future<int> updateProduct(ProductModel product) async {
    return await db.update(
      'products',
      product.toJson(),
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<int> deleteProduct(int id) async {
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
