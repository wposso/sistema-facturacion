import 'package:flutter/material.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class InformacionPantalla extends StatelessWidget {
  const InformacionPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Información del Sistema",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: themeBlackColor,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                "Panel de información general sobre el funcionamiento del sistema de facturación.",
                style: TextStyle(color: themeFontGreyColor, fontSize: 14),
              ),

              const SizedBox(height: 25),

              _buildInfoCard(
                title: "Descripción del sistema",
                content:
                    "Este sistema de facturación permite administrar clientes, empleados, productos, categorías y generar facturas de forma organizada. "
                    "Está diseñado para facilitar la gestión de ventas y el control del inventario dentro de una empresa o negocio.",
              ),

              const SizedBox(height: 20),

              _buildModulesSection(),

              const SizedBox(height: 20),

              _buildFlowSection(),

              const SizedBox(height: 20),

              _buildRecommendationsSection(),

              const SizedBox(height: 20),

              _buildGoodPracticesSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required String content}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeIconGreyColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeBlackColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 13,
              color: themeFontGreyColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModulesSection() {
    return _buildModuleCard("Módulos del sistema", [
      _module(
        "Clientes",
        "Permite registrar, consultar y administrar la información de los clientes.",
      ),
      _module(
        "Empleados",
        "Gestiona los empleados que operan el sistema y participan en las ventas.",
      ),
      _module(
        "Productos",
        "Administra el catálogo de productos disponibles para la venta.",
      ),
      _module(
        "Categorías",
        "Organiza los productos en grupos para facilitar su administración.",
      ),
      _module(
        "Facturas",
        "Permite registrar ventas, seleccionar productos y generar facturas.",
      ),
      _module(
        "Roles",
        "Define permisos y responsabilidades dentro del sistema.",
      ),
    ]);
  }

  Widget _buildFlowSection() {
    return _buildModuleCard("Flujo de funcionamiento", [
      _module(
        "1. Registro de clientes",
        "Primero se registran los clientes que realizarán compras.",
      ),
      _module(
        "2. Registro de productos",
        "Se agregan productos al inventario con sus precios y cantidades.",
      ),
      _module(
        "3. Gestión de categorías",
        "Los productos se organizan dentro de categorías.",
      ),
      _module(
        "4. Creación de facturas",
        "Se selecciona cliente, empleado y productos para generar una venta.",
      ),
      _module(
        "5. Control del sistema",
        "Los roles permiten controlar quién puede acceder a cada módulo.",
      ),
    ]);
  }

  Widget _buildRecommendationsSection() {
    return _buildModuleCard("Recomendaciones de uso", [
      _module(
        "Actualizar inventario",
        "Mantener actualizado el stock de productos evita errores en ventas.",
      ),
      _module(
        "Registrar correctamente los clientes",
        "Una base de datos de clientes organizada mejora la gestión comercial.",
      ),
      _module(
        "Verificar facturas antes de guardar",
        "Asegurarse de que los productos y cantidades sean correctos.",
      ),
      _module(
        "Organizar productos por categorías",
        "Facilita la búsqueda y gestión del catálogo.",
      ),
    ]);
  }

  Widget _buildGoodPracticesSection() {
    return _buildModuleCard("Buenas prácticas del sistema", [
      _module(
        "Control de accesos",
        "Asignar roles adecuados para mantener la seguridad del sistema.",
      ),
      _module(
        "Gestión ordenada de datos",
        "Evitar registros duplicados en clientes o productos.",
      ),
      _module(
        "Revisión periódica",
        "Revisar inventario y ventas para detectar inconsistencias.",
      ),
      _module(
        "Respaldo de información",
        "Realizar copias de seguridad periódicas de la base de datos.",
      ),
    ]);
  }

  Widget _buildModuleCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themeBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeIconGreyColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeBlackColor,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }

  Widget _module(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: 8, color: themeGreenColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 13, color: themeFontGreyColor),
                children: [
                  TextSpan(
                    text: "$title: ",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
