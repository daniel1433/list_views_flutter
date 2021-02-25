import 'package:flutter/material.dart';

import 'package:second_app/src/providers/menu_provider.dart';
import 'package:second_app/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  final lista = [
    {"title": "uno", "sub": "subtitulo"},
    {"title": "dos", "sub": "subtitulo"},
    {"title": "tres", "sub": "subtitulo"},
    {"title": "cuatro", "sub": "subtitulo"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba"),
        centerTitle: true,
      ),
      body: createItems3(),
    );
  }

  List<Widget> createItems() {
    List<Widget> list = new List<Widget>();

    // for (String item in lista) {
    //   list.add(Column(
    //     children: [ListTile(title: Text('$item')), Divider()],
    //   ));
    // }

    for (dynamic item in lista) {
      final tempWdg = ListTile(title: Text(item["title"]));

      list..add(tempWdg)..add(Divider());
    }

    return list;
  }

  List<Widget> createItems2() {
    print(menuProvider.options);

    return lista
        .map((val) => Column(
              children: [
                ListTile(
                  title: Text(val["title"]),
                  subtitle: Text(val["sub"]),
                  leading: Icon(Icons.access_alarm),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }

  Widget createItems3() {
    // No es valida esta forma porque la aplicación se quedaría como congelada mietras carga
    // menuProvider.cargarData().then((items) {
    //   print('_lista');
    //   print(items);
    // });

    return FutureBuilder(
      // Recibe una función que retorne un future y es de donde provienen nuestros datos
      future: menuProvider.cargarData(),
      // Hace referencia al valor inicial del elemento y se carga con una lista vacia o con un loading
      initialData: [],

      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: listOrder(snapshot.data),
        );
      },
    );
  }

  List<Widget> listOrder(List<dynamic> data) {
    return data.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item["text"]),
            leading: getIcon(item["icon"]),
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
