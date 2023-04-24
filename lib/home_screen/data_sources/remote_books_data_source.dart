import 'package:flutter/cupertino.dart';
import 'package:marvin_book/home_screen/data_sources/books_data_source.dart';

class RemoteBooksDataSource implements BooksDataSource {

  @override
  Future<List<String>> getBooks() async {
    debugPrint("Getting books from local data source");
    return ["Lord of the Rings : The Fellowship of the ring", "Pet Simetary", "Harry potter and the Philosophal stone"];
  }

  @override
  Future<void> saveBooks(List<String> books) async {
    // TODO: implement saveBooks
  }

}