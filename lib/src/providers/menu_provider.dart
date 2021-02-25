import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    // cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    String data = await rootBundle.loadString('data/menu_opts.json');
    Map jsonData = json.decode(data);
    this.options = jsonData["rutas"];
    return this.options;
  }
}

final menuProvider = new _MenuProvider();
