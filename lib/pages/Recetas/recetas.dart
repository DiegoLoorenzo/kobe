import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:kobe_flutter/pages/Recetas/RecetaEstandar.dart';
import 'package:kobe_flutter/pages/Recetas/RecetaComplementaria.dart';
import 'package:kobe_flutter/pages/config.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'recetas_operations.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Recetas extends StatefulWidget {
  const Recetas({Key? key, required String nombreReceta}) : super(key: key);

  @override
  State<Recetas> createState() => _RecetasState();
}

class _RecetasState extends State<Recetas> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<String> registrosFiltradosEstandar = [];
  List<String> registrosFiltradosComplementaria = [];
  TextEditingController _searchControllerEstandar = TextEditingController();
  TextEditingController _searchControllerComplementaria =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _cargarArchivosPDF('estandar'); // Cargar archivos de la carpeta "estandar"
    _cargarArchivosPDF(
        'complementaria'); // Cargar archivos de la carpeta "complementaria"
  }

  Future<void> _cargarArchivosPDF(String carpeta) async {
    firebase_storage.ListResult result =
        await firebase_storage.FirebaseStorage.instance.ref(carpeta).listAll();

    setState(() {
      if (carpeta == 'estandar') {
        registrosFiltradosEstandar = result.items
            .where((element) => element.name.toLowerCase().endsWith('.pdf'))
            .map((element) => element.name)
            .toList();
      } else if (carpeta == 'complementaria') {
        registrosFiltradosComplementaria = result.items
            .where((element) => element.name.toLowerCase().endsWith('.pdf'))
            .map((element) => element.name)
            .toList();
      }
    });
  }

  void filtrarRegistros(String filtro, String carpeta) {
    setState(() {
      if (filtro.isEmpty) {
        // Si el campo de búsqueda está vacío, cargar todos los archivos nuevamente
        _cargarArchivosPDF(carpeta);
      } else {
        if (carpeta == 'estandar') {
          registrosFiltradosEstandar = registrosFiltradosEstandar
              .where((elemento) =>
                  elemento.toLowerCase().contains(filtro.toLowerCase()))
              .toList();
        } else if (carpeta == 'complementaria') {
          registrosFiltradosComplementaria = registrosFiltradosComplementaria
              .where((elemento) =>
                  elemento.toLowerCase().contains(filtro.toLowerCase()))
              .toList();
        }
      }
    });
  }

  void abrirPDF(String nombrePDF, String carpeta) async {
    try {
      // Obtener la URL de descarga desde Firebase Storage
      String url = await firebase_storage.FirebaseStorage.instance
          .ref('$carpeta/$nombrePDF')
          .getDownloadURL();

      PDFDocument doc = await PDFDocument.fromURL(url);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewer(document: doc),
        ),
      );
    } catch (error) {
      print("Error al abrir el PDF: $error");
    }
  }

  Future<void> _eliminarPDF(String nombrePDF, String carpeta) async {
    await mostrarDialogoEliminar(
        context, nombrePDF, carpeta, () => _cargarArchivosPDF(carpeta));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.28,
            decoration: const BoxDecoration(
              color: Color(0xFFFFD974),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 236, 185),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {
                          // Lógica para recargar la vista
                          _cargarArchivosPDF('estandar');
                          _cargarArchivosPDF('complementaria');
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 236, 185),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.settings),
                        color: const Color.fromARGB(255, 0, 0, 0),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfigurationScreen()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Expanded(
                  child: Column(
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: 'Recetas Estándar'),
                          Tab(text: 'Recetas Complementarias'),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            _buildRecetasTab(
                              _searchControllerEstandar,
                              registrosFiltradosEstandar,
                              'estandar',
                            ),
                            _buildRecetasTab(
                              _searchControllerComplementaria,
                              registrosFiltradosComplementaria,
                              'complementaria',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.orange,
        overlayColor: const Color.fromARGB(255, 252, 250, 250),
        overlayOpacity: 0.8,
        spacing: 20,
        spaceBetweenChildren: 5,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add_to_photos_rounded),
            labelBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey,
            label: 'Receta Complementaria',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RecetaComplementaria()),
              );
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.add_to_photos_outlined),
            labelBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.grey,
            label: 'Receta Estandar',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RecetaEstandar()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecetasTab(
    TextEditingController searchController,
    List<String> registrosFiltrados,
    String carpeta,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: TextField(
              controller: searchController,
              onChanged: (filtro) => filtrarRegistros(filtro, carpeta),
              decoration: const InputDecoration(
                hintText: 'Buscar en K.O.B.E',
                prefixIcon: Icon(Icons.search),
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(16),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: registrosFiltrados.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(
                    registrosFiltrados[index],
                  ),
                  leading: Image.asset(
                    'assets/pdf.png',
                    width: 40,
                    height: 40,
                  ),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'download') {
                        // Lógica para descargar el PDF
                        descargarPDF(registrosFiltrados[index], carpeta);
                      } else if (value == 'delete') {
                        // Lógica para eliminar el PDF
                        _eliminarPDF(registrosFiltrados[index], carpeta);
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'download',
                        child: ListTile(
                          leading: Icon(Icons.file_download),
                          title: Text('Descargar'),
                        ),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Eliminar'),
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    abrirPDF(
                      registrosFiltrados[index],
                      carpeta,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
