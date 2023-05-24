import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../models/basket.dart';
import '../models/product.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketState()) {
    on<GetProduct>(_getAllProduct);
    on<AddProduct>(_addProduct);
    on<RemoveProduct>(_removeProduct);
  }

  _getAllProduct(GetProduct event, Emitter<BasketState> emit) async {
    emit(state.copyWith(newStatus: BasketStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(newStatus: BasketStatus.success));
    } catch (e) {
      emit(state.copyWith(newStatus: BasketStatus.error, newError: e.toString()));
    }
  }

  _addProduct(AddProduct event, Emitter<BasketState> emit) async {
    emit(state.copyWith(newStatus: BasketStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 3));
      final product = state.basket.products[event.product];
      if (product != null) {
        state.basket.products[event.product] = product + 1;
      } else {
        state.basket.products[event.product] = 1;
      }
      state.basket.lastUpdateDate = DateTime.now();
      emit(state.copyWith(newStatus: BasketStatus.success));
    } catch (e) {
      emit(state.copyWith(newStatus: BasketStatus.error, newError: e.toString()));
    }
  }

  _removeProduct(RemoveProduct event, Emitter<BasketState> emit) async {
    emit(state.copyWith(newStatus: BasketStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 3));
      final product = state.basket.products[event.product];
      if (product == null) {
        emit(state.copyWith(newStatus: BasketStatus.error, newError: "This product does not exist in your cart."));
      } else {
        state.basket.products.removeWhere((key, value) => key.id == event.product.id);
        state.basket.lastUpdateDate = DateTime.now();
        emit(state.copyWith(newStatus: BasketStatus.success));
      }
    } catch (e) {
      emit(state.copyWith(newStatus: BasketStatus.error, newError: e.toString()));
    }
  }
}
