import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class InformesScreen extends StatefulWidget {
  @override
  _InformesScreenState createState() => _InformesScreenState();
}

class _InformesScreenState extends State<InformesScreen> {
  List<Map<String, dynamic>> informes = [];

  @override
  void initState() {
    super.initState();
    obtenerDatosDeInformes();
  }

  Future<void> obtenerDatosDeInformes() async {
    final response = await http.get(Uri.parse('http://localhost/flutter/informes.php'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        informes = data.cast<Map<String, dynamic>>();
      });
    } else {
      throw Exception('Error al obtener los datos de informes');
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> reportWidgets = [];

    for (int i = 0; i < informes.length; i++) {
      EdgeInsets padding = EdgeInsets.only(top: i > 0 ? 20.0 : 0.0);
      final item = informes[i];

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profesor: ${item['profesor']}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Curso: ${item['curso']}',
                style: TextStyle(
                  color: Color.fromARGB(255, 41, 41, 41),
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Fecha: ${item['fecha']}',
                style: TextStyle(
                  color: Color.fromARGB(255, 51, 51, 51),
                  fontSize: 11,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Texto: ${item['texto']}',
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
        title: Text('Pantalla de Informes'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 20.0), // Añade un espacio antes del primer informe
          ...reportWidgets,
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InformesScreen(),
  ));
}
