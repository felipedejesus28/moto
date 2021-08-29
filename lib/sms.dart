import 'package:sendsms/sendsms.dart';

Future enviarSMS(String telefono, String mensaje) async {
  await Sendsms.onGetPermission();

  if (await Sendsms.hasPermission()) {
    await Sendsms.onSendSMS(telefono, mensaje);
  }
}
