import 'package:flutter/material.dart';
import 'package:sistema_facturacion/pantallas/dashboard/dashboard.dart';
import 'package:sistema_facturacion/pantallas/inicio_sesion/inicio_sesion.dart';

Map<String, Widget Function(BuildContext)> routes = {
  'InicioSesion': (context) => InicioSesion(),
  'Dashboard': (context) => Dashboard(),
};
