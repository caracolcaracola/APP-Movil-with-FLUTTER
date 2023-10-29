import 'package:flutter/material.dart';

class InformesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> reportWidgets = [];

    for (int i = 0; i < 56; i++) {
      // Agregar un Padding en la parte superior para cada elemento
      EdgeInsets padding = EdgeInsets.only(top: i > 0 ? 20.0 : 0.0);

      Widget reportWidget = Padding(
        padding: padding,
        child: Container(
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
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Curso: 7°2°',
                style: TextStyle(
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Fecha: 26-10-2023',
                style: TextStyle(
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                style: TextStyle(
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      );

      reportWidgets.add(reportWidget);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inventario'),
      ),
      body: ListView(
        children: reportWidgets,
      ),
    );
  }
}
