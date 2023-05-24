import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvin_book/cart_screen/cart_screen.dart';
import 'package:marvin_book/home_screen/basket_bloc/basket_bloc.dart';
import 'package:marvin_book/home_screen/products_bloc/products_bloc.dart';
import 'books_repository_provider.dart';
import 'models/product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Amazon"),
        actions: [
          IconButton(
            onPressed: () => CartScreen.navigateTo(context),
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(builder: (context, state) {
        final products = state.products;
        switch (state.status) {
          case ProductStatus.success:
            if (products.isEmpty) {
              return const Center(
                child: Text("No products found"),
              );
            }
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final currentProduct = products[index];
                return ListTile(
                  title: GestureDetector(
                    onTap: () => _addProduct(context, currentProduct),
                    child: Text(
                        "${currentProduct.name} : ${currentProduct.price}€"),
                  ),
                );
              },
            );

          case ProductStatus.loading:
            return const Center(child: CircularProgressIndicator());

          case ProductStatus.error:
            return Text("Erreur : ${state.error}");
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final productsBloc = BlocProvider.of<ProductsBloc>(context);
          productsBloc.add(GetAllProduct(3));
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  void _addProduct(BuildContext context, Product product) {
    final cartBloc = BlocProvider.of<BasketBloc>(context);
    cartBloc.add(AddProduct(product));
  }
}
