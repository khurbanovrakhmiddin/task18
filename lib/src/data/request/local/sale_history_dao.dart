import 'package:sqflite/sqflite.dart';

import '../../../domain/entity/prodcut_entity.dart';
import '../../../domain/entity/sale_history_entity.dart';

import 'package:sqflite/sqflite.dart';

import '../../model/sale_history_model.dart';


class SaleHistoryDao {
  final Database db;

  SaleHistoryDao(this.db);

  Future<void> insertSale(SaleHistoryEntity sale) async {
    await db.insert(
      'sale_history',
      sale.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<SaleHistoryEntity>> getAllSales(List<ProductEntity> products) async {
    final data = await db.query('sale_history');
    return data.map((e) => SaleHistoryEntity.fromJson(e, products)).toList();
  }
}

