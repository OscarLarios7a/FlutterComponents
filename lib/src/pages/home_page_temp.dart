import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //?Creando un arreglo de opciones
  final opciones = [
    'Uno',
    'Dos',
    'Tres',
    'Cuatro',
    'Cinco',
    'Seis',
    'Siete',
    'Ocho',
    'Nueve',
    'Diez'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Componentes Temp'),
      ),
      /*body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider(
            height: 10.0,
            color: Colors.blueGrey.shade400,
          ),
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider(
            height: 2.0,
            color: Colors.blueGrey.shade400,
          ),
          ListTile(
            title: Text('ListTile Title'),
          ),
        ],
      ),*/
      body: ListView(
        //children: _crearItems(), //?Metodo 1
        children: _crearItemsCorta(), //? Metodo 2
      ), //! metodo para cargar los Items
    );
  }

  //* Metodo para crear los Items
  List<Widget> _crearItems() {
    List<Widget> lista = <Widget>[];
    for (String opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista
        ..add(tempWidget)
        ..add(Divider(
          height: 30.0,
          color: Colors.blueGrey.shade400,
        ));
    }

    return lista;
  }

  //*Metodo 2 para Crear los Item utilizando map y ListTile
  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Cualquier Cosa'),
            leading: Icon(Icons.account_balance_wallet_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(
            color: Colors.orange.shade400,
          ),
        ],
      );
    }).toList();
  }
}
