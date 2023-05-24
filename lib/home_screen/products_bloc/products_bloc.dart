import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../models/product.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState(status: ProductStatus.loading)) {
    on<GetAllProduct>(_getAllProduct);
  }

  _getAllProduct(GetAllProduct event, Emitter<ProductsState> emit) async {
    emit(state.copyWith(newStatus: ProductStatus.loading));
    try{
      await Future.delayed(const Duration(seconds: 3));
      final count = event.count;
      debugPrint('Get all product : $count');
      final products = List.generate(
        count,
            (index) => Product(
          id: index,
          name: "Product n°$index",
          description: "Production destion",
          price: 0.99 + index,
        ),
      );
      emit(state.copyWith(newStatus: ProductStatus.success, newProducts:  products));
    } catch(e) {
      emit(state.copyWith(newStatus: ProductStatus.error));
    }
  }
}
