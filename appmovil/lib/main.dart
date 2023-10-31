import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'inventario_screen.dart';
import 'informes_screen.dart';
import 'login.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _searchController = TextEditingController();

  List<Widget> _herramientasWidgets = [];

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
              title: const Text('Inicio de sesion'),
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
            ListTile(
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
              title: Text('Informes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InformesScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () async {
                      final String searchTerm = _searchController.text;

                      final response = await http.post(
                        Uri.parse('http://localhost/flutter/buscar_herramienta.php'),
                        body: {'nombre_herramienta': searchTerm},
                      );

                      if (response.statusCode == 200) {
                        final List<dynamic> data = json.decode(response.body);
                        setState(() {
                          if (data.isNotEmpty) {
                            _herramientasWidgets = data.map((herramienta) {
                              return Column(
                                children: [
                                  Text('Herramienta: ${herramienta['herramienta']}'),
                                  Text('Cantidad: ${herramienta['cantidad']}'),
                                  Text('Ubicación: ${herramienta['ubicacion']}'),
                                  Divider(), // Separador visual entre las herramientas
                                ],
                              );
                            }).toList();

                            // Imprime los nombres de las herramientas en la terminal
                            for (var herramienta in data) {
                              print('Herramienta: ${herramienta['herramienta']}, Cantidad: ${herramienta['cantidad']}, Ubicación: ${herramienta['ubicacion']}');
                            }
                          } else {
                            _herramientasWidgets = []; // Limpia la lista si no hay resultados
                          }
                        });
                      }else {
                        throw Exception('Error al obtener los datos de inventario');
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _herramientasWidgets,
            ),
          ),
        ],
      ),
    );
  }
}
