import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:kobe_flutter/pages/Recetas/RecetaComplementaria.dart';
import 'package:kobe_flutter/pages/Recetas/RecetaEstandar.dart';

class Recetas extends StatefulWidget {
  const Recetas({Key? key}) : super(key: key);

  @override
  State<Recetas> createState() => _RecetasState();
}

class _RecetasState extends State<Recetas> {
  // Lista filtrada para la búsqueda
  List<String> registrosFiltrados = [];

  // Controlador del campo de búsqueda
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializa la lista filtrada con algunos elementos de ejemplo
    registrosFiltrados = List.generate(10, (index) => 'Elemento $index');
  }

  // Método para filtrar la lista según el término de búsqueda
  void filtrarRegistros(String filtro) {
    setState(() {
      registrosFiltrados = List.generate(
        10,
        (index) => 'Elemento $index',
      )
          .where((elemento) =>
              elemento.toLowerCase().contains(filtro.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: [
            // Fondo del AppBar
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
                  // Contenedor para los iconos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Contenedor del primer icono
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 236, 185),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.file_download),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            print('Botón de Descargas presionado');
                          },
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Contenedor del segundo icono
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 236, 185),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.settings),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            print('Botón de Configuración presionado');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Contenido de la pestaña Descargas
                        Column(
                          children: [
                            // Búsqueda
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: (filtro) =>
                                      filtrarRegistros(filtro),
                                  decoration: const InputDecoration(
                                    hintText: 'Buscar en K.O.B.E',
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                ),
                              ),
                            ),
                            // ListView
                            const SizedBox(height: 15),
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.all(10),
                                itemCount: registrosFiltrados.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ListTile(
                                      title: Text(registrosFiltrados[index]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // Contenido de la pestaña Configuración
                        const Center(
                          child: Text('Contenido de Configuración'),
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
          overlayColor: Colors.white,
          // label: const Text('Receta'),
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
                  MaterialPageRoute(
                      builder: (context) => const RecetaEstandar()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
