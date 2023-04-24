import 'package:flutter/cupertino.dart';
import 'package:marvin_book/home_screen/repository/books_repository.dart';

class BooksRepositoryProvider extends InheritedWidget {
  final BooksRepository repository;

  const BooksRepositoryProvider({
    Key? key,
    required Widget child,
    required this.repository,
  }) : super(key: key, child: child);

  static BooksRepositoryProvider of(BuildContext context) {
    final BooksRepositoryProvider? result =
        context.dependOnInheritedWidgetOfExactType<BooksRepositoryProvider>();
    assert(result != null, 'No BooksRepositoryProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(BooksRepositoryProvider old) {
    return true;
  }
}
