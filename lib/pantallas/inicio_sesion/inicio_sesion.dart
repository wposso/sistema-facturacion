import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBackgroundColor,
      body: Center(
        child: Container(
          width: 400,
          padding: EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: themeBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: themeIconGreyColor.withOpacity(0.15),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: themeGreenColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: FaIcon(
                        FontAwesomeIcons.accusoft,
                        color: themeGreenColor,
                        size: 24,
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bienvenido',
                        style: TextStyle(
                          fontSize: 14,
                          color: themeFontGreyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Sistema de Facturación',
                        style: TextStyle(
                          fontSize: 18,
                          color: themeBlackColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 40),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.user,
                        size: 14,
                        color: themeFontGreyColor,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'USUARIO',
                        style: TextStyle(
                          color: themeFontGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: themeDrawerColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: themeIconGreyColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      style: TextStyle(color: themeBlackColor, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Ingrese su usuario',
                        hintStyle: TextStyle(
                          color: themeIconGreyColor,
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.lock,
                        size: 14,
                        color: themeFontGreyColor,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'CONTRASEÑA',
                        style: TextStyle(
                          color: themeFontGreyColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: themeDrawerColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: themeIconGreyColor.withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      obscureText: true,
                      style: TextStyle(color: themeBlackColor, fontSize: 14),
                      decoration: InputDecoration(
                        hintText: 'Ingrese su contraseña',
                        hintStyle: TextStyle(
                          color: themeIconGreyColor,
                          fontSize: 14,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(14),
                          child: FaIcon(
                            FontAwesomeIcons.eye,
                            size: 14,
                            color: themeFontGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),

              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'Dashboard');
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: themeGreenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'INGRESAR',
                          style: TextStyle(
                            color: themeBackgroundColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(width: 10),
                        FaIcon(
                          FontAwesomeIcons.arrowRight,
                          size: 14,
                          color: themeBackgroundColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Center(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      print('Olvidé mi contraseña');
                    },
                    child: Text(
                      '¿Olvidó su contraseña?',
                      style: TextStyle(
                        color: themeFontGreyColor,
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
