part of 'sale_cubit.dart';


class SaleState extends Equatable {
  final bool isLoading;
  final String? errorMsg;
  final SaleHistoryEntity? lastSale;

  const SaleState({
    this.isLoading = false,
    this.errorMsg,
    this.lastSale,
  });

  SaleState copyWith({
    bool? isLoading,
    String? errorMsg,
    SaleHistoryEntity? lastSale,
  }) {
    return SaleState(
      isLoading: isLoading ?? this.isLoading,
      errorMsg: errorMsg ?? this.errorMsg,
      lastSale: lastSale ?? this.lastSale,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMsg, lastSale];
}
