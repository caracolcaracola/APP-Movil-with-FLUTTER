import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Informes_Screen extends StatefulWidget {
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Informes'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: InformesSearch(informes),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: informes.length,
        itemBuilder: (context, index) {
          final item = informes[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              title: Text('Profesor: ${item['profesor']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Curso: ${item['curso']}'),
                  Text('Texto: ${item['texto']}'),
                  Text('Fecha: ${item['fecha']}'),
                  Text('ID: ${item['id']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class InformesSearch extends SearchDelegate<String> {
  final List<Map<String, dynamic>> informes;

  InformesSearch(this.informes);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = informes
        .where((item) => item['texto'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return Card(
          margin: EdgeInsets.all(10.0),
          child: ListTile(
            title: Text('Profesor: ${item['profesor']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Curso: ${item['curso']}'),
                Text('Texto: ${item['texto']}'),
                Text('Fecha: ${item['fecha']}'),
                Text('ID: ${item['id']}'),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = informes
        .where((item) => item['texto'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results[index];
        return ListTile(
          title: Text('Texto: ${item['texto']}'),
          onTap: () {
            close(context, item['texto']);
          },
        );
      },
    );
  }
}