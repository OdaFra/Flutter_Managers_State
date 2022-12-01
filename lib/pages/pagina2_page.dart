import 'package:estados/controllers/usuario_controllers.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    final usuarioCtrl = Get.find<UsuarioController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cargarUsuario(Usuario(nombre: 'Oscar', edad: 31));
                Get.snackbar('Usuario agregado', 'Oscar es el usuario definido',
                    backgroundColor: Colors.white,
                    boxShadows: [
                      const BoxShadow(color: Colors.black38, blurRadius: 10)
                    ]);
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(32);
              }),
          MaterialButton(
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion(
                    'Dev Profesiones ${usuarioCtrl.profesionesCount + 1}');
              }),
          MaterialButton(
              child: const Text('Cambiar Tema',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                //usuarioCtrl.toggleDarkMode();
                // Get.changeTheme(
                //     Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
              }),
        ],
      )),
    );
  }
}
