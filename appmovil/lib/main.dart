import 'package:flutter/material.dart';
import 'InventarioScreen.dart';
import 'InformesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pañol App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menú',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Inventario'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InventarioScreen()), // Navega a InventarioScreen
                );
              },
            ),
            ListTile(
              title: Text('Informes'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          InformesScreen()), // Navega a InformesScreen
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Contenido principal de la aplicación'),
      ),
    );
  }
}
