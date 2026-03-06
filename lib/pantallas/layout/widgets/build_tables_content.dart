import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/forms_controller_provider.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_form_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildTablesContent extends StatelessWidget {
  final int count;
  final String message;
  final List<String> columnLabels;
  final List<DataRow> rows;
  final Widget form;
  const BuildTablesContent({
    super.key,
    required this.count,
    required this.message,
    required this.columnLabels,
    required this.rows,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTableOptionsContent(context, count, message),
            SizedBox(height: 20),
            Expanded(child: _buildDataTableContent(columnLabels, rows)),
          ],
        ),
      ),
    );
  }

  Widget _buildTableOptionsContent(BuildContext context, int count, message1) {
    final fpc = Provider.of<FormsControllerProvider>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: themeGreenColor1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              '$count $message1 en total',
              style: TextStyle(
                color: themeGreenColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Row(
            children: [
              _buildOptionsContentButton(
                icon: FontAwesomeIcons.arrowTurnDown,
                label: 'Descargar',
                message: 'Descargar $message1',
                color: themeFontGreyColor,
                onPress: () {},
              ),
              SizedBox(width: 8),
              _buildOptionsContentButton(
                icon: FontAwesomeIcons.arrowTurnUp,
                label: 'Cargar',
                message: 'Cargar $message1',
                color: themeFontGreyColor,
                onPress: () {},
              ),
              SizedBox(width: 8),
              _buildOptionsContentButton(
                icon: FontAwesomeIcons.plus,
                label: 'Agregar',
                message: 'Agregar un $message1',
                color: themeGreenColor,
                isPrimary: true,
                onPress: () => fpc.showFormModal(context, form),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsContentButton({
    required IconData icon,
    required String label,
    required String message,
    required Color color,
    required VoidCallback onPress,
    bool isPrimary = false,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: isPrimary ? color : Colors.transparent,
            border: Border.all(
              width: 1,
              color: isPrimary
                  ? Colors.transparent
                  : themeIconGreyColor.withOpacity(0.3),
            ),
          ),
          child: Row(
            children: [
              FaIcon(
                icon,
                size: 14,
                color: isPrimary ? Colors.white : themeFontGreyColor,
              ),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isPrimary ? Colors.white : themeFontGreyColor,
                  fontSize: 13,
                  fontWeight: isPrimary ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataTableContent(List<String> columnLabels, List<DataRow> rows) {
    return Container(
      decoration: BoxDecoration(
        color: themeBackgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: themeIconGreyColor.withOpacity(0.15),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            child: DataTable(
              columnSpacing: 55,
              headingRowHeight: 45,
              dataRowHeight: 45,
              headingTextStyle: TextStyle(
                color: themeFontGreyColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
              headingRowColor: WidgetStatePropertyAll(themeDrawerColor),
              dataTextStyle: TextStyle(color: themeBlackColor, fontSize: 13),
              decoration: BoxDecoration(color: themeBackgroundColor),
              columns: columnLabels
                  .map((label) => DataColumn(label: Text(label)))
                  .toList(),
              rows: rows,
            ),
          ),
        ),
      ),
    );
  }
}
