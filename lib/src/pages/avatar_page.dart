import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Icon(Icons.person_pin, color: Colors.cyanAccent.shade700),
        centerTitle: true,
        title: Text('Avatar Page'),
        actions: <Widget>[
          //?Se agrega otro container para el anejo del icono del Avatar

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://dam.smashmexico.com.mx/wp-content/uploads/2019/12/THANOS.jpg'),
              radius: 25.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.green.shade800,
            ),
          ),
        ],
      ),
      body: ListView(
         padding: EdgeInsets.all(10.0),
          children: <Widget>[
            _avatarImagen(),
          ],
      ) 
        
    );
  }
}

//* Metodo para ver la imagen
Widget _avatarImagen() {
  //*Se creo una variable para el manejo de la tarjeta
  final card = Container(
    child: Column(
      children: <Widget>[
        FadeInImage(
          image: NetworkImage(
              'https://i0.wp.com/wipy.tv/wp-content/uploads/2019/12/Thanos.jpg'),
          placeholder: AssetImage('assets/jar-loading.gif'),
          fadeInDuration: Duration(milliseconds: 200),
          height: 300.00,
          fit: BoxFit.cover,
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
              offset: Offset(2.0, 10.0))
        ]),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: card,
    ),
  );
}

// Center(
//         child: Container(
//           decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30.0),
//                 color: Colors.white,
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 5.0,
//                       spreadRadius: 2.0,
//                       offset: Offset(2.0, 10.0))
//                 ]

//           ),

//           child: FadeInImage(
//           placeholder: AssetImage('assets/jar-loading.gif'),
//           image: NetworkImage('https://i0.wp.com/wipy.tv/wp-content/uploads/2019/12/Thanos.jpg?fit=1000%2C600&ssl=1'),
//           fadeInDuration: Duration(milliseconds: 200),
//           ),
//         ),
//       )
