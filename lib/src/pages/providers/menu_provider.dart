import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

//? se hace que la clase sea Privada por ello se añade el guion Bajo "_"
class _MenuProvider {
  List<dynamic> opciones = [];

  //*Creo mi constructor
  _MenuProvider() {
    //cargarData();  Se quita este metodo en el constructor por que se ocupara  el propio metod de Future
  }

  //*Creo mi metodo para cardar el Json
  /* cargarData() {
    rootBundle.loadString('data/menu_opts.json').then((data) {
      //print(data);
      Map dataMap = json.decode(data);
      print(dataMap['rutas']);
      opciones = dataMap['rutas'];
    });
  }*/
//cARGO DE NUEVO MI METODO PERO AGREGANDO  EL METODO ASYNC Y AWAIT

Future<List<dynamic>>  cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

final menuProvider = _MenuProvider();
