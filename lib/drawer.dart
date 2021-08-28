import 'package:flutter/material.dart';

Widget menuIzquierdo(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("Felipao"),
          accountEmail: Text("felipe@gmail.com"),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("imagenes/motos/rossi.png")),
              gradient: RadialGradient(
                colors: [Colors.blue, Colors.black54],
              )),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: const Text('Clientes'),
          onTap: () {
            Navigator.pushNamed(context, 'clientesConsultar');
          },
        ),
        ListTile(
          leading: Icon(Icons.motorcycle),
          title: const Text('Servicios'),
          onTap: () {
            Navigator.pushNamed(context, 'serviciosConsultar');
          },
        ),
      ],
    ),
  );
}
