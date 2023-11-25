import 'package:flutter/material.dart';

class biblioteca extends StatefulWidget {
  const biblioteca({super.key});

  @override
  _bibliotecaState createState() => _bibliotecaState();
}

class _bibliotecaState extends State<biblioteca> {
  List<String> books = [
    'Libro 1',
    'Libro 2',
    'Libro 3',
    'Libro 4',
    'Libro 5',
    'Libro 6',
    // Agrega más libros según sea necesario
  ];

  List<String> filteredBooks = [];

  @override
  void initState() {
    super.initState();
    filteredBooks = books;
  }

  void filterBooks(String query) {
    setState(() {
      filteredBooks = books
          .where((book) => book.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libros'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => filterBooks(query),
              decoration: InputDecoration(
                labelText: 'Buscar libros',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) {
                return BookCard(bookTitle: filteredBooks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String bookTitle;

  const BookCard({required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        title: Text(bookTitle),
        // Agrega aquí las animaciones o personalizaciones que desees
      ),
    );
  }
}
