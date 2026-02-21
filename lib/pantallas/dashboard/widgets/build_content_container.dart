import 'package:flutter/material.dart';

class BuildContentContainer extends StatelessWidget {
  const BuildContentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          DataTable(
            columns: [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Precio')),
              DataColumn(label: Text('Stock')),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('Arroz')),
                  DataCell(Text('3200')),
                  DataCell(Text('50')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Arroz')),
                  DataCell(Text('3200')),
                  DataCell(Text('50')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Arroz')),
                  DataCell(Text('3200')),
                  DataCell(Text('50')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Arroz')),
                  DataCell(Text('3200')),
                  DataCell(Text('50')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
