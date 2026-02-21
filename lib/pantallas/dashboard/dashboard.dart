import 'package:flutter/material.dart';
import 'package:sistema_facturacion/pantallas/dashboard/widgets/build_content_container.dart';
import 'package:sistema_facturacion/pantallas/dashboard/widgets/build_drawer_menu.dart';

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
              decoration: BoxDecoration(color: Colors.amberAccent),
              child: BuildContentContainer(),
            ),
          ),
        ],
      ),
    );
  }
}
