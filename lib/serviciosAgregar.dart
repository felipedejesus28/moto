import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motolab/menu.dart';

void main() => runApp(ServiciosAgregar());

class ServiciosAgregar extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<ServiciosAgregar> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController txtNombre = TextEditingController();
  TextEditingController txtMail = TextEditingController();
  String nombre = '';
  String mail = '';

  bool servicioMantenimientoRegular = false,
      servicioRevisionGarantia = false,
      servicioReparacion = false,
      sistemaElectrico = false,
      sistemaMecanico = false,
      chasis = false,
      chooper = false,
      trabajo = false,
      cross = false,
      scooter = false,
      deportiva = false,
      street = false;
  TextEditingController txtOtraMoto = TextEditingController();
  TextEditingController txtModelo = TextEditingController();
  TextEditingController txtKilometraje = TextEditingController();
  TextEditingController txtNumeroMotor = TextEditingController();
  TextEditingController txtPlaca = TextEditingController();
  TextEditingController txtNumeroChasis = TextEditingController();
  TextEditingController txtOtroDatoVehiculo = TextEditingController();

  bool llavesVehiculo = false,
      luzTrasera = false,
      portaHerramientas = false,
      cableFrenoDelantero = false,
      llantaDelanteraBM = false,
      paradoLateral = false;
  bool direccionalesDelanteras = false,
      palancaCambio = false,
      tarjetaCirculacion = false,
      carenado = false,
      cableClutch = false,
      paradorCentral = false;
  bool llantaTraseraBM = false,
      direccionalesTraseras = false,
      espejosDI = false,
      velocimetroTacometro = false,
      cableTacometro = false,
      salpicaderaDelantera = false;
  bool reposapiesDelanteros = false,
      luzFrontal = false,
      asientoDT = false,
      barrasDelanterasBM = false,
      cubreCadena = false,
      salpicaderaTrasera = false,
      reposapiesTraseros = false;

  TextEditingController txtCostoTotal = TextEditingController();
  TextEditingController txtAnticipo = TextEditingController();

  bool efectivo = false, tarjetaCredito = false, tarjetaDebito = false;

  @override
  Widget build(BuildContext context) {
    final clientes = ModalRoute.of(context)!.settings.arguments;
    print(clientes);

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Orden de servicio"),
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_outlined),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          drawer: menuIzquierdo(context),
          body: ListaServicios(),
          //    ListaCliente()
        ));
  }

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

              CheckboxListTile(
                  title: Text("Mantenimiento regular"),
                  value: servicioMantenimientoRegular,
                  onChanged: (seleccion) {
                    setState(() {
                      servicioMantenimientoRegular = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Revisi??n por garant??a"),
                  value: servicioRevisionGarantia,
                  onChanged: (seleccion) {
                    setState(() {
                      servicioRevisionGarantia = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Reparaci??n"),
                  value: servicioReparacion,
                  onChanged: (seleccion) {
                    setState(() {
                      servicioReparacion = seleccion!;
                    });
                  }),

              // CORTINA TIPO DE REPARACI??N
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Tipo de reparaci??n",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CheckboxListTile(
                  title: Text("Sistema Mec??nico"),
                  value: sistemaMecanico,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      sistemaMecanico = seleccion!;
                    });
                  }),
              CheckboxListTile(
                  title: Text("Sistema El??ctrico"),
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

              // CORTINA DATOS DEL VEH??CULO
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "Datos del veh??culo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: txtModelo,
                  decoration: InputDecoration(
                      hintText: "Modelo (A??o)",
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
                      hintText: "N??mero de motor",
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
                      hintText: "N??mero de chasis",
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
                    "Inventario del veh??culo",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              CheckboxListTile(
                  title: Text("Tarjeta de circulaci??n"),
                  value: tarjetaCirculacion,
                  onChanged: (seleccion) {
                    setState(() {
                      tarjetaCirculacion = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Llave del veh??culo"),
                  value: llavesVehiculo,
                  onChanged: (bool? seleccion) {
                    setState(() {
                      llavesVehiculo = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Veloc??metro/Tac??metro"),
                  value: velocimetroTacometro,
                  onChanged: (seleccion) {
                    setState(() {
                      velocimetroTacometro = seleccion!;
                    });
                  }),

              CheckboxListTile(
                  title: Text("Cable Tac??metro"),
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
              Image.asset("imagenes/motos/tanqueGasolina.png"),

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
                  //     ? "Por favor escriba un tel??fono celular"
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
                  //     ? "Por favor escriba un tel??fono celular"
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
                  Text("T. Cr??dito"),
                  Checkbox(
//                  title: Text("Tipo de pago"),
                      value: tarjetaDebito,
                      onChanged: (seleccion) {
                        setState(() {
                          tarjetaDebito = seleccion!;
                        });
                      }),
                  Text("T. D??bito"),
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

              // ACEPTACI??N
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(5),
                  color: Color.fromARGB(180, 60, 120, 180),
                  child: Text(
                    "ACEPTACI??N",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              ElevatedButton(
                onPressed: () {},
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
