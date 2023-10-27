import 'package:flutter/material.dart';

class InformesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inventario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              
              width: 600,
              padding: const EdgeInsets.all(6.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profesor: Andrea Insaurralde',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold, // Negrita
                    ),
                  ),
                  SizedBox(height: 6), // Espacio entre textos
                  Text(
                    'Curso: 7°2°',
                    style: TextStyle(
                      color: Color.fromARGB(255, 41, 41, 41),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 6), // Espacio entre textos
                  Text(
                    'Fecha: 26-10-2023',
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(height: 8), // Espacio entre textos
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed quis tortor vitae elit accumsan commodo. Ut lacinia semper mauris, in euismod mauris lacinia id. Suspendisse at urna id tortor laoreet vestibulum. Vestibulum euismod venenatis dolor ut facilisis. Duis non vestibulum urna. Vivamus ac erat id dui vestibulum lacinia ac a velit. Quisque ullamcorper consectetur fermentum. Vestibulum pharetra dui eu tortor lacinia, eu vestibulum nulla elementum. ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 51, 51),
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 23), // Espacio entre los contenedores
            
            // Los siguientes contenedores están igual que el primero, solo cambia el texto
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 170,
              width: 600,
              padding: const EdgeInsets.all(6.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profesor',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Profesor',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 23),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: 170,
              width: 600,
              padding: const EdgeInsets.all(6.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Profesor',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Profesor',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
