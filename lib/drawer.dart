import 'package:flutter/material.dart';

var menuIzquierdo = Drawer(
  child: ListView(
    children: [

      UserAccountsDrawerHeader(
        accountName: Text("Usuario"),
        accountEmail: Text("mecanico@gmail.com"),
//  currentAccountPicture: CircleAvatar(radius: 5,
//  backgroundImage: AssetImage("imagenes/logo/logo.png"),
// ),
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
)