import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/modelos/empleados_model.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_content_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class EmpleadosPantalla extends StatelessWidget {
  const EmpleadosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContentContainer(
      count: Empleados().empleadosLista.length,
      message: 'Empleados',
      columnLabels: columnasEmpleados,
      rows: Empleados().empleadosLista.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.nombreEmpleado,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(item.documento, overflow: TextOverflow.ellipsis),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(item.rolEmpleado, overflow: TextOverflow.ellipsis),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(item.telefono, overflow: TextOverflow.ellipsis),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(item.email, overflow: TextOverflow.ellipsis),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.fechaIngreso.toString(),
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
