import 'package:flutter/material.dart';
import 'books_repository_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: BooksRepositoryProvider.of(context).repository.fetchBooks(),
      builder:
          (BuildContext contextBuilder, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            final books = snapshot.data!;
            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (BuildContext contextList, int index) {
                return Material(
                  child: ListTile(
                    title: Text(
                      books[index],
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text("Non content");
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
