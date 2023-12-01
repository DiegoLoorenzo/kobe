import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class biblioteca extends StatefulWidget {
  const biblioteca({super.key});

  @override
  _bibliotecaState createState() => _bibliotecaState();
}

class _bibliotecaState extends State<biblioteca> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> pdfData =[];

  Future<String?> uploadPdf(String fileName, File file) async {
    final refrence = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
    final uploadTask = refrence.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = refrence.getDownloadURL();
    return downloadLink;
  }
  void pickFile() async{
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

      if(pickedFile != null) {
        String fileName = pickedFile.files[0].name;
        File file = File(pickedFile.files[0].path!);
        final downloadLink = await uploadPdf(fileName, file);

        _firebaseFirestore.collection("pdfs").add({
          "name": fileName,
          "url": downloadLink,
        });

        print("Pdf upload Successfully");
      }
  }

    void getAllPdf() async {
      final results = await _firebaseFirestore.collection("pdfs").get();
      pdfData = results.docs.map((e) => e.data()).toList();

      setState(() {
        
      });

    }

    @override
    void initState(){
      super.initState();
      getAllPdf();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libros'),
      ),
      body: GridView.builder(
        itemCount: pdfData.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, Index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                    PdfViewerScreen(pdfUrl: pdfData[Index]['url'])),
                    );
              },
              child:  Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/pdf.png",
                      height: 120,
                      width: 100,
                    ),
                    Text(
                      pdfData[Index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.upload_file),
        onPressed: pickFile,
      ),
    );
  }
}

class PdfViewerScreen extends StatefulWidget{
  final String pdfUrl;
  const PdfViewerScreen({super.key, required this.pdfUrl});

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFDocument? document;
  
  void initialisePdf() async {
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    initialisePdf();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: document != null? PDFViewer(
        document: document!,
        )
        : Center(
          child: CircularProgressIndicator(),
        ),
    );
  }
}


