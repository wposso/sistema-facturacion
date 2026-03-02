import 'package:flutter/material.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_header_content.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_indicators_content.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_tables_content.dart';

class BuildContentContainer extends StatelessWidget {
  final int count;
  final String message;
  final List<String> columnLabels;
  final List<DataRow> rows;
  const BuildContentContainer({
    super.key,
    required this.count,
    required this.message,
    required this.columnLabels,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          BuildHeaderContent(title: message),
          Divider(),
          SizedBox(height: 70),
          BuildIndicatorsContent(),
          SizedBox(height: 55),
          BuildTablesContent(
            count: count,
            message: message,
            columnLabels: columnLabels,
            rows: rows,
          ),
        ],
      ),
    );
  }
}
