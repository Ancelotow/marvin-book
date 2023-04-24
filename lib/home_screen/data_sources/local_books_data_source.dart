import 'package:flutter/cupertino.dart';
import 'package:marvin_book/home_screen/data_sources/books_data_source.dart';

class LocalBooksDataSource implements BooksDataSource {

  @override
  Future<List<String>> getBooks() async {
    debugPrint("Getting books from remote data source");
    await Future.delayed(const Duration(seconds: 2));
    return ["Lord of the Rings : The Fellowship of the ring", "Pet Simetary", "Harry potter and the Philosophal stone"];
  }

  @override
  Future<void> saveBooks(List<String> books) async {
    // TODO: implement saveBooks
  }



}