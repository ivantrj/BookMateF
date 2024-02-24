import 'package:bookmate/database/book_database.dart';
import 'package:bookmate/screens/widgets/add_book_modal.dart';
import 'package:flutter/material.dart';
import 'package:bookmate/models/book.dart';

class InboxPage extends StatefulWidget {
  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  Future<List<Book>>? _books;
  final bookDB = BookDatabase();

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  void fetchBooks() {
    setState(() {
      _books = bookDB.getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Book',
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddBookWidget(onSubmit: (title) async {
            await bookDB.create(title: title);
            if (!mounted) return;
            fetchBooks();
            Navigator.of(context).pop();
          }),
        ),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List<Book>>(
        future: _books,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            final books = snapshot.data ?? [];
            return books.isEmpty
                ? const Center(child: Text('No books'))
                : ListView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return ListTile(
                        title: Text(book.title),
                        trailing: IconButton(
                          onPressed: () async {
                            await bookDB.delete(book.id);
                            if (!mounted) return;
                            fetchBooks();
                          },
                          icon: const Icon(Icons.delete),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddBookWidget(
                                book: book,
                                onSubmit: (title) async {
                                  await bookDB.update(book, title: title);
                                  if (!mounted) return;
                                  fetchBooks();
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
          }
        },
      ),
    );
  }
}
