part of 'products_bloc.dart';

enum ProductStatus { loading, success, error }

class ProductsState {
  final ProductStatus status;
  final List<Product> products;
  final String error;

  ProductsState({
    required this.status,
    this.products = const [],
    this.error = "",
  });

  ProductsState copyWith({
    ProductStatus? newStatus,
    List<Product>? newProducts,
    String? newError,
  }) {
    return ProductsState(
      status: newStatus ?? status,
      products: newProducts ?? products,
      error: newError ?? error,
    );
  }
}
