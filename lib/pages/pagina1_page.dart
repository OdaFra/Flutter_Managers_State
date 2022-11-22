import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  const Pagina1Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
              onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: const _BodyScaffold(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.accessibility_new),
          onPressed: () => Navigator.pushNamed(context, 'pagina2')),
    );
  }
}

class _BodyScaffold extends StatelessWidget {
  const _BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case UsuarioInitialState:
            return const Center(child: Text('No hay información del usuario'));
          case UsuarioActivoState:
            return InformacionUsuario(
                usuario: (state as UsuarioActivoState).usuario);
          default:
            return const Center(child: Text("Estado no encontrado"));
        }
        //   if (state is UsuarioInitialState) {
        //     return const Center(
        //       child: Text('No hay información del usuario'),
        //     );
        //   }
        //   if (state is UsuarioActivoState) {
        //     return InformacionUsuario(
        //       usuario: state.usuario,
        //     );
        //   }
        //   return const Center(child: Text("Estado no encontrado"));
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  const InformacionUsuario({Key? key, required this.usuario}) : super(key: key);

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
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad:${usuario.edad} ')),
          const Text('Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const Divider(),
          ...usuario.profesiones!
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
