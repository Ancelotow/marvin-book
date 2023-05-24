import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvin_book/cart_screen/cart_screen.dart';
import 'package:marvin_book/home_screen/basket_bloc/basket_bloc.dart';
import 'package:marvin_book/home_screen/data_sources/local_books_data_source.dart';
import 'package:marvin_book/home_screen/data_sources/remote_books_data_source.dart';
import 'package:marvin_book/home_screen/home_screen.dart';
import 'home_screen/books_repository_provider.dart';
import 'home_screen/products_bloc/products_bloc.dart';
import 'home_screen/repository/books_repository.dart';

void main() {
  const apiBaseUrl =
  String.fromEnvironment("API_BASE_URL", defaultValue: "coucou");
  debugPrint(apiBaseUrl);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BooksRepositoryProvider(
      repository: BooksRepository(
        localDataSource: LocalBooksDataSource(),
        remoteDataSource: RemoteBooksDataSource(),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => BasketBloc()..add(GetProduct())
          ),
          BlocProvider(
              create: (context) => ProductsBloc()..add(GetAllProduct(3))
          ),
        ],
        child: MaterialApp(
            title: 'Marvin Book',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const HomeScreen(),
            onGenerateRoute: (RouteSettings settings) {
              final dynamic arguments = settings.arguments;
              switch (settings.name) {
                case CartScreen.routeName:
                  return MaterialPageRoute(
                    builder: (BuildContext context) => const CartScreen(),
                  );
                  break;
              }
            }
        ),
      ),
    );
  }
}
