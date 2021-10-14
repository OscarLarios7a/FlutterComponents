import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cards Page',
          )),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[_cardTipo1()],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children:<Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text('Te comento que no procede tu solicitud debido a que ese mismo CERM ya se capturo como entregado por medio del DM el día 28 de septiembre, por lo que el medio ya se esta tomando en cuenta como Entregado.'),
          ),
          //? Se utilizara un Row para el manejo de los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //? Se agrega el Widget TextButton en vez de FlatButton
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.lightBlueAccent,
                  textStyle: TextStyle(fontSize: 15,color: Colors.black ),
                ),
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  primary: Colors.lightBlueAccent,
                  textStyle: TextStyle(fontSize: 15, color: Colors.black),
                ),
                onPressed: () {},
                child: const Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
