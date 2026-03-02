import 'package:flutter/material.dart';
import 'package:sistema_facturacion/pantallas/layout/layout_content.dart';
import 'package:sistema_facturacion/pantallas/inicio_sesion/inicio_sesion.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'InicioSesion': (context) => LoginScreen(),
  'Dashboard': (context) => Dashboard(),
};
