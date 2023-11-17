import 'package:appmovil/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'informes_screen.dart';
import 'login.dart';
import 'dart:convert';

class InventarioScreen extends StatefulWidget {
  @override
  _InventarioScreenState createState() => _InventarioScreenState();
}

class _InventarioScreenState extends State<InventarioScreen> {
  List<Map<String, dynamic>> inventario = [];

  @override
  void initState() {
    super.initState();
    obtenerDatosDeInventario();
  }

  Future<void> obtenerDatosDeInventario() async {
    final response =
        await http.get(Uri.parse('http://server_prog2/panolAPP/inventario.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        inventario = data.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Error al obtener los datos de inventario');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inventario'),
        backgroundColor: Color(0xFF393F46),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
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
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: const Text('Inventario'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventarioScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Informes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformesScreen()),
                );
              },
            ),
             SizedBox(height: 70), // Agregar un Divider entre elementos
               ListTile(
              leading: Icon(Icons.person),
              title: const Text('Cerrar sesion'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: inventario.map<Widget>((item) {
            return Card(
              margin: EdgeInsets.all(8.0),
              elevation: 3.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nombre: ${item['herramienta']}',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Cantidad: ${item['cantidad']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Ubicación: ${item['ubicacion']}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
