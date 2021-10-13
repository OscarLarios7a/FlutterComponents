
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/providers/menu_provider.dart';
import 'package:componentes/src/utils/icons_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /*Se utilizara un metodo FutureBuilder */
    return FutureBuilder(
      future: menuProvider.cargarData(),
      //initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>?> snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: _listaItems(
                snapshot.data), //se agrega el ! para la cuestion de Null Safety
          );
        }
        return const SizedBox();
      },
    );
  }

  List<Widget> _listaItems(List<dynamic>? data) {
    final List<Widget> opciones = [];

    //for (var element in data!) {
    data!.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIcon(element['icon']),
        trailing: Icon(
          Icons.arrow_right,
          color: Colors.blueGrey.shade900,
        ),
        onTap: () {},
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider(
          color: Colors.green.shade900,
        ));
    });

    return opciones;
  }
}
