import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter/services.dart';

void main() => runApp(Motolab());

class Motolab extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<Motolab> {
  String cuerpoCorreo = '';
  final Email email = Email(
    recipients: [],
    bcc: ['fernandovazquezia@aragon.unam.mx'],
    subject: 'Motocicleta recibida en Motolab',
    body: 'Muchas gracias por elegir el servicio de Motolab',
    isHTML: true,
  );

  final _formKey = GlobalKey<FormState>();

  TextEditingController txtNombre = TextEditingController();
  TextEditingController txtMail = TextEditingController();
  String nombre = '';
  String mail = '';

  bool servicioMantenimientoRegular = false, servicioRevisionGarantia = false, servicioReparacion = false;
  bool sistemaElectrico = false, sistemaMecanico = false, chasis = false;
  bool chooper= false, trabajo=false, cross= false, scooter=false, deportiva=false, street=false;
  TextEditingController txtOtraMoto = TextEditingController();
  TextEditingController txtModelo = TextEditingController();
  TextEditingController txtKilometraje = TextEditingController();
  TextEditingController txtNumeroMotor = TextEditingController();
  TextEditingController txtPlaca = TextEditingController();
  TextEditingController txtNumeroChasis = TextEditingController();
  TextEditingController txtOtroDatoVehiculo = TextEditingController();


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
  TextEditingController txtFacebook = TextEditingController();
  TextEditingController txtTwitter = TextEditingController();
  TextEditingController txtOtraRedSocial = TextEditingController();
  bool llavesVehiculo= false;

  bool luzTrasera=false, portaHerramientas=false, cableFrenoDelantero= false, llantaDelanteraBM=false, paradoLateral=false;
  bool direccionalesDelanteras=false, palancaCambio=false, tarjetaCirculacion=false, carenado=false, cableClutch=false, paradorCentral=false;
  bool llantaTraseraBM=false, direccionalesTraseras=false, espejosDI=false, velocimetroTacometro=false, cableTacometro=false, salpicaderaDelantera=false;
  bool reposapiesDelanteros=false, luzFrontal=false, asientoDT=false, barrasDelanterasBM=false, cubreCadena=false, salpicaderaTrasera=false, reposapiesTraseros=false;

  TextEditingController txtCostoTotal= TextEditingController();
  TextEditingController txtAnticipo = TextEditingController();

  bool efectivo=false, tarjetaCredito= false, tarjetaDebito=false;

  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Orden de servicio"),
            backgroundColor: Colors.deepPurple,
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                // const DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //   ),
                //   child: Text('Motolab Racing Team'),
                // ),

                UserAccountsDrawerHeader(
                  accountName: Text("Usuario"),
                  accountEmail: Text("mecanico@gmail.com"),
                   //  currentAccountPicture: CircleAvatar(radius: 5,
                   //  backgroundImage: AssetImage("imagenes/logo/logo.png"),
                   // ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("imagenes/motos/rossi.png")
                    ),
                    gradient: RadialGradient(colors: [
                      Colors.blue,
                      Colors.black54
                    ],
                    )
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.people),
                  title: const Text('Clientes'),
                  onTap: () {
                  },
                ),
                ListTile(
                  leading: Icon(Icons.motorcycle),
                  title: const Text('Servicios'),
                  onTap: () {
                  },
                ),
              ],
            ),
          ),
          body:
            ListaServicios(),
      //    ListaCliente()

      ));

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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  // validator: (valor) => (valor == null || valor.isEmpty)
                  //     ? "Por favor escriba un nombre"
                  //     : null
                ),
              ),

              // CORTINA DE DIRECCIÓN
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  // validator: (valor) => (valor == null || valor.isEmpty)
                  //     ? "Por favor escriba el código postal"
                  //     : null
                ),
              ),

              // CORTINA DE DATOS DE CONTACTO
              Padding(
                padding:
                    const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "DATOS DE CONTACTO",
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),

              // CORREO ELECTRÓNICO
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Correo Electrónico",
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
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate())
                    print("Datos validados ${txtNombreCompleto.text}");
                  // Enviar los datos a Internet
                },
                child: Text('Agregar cliente'),
              ),
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        );
  }

  ///
  /// SERVICIOS
  ///

  Form ListaServicios() {
    return Form(
    //  key: _formKey,
      child: Stack(
        children: [
          Center(
            child: Opacity(
                opacity: 0.08, child: Image.asset("imagenes/logo/logo.png")),
          ),
          ListView(
            children: [

              // CORTINA TIPO DE SERVICIO
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     padding: EdgeInsets.all(5),
              //     color: Color.fromARGB(180, 60, 120, 180),
              //     child: Text(
              //       "Tipo de servicio",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //   ),
              // ),
              CheckboxListTile(
                  title: Text("Mantenimiento regular"),
                  value: servicioMantenimientoRegular,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      servicioMantenimientoRegular = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Revisión por garantía"),
                  value: servicioRevisionGarantia,
                  onChanged: (seleccion) {
                    setState(() {
                      servicioRevisionGarantia = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Reparación"),
                  value: servicioReparacion,
                  onChanged: (seleccion) {
                    setState(() {
                      servicioReparacion = seleccion!;
                    });
                  }),

              // CORTINA TIPO DE REPARACIÓN
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Tipo de reparación",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CheckboxListTile(
                  title: Text("Sistema Mecánico"),
                  value: sistemaMecanico,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      sistemaMecanico = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Sistema Eléctrico"),
                  value: sistemaElectrico,
                  onChanged: (seleccion) {
                    setState(() {
                      sistemaElectrico = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Chasis"),
                  value: chasis,
                  onChanged: (seleccion) {
                    setState(() {
                      chasis = seleccion!;
                    });
                  }),

              // CORTINA TIPO DE MOTO
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Tipo de moto",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CheckboxListTile(
                  title: Text("Chooper"),
                  value: chooper,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      chooper = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Trabajo"),
                  value: trabajo,
                  onChanged: (seleccion) {
                    setState(() {
                      trabajo = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Cross"),
                  value: cross,
                  onChanged: (seleccion) {
                    setState(() {
                      cross = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Scooter"),
                  value: scooter,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      scooter = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Deportiva"),
                  value: deportiva,
                  onChanged: (seleccion) {
                    setState(() {
                      deportiva = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Street"),
                  value: street,
                  onChanged: (seleccion) {
                    setState(() {
                      street = seleccion!;
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtOtraMoto,
                  decoration: InputDecoration(
                      hintText: "Otra moto",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),

              // CORTINA DATOS DEL VEHÍCULO
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Datos del vehículo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtModelo,
                  decoration: InputDecoration(
                      hintText: "Modelo (Año)",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtKilometraje,
                  decoration: InputDecoration(
                      hintText: "Kilometraje",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtNumeroMotor,
                  decoration: InputDecoration(
                      hintText: "Número de motor",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtPlaca,
                  decoration: InputDecoration(
                      hintText: "Placa",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtNumeroChasis,
                  decoration: InputDecoration(
                      hintText: "Número de chasis",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtOtroDatoVehiculo,
                  decoration: InputDecoration(
                      hintText: "Otro dato",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),

              // CORTINA INVENTARIO
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                      "Inventario del vehículo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CheckboxListTile(
                  title: Text("Tarjeta de circulación"),
                  value: tarjetaCirculacion,
                  onChanged: (seleccion) {
                    setState(() {
                      tarjetaCirculacion = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Llave del vehículo"),
                  value: llavesVehiculo,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      llavesVehiculo = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Velocímetro/Tacómetro"),
                  value: velocimetroTacometro,
                  onChanged: (seleccion) {
                    setState(() {
                      velocimetroTacometro = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Cable Tacómetro"),
                  value: cableTacometro,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      cableTacometro = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Cable freno delantero"),
                  value: cableFrenoDelantero,
                  onChanged: (seleccion) {
                    setState(() {
                      cableFrenoDelantero = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Cable clutch"),
                  value: cableClutch,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      cableClutch = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Porta herramientas"),
                  value: portaHerramientas,
                  onChanged: (seleccion) {
                    setState(() {
                      portaHerramientas = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Parado lateral"),
                  value: paradoLateral,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      paradoLateral = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Llanta delantera B/M"),
                  value: llantaDelanteraBM,
                  onChanged: (seleccion) {
                    setState(() {
                      llantaDelanteraBM = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Llanta Trasera B/M"),
                  value: llantaTraseraBM,
                  onChanged: (seleccion) {
                    setState(() {
                      llantaTraseraBM = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Direccionales delanteras"),
                  value: direccionalesDelanteras,
                  onChanged: (seleccion) {
                    setState(() {
                      direccionalesDelanteras = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Direccionales traseras"),
                  value: direccionalesTraseras,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      direccionalesTraseras = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Palanca cambio"),
                  value: palancaCambio,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      palancaCambio = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Carenado"),
                  value: carenado,
                  onChanged: (seleccion) {
                    setState(() {
                      carenado = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Parador Central"),
                  value: paradorCentral,
                  onChanged: (seleccion) {
                    setState(() {
                      paradorCentral = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Espejos D/I"),
                  value: espejosDI,
                  onChanged: (seleccion) {
                    setState(() {
                      espejosDI = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Salpicadera delantera"),
                  value: salpicaderaDelantera,
                  onChanged: (seleccion) {
                    setState(() {
                      salpicaderaDelantera = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Reposapies delanteros"),
                  value: reposapiesDelanteros,
                  onChanged: (seleccion) {
                    setState(() {
                      reposapiesDelanteros = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Luz frontal"),
                  value: luzFrontal,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      luzFrontal = seleccion!;
                    });
                  }),


              CheckboxListTile(
                  title: Text("Luz trasera"),
                  value: luzTrasera,
                  onChanged: (seleccion) {
                    setState(() {
                      luzTrasera = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Asiento D/T"),
                  value: asientoDT,
                  onChanged: (seleccion) {
                    setState(() {
                      asientoDT = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Barras Delanteras B/M"),
                  value: barrasDelanterasBM,
                  onChanged: (seleccion) {
                    setState(() {
                      barrasDelanterasBM = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Cubre Cadena"),
                  value: cubreCadena,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      cubreCadena = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Salpicadera Trasera"),
                  value: salpicaderaTrasera,
                  onChanged: (seleccion) {
                    setState(() {
                      salpicaderaTrasera = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Reposapies Traseros"),
                  value: reposapiesTraseros,
                  onChanged: (seleccion) {
                    setState(() {
                      reposapiesTraseros = seleccion!;
                    });
                  }),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtOtraMoto,
                  decoration: InputDecoration(
                      hintText: "Otros accesorios",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Detalles en moto",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Image.asset("imagenes/motos/motoDerecha.png"),
              Image.asset("imagenes/motos/motoIzquierda.png"),
              Image.asset("imagenes/motos/tanque.png"),


                // CORTINA DE COSTOS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Costos",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // * COSTO TOTAL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                   inputFormatters: <TextInputFormatter>[
                     FilteringTextInputFormatter.digitsOnly,
                   ],
                  controller: txtCostoTotal,
                  decoration: InputDecoration(
                      hintText: "Costo total",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  // validator: (valor) => (valor == null || valor.isEmpty)
                  //     ? "Por favor escriba un teléfono celular"
                  //     : null
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  // inputFormatters: <TextInputFormatter>[
                  //   FilteringTextInputFormatter.digitsOnly
                  // ],
                  controller: txtAnticipo,
                  decoration: InputDecoration(
                      hintText: "Anticipo",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  // validator: (valor) => (valor == null || valor.isEmpty)
                  //     ? "Por favor escriba un teléfono celular"
                  //     : null
                ),
              ),

              // CORTINA DE TIPO DE PAGO
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Tipo de pago",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Checkbox(
//                  title: Text("Tipo de pago"),
                      value: efectivo,
                      onChanged: (seleccion) {
                        setState(() {
                          efectivo = seleccion!;
                        });
                      }),
                  Text("Efectivo"),

                  Checkbox(
//                  title: Text("Tipo de pago"),
                      value: tarjetaCredito,
                      onChanged: (seleccion) {
                        setState(() {
                          tarjetaCredito = seleccion!;
                        });
                      }),
                  Text("T. Crédito"),

                  Checkbox(
//                  title: Text("Tipo de pago"),
                      value: tarjetaDebito,
                      onChanged: (seleccion) {
                        setState(() {
                          tarjetaDebito = seleccion!;
                        });
                      }),
                  Text("T. Débito"),

                ],
              ),


              // FECHAS
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "FECHAS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),


              // ACEPTACIÓN
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "ACEPTACIÓN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  mail = txtMail.text;

                  cuerpoCorreo =
                      "<HTML>Muchas gracias por confiar en Motolab, los servicios a realizarse son: ";
                  servicioMantenimientoRegular == true
                      ? cuerpoCorreo += "<HR> Mantenimiento regular"
                      : print("No mantenimiento");
                  servicioRevisionGarantia == true
                      ? cuerpoCorreo += "<HR> Revisión por garantía"
                      : print("No garantía");
                  servicioReparacion == true
                      ? cuerpoCorreo += " <HR>Reparación"
                      : print("No reparación");
                  cuerpoCorreo = cuerpoCorreo += "</HTML>";

                  FlutterEmailSender.send(Email(
                    recipients: [mail],
                    bcc: ['fernandovazquezia@aragon.unam.mx'],
                    subject: 'Motocicleta recibida en Motolab',
                    body: cuerpoCorreo,
                    isHTML: true,
                  ));
                },
                child: Text("Enviar"),
              )
            ],
          )
        ],
      ),
    );
  }
}


// MAILER
// https://pub.dev/packages/mailer

// TEXT FORM FILED
// https://flutter.dev/docs/cookbook/forms/validation

// EMAIL VALIDATOR
// https://pub.dev/packages/email_validator

// GOOGLE SIGN IN
// https://pub.dev/packages/google_sign_in

// SOCIAL AUTHENTICATION
// https://firebase.flutter.dev/docs/auth/social/