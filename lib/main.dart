import 'package:app_pelis_1/main_pantallas.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PelisApp',
      //Tema
      //Segun el tema del celular se adapta al modo oscuro o claro
      theme: ThemeData(
        primaryColor: Colors.orange[400],
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      darkTheme: ThemeData(
        primaryColor: Colors.orange[400],
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: MainPantallas(),
    );
  }
}
