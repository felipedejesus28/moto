import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motolab/drawer.dart';

final bd = FirebaseFirestore.instance;

main() {
  runApp(ClientesConsultar());
}

class ClientesConsultar extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
      consultar();
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: Text("Clientes Consultar"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(Icons.search),
              )
            ],
          ),

          
          /*
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("Usuario"),
                  accountEmail: Text("mecanico@gmail.com"),
                    currentAccountPicture: CircleAvatar(radius: 5,
                    backgroundImage: AssetImage("imagenes/logo/logo.png"),
                   ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("imagenes/motos/rossi.png")),
                      gradient: RadialGradient(
                        colors: [Colors.blue, Colors.black],
                      )),
                ),
                ListTile(
                  selectedTileColor: Colors.green,
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
          ),
          */

          drawer: menuIzquierdo(context),  

          body: crearListado(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, 'clientesAgregar');
              },
              child: Icon(Icons.add)),
        ),
      );
}

void insertar() async {
  try {
    // await bd.collection("clientes").doc("gulf790205").set({
    //   'nombre': 'Roberto',
    // });

    await bd
        .collection("clientes")
        .doc("gulf790205")
        .collection('servicios')
        .doc('25-ago-2021')
        .set({
      'tipo': 'Garantía',
    });
  } catch (error) {
    print(error);
  }
}

void eliminar() async {
  try {
    await bd.collection('clientes').doc('gulf790205').delete();
  } catch (error) {
    print(error);
  }
}

void actualizar() async {
  try {
    await bd
        .collection('clientes')
        .doc('gulf790205')
        .update({'Nombre': 'Oscar', 'Mensaje': 'Qué hay de nuevo'});
  } catch (error) {
    print(error);
  }
}

void consultar() async {
  try {
    await bd.collection('clientes').get().then((instantanea) {
      instantanea.docs.forEach((element) {
        print(element.data());
      });
    });
  } catch (error) {
    print(error);
  }
}

ListView crearListado() {
  return ListView(
    children: [
      ListTile(
        title: Text("Felipe"),
        subtitle: Text("55 13 89 87 68"),
      )
    ],
  );
}
