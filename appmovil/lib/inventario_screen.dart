import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
    final response = await http.get(Uri.parse('http://localhost/flutter/inventario.php'));

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
    List<DataRow> rows = [];

    for (int i = 0; i < inventario.length; i++) {
      final item = inventario[i];

      DataRow row = DataRow(
        cells: <DataCell>[
          DataCell(Text(item['herramienta'])),
          DataCell(Text(item['cantidad'].toString())),
          DataCell(Text(item['ubicacion'])),
        ],
      );

      rows.add(row);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inventario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith((states) {
                return Color(0xFF393F46);
              }),
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Nombre',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Cantidad',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Ubicación',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              rows: rows,
            ),
          ),
        ),
      ),
    );
  }
}
