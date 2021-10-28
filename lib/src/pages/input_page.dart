//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _Nombre = ' ';
  String _Email = ' ';
  String _Password =
      ' '; //*Declaracion de una variable para manipular los datos que se mostraran mas adelante
  String _fecha = ' ';

  TextEditingController _inputFieldDateController = new TextEditingController();

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
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearFechaDos(),
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
        suffixIcon: const Icon(
            Icons.accessibility), //* Icono dentro de la caja de texto (Input),
        icon: const Icon(Icons.account_circle, color: Colors.indigo),
      ),
      onChanged: (valor) {
        setState(() {
          _Nombre = valor;
        });
      },
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
          hintText: 'Password', //* este funciona como la propiedad Placeholder
          labelText: 'Password',
          //helperText: 'Solo es el Nombre',
          suffixIcon: Icon(Icons
              .alternate_email), //* Icono dentro de la caja de texto (Input),
          icon: Icon(Icons.email, color: Colors.indigo),
        ),
        onChanged: (valor) => setState(() {
              _Email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
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
          suffixIcon: Icon(
              Icons.lock_open), //* Icono dentro de la caja de texto (Input),
          icon: Icon(Icons.lock, color: Colors.indigo),
        ),
        onChanged: (valor) => setState(() {
              _Password = valor;
            }));
  }

  Widget _crearFecha() {
    return DatePickerWidget(
        initialDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: -1)),
        firstDate: DateTime.now().add(Duration(days: -(365 * 100))),
        dateFormat: "dd-MM-yyyy",
        locale: DatePicker.localeFromString("ES"),
        pickerTheme: DateTimePickerTheme(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            dividerColor: Theme.of(context).primaryColor));
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_Nombre'),
      subtitle: Text('Email: $_Email'),
    );
  }

//? Este es el metodo Original  de acuerdo al curso

  Widget _crearFechaDos() {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
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
        hintText:
            'Fecha de Nacimiento ', //* este funciona como la propiedad Placeholder
        labelText: 'Fecha de Nacimiento',
        suffixIcon: Icon(Icons
            .perm_contact_calendar), //* Icono dentro de la caja de texto (Input),
        icon: Icon(Icons.calendar_today, color: Colors.indigo),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }
}
