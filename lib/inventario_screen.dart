import 'package:flutter/material.dart';

class InventarioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inventario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Ajusta el padding según tus necesidades
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width, // Establecer el ancho al ancho de la pantalla
            child: DataTable(
              headingRowColor: MaterialStateColor.resolveWith((states) {
                return Color(0xFF393F46); // RGB(57, 63, 70)
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
              rows: const <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Producto 1')),
                    DataCell(Text('10')),
                    DataCell(Text('Ubicación A')),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('Producto 2')),
                    DataCell(Text('5')),
                    DataCell(Text('Ubicación B')),
                  ],
                ),
                // Puedes agregar más filas según sea necesario
              ],
            ),
          ),
        ),
      ),
    );
  }
}
