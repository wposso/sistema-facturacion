import 'package:flutter/material.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Panel Administrativo",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: themeBlackColor,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: _metricCard(
                      "Facturas emitidas",
                      "124",
                      Icons.receipt_long,
                      themeGreenColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _metricCard(
                      "Productos registrados",
                      "56",
                      Icons.inventory_2,
                      themeOranjeColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _metricCard(
                      "Clientes",
                      "38",
                      Icons.people,
                      themeGreenColor,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _metricCard(
                      "Empleados",
                      "6",
                      Icons.badge,
                      themeOranjeColor,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _quickAccess(),

              const SizedBox(height: 30),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _recentInvoicesCard()),

                  const SizedBox(width: 20),

                  Expanded(child: _alertsCard()),
                ],
              ),

              const SizedBox(height: 25),

              _mostSoldProductsCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _metricCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: themeBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: themeIconGreyColor.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: themeBlackColor,
                ),
              ),
              Text(
                title,
                style: TextStyle(fontSize: 12, color: themeFontGreyColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickAccess() {
    return Container(
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
            "Accesos rápidos",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeBlackColor,
            ),
          ),

          const SizedBox(height: 15),

          Row(
            children: [
              Expanded(
                child: _quickButton(
                  "Nueva factura",
                  Icons.receipt,
                  themeGreenColor,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: _quickButton(
                  "Agregar producto",
                  Icons.inventory,
                  themeOranjeColor,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: _quickButton(
                  "Registrar cliente",
                  Icons.person_add,
                  themeGreenColor,
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: _quickButton(
                  "Registrar empleado",
                  Icons.badge,
                  themeOranjeColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _quickButton(String title, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),

          const SizedBox(height: 8),

          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: themeBlackColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentInvoicesCard() {
    return Container(
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
            "Últimas facturas",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeBlackColor,
            ),
          ),

          const SizedBox(height: 15),

          _invoiceItem("FAC-001", "Juan Pérez", "\$23.300"),
          _invoiceItem("FAC-002", "María Rodríguez", "\$49.600"),
          _invoiceItem("FAC-003", "ABC SAS", "\$8.085.000"),
          _invoiceItem("FAC-004", "Carlos Mendoza", "\$450.000"),
        ],
      ),
    );
  }

  Widget _invoiceItem(String factura, String cliente, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                factura,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: themeBlackColor,
                ),
              ),
              Text(
                cliente,
                style: TextStyle(fontSize: 12, color: themeFontGreyColor),
              ),
            ],
          ),

          Text(
            total,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: themeGreenColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _alertsCard() {
    return Container(
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
            "Alertas del sistema",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeBlackColor,
            ),
          ),

          const SizedBox(height: 15),

          _alertItem("Stock bajo", "Pechuga de pollo", themeOranjeColor),
          _alertItem("Stock crítico", "Huevos AA x30", themeRedColor),
          _alertItem("Producto agotado", "Arroz Diana", themeRedColor),
          _alertItem("Alta rotación", "Leche Alpina", themeGreenColor),
        ],
      ),
    );
  }

  Widget _alertItem(String title, String product, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Text(
              "$title - $product",
              style: TextStyle(fontSize: 13, color: themeFontGreyColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mostSoldProductsCard() {
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
            "Productos más vendidos",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: themeBlackColor,
            ),
          ),

          const SizedBox(height: 15),

          _productItem("Arroz Diana 1Kg", "120 ventas"),
          _productItem("Leche Alpina 1L", "98 ventas"),
          _productItem("Huevos AA x30", "86 ventas"),
          _productItem("Aceite Premier", "72 ventas"),
        ],
      ),
    );
  }

  Widget _productItem(String product, String ventas) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            product,
            style: TextStyle(
              color: themeBlackColor,
              fontWeight: FontWeight.w500,
            ),
          ),

          Text(
            ventas,
            style: TextStyle(
              color: themeGreenColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
