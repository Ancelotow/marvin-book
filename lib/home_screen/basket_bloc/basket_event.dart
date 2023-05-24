part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent {}

class AddProduct extends BasketEvent {
  final Product product;

  AddProduct(this.product);
}

class GetProduct extends BasketEvent {
  GetProduct();
}

class RemoveProduct extends BasketEvent {
  final Product product;
  final int count;

  RemoveProduct({required this.product, this.count = 1});
}