import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/pantallas/clientes/clientes.dart';
import 'package:sistema_facturacion/pantallas/empleados/empleados.dart';
import 'package:sistema_facturacion/pantallas/facturacion/facturacion.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_drawer_menu.dart';
import 'package:sistema_facturacion/pantallas/productos/productos.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          BuildDrawerMenu(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: Consumer<ScreenProvider>(
                builder: (context, screenProvider, child) {
                  return _buildScreensDyanmic(screenProvider._currentScreen);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreensDyanmic(String screen) {
    switch (screen) {
      case 'Productos':
        return const ProductosPantalla();
      case 'Clientes':
        return const ClientesPantalla();
      case 'Empleados':
        return const EmpleadosPantalla();
      case 'Facturas':
        return const FacturacionPantalla();
      default:
        return const ProductosPantalla();
    }
  }
}

class ScreenProvider extends ChangeNotifier {
  String _currentScreen = 'Productos';

  String get currentScreen => _currentScreen;

  set currentScreen(String screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
