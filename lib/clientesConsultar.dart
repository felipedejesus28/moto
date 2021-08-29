import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:motolab/menu.dart';
import 'package:motolab/serviciosAgregar.dart';

import 'clientesAgregar.dart';

final baseDatos = FirebaseFirestore.instance;
List<Map<dynamic, dynamic>> tablaClientes = [];

main() => runApp(ClientesConsultar());

class ClientesConsultar extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      consultarClientes().whenComplete(() {
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Clientes"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(Icons.search),
              )
            ],
          ),
          drawer: menuIzquierdo(context),
          body: FutureBuilder(
            future: consultarClientes(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done)
                return listarClientes(context);
              else
                return Center(child: CircularProgressIndicator());
            },
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
//              Navigator.pushNamed(context, '/clientesAgregar');
                Navigator.pushNamed(context, '/clientesAgregar', arguments: {"telefono": "5513"});
              },
              child: Icon(Icons.add)),
        ),
      );
}

// REVISAR CONSULTA DE DATOS
// https://firebase.google.com/docs/firestore/query-data/get-data

Future consultarClientes() async {
  tablaClientes.clear();
  try {
    await baseDatos.collection('clientes').get().then((instantanea) {
      instantanea.docs.forEach((element) {
        tablaClientes.add(element.data());
        print(element.data()['nombreCompleto']);
      });
    });
  } catch (error) {
    print(error);
  }
  return tablaClientes;
}

Widget listarClientes(BuildContext context) {
  return ListView.builder(
      itemCount: tablaClientes.length,
      itemBuilder: (context, i) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text(
                  tablaClientes[i]['nombreCompleto'][0],
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              title: Text(tablaClientes[i]['nombreCompleto']),
              subtitle: Text(tablaClientes[i]['Email']),
              trailing: Icon(Icons.phone_rounded),
              onTap: () {
               // SI FUNCIONA
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiciosAgregar(),
                ));
              },
              onLongPress: () {
                print("Tap long");
              },
            ),
            Divider(),
          ],
        );
      });
}
