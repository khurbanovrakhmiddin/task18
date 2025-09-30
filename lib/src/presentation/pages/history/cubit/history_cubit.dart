import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:task18_m24/src/domain/usecase/sale_history_usecase.dart';

import '../../../../data/model/sale_history_model.dart';
import '../../../../di.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final SaleUseCase _case = sl<SaleUseCase>();

  HistoryCubit() : super(HistoryState());

  void init() async {
    emit(state.copyWith(isLoading: true));
    final res = await _case.getSales();
    emit(
      res.fold(
        (l) => state.copyWith(msg: l.msg, isLoading: false),
        (r) => state.copyWith(history: r, isLoading: false),
      ),
    );
  }
}
