import 'package:flutter/material.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_form_container.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class FormsControllerProvider extends ChangeNotifier {
  final clientsField = [
    FormFieldConfig(
      required: true,
      label: 'Nombre del cliente',
      text: 'Ingrese cliente',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Tipo documento',
      text: 'Seleccione documento',
      type: FieldType.dropdown,
      options: ['Cedula Ciudadanía', 'NIT', 'Rut'],
    ),
    FormFieldConfig(
      required: true,
      label: 'Documento del cliente',
      text: 'Ingrese documento',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Dirección del cliente',
      text: 'Ingrese dirección',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Teléfono del cliente',
      text: 'Ingrese teléfono',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Correo del cliente',
      text: 'Ingrese correo',
      type: FieldType.text,
    ),
  ];

  void showFormModal(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (builder) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            width: 650,
            height: MediaQuery.of(context).size.height * 2,
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.9,
            ),
            decoration: BoxDecoration(
              color: themeBackgroundColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BuildGenericForm(
                fields: clientsField,
                title: title,
                text: message,
              ),
            ),
          ),
        );
      },
    );
  }
}
