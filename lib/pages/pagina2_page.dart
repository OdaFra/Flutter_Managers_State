import 'package:estados/models/usuario.dart';
import 'package:estados/services/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
          title: usuarioService.existeUsuario
              ? Text(usuarioService.usuario.nombre)
              : const Text('Pagina 2')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: const Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(
                    edad: 31,
                    profesiones: [
                      'Mobile Dev',
                      'DevOps',
                      'Kotlin Dev',
                      'Swift Dev'
                    ],
                    nombre: 'Oscar');
                usuarioService.usuario = newUser;
              }),
          MaterialButton(
              child: const Text('Cambiar Edad',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                const edad = 32;
                usuarioService.cambiarEdad(edad);
              }),
          MaterialButton(
              child: const Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                usuarioService.agregarProfesion();
              }),
        ],
      )),
    );
  }
}
