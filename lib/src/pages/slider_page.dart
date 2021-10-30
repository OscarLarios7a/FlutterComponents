import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.00;
  bool _bloquearCheck = false;
  bool _bloquearSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Slider'),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImagen()),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la Imagen',
        //divisions: 20,
        value: _valorSlider,
        min: 10.00,
        max: 400.00,
        onChanged: (_bloquearCheck)? null : (_bloquearSwitch)?  null 
            : (valor) {
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  Widget _crearImagen() {
    return FadeInImage(
      image: const NetworkImage(
          'https://thumbnail.imgbin.com/12/24/14/imgbin-batman-cQSqYMvY3qGUpNnUFvipfJAAB_t.jpg'),
      placeholder: const AssetImage('assets/jar-loading.gif'),
      fadeInDuration: const Duration(milliseconds: 200),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    //?Utilizando un Widget de CheckBox
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearCheck = valor!;
    //       });
    //     },
    // );

    //*?Utlizando el Widget CheckboxListTile
    return CheckboxListTile(
      //tileColor: Colors.amberAccent,
      activeColor: Colors.black54,
      //selectedTileColor: Colors.black54,
      contentPadding: EdgeInsets.all(5.00),
      checkColor: Colors.amber.shade700,
      title: const Text('Bloquear Slider'),
      value: _bloquearCheck,
      onChanged: (valor) {
        setState(() {
          _bloquearCheck = valor!;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      //tileColor: Colors.amberAccent,
      activeColor: Colors.black54,
      //selectedTileColor: Colors.black54,
      contentPadding: EdgeInsets.all(5.00),
      //checkColor: Colors.amber.shade700,
      title: const Text('Bloquear Slider'),
      value: _bloquearSwitch,
      onChanged: (valor) {
        setState(() {
          _bloquearSwitch = valor;
        });
      },
    );
  }
}
