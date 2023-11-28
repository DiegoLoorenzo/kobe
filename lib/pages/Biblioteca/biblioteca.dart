import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<String?> uploadPdf(String fileName, File file) async {
    final reference = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");

    final UploadTask = reference.putFile(file);
    await UploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if(pickedFile != null) {
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path!);
    final downloadLink = await uploadPdf(fileName, file);
    await _firebaseFirestore.collection("pdfs").add({
      "name": fileName,
      "url": downloadLink,
    });

      print("Pdf uploaded Sucessfully");

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Libros'),
      ),
      body: Column(
      
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color.fromRGBO(234, 92, 0, 1),
        child: Icon(Icons.upload_file,
        ),
        onPressed: pickFile,
        ),
    );
  }
}


