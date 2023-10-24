import 'package:flutter/material.dart';
import 'Inventario_screen.dart';
import 'Informes_screen.dart';

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

      // Menu "Hamburgesa"
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
              title: const Text('Inventario'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InventarioScreen(), // Navega a InventarioScreen
                  ),
                );
              },
            ),

            ListTile(
              title: const Text('Informes'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InformesScreen(), // Navega a InformesScreen
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // Fin de Menu "Hamburgesa"

      body: 
      
      // Inicio "Bienvenido al Pañol"
      Column(
        children: <Widget>[
         const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Bienvenido al pañol",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          //Fin de "Bienvenido al Pañol"



          //Inicio Buscador
          /* Estilos de la "caja" */
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
              
              /* Estilos dentro de la caja*/ 
              child: Row(
                children: <Widget>[
                 const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(15.0),
                      ),
                    ),
                  ),

                  /* Estilos y logica del boton "Buscar" */
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Agrega aquí la lógica para realizar la búsqueda.
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
