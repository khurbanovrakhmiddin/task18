import '../model/product_model.dart';
import 'local/app_db.dart';
  
final List<ProductModel> fakeProducts = [
  ProductModel(id: 1, name: "Яблоко", amount: 12000, stock: 156, photoUrl: "https://picsum.photoUrls/200?random=1"),
  ProductModel(id: 2, name: "Банан", amount: 18000, stock: 84, photoUrl: "https://picsum.photoUrls/200?random=2"),
  ProductModel(id: 3, name: "Апельсин", amount: 22000, stock: 132, photoUrl: "https://picsum.photoUrls/200?random=3"),
  ProductModel(id: 4, name: "Груша", amount: 15000, stock: 177, photoUrl: "https://picsum.photoUrls/200?random=4"),
  ProductModel(id: 5, name: "Хлеб", amount: 5000, stock: 93, photoUrl: "https://picsum.photoUrls/200?random=5"),
  ProductModel(id: 6, name: "Молоко", amount: 11000, stock: 110, photoUrl: "https://picsum.photoUrls/200?random=6"),
  ProductModel(id: 7, name: "Сыр", amount: 35000, stock: 65, photoUrl: "https://picsum.photoUrls/200?random=7"),
  ProductModel(id: 8, name: "Йогурт", amount: 8000, stock: 124, photoUrl: "https://picsum.photoUrls/200?random=8"),
  ProductModel(id: 9, name: "Мясо", amount: 75000, stock: 52, photoUrl: "https://picsum.photoUrls/200?random=9"),
  ProductModel(id: 10, name: "Курица", amount: 48000, stock: 87, photoUrl: "https://picsum.photoUrls/200?random=10"),
  ProductModel(id: 11, name: "Рыба", amount: 68000, stock: 60, photoUrl: "https://picsum.photoUrls/200?random=11"),
  ProductModel(id: 12, name: "Рис", amount: 19000, stock: 150, photoUrl: "https://picsum.photoUrls/200?random=12"),
  ProductModel(id: 13, name: "Макароны", amount: 15000, stock: 120, photoUrl: "https://picsum.photoUrls/200?random=13"),
  ProductModel(id: 14, name: "Масло", amount: 25000, stock: 98, photoUrl: "https://picsum.photoUrls/200?random=14"),
  ProductModel(id: 15, name: "Шоколад", amount: 17000, stock: 73, photoUrl: "https://picsum.photoUrls/200?random=15"),
  ProductModel(id: 16, name: "Сок", amount: 9000, stock: 180, photoUrl: "https://picsum.photoUrls/200?random=16"),
  ProductModel(id: 17, name: "Вода", amount: 4000, stock: 200, photoUrl: "https://picsum.photoUrls/200?random=17"),
  ProductModel(id: 18, name: "Чай", amount: 12000, stock: 95, photoUrl: "https://picsum.photoUrls/200?random=18"),
  ProductModel(id: 19, name: "Кофе", amount: 42000, stock: 70, photoUrl: "https://picsum.photoUrls/200?random=19"),
  ProductModel(id: 20, name: "Печенье", amount: 10000, stock: 199, photoUrl: "https://picsum.photoUrls/200?random=20"),
];

Future<void> seedProducts() async {
  final db = AppDatabase.instance;
  final productDao = await db.productDao;

   final existingProducts = await productDao.getAllProducts();
  if (existingProducts.isEmpty) {
    for (var product in fakeProducts) {
      await productDao.insertProduct(product);
    }
    print("Products seeded successfully!");
  } else {
    print("Products already exist, seeding skipped.");
  }
}