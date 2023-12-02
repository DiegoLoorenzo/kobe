import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kobe_flutter/pages/Biblioteca/pdf_viewer_screen.dart';
import 'package:kobe_flutter/pages/Biblioteca/pdf_upload.dart';
import 'package:kobe_flutter/pages/config.dart';

class biblioteca extends StatefulWidget {
  const biblioteca({super.key});

  @override
  _bibliotecaState createState() => _bibliotecaState();
}

class _bibliotecaState extends State<biblioteca> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData = [];
  List<Map<String, dynamic>> filteredPdfData = [];

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  Future<void> getAllPdf() async {
    final results = await _firebaseFirestore.collection("pdfs").get();
    pdfData = results.docs.map((e) => e.data()).toList();
    filteredPdfData = List.from(pdfData);
    setState(() {});
  }

  // Filtro los libros
  void filterBooks(String query) {
    setState(() {
      filteredPdfData = pdfData
          .where((book) =>
              book['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFFFD974),
            expandedHeight: MediaQuery.of(context).size.height * 0.16,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFD974),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 8.0),
                            Icon(Icons.search),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: TextField(
                                onChanged: (query) {
                                  filterBooks(query);
                                },
                                decoration: InputDecoration(
                                  hintText: 'Buscar en K.O.B.E',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                // Text(
                //   'Biblioteca',
                //   style: TextStyle(fontSize: 20, color: Colors.white),
                // ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ConfigurationScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PdfViewerScreen(
                              pdfUrl: filteredPdfData[index]['url']),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                            child: Image.asset(
                              "assets/pdf.png",
                              height: 120,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              filteredPdfData[index]['name'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: filteredPdfData.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_file),
        onPressed: pickFile,
      ),
    );
  }
}
