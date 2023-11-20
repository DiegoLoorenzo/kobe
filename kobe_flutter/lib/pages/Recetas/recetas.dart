import 'package:kobe_flutter/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
        body: Stack(
          children: [
            // Fondo del AppBar
            Container(
              height: MediaQuery.of(context).size.height * 0.28,
              decoration: BoxDecoration(
                color: Color(0xFFFFD974),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
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
                          color: Color.fromARGB(255, 255, 236, 185),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.file_download),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            // Lógica del botón Descargas
                            print('Botón de Descargas presionado');
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      // Contenedor del segundo icono
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 236, 185),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.settings),
                          color: const Color.fromARGB(255, 0, 0, 0),
                          onPressed: () {
                            // Lógica del botón Configuración
                            print('Botón de Configuración presionado');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  TabBar(
                    labelStyle: TextStyle(fontSize: 18),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          10), // Bordes de la línea indicadora
                      color: Color.fromARGB(255, 238, 126,
                          51), // Color de fondo de la línea indicadora
                    ),
                    labelColor: Colors.white, // Color del texto seleccionado
                    unselectedLabelColor:
                        Colors.black, // Color del texto no seleccionado
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(
                                61, 238, 126, 51), // Bordes del tab
                            // Color de fondo del tab no seleccionado
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Mis Recetas'),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(10), // Bordes del tab
                            color: Color.fromARGB(61, 238, 126,
                                51), // Color de fondo del tab no seleccionado
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Costeo'),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 40),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Contenido de la pestaña Descargas
                        Column(
                          children: [
                            // Campo de búsqueda personalizado
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
                                  decoration: InputDecoration(
                                    hintText: 'Buscar en K.O.B.E',
                                    prefixIcon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                ),
                              ),
                            ),
                            // ListView con registros filtrados
                            Expanded(
                              child: ListView.builder(
                                itemCount: registrosFiltrados.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(registrosFiltrados[index]),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        // Contenido de la pestaña Configuración
                        Center(
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
      ),
    );
  }
}
