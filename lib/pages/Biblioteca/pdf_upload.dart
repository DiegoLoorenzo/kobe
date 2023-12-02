import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

Future<String?> uploadPdf(String fileName, File file) async {
  final reference = FirebaseStorage.instance.ref().child("pdfs/$fileName.pdf");
  final uploadTask = reference.putFile(file);
  await uploadTask.whenComplete(() {});
  final downloadLink = reference.getDownloadURL();
  return downloadLink;
}

void pickFile() async {
  final pickedFile = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf'],
  );

  if (pickedFile != null) {
    String fileName = pickedFile.files[0].name;
    File file = File(pickedFile.files[0].path!);
    final downloadLink = await uploadPdf(fileName, file);

    FirebaseFirestore.instance.collection("pdfs").add({
      "name": fileName,
      "url": downloadLink,
    });

    print("Pdf uploaded Successfully");
  }
}
