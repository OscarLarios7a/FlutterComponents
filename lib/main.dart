import 'package:flutter/material.dart';

import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es','ES'),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Compontes App',
      //home: HomePage(),
      initialRoute: '/',
      routes: getAppRoutes(),
      //! Manejo de Rutas Dinamicas
      onGenerateRoute: (settings) {
        print('Ruta Llamada:${settings.name}');
        return MaterialPageRoute(builder: (context) => AlertPage());
      },
    );
  }
}
