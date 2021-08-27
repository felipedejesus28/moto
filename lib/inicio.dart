import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

final bd = FirebaseFirestore.instance;

main() {
  runApp(Inicio());
}

class Inicio extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text("Clientes")),
          body: ListView(
            children: [
              ListTile(
                title: Text("Felipe"),
                subtitle: Text("Italika"),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                insertar();
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
