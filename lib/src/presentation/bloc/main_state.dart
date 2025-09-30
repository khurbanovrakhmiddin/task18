

part of 'main_bloc.dart';


class MainState  extends Equatable{
  final bool isLoading;
  final String? errorMsg;
  final List<ProductEntity> products;
  final List<SaleHistoryEntity> sales;
  final List<CartEntity> cart;

 const MainState({
    this.isLoading = false,
    this.errorMsg,
    this.products = const [],
    this.sales = const [],
    this.cart = const [],
   });

  MainState copyWith({
    bool? isLoading,
    String? errorMsg,
    List<ProductEntity>? products,
    List<SaleHistoryEntity>? sales,
    List<CartEntity>? cart,
   }) {
    return MainState(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg,
      products: products ?? this.products,
      sales: sales ?? this.sales,
      cart: cart ?? this.cart,
     );
  }

  @override
   List<Object?> get props =>[isLoading,errorMsg,products,sales,cart];
}
