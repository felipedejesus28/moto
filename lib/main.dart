import 'package:flutter/material.dart';
import 'package:motolab/serviciosConsultar.dart';
import 'clientesAgregar.dart';
import 'clientesConsultar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() => runApp(Motolab());

class Motolab extends StatefulWidget {
  @override
  Estado createState() => Estado();
}

class Estado extends State<Motolab> {

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'serviciosConsultar',
      routes: {
        '/' : (context) => ClientesConsultar(),
        'clientesAgregar' : (context) => ClientesAgregar(),
        'clientesConsultar' : (context) => ClientesConsultar(),
        'serviciosConsultar' : (context) => ServiciosConsultar()
      }
  );
}