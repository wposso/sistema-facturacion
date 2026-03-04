import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/pantallas/layout/layout_content.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/forms_controller_provider.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/mouse_region_menu.dart';
import 'package:sistema_facturacion/routes/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MouseRegionMenu()),
        ChangeNotifierProvider(create: (_) => ScreenProvider()),
        ChangeNotifierProvider(create: (_) => FormsControllerProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      title: 'SISTEMA DE FACTURACIÓN',
      initialRoute: 'InicioSesion',
      routes: routes,
    );
  }
}
