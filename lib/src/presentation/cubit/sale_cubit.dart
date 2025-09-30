import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/cart_item_with_product.dart';
import '../../data/model/sale_history_model.dart';
import '../../domain/entity/error.dart';
import '../../domain/usecase/sale_history_usecase.dart';


part 'sale_state.dart';

class SaleCubit extends Cubit<SaleState> {
  final SaleUseCase saleUseCase;

  SaleCubit({required this.saleUseCase}) : super(const SaleState());

  Future<void> checkoutCart(List<CartItemWithProduct> items) async {
    emit(state.copyWith(isLoading: true, errorMsg: null, lastSale: null));

    final Either<SameFailure, dynamic> result = await saleUseCase.addSale(items);

    result.fold(
          (failure) => emit(state.copyWith(isLoading: false, errorMsg: failure.msg)),
          (sale) => emit(state.copyWith(isLoading: false, lastSale: sale)),
    );
  }
}
