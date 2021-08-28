import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

final bd = FirebaseFirestore.instance;

main() => runApp(ClientesAgregar());

class ClientesAgregar extends StatefulWidget {
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

  final _formKey = GlobalKey<FormState>();

  String coleccion= "clientes";
  TextEditingController txtNombreCompleto = TextEditingController();
  TextEditingController txtRFC = TextEditingController();
  TextEditingController txtCalle = TextEditingController();
  TextEditingController txtNumeroExterior = TextEditingController();
  TextEditingController txtNumeroInterior = TextEditingController();
  TextEditingController txtColonia = TextEditingController();
  TextEditingController txtAlcaldia = TextEditingController();
  TextEditingController txtEntidadFederativa = TextEditingController();
  TextEditingController txtCodigoPostal = TextEditingController();
  TextEditingController txtCelular = TextEditingController();
  TextEditingController txtTelefonoCasa = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtFacebook = TextEditingController();
  TextEditingController txtTwitter = TextEditingController();
  TextEditingController txtOtraRedSocial = TextEditingController();

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Colors.lightGreen,
            title: Text("Alta de clientes"),
          ),
          body: ListaCliente(),
        ),
      );

  Form ListaCliente() {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          // * NOMBRE COMPLETO
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
                controller: txtNombreCompleto,
                decoration: InputDecoration(
                    hintText: "Nombre completo",
                    labelText: "Nombre",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                validator: (valor) => (valor == null || valor.isEmpty)
                    ? "Por favor escriba un nombre"
                    : null),
          ),

          // RFC
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: txtRFC,
              decoration: InputDecoration(
                  hintText: "RFC",
                  labelText: "RFC",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba un nombre"
              //     : null
            ),
          ),

          // CORTINA DE DIRECCIÓN
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
            child: Container(
              padding: EdgeInsets.all(5),
              color: Color.fromARGB(120, 60, 120, 180),
              child: Text(
                "DIRECCIÓN",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // * CALLE
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtCalle,
              decoration: InputDecoration(
                  hintText: "Calle",
                  labelText: "Calle",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba la calle"
              //     : null
            ),
          ),

          // * NUMERO EXTERIOR
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: txtNumeroExterior,
              decoration: InputDecoration(
                  hintText: "Número exterior",
                  labelText: "No. Exterior",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba el número exterior"
              //     : null
            ),
          ),

          // NÚMERO INTERIOR
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: txtNumeroInterior,
              decoration: InputDecoration(
                  hintText: "Número interior",
                  labelText: "No. Interior",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),

          // * COLONIA
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtColonia,
              decoration: InputDecoration(
                  hintText: "Colonia",
                  labelText: "Colonia",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba una colonia"
              //     : null
            ),
          ),

          // * ALCALDÍA O MUNICIPIO
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtAlcaldia,
              decoration: InputDecoration(
                  hintText: "Alcaldía o municipio",
                  labelText: "Alcaldía o municipio",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba la alcaldía o municipio"
              //     : null
            ),
          ),

          // * ENTIDAD FEDERATIVA
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtEntidadFederativa,
              decoration: InputDecoration(
                  hintText: "Entidad Federativa",
                  labelText: "Entidad Federativa",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba la Entidad Federativa"
              //     : null
            ),
          ),

          //*  C.P.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtCodigoPostal,
              decoration: InputDecoration(
                  hintText: "Código Postal",
                  labelText: "Código Postal",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba el código postal"
              //     : null
            ),
          ),

          // CORTINA DE DATOS DE CONTACTO
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
            child: Container(
              padding: EdgeInsets.all(5),
              color: Color.fromARGB(120, 60, 120, 180),
              child: Text(
                "CONTACTO",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          // * CELULAR
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: txtCelular,
              decoration: InputDecoration(
                  hintText: "Celular",
                  labelText: "Celular",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              // validator: (valor) => (valor == null || valor.isEmpty)
              //     ? "Por favor escriba un teléfono celular"
              //     : null
            ),
          ),

          // TELÉFONO DE CASA
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              controller: txtTelefonoCasa,
              decoration: InputDecoration(
                  hintText: "Teléfono de casa",
                  labelText: "Teléfono de casa",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),

          // CORREO ELECTRÓNICO
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtEmail,
              decoration: InputDecoration(
                  hintText: "Correo Electrónico",
                  labelText: "Correo Electrónico",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              //   validator: (valor) => EmailValidator.validate(valor) ? null : "Por favor, escriba un correo válido",
            ),
          ),

          // FACEBOOK
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtFacebook,
              decoration: InputDecoration(
                  hintText: "Facebook",
                  labelText: "Facebook",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),

          // TWITTER
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtTwitter,
              decoration: InputDecoration(
                  hintText: "Twitter",
                  labelText: "Twitter",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),

          // OTRO
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtOtraRedSocial,
              decoration: InputDecoration(
                  hintText: "Otro",
                  labelText: "Otro",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(20),
                  shape: StadiumBorder(),
                  elevation: 3,
                  side: BorderSide(width: 2, color: Colors.lightGreen)),
              onPressed: () {
                if (_formKey.currentState!.validate())
                  insertar(context,
                      coleccion,
                      txtNombreCompleto.text,
                      txtRFC.text,
                      txtCalle.text,
                      txtNumeroExterior.text,
                      txtNumeroInterior.text,
                      txtColonia.text,
                      txtAlcaldia.text,
                      txtEntidadFederativa.text,
                      txtCodigoPostal.text,
                      txtCelular.text,
                      txtTelefonoCasa.text,
                      txtEmail.text,
                      txtFacebook.text,
                      txtTwitter.text,
                      txtOtraRedSocial.text);
              },
              child: Text('AGREGAR'),
            ),
          )

          // Add TextFormFields and ElevatedButton here.
        ],
      ),
    );
  }
}

void insertar(
    BuildContext context,
    String coleccion,
    String nombreCompleto,
    String rfc,
    String calle,
    String numeroExterior,
    String numeroInterior,
    String colonia,
    String alcaldia,
    String entidadFederativa,
    String codigoPostal,
    String celular,
    String telefonoCasa,
    String eMail,
    String facebook,
    String twitter,
    String otraRedSocial) async {
  try {
    await bd.collection("clientes").doc(/*rfc*/).set({
      'nombreCompleto': nombreCompleto,
      'rfc': rfc,
      'calle': calle,
      'numeroExterior': numeroExterior,
      'numeroInterior': numeroInterior,
      'colonia': colonia,
      'alcaldia': alcaldia,
      'entidadFederativa': entidadFederativa,
      'codigoPostal': codigoPostal,
      'celular': celular,
      'Email': eMail,
      'telefonoCasa': telefonoCasa,
      'facebook': facebook,
      'twitter': twitter,
      'otraRedSocial': otraRedSocial
    });
    Navigator.pop(context);
  } catch (error) {
    print(error);
  }
}
