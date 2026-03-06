import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/modelos/clientes_model.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/forms_controller_provider.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_content_container.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_form_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class ClientesPantalla extends StatelessWidget {
  const ClientesPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final provForm = Provider.of<FormsControllerProvider>(context);
    return BuildContentContainer(
      form: provForm.showFormClients(),
      count: Clientes().clientesLista.length,
      message: 'Clientes',
      columnLabels: columnasClientes,
      rows: Clientes().clientesLista.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.nombreCliente,
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
                child: Text(item.direccion, overflow: TextOverflow.ellipsis),
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
                child: Row(
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.penToSquare,
                          size: 14,
                          color: themeFontGreyColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.trashCan,
                          size: 14,
                          color: themeFontGreyColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
