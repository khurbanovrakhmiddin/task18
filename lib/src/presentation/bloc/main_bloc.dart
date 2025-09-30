
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task18_m24/src/data/model/sale_history_model.dart';
import 'package:task18_m24/src/di.dart';
import 'package:task18_m24/src/domain/entity/cart_entity.dart';
import 'package:task18_m24/src/domain/entity/prodcut_entity.dart';
import 'package:task18_m24/src/domain/usecase/product_usecase.dart';

import '../../data/model/cart_item_with_product.dart';
import '../../domain/usecase/sale_history_usecase.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final ProductUseCase _productUseCase ;
  final SaleUseCase _saleUseCase  ;

  MainBloc(this._productUseCase, this._saleUseCase) : super(MainState()) {
    on<MainSaleEvent>((event, emit) async {
      final result = await _saleUseCase.addSale(cartItemsWithProduct);
    });    on<MainCartCleanEvent>((event, emit) async {
      emit(state.copyWith(cart: []));

    });
    on<MainInitEvent>((event, emit) async {
      final result = await _productUseCase.repository.getAllProducts();

      emit(
        result.fold(
          (l) => state.copyWith(errorMsg: l.msg),
          (r) => state.copyWith(products: r),
        ),
      );
    });

    on<MainAddCartEvent>((event, emit) async {
      final existingIndex = state.cart.indexWhere(
        (c) => c.productId == event.product.id,
      );
      List<CartEntity> updatedCart = List.from(state.cart);

      if (existingIndex >= 0) {
        final existing = updatedCart[existingIndex];
        updatedCart[existingIndex] = existing.copyWith(
          quantity: existing.quantity + 1,
        );
      } else {
        updatedCart.add(
          CartEntity(
            id: DateTime.now().millisecondsSinceEpoch,
            productId: event.product.id,
            quantity: 1,
          ),
        );
      }

      emit(state.copyWith(cart: updatedCart));
    });

    on<MainRemoveCartEvent>((event, emit) async {
      final existingIndex = state.cart.indexWhere(
        (c) => c.productId == event.product.id,
      );
      List<CartEntity> updatedCart = List.from(state.cart);

      final existing = updatedCart[existingIndex];

      if (existing.quantity > 1) {
        updatedCart[existingIndex] = existing.copyWith(
          quantity: existing.quantity - 1,
        );
      } else {
        updatedCart.removeAt(existingIndex);
      }

      emit(state.copyWith(cart: updatedCart));
    });
    on<MainDeleteCartEvent>((event, emit) async {
      final existingIndex = state.cart.indexWhere(
        (c) => c.productId == event.product.id,
      );
      List<CartEntity> updatedCart = List.from(
        state.cart..removeAt(existingIndex),
      );

      emit(state.copyWith(cart: updatedCart));
    });
  }

  List<CartItemWithProduct> get cartItemsWithProduct {
    return state.cart.map((cartItem) {
      final product = state.products.firstWhere(
        (p) => p.id == cartItem.productId,
        orElse: () => ProductEntity(
          id: 0,
          name: 'Unknown',
          amount: 0,
          stock: 0,
          photoUrl: '',
        ),
      );
      return CartItemWithProduct(cart: cartItem, product: product);
    }).toList();
  }
}
