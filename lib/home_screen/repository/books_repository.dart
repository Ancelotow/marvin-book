import '../data_sources/books_data_source.dart';

class BooksRepository {
  final BooksDataSource remoteDataSource;
  final BooksDataSource localDataSource;

  BooksRepository({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  Future<List<String>> fetchBooks() async {
    try {
      final books = await remoteDataSource.getBooks();
      await localDataSource.saveBooks(books); // Gestion du cache, en cas de coupure réseau, on aura enregistré les données en local
      return books;
    } catch(e) {
      return await localDataSource.getBooks(); // Gestion du cache, récupération des données en local
    }
  }
}
