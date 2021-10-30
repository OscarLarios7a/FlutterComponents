//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //*Declaracion de una variable para manipular los datos que se mostraran mas adelante
  // ignore: non_constant_identifier_names
  String _Nombre = ' ';
  // ignore: non_constant_identifier_names
  String _Email = ' ';
  // ignore: non_constant_identifier_names, unused_field
  String _Password = '';
  String _fecha = ' ';
  //! Variable en la cual estara como default para que muestre en el DropDown
  String _opcionSeleccionada = 'Volar';
  //! Variable en la cual estara en el listado del DropdownMenuItems
  final List<String> _poderes = [
    'Volar',
    'Rayos X',
    'Super Aliento',
    'Super Fuerza',
    'Rayos Laser'
  ];

  final TextEditingController? _inputFieldDateController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Inputs de Texto'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearFecha(),
          const Divider(),
          _crearFechaDos(context),
          const Divider(),
          _crearDropDownMenu(),
          const Divider(),
          _crearPersona(),
        ],
      ),
    );
  }

//? Metodo para el manejo de Inputs
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

//? Metodo para el manejo de Inputs de Email
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
        onChanged: (valor) => setState(() {
              _Email = valor;
            }));
  }

//? Metodo para el manejo de Inputs de Password
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
          hintText: 'Password', //* este funciona como la propiedad Placeholder
          labelText: 'Password',
          //helperText: 'Solo es el Nombre',
          suffixIcon: Icon(
              Icons.lock_open), //* Icono dentro de la caja de texto (Input),
          icon: Icon(Icons.lock, color: Colors.indigo),
        ),
        onChanged: (valor) => setState(() {
              _Password = valor;
            }));
  }

//? Metodo para el manejo de Inputs de crear Fecha con una libreria de DatePickerWidget
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

//? Metodo para el manejo de Inputs que muestra los datos que se ingresa en inputoNombre y Inputo Email
  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_Nombre'),
      subtitle: Text('Email: $_Email'),
      trailing: Text('$_opcionSeleccionada'),
    );
  }

//? Este es el metodo Original  de acuerdo al curso de Fernando Herrera
  Widget _crearFechaDos(BuildContext context) {
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
        suffixIcon: const Icon(Icons
            .perm_contact_calendar), //* Icono dentro de la caja de texto (Input),
        icon: const Icon(Icons.calendar_today, color: Colors.indigo),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

//? Metodo para el manejo en el input mostrando otra ventana
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
      locale: const Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController!.text = _fecha;
      });
    }
  }

//? no funciona la creacion de la lista de elementos en el metodo
  // List<DropdownMenuItem<String>> getOpcionesDropDown(
  //     List<DropdownMenuItem<String>> _lista, List<String> poderes) {
  //   for (String element in _poderes) {
  //     _lista.add(DropdownMenuItem(
  //       child: Text(element),
  //       value: element,
  //     ));
  //   }
  //   return _lista;
  // }
  //? no funciona y no se como arreglarlo hay que checar a detalle y preguntar en grupos
  // Widget _crearDropDownMenu() {
  //   return DropdownButton(
  //     items: getOpcionesDropDown(List<String> _poderes,),
  //     onChanged: (opt) {
  //       // ignore: avoid_print
  //       print(opt);
  //     },
  //   );
  // }

//? Nuevo metodo para el manejo del Menu desplagable
  Widget _crearDropDownMenu() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all, color:  Colors.indigo,),
        const SizedBox(width: 30.0,),
        Expanded(
          child: DropdownButton(
            focusColor: Colors.black  ,
            dropdownColor: Colors.black54 ,
            //selectedItemBuilder: Colors.blue,
            //?rellenamos la Lista de Opciones a mostrar en el desplegado
            items: _poderes.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(value: value, child: Text(value));
            }).toList(),
            //? Personalizacion de la Vista del Desplegado
            borderRadius:BorderRadius.circular(20.0) ,
            iconSize: 15,
            elevation: 16,
            underline: Container(
              height: 3,
              color: Colors.blue.shade500,
            ),
            style: TextStyle(color:Colors.greenAccent.shade700,),
            //? Actualizar el valor de la _opcionSeleccionada
            value: _opcionSeleccionada,
            onChanged: (String? valueIn) {
              setState(() {
                _opcionSeleccionada = valueIn!;
              });
            },
          ),
        ),
      ],
    );
  }
}
