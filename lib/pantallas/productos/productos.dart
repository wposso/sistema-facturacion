import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/modelos/productos_model.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/forms_controller_provider.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_content_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class ProductosPantalla extends StatelessWidget {
  const ProductosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    final provForm = Provider.of<FormsControllerProvider>(context);
    return BuildContentContainer(
      form: provForm.showFormClients(),
      count: Productos().productosLista.length,
      message: 'Productos',
      columnLabels: columnasProductos,
      rows: Productos().productosLista.map((item) {
        return DataRow(
          cells: [
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.nombreProducto,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.codigoReferencia,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.categoria.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.cantidadStock.toString(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.precioCompra.toStringAsFixed(3),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.precioVenta.toStringAsFixed(3),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            DataCell(
              Container(
                width: 100,
                child: Text(
                  item.detalleProducto,
                  overflow: TextOverflow.ellipsis,
                ),
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
