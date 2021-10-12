import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    cargarData();
  }

  cargarData() {
    rootBundle.loadString('data/menu_opt.json').then((data) {
      print(data);
    });
  }
}

final menuProvider = new _MenuProvider();
