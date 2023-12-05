import 'package:flutter/material.dart';
import 'package:kobe_flutter/pages/Recetas/Firebase/firebase_services.dart';

class EditRecetaEstandar extends StatefulWidget {
  const EditRecetaEstandar({super.key});

  @override
  State<EditRecetaEstandar> createState() => _EditRecetaEstandarState();
}

class _EditRecetaEstandarState extends State<EditRecetaEstandar> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController tipoRecetaController = TextEditingController(text: '');
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
            title: const Text('Receta Estandar'),
            centerTitle: true,
          ),

          //Container 1
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 1100,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 10.0),
                      Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 20,
                                  color: Colors.black26,
                                  offset: Offset(0, 20),
                                ),
                              ],
                            ),
                            child: Image.network(
                              'https://images.ctfassets.net/awb1we50v0om/2Spf80TME2zIhLqsi3Zxv9/919421a45f3260ee426c99c35235f1c8/Plates03__3__copy3.jpg',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          labelText: 'Nombre de la receta',
                          prefixIcon: Icon(Icons.sticky_note_2_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: rendimientoController,
                        decoration: const InputDecoration(
                          labelText: 'Rendimiento',
                          prefixIcon: Icon(Icons.sticky_note_2_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tamPorcionController,
                        decoration: const InputDecoration(
                          labelText: 'Tamaño de porción',
                          prefixIcon: Icon(Icons.add_box_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: numPorcionController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          labelText: 'Numero de porción',
                          prefixIcon: Icon(Icons.numbers_rounded),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orange),
                        child: const Text(
                          'Tiempo de preparación',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '00',
                                        counterText: ''),
                                  ))),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(':'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  maxLength: 2,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '00',
                                      counterText: ''),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(':'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '00',
                                    counterText: ''),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.orange),
                        child: const Text(
                          'Tiempo de cocción',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                                  //color: Colors.green,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: TextFormField(
                                    textAlign: TextAlign.center,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: '00',
                                        counterText: ''),
                                  ))),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(':'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  maxLength: 2,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '00',
                                      counterText: ''),
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(':'),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '00',
                                    counterText: ''),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tempCoccionController,
                        decoration: const InputDecoration(
                          labelText: 'Temperatura de cocción',
                          prefixIcon: Icon(Icons.thermostat_sharp),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tempServicioController,
                        decoration: const InputDecoration(
                          labelText: 'Temperatura de servicio',
                          prefixIcon: Icon(Icons.thermostat),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tmpConservacionController,
                        decoration: const InputDecoration(
                          labelText: 'Tiempo de conservación',
                          prefixIcon: Icon(Icons.timer),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tempConservacionController,
                        decoration: const InputDecoration(
                          labelText: 'Temperatura de conservación',
                          prefixIcon: Icon(Icons.thermostat_sharp),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
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
                        decoration: const InputDecoration(
                          labelText: 'Clasificación',
                          prefixIcon: Icon(Icons.class_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: tipoCorteController,
                        decoration: const InputDecoration(
                          labelText: 'Tipos de corte',
                          prefixIcon: Icon(Icons.soup_kitchen_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: bebidaController,
                        decoration: const InputDecoration(
                          labelText: 'Alianza con bebida',
                          prefixIcon: Icon(Icons.assignment_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: metCoccionController,
                        decoration: const InputDecoration(
                          labelText: 'Métodos de cocción',
                          prefixIcon: Icon(Icons.soup_kitchen_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        controller: emplatadoController,
                        decoration: const InputDecoration(
                          labelText: 'Tipo de emplatado',
                          prefixIcon: Icon(Icons.timer),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //Container 3
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 290,
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: porcionController,
                        decoration: const InputDecoration(
                          labelText: 'Porción',
                          prefixIcon: Icon(Icons.verified_user_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              //color: Colors.green,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: caloriasController,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Calorías',
                                    counterText: ''),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: lipidosController,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Lípidos',
                                    counterText: ''),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              //color: Colors.green,
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12)),
                              child: TextFormField(
                                controller: carbohidratosController,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Carbohidratos',
                                    counterText: ''),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: Container()),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            await addrecetaEstandar(
                                    nameController.text,
                                    tipoRecetaController.text,
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
                                    porcionController.text,
                                    caloriasController.text,
                                    lipidosController.text,
                                    carbohidratosController.text,
                                    proteinaController.text)
                                .then((_) {
                              Navigator.pop(context);
                            });
                          },
                          child: const Text('Guardar'),
                        ),
                      ),
                    ],
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
