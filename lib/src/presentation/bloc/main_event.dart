part of 'main_bloc.dart';

sealed class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object?> get props => [];
}

class MainInitEvent extends MainEvent {}
class MainCartCleanEvent extends MainEvent {}

class MainAddCartEvent extends MainEvent {
  final ProductEntity product;

  const MainAddCartEvent(this.product);
}

class MainRemoveCartEvent extends MainEvent {
  final ProductEntity product;

  const MainRemoveCartEvent(this.product);
}

class MainSaleEvent extends MainEvent {

  const MainSaleEvent();
}
class MainDeleteCartEvent extends MainEvent {
  final ProductEntity product;

  const MainDeleteCartEvent(this.product);
}
