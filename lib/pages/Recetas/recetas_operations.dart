import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> mostrarDialogoEliminar(BuildContext context, String nombrePDF,
    String carpeta, Function actualizarLista) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirmar Eliminación'),
        content: Text('¿Estás seguro de eliminar la receta $nombrePDF?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Cerrar el cuadro de diálogo
              await eliminarPDF(context, nombrePDF, carpeta, actualizarLista);
            },
            child: Text('Eliminar'),
          ),
        ],
      );
    },
  );
}

Future<void> descargarPDF(String nombrePDF, String carpeta) async {
  // Lógica para descargar el PDF
  print('Descargar PDF: $nombrePDF');
}

Future<void> eliminarPDF(BuildContext context, String nombrePDF, String carpeta,
    Function actualizarLista) async {
  // Lógica para eliminar el PDF
  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('$carpeta/$nombrePDF')
        .delete();

    // Actualizar la lista después de la eliminación
    actualizarLista();
  } catch (error) {
    print("Error al eliminar el PDF: $error");
  }
}
