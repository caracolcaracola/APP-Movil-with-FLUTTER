import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Inventario'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Mis pedidos'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Cuenta'),
            onTap: () => null,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
              title: Text('Exit'),
              leading: Icon(Icons.exit_to_app),
              onTap: () => null,
            ),
          )
        ],
      ),
    );
  }
}
