import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task18_m24/src/data/request/local/sale_history_dao.dart';
import 'product_dao.dart';

class AppDatabase {
  static final AppDatabase instance = AppDatabase._internal();
  static Database? _database;

  AppDatabase._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('pos_db.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        amount INTEGER NOT NULL,
        stock INTEGER NOT NULL,
        photoUrl TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE sale_history (
        id INTEGER PRIMARY KEY,
        items TEXT NOT NULL,
        totalAmount REAL NOT NULL,
        date TEXT NOT NULL
      );
    ''');
  }

  Future<ProductDao> get productDao async {
    final db = await database;
    return ProductDao(db);
  }

  Future<SaleHistoryDao> get historyDao async {
    final db = await database;
    return SaleHistoryDao(db);
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
