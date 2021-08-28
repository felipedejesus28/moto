import 'package:flutter/material.dart';

Widget menuIzquierdo(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text("My myyyy"),
          accountEmail: Text("fernandovazquez@gmail.com"),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("imagenes/motos/rossi.png")),
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
              )),
        ),
        ListTile(
          leading: Icon(Icons.people),
          title: const Text('Clientes'),
          onTap: () {
            Navigator.pushNamed(context, 'clientesConsultar');
          },
        ),
        Divider(),
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
