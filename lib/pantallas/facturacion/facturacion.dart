import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/modelos/facturas_model.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_content_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class FacturacionPantalla extends StatelessWidget {
  const FacturacionPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContentContainer(
      count: Facturas().facturasLista.length,
      message: 'Empleados',
      columnLabels: columnasFacturas,
      rows: Facturas().facturasLista.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.numeroFactura,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(item.cliente, overflow: TextOverflow.ellipsis),
              ),
            ),

            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.total.toStringAsFixed(3),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.fechaEmitido.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: FaIcon(
                  FontAwesomeIcons.penToSquare,
                  size: 14,
                  color: themeFontGreyColor,
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
