import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  //?Se agregaran propiedades para la manipulacion del contenedor
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blueGrey;

  //? se agrega esta propiedad para el borde cirular del contenedor
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contenedor Animado'),
      ),
      body: Center(
        child: AnimatedContainer( //?se cambio el Container por AnimatedContainer, ya que se utilizaran las propiedades de duration y curve para animar dicho contenedor
        
          width: _width,
          height: _height,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(seconds: 1), // para el manejo de la duracion de la animacion
          decoration: BoxDecoration(
            color: _color,
            borderRadius: _borderRadius,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _cambiarForma();
        },
      ),
    );
  }

  void _cambiarForma() {
    //*Creando un objeto para el manejo aleatorio de las propiedades del contenedor
    final rand = Random();

    setState(() {
      _width = rand.nextInt(300).toDouble();
      _height = rand.nextInt(300).toDouble();
      _color = Color.fromRGBO(
          rand.nextInt(255), rand.nextInt(255), rand.nextInt(255), 1);
        BorderRadiusGeometry _borderRadius = BorderRadius.circular(rand.nextInt(100).toDouble());
    });
  }
}
