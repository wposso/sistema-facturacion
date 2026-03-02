import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/modelos/productos_model.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_content_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class ProductosPantalla extends StatelessWidget {
  const ProductosPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return BuildContentContainer(
      count: Productos().productosLista.length,
      message: 'Empleados',
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
