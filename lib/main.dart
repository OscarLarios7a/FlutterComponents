import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/home_page.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Compontes App',
      //home: HomePage(),
      initialRoute: '/',
      routes: <String,WidgetBuilder>{
        '/':(BuildContext context)=>const HomePage(),
        'alert': (BuildContext context) => const AlertPage(),
        'avatar': (BuildContext context) => const AvatarPage(),

      },
    );
  }
}
