import 'package:flutter/material.dart';

//creacion de una variable final  para no manejar los iconos

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large" : Icons.donut_large,
};

//Creo mi metodo de getIcon para la manipulacion de los iconos
Icon getIcon(String nameIcon) {
  return Icon(
    _icons[nameIcon],
    color: Colors.red.shade400,
  );
}
