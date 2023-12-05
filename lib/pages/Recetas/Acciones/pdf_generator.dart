import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:typed_data';

class PdfGenerator {
  static Future<Uint8List> generatePdf({
    required String name,
    required String rendimiento,
    required String tamPorcion,
    required String numPorcion,
    required String tmpPreparacion,
    required String tmpCoccion,
    required String tempCoccion,
    required String tempServicio,
    required String tmpConservacion,
    required String tempConservacion,
    required String clasificacion,
    required String tipoCorte,
    required String bebida,
    required String metCoccion,
    required String emplatado,
    required String porcion,
    required String calorias,
    required String lipidos,
    required String carbohidratos,
    required String proteina,
    required String pdfFileName,
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Nombre de la receta: $name'),
            pw.Text('Rendimiento: $rendimiento'),
            pw.Text('Tamaño de porción: $tamPorcion'),
            pw.Text('Número de porción: $numPorcion'),
            pw.Text('Tiempo de preparación: $tmpPreparacion'),
            pw.Text('Tiempo de cocción: $tmpCoccion'),
            pw.Text('Temperatura de cocción: $tempCoccion'),
            pw.Text('Temperatura de servicio: $tempServicio'),
            pw.Text('Tiempo de conservación: $tmpConservacion'),
            pw.Text('Temperatura de conservación: $tempConservacion'),
            pw.Text('Clasificación: $clasificacion'),
            pw.Text('Tipo de corte: $tipoCorte'),
            pw.Text('Alianza con bebida: $bebida'),
            pw.Text('Métodos de cocción: $metCoccion'),
            pw.Text('Tipo de emplatado: $emplatado'),
            pw.Text('Porción: $porcion'),
            pw.Text('Calorías: $calorias'),
            pw.Text('Lípidos: $lipidos'),
            pw.Text('Carbohidratos: $carbohidratos'),
            pw.Text('Proteína: $proteina'),
          ],
        ),
      ),
    );

    final pdfBytes = await pdf.save();
    return Uint8List.fromList(pdfBytes);
  }
}
