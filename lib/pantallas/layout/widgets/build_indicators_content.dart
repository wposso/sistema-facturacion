import 'package:flutter/material.dart';
import 'package:sistema_facturacion/modelos/productos_model.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildIndicatorsContent extends StatelessWidget {
  const BuildIndicatorsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final precioVenta = Productos().totalPrecioVenta;
    final precioCompra = Productos().totalPrecioCompra;
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            _buildIndicatorCard(
              width: size.width * 0.19,
              title: 'PRECIO DE VENTA',
              value: precioVenta,
            ),
            SizedBox(width: 20),
            _buildIndicatorCard(
              width: size.width * 0.19,
              title: 'PRECIO DE COMPRA',
              value: precioCompra,
            ),
            SizedBox(width: 20),
            _buildIndicatorCard(
              width: size.width * 0.19,
              title: 'MARGEN BRUTO',
              value: precioVenta - precioCompra,
              isGain: false,
            ),
            SizedBox(width: 20),
            _buildIndicatorCard(
              width: size.width * 0.20,
              title: 'RENTABILIDAD',
              value: precioCompra > 0
                  ? ((precioVenta - precioCompra) / precioCompra * 100)
                  : 0,
              isPercentage: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIndicatorCard({
    required double width,
    required String title,
    required double value,
    bool isPercentage = false,
    bool isGain = false,
  }) {
    final colorValue = isGain
        ? (value >= 0 ? themeGreenColor : themeRedColor)
        : themeBlackColor;

    return Container(
      width: width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: themeIconGreyColor.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: themeFontGreyColor,
              fontSize: 11,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8),
          Text(
            isPercentage
                ? '${value.toStringAsFixed(1)}%'
                : '\$ ${value.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
            style: TextStyle(
              color: colorValue,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (isGain) ...[
            SizedBox(height: 6),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: value >= 0
                    ? themeGreenColor1
                    : themeRedColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                value >= 0
                    ? '+${value.toStringAsFixed(0)}'
                    : value.toStringAsFixed(0),
                style: TextStyle(
                  color: value >= 0 ? themeGreenColor : themeRedColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
