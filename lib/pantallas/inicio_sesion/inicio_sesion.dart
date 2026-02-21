import 'package:flutter/material.dart';

class InicioSesion extends StatelessWidget {
  const InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 300, width: 300, child: BuildInputButton()),
        ],
      ),
    );
  }
}

class BuildInputButton extends StatelessWidget {
  const BuildInputButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Ingrese su correo',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.20),
          ),
        ),
      ),
    );
  }
}
