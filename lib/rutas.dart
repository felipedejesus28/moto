import 'package:flutter/material.dart';
import 'clientesAgregar.dart';
import 'clientesConsultar.dart';

Map<String, Widget Function(BuildContext)> getApplicationRoutes() {
  return <String, Widget Function(BuildContext)>{
    '/': (BuildContext context) => ClientesConsultar(),
    '/clientesConsultar': (BuildContext context) => ClientesConsultar(),
    '/clientesAgregar': (BuildContext context) => ClientesAgregar(),
  };
}


