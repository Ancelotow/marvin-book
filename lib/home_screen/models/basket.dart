import 'package:marvin_book/home_screen/models/product.dart';

class Basket {
  late final Map<Product, int> products;
  late DateTime lastUpdateDate;

  Basket({
    Map<Product, int>? products,
    DateTime? lastUpdateDate,
  }) {
    this.lastUpdateDate = lastUpdateDate ?? DateTime.now();
    this.products = products ?? {};
  }
}
