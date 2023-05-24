import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvin_book/home_screen/basket_bloc/basket_bloc.dart';
import '../home_screen/models/product.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = "cart";

  const CartScreen({Key? key}) : super(key: key);

  static void navigateTo(BuildContext context){
    Navigator.pushNamed(
      context,
      CartScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("My cart"),
      ),
      body: BlocBuilder<BasketBloc, BasketState>(builder: (context, state) {
        final basket = state.basket;
        switch (state.status) {
          case BasketStatus.success:
            return _getProducts(context, basket.products);

          case BasketStatus.loading:
            return const Center(child: CircularProgressIndicator());

          case BasketStatus.error:
            return Column(
              children: [
                _getProducts(context, basket.products),
                Text("Erreur : ${state.error}"),
              ],
            );

          case BasketStatus.initial:
            return _getProducts(context, basket.products);
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final productsBloc = BlocProvider.of<BasketBloc>(context);
          productsBloc.add(GetProduct());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _getProducts(BuildContext context, Map<Product, int> products) {
    if (products.isEmpty) {
      return const Center(
        child: Text("No products found"),
      );
    }
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final currentProduct = products.keys.elementAt(index);
        return ListTile(
          title: Text(
              "${currentProduct.name} : ${currentProduct.price}€ (x${products[currentProduct]})"),
        );
      },
    );
  }
}
