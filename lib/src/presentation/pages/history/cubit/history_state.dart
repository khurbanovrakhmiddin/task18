part of 'history_cubit.dart';

class HistoryState extends Equatable {
  final List<SaleHistoryEntity> history;
  final bool isLoading;
  final String msg;

  const HistoryState({
    this.history = const [],
    this.isLoading = false,
    this.msg = '',
  });

  HistoryState copyWith({
    final bool? isLoading,
    final String? msg,
    final List<SaleHistoryEntity>? history,
  }) {
    return HistoryState(history: history ?? this.history);
  }

  @override
  List<Object> get props => [isLoading, msg, history];
}
