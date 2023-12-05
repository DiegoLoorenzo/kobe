import 'package:flutter/material.dart';
import 'package:kobe_flutter/pages/Recetas/Firebase/firebase_services.dart';
import 'package:kobe_flutter/pages/Recetas/Acciones/pdf_generator.dart';
import 'dart:typed_data';
import 'package:kobe_flutter/pages/Recetas/Acciones/pdf_generator.dart';

class RecetaComplementaria extends StatefulWidget {
  const RecetaComplementaria({super.key});

  @override
  State<RecetaComplementaria> createState() => _RecetaComplementariaState();
}

class _RecetaComplementariaState extends State<RecetaComplementaria> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController rendimientoController = TextEditingController(text: '');
  TextEditingController tamPorcionController = TextEditingController(text: '');
  TextEditingController numPorcionController = TextEditingController(text: '');
  TextEditingController tmpPreparacionController =
      TextEditingController(text: '');
  TextEditingController tmpCoccionController = TextEditingController(text: '');
  TextEditingController tempCoccionController = TextEditingController(text: '');
  TextEditingController tempServicioController =
      TextEditingController(text: '');
  TextEditingController tmpConservacionController =
      TextEditingController(text: '');
  TextEditingController tempConservacionController =
      TextEditingController(text: '');
  TextEditingController clasificacionController =
      TextEditingController(text: '');
  TextEditingController tipoCorteController = TextEditingController(text: '');
  TextEditingController bebidaController = TextEditingController(text: '');
  TextEditingController metCoccionController = TextEditingController(text: '');
  TextEditingController emplatadoController = TextEditingController(text: '');
  TextEditingController porcionController = TextEditingController(text: '');
  TextEditingController caloriasController = TextEditingController(text: '');
  TextEditingController lipidosController = TextEditingController(text: '');
  TextEditingController carbohidratosController =
      TextEditingController(text: '');
  TextEditingController proteinaController = TextEditingController(text: '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> generateAndUploadPdf() async {
    final Uint8List pdfBytes = await PdfGenerator.generatePdf(
      name: nameController.text,
      rendimiento: rendimientoController.text,
      tamPorcion: tamPorcionController.text,
      numPorcion: numPorcionController.text,
      tmpPreparacion: tmpPreparacionController.text,
      tmpCoccion: tmpCoccionController.text,
      tempCoccion: tempCoccionController.text,
      tempServicio: tempServicioController.text,
      tmpConservacion: tmpConservacionController.text,
      tempConservacion: tempConservacionController.text,
      clasificacion: clasificacionController.text,
      tipoCorte: tipoCorteController.text,
      bebida: bebidaController.text,
      metCoccion: metCoccionController.text,
      emplatado: emplatadoController.text,
      porcion: porcionController.text,
      calorias: caloriasController.text,
      lipidos: lipidosController.text,
      carbohidratos: carbohidratosController.text,
      proteina: proteinaController.text,
      pdfFileName: nameController.text,
    );

    await FirebaseService.uploadPdfToStorage(pdfBytes, nameController.text);

    print('PDF subido exitosamente a Firebase Storage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            backgroundColor: const Color(0xFFFFD974),
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
            ),
            automaticallyImplyLeading: true,
            title: const Text('Receta Complementaria'),
            centerTitle: true,
          ),

          //Container 1
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 720,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            // const SizedBox(height: 10.0),
                            // Stack(
                            //   children: [
                            //     Container(
                            //       decoration: const BoxDecoration(
                            //         color: Colors.white,
                            //         shape: BoxShape.rectangle,
                            //         boxShadow: [
                            //           BoxShadow(
                            //             blurRadius: 20,
                            //             color: Colors.black26,
                            //             offset: Offset(0, 20),
                            //           ),
                            //         ],
                            //       ),
                            //       child: Image.network(
                            //         'https://images.ctfassets.net/awb1we50v0om/2Spf80TME2zIhLqsi3Zxv9/919421a45f3260ee426c99c35235f1c8/Plates03__3__copy3.jpg',
                            //         width: 200,
                            //         height: 200,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Nombre de la receta',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 5 || value.length > 10) {
                                  return "Nombre demasiado corto";
                                }
                                return null;
                              },
                              // validator: (value) {
                              //   if (value!.isEmpty ||
                              //       !RegExp(r'^[a-z,A-Z]+$').hasMatch(value!)) {
                              //     return "Nombre correcto";
                              //   } else {
                              //     return null;
                              //   }
                              // },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: rendimientoController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Rendimiento',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 2 || value.length > 15) {
                                  return "Datos demasiados cortos";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tamPorcionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Tamaño de porción',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 2 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: numPorcionController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                labelText: 'Numero de porciones',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.isEmpty || value.length > 10) {}
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tmpPreparacionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Tiempo de preparación',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 5 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tmpCoccionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Tiempo de cocción',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 5 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tempCoccionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Temperatura de cocción',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 3 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tempServicioController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Temperatura de servicio',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 3 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tmpConservacionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Tiempo de conservación',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 5 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 10.0),
                            TextFormField(
                              controller: tempConservacionController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                labelText: 'Temperatura de conservación',
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return "Campo requerido";
                                }
                                if (value.length < 3 || value.length > 10) {
                                  return "Dato demasiado corto";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Container 2
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 360,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: clasificacionController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Clasificación',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Campo requerido";
                          }
                          if (value.length < 5 || value.length > 20) {
                            return "Dato demasiado corto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tipoCorteController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Tipos de corte',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Campo requerido";
                          }
                          if (value.length < 5 || value.length > 100) {
                            return "Dato demasiado corto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: bebidaController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Alianza con bebida',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Campo requerido";
                          }
                          if (value.length < 5 || value.length > 50) {
                            return "Dato demasiado corto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: metCoccionController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Métodos de cocción',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Campo requerido";
                          }
                          if (value.length < 5 || value.length > 100) {
                            return "Dato demasiado corto";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: emplatadoController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Tipo de emplatado',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Campo requerido";
                          }
                          if (value.length < 5 || value.length > 50) {
                            return "Dato demasiado corto";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Container 4 boton
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 60,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print('todo bien');
                        }
                        addrecetaComplementaria(
                          nameController.text,
                          rendimientoController.text,
                          tamPorcionController.text,
                          numPorcionController.text,
                          tmpPreparacionController.text,
                          tmpCoccionController.text,
                          tempCoccionController.text,
                          tempServicioController.text,
                          tmpConservacionController.text,
                          tempConservacionController.text,
                          clasificacionController.text,
                          tipoCorteController.text,
                          bebidaController.text,
                          metCoccionController.text,
                          emplatadoController.text,
                        ).then((_) {
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
