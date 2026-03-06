import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/pantallas/ayuda/ayuda.dart';
import 'package:sistema_facturacion/pantallas/categorias/categorias.dart';
import 'package:sistema_facturacion/pantallas/clientes/clientes.dart';
import 'package:sistema_facturacion/pantallas/empleados/empleados.dart';
import 'package:sistema_facturacion/pantallas/facturacion/facturacion.dart';
import 'package:sistema_facturacion/pantallas/informacion/informacion.dart';
import 'package:sistema_facturacion/pantallas/inicio/inicio.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_drawer_menu.dart';
import 'package:sistema_facturacion/pantallas/productos/productos.dart';
import 'package:sistema_facturacion/pantallas/roles/roles.dart';

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
      case 'Facturación':
        return const FacturacionPantalla();
      case 'Inicio':
        return const InicioPantalla();
      case 'Información':
        return InformacionPantalla();
      case 'Categorías':
        return CategoriasPantalla();
      case 'Roles':
        return RolesPantalla();
      case 'Ayúda':
        return AyudaPantalla();
      default:
        return const InicioPantalla();
    }
  }
}

class ScreenProvider extends ChangeNotifier {
  String _currentScreen = 'Inicio';

  String get currentScreen => _currentScreen;

  set currentScreen(String screen) {
    _currentScreen = screen;
    notifyListeners();
  }
}
