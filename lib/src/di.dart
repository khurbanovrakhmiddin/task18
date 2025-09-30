import 'package:get_it/get_it.dart';
import 'package:task18_m24/src/data/repository/product_repository.dart';
import 'package:task18_m24/src/domain/usecase/product_usecase.dart';
import 'package:task18_m24/src/domain/usecase/sale_history_usecase.dart';
import 'package:task18_m24/src/presentation/bloc/main_bloc.dart';

import 'data/repository/sale_history_repository.dart';
import 'data/request/local/app_db.dart';
import 'data/request/local/product_dao.dart';
import 'data/request/local/sale_history_dao.dart';
import 'domain/repository/product_repository.dart';
import 'domain/repository/sale_history_repository.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  final db = await AppDatabase.instance.database;

  sl.registerLazySingleton(() => ProductDao(db));
  sl.registerLazySingleton(() => SaleHistoryDao(db));

  // Репозиторий для истории продаж
  final products = await sl<ProductDao>().getAllProducts();

  sl.registerLazySingleton<SaleHistoryRepository>(
    () => SaleHistoryRepositoryImpl(
      dao: sl<SaleHistoryDao>(),
      products: products,
    ),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl<ProductDao>()),
  );

  // UseCase для продажи
  sl.registerLazySingleton(() => SaleUseCase(sl<SaleHistoryRepository>()));
  sl.registerLazySingleton(() => ProductUseCase(sl<ProductRepository>()));

  // Bloc
  sl.registerFactory(() => MainBloc(sl<ProductUseCase>(), sl<SaleUseCase>()));
}
