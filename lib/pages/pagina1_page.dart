import 'package:estados/controllers/usuario_controllers.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCtl = Get.put(UsuarioController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
      ),
      body: Obx(
        () => usuarioCtl.existeUsuario.value
            ? InformacionUsuario(
                usuario: usuarioCtl.usuario.value,
              )
            : const NoInformacion(),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Get.toNamed('/pagina2',
              arguments: {'nombre': 'Oscar', 'edad': 31})

          // => Navigator.pushNamed(context, 'pagina2')
          ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);
  final Usuario usuario;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ListTile(title: Text('Nombre:${usuario.nombre} ')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion))),
        ],
      ),
    );
  }
}

class NoInformacion extends StatelessWidget {
  const NoInformacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No existe Usuario'));
  }
}
