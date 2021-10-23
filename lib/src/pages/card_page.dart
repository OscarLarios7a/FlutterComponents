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
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
         _cardTipo2(),
         SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
           _cardTipo1(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
         ],
      ),
    );
  }

  //* Metodo para el primer tipo de tarjeta a ocupar
  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo de la tarjeta'),
            subtitle: Text(
                'Te comento que no procede tu solicitud debido a que ese mismo CERM ya se capturo como entregado por medio del DM el día 28 de septiembre, por lo que el medio ya se esta tomando en cuenta como Entregado.'),
          ),
          //? Se utilizara un Row para el manejo de los botones
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //? Se agrega el Widget TextButton en vez de FlatButton
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                // style: TextButton.styleFrom(
                //   padding: const EdgeInsets.all(16.0),
                //   //primary: Colors.lightBlueAccent,
                //   textStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // ),
                onPressed: () {},
                child: const Text('Cancelar'),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                // style: TextButton.styleFrom(
                //   padding: const EdgeInsets.all(16.0),
                //   primary: Colors.lightBlueAccent,
                //   textStyle: const TextStyle(fontSize: 15, color: Colors.black),
                // ),
                onPressed: () {},
                child: const Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }

//* Metodo para el segundo tipo de tarjeta a ocupar
  Widget _cardTipo2() {
    //*Se creo una variable para el manejo de la tarjeta
    final card = Container(
      //clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(
                'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.00,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1.jpg'),
          //   ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('No se que traigo aqui'),
          ),
        ],
      ),
    );
    //?Aqui retorno la variable dentro  container
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[ 
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0,10.0)
          )
        ]
        ),
      child:ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
