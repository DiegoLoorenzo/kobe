import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static Future<void> uploadPdfToStorage(
      Uint8List pdfBytes, String pdfFileName) async {
    final storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('estandar/$pdfFileName.pdf');

    await storageRef.putData(pdfBytes);
  }
}

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getrecetaEstandar() async {
  List recetaEstandar = [];

  QuerySnapshot querySnapshot = await db.collection('recetaEstandar').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    recetaEstandar.add(doc.data());
  }
  return recetaEstandar;
}

// Guardar
Future<void> addrecetaEstandar(
  String nombre,
  String tipoReceta,
  String rendimiento,
  String tamPorcion,
  String numPorcion,
  String tmpPreparacion,
  String tmpCoccion,
  String tempCoccion,
  String tempServicio,
  String tmpConservacion,
  String tempConservacion,
  String clasificacion,
  String tipoCorte,
  String alianzaBebida,
  String metCoccion,
  String tipoEmplatado,
  String porcion,
  String calorias,
  String lipidos,
  String carbohidratos,
  String proteina,
) async {
  await db.collection('recetaEstandar').add({
    'name': nombre,
    'receta': tipoReceta,
    'rendimiento': rendimiento,
    'tamPorcion': tamPorcion,
    'numPorcion': numPorcion,
    'tempturaPreparacion': tmpPreparacion,
    'tmpCoccion': tmpCoccion,
    'tempCoccion': tempCoccion,
    'tempServicio': tempServicio,
    'tmpConservacion': tmpConservacion,
    'tempConservacion': tempConservacion,
    'clasificacion': clasificacion,
    'tipoCorte': tipoCorte,
    'alianzaBebida': alianzaBebida,
    'metodoCoccion': metCoccion,
    'tipoEmplatado': tipoEmplatado,
    'porcion': porcion,
    'calorias': calorias,
    'liìdos': lipidos,
    'carbohidratos': carbohidratos,
    'proteina': proteina,
  });
}

//Actualizar datos
Future<void> updaterecetaEstandar(
  String uid,
  String newName,
  String newRendimiento,
  String newTamPorcion,
  String newNumPorcion,
  String newTmpPreparacion,
  String newTmpCoccion,
  String newTempCoccion,
  String newTempServicio,
  String newTmpConservacion,
  String newTempConservacion,
  String newClasificacion,
  String newTipoCorte,
  String newAlianzaBebida,
  String newMetCoccion,
  String newTipoEmplatado,
  String newPorcion,
  String newCalorias,
  String newLipidos,
  String newCarbohidratos,
  String newProteina,
) async {
  await db.collection('recetaEstandar').doc(uid).set({
    'name': newName,
    'rendimiento': newRendimiento,
    'tamPorcion': newTamPorcion,
    'numPorcion': newNumPorcion,
    'tempturaPreparacion': newTmpPreparacion,
    'tmpCoccion': newTamPorcion,
    'tempCoccion': newTempCoccion,
    'tempServicio': newTempServicio,
    'tmpConservacion': newTmpConservacion,
    'tempConservacion': newTempConservacion,
    'clasificacion': newClasificacion,
    'tipoCorte': newTipoCorte,
    'alianzaBebida': newAlianzaBebida,
    'metodoCoccion': newMetCoccion,
    'tipoEmplatado': newTipoEmplatado,
    'porcion': newPorcion,
    'calorias': newCalorias,
    'liìdos': newLipidos,
    'carbohidratos': newCarbohidratos,
    'proteina': newProteina,
  });
}

//RECETA COMPLEMENTARIA
Future<List> getrecetaComplementaria() async {
  List recetaComplementaria = [];

  QuerySnapshot querySnapshot =
      await db.collection('addrecetaComplementaria').get();
  for (var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    recetaComplementaria.add(doc.data());
  }
  return recetaComplementaria;
}

// Guardar
Future<void> addrecetaComplementaria(
  String nombre,
  String rendimiento,
  String tamPorcion,
  String numPorcion,
  String tmpPreparacion,
  String tmpCoccion,
  String tempCoccion,
  String tempServicio,
  String tmpConservacion,
  String tempConservacion,
  String clasificacion,
  String tipoCorte,
  String alianzaBebida,
  String metCoccion,
  String tipoEmplatado,
) async {
  await db.collection('addrecetaComplementaria').add({
    'name': nombre,
    'rendimiento': rendimiento,
    'tamPorcion': tamPorcion,
    'numPorcion': numPorcion,
    'tempturaPreparacion': tmpPreparacion,
    'tmpCoccion': tmpCoccion,
    'tempCoccion': tempCoccion,
    'tempServicio': tempServicio,
    'tmpConservacion': tmpConservacion,
    'tempConservacion': tempConservacion,
    'clasificacion': clasificacion,
    'tipoCorte': tipoCorte,
    'alianzaBebida': alianzaBebida,
    'metodoCoccion': metCoccion,
    'tipoEmplatado': tipoEmplatado,
  });
}

//Actualizar datos
Future<void> updaterecetaComplementaria(
  String uid,
  String newName,
  String newRendimiento,
  String newTamPorcion,
  String newNumPorcion,
  String newTmpPreparacion,
  String newTmpCoccion,
  String newTempCoccion,
  String newTempServicio,
  String newTmpConservacion,
  String newTempConservacion,
  String newClasificacion,
  String newTipoCorte,
  String newAlianzaBebida,
  String newMetCoccion,
  String newTipoEmplatado,
) async {
  await db.collection('addrecetaComplementaria').doc(uid).set({
    'name': newName,
    'rendimiento': newRendimiento,
    'tamPorcion': newTamPorcion,
    'numPorcion': newNumPorcion,
    'tempturaPreparacion': newTmpPreparacion,
    'tmpCoccion': newTamPorcion,
    'tempCoccion': newTempCoccion,
    'tempServicio': newTempServicio,
    'tmpConservacion': newTmpConservacion,
    'tempConservacion': newTempConservacion,
    'clasificacion': newClasificacion,
    'tipoCorte': newTipoCorte,
    'alianzaBebida': newAlianzaBebida,
    'metodoCoccion': newMetCoccion,
    'tipoEmplatado': newTipoEmplatado,
  });
}
