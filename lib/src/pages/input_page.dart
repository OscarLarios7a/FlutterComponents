import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _Nombre = '';
  String _Email =''; //*Declaracion de una variable para manipular los datos que se mostraran mas adelante
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      style: TextStyle(
        color: Colors.red.shade800,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent.shade700,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent.shade700,
          ),
        ),
        counter: Text('Letras No. ${_Nombre.length} '),
        hintText:
            'Nombre Personal', //* este funciona como la propiedad Placeholder
        //labelText: 'Nombre',
        helperText: 'Solo es el Nombre',
        suffixIcon: Icon(
            Icons.accessibility), //* Icono dentro de la caja de texto (Input),
        icon: Icon(Icons.account_circle, color: Colors.indigo),
      ),
      onChanged: (valor) {
        setState(() {
          _Nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_Nombre'),
      
    );
  }

  Widget _crearEmail() {
    return TextField(
      //textCapitalization: TextCapitalization.sentences,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.red.shade800,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent.shade700,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.greenAccent.shade700,
          ),
        ),
        //counter: Text('Letras No. ${_Nombre.length} '),
        hintText: 'Email', //* este funciona como la propiedad Placeholder
        labelText: 'Email',
        //helperText: 'Solo es el Nombre',
        suffixIcon: Icon(Icons
            .alternate_email), //* Icono dentro de la caja de texto (Input),
        icon: Icon(Icons.email, color: Colors.indigo),
      ),
      onChanged: (valor) {
        setState(() {
          _Nombre = valor;
        });
      },
    );
  }
}
