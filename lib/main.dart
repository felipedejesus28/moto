import 'package:flutter/material.dart';
import 'package:motolab/serviciosAgregar.dart';
import 'package:motolab/serviciosConsultar.dart';
import 'clientesAgregar.dart';
import 'clientesConsultar.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(Motolab());

class Motolab extends StatefulWidget {
  @override
  Estado createState() => Estado();
}

class Estado extends State<Motolab> {

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: 'clientesConsultar',
      routes: {
        '/'                   : (context) => ClientesConsultar(),

        '/clientesConsultar'  : (context) => ClientesConsultar(),
        '/clientesAgregar'    : (context) => ClientesAgregar(),

        '/serviciosConsultar' : (context) => ServiciosConsultar(),
        '/serviciosAgregar'   : (context) => ServiciosAgregar(),
      }


  );
}