abstract class BooksDataSource {

  Future<List<String>> getBooks();

  Future<void> saveBooks(List<String> books);

}