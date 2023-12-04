import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kobe_flutter/pages/config.dart';

class Biblioteca extends StatefulWidget {
  const Biblioteca({Key? key});

  @override
  _BibliotecaState createState() => _BibliotecaState();
}

class _BibliotecaState extends State<Biblioteca> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  List<Map<String, dynamic>> pdfData = [];
  List<Map<String, dynamic>> filteredPdfData = [];

  @override
  void initState() {
    super.initState();
    getAllPdf();
  }

  Future<void> getAllPdf() async {
    final results = await _firebaseFirestore.collection("libros").get();
    pdfData = results.docs.map((e) => e.data()).toList();
    filteredPdfData = List.from(pdfData);
    setState(() {});
  }

  Future<String?> uploadPdfAndImage(
      String pdfFileName, File pdfFile, File imageFile) async {
    final pdfReference =
        _firebaseStorage.ref().child("libros/$pdfFileName.pdf");
    final pdfUploadTask = pdfReference.putFile(pdfFile);
    await pdfUploadTask.whenComplete(() {});

    final pdfDownloadLink = await pdfReference.getDownloadURL();

    final imageReference =
        _firebaseStorage.ref().child("images/${DateTime.now()}.png");
    final imageUploadTask = imageReference.putFile(imageFile);
    await imageUploadTask.whenComplete(() {});

    final imageDownloadLink = await imageReference.getDownloadURL();

    final documentReference =
        await _firebaseFirestore.collection('libros').add({
      'name': pdfFileName,
      'pdfUrl': pdfDownloadLink,
      'imageUrl': imageDownloadLink,
    });

    filteredPdfData.add({
      'name': pdfFileName,
      'pdfUrl': pdfDownloadLink,
      'imageUrl': imageDownloadLink,
    });

    setState(() {});

    return documentReference.id;
  }

  void pickFile() async {
    final pdfPickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    final imagePickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pdfPickedFile != null && imagePickedFile != null) {
      String pdfFileName = pdfPickedFile.files[0].name;
      File pdfFile = File(pdfPickedFile.files[0].path!);
      File imageFile = File(imagePickedFile.path!);

      final documentId =
          await uploadPdfAndImage(pdfFileName, pdfFile, imageFile);

      print("Libro agregado con ID: $documentId");
    }
  }

  void filterBooks(String query) {
    print("Query: $query");
    setState(() {
      filteredPdfData = pdfData
          .where((book) =>
              book['name'].toLowerCase().contains(query.toLowerCase()))
          .toList();
      print("Filtered Data: $filteredPdfData");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFFFD974),
            expandedHeight: MediaQuery.of(context).size.height * 0.12,
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Biblioteca',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      // Resto del código...
                      // Container(
                      //   margin: EdgeInsets.symmetric(horizontal: 16.0),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(30.0),
                      //   ),
                      //   child: Row(
                      //     children: [
                      //       SizedBox(width: 8.0),
                      //       Icon(Icons.search),
                      //       SizedBox(width: 8.0),
                      //       Expanded(
                      //         child: TextField(
                      //           onChanged: (query) {
                      //             filterBooks(query);
                      //           },
                      //           decoration: InputDecoration(
                      //             hintText: 'Buscar en K.O.B.E',
                      //             border: InputBorder.none,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            title: Row(
              children: [
                Spacer(),
                IconButton(
                  icon: Icon(Icons.settings),
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfigurationScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 16.0),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.65,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => PdfViewerScreen(
                                  pdfUrl: pdfData[index]['pdfUrl'],
                                )),
                      );
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(
                            pdfData[index]['imageUrl'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            pdfData[index]['name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: pdfData.length,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.upload_file),
      //   onPressed: pickFile,
      // ),
    );
  }
}

class PdfViewerScreen extends StatefulWidget {
  final String pdfUrl;
  const PdfViewerScreen({Key? key, required this.pdfUrl});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument? document;

  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document != null
          ? PDFViewer(
              document: document!,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
