part of 'basket_bloc.dart';

enum BasketStatus { initial, loading, error, success }

class BasketState {
  late final Basket basket;
  final BasketStatus status;
  final String error;

  BasketState({
    this.status = BasketStatus.initial,
    Basket? basket,
    this.error = "",
  }) {
    this.basket = basket ?? Basket();
  }

  BasketState copyWith({
    BasketStatus? newStatus,
    Basket? newBasket,
    String? newError,
  }) {
    return BasketState(
      status: newStatus ?? status,
      basket: newBasket ?? basket,
      error: newError ?? error,
    );
  }
}
