part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent {}

class GetAllProduct extends ProductsEvent {
  final int count;

  GetAllProduct(this.count);
}
