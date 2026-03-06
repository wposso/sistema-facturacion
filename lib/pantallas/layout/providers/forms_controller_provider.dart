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

  final employeesField = [
    FormFieldConfig(
      required: true,
      label: 'Nombre de empleado',
      text: 'Ingrese nombre del empleado',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Tipo de documento',
      text: 'Seleccione tipo documento',
      type: FieldType.dropdown,
      options: ['Cedula ciudadanía', 'Pasaporte', 'Permiso residencía'],
    ),
    FormFieldConfig(
      required: true,
      label: 'Documento del empleado',
      text: 'Ingrese documento del empleado',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Dirección de empleado',
      text: 'Ingrese dirección del empleado',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Teléfono de empleado',
      text: 'Ingrese telefono del empleado',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Correo de empleado',
      text: 'Ingrese correo del empleado',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Rol de empleado',
      text: 'Ingrese rol del empleado',
      type: FieldType.text,
    ),
  ];

  final productsField = [
    FormFieldConfig(
      required: true,
      label: 'Nombre del producto',
      text: 'Ingrese nombre del producto',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Código de referencia',
      text: 'Ingrese código',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Categoría',
      text: 'Seleccione categoría',
      type: FieldType.dropdown,
      options: [
        'Frutas',
        'Carnes',
        'Panadería',
        'Lácteos',
        'Aseo',
        'Abarrotes',
        'Bebidas',
      ],
    ),
    FormFieldConfig(
      required: true,
      label: 'Precio de compra',
      text: 'Ingrese precio de compra',
      type: FieldType.number,
    ),
    FormFieldConfig(
      required: true,
      label: 'Precio de venta',
      text: 'Ingrese precio de venta',
      type: FieldType.number,
    ),
    FormFieldConfig(
      required: true,
      label: 'Cantidad en stock',
      text: 'Ingrese cantidad',
      type: FieldType.number,
    ),
    FormFieldConfig(
      required: false,
      label: 'Detalle del producto',
      text: 'Ingrese detalle',
      type: FieldType.text,
    ),
  ];

  final invoicesField = [
    FormFieldConfig(
      required: true,
      label: 'Número de factura',
      text: 'Ingrese número de factura',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Cliente',
      text: 'Seleccione cliente',
      type: FieldType.dropdown,
      options: [],
    ),
    FormFieldConfig(
      required: true,
      label: 'Empleado',
      text: 'Seleccione empleado',
      type: FieldType.dropdown,
      options: [],
    ),
    FormFieldConfig(
      required: true,
      label: 'Fecha de emisión',
      text: 'Seleccione fecha',
      type: FieldType.date,
    ),
    FormFieldConfig(
      required: false,
      label: 'Observaciones',
      text: 'Ingrese observaciones',
      type: FieldType.text,
    ),
  ];

  final categoriesField = [
    FormFieldConfig(
      required: true,
      label: 'Nombre de la categoría',
      text: 'Ingrese nombre de la categoría',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Código de categoría',
      text: 'Ingrese código',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: false,
      label: 'Descripción',
      text: 'Ingrese descripción',
      type: FieldType.text,
    ),
  ];

  final rolesField = [
    FormFieldConfig(
      required: true,
      label: 'Nombre del rol',
      text: 'Ingrese nombre del rol',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: true,
      label: 'Código del rol',
      text: 'Ingrese código del rol',
      type: FieldType.text,
    ),
    FormFieldConfig(
      required: false,
      label: 'Descripción del rol',
      text: 'Ingrese descripción del rol',
      type: FieldType.text,
    ),
  ];

  void showFormModal(BuildContext context, Widget constructor) {
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
              child: constructor,
            ),
          ),
        );
      },
    );
  }

  Widget showFormClients() {
    return BuildGenericForm(
      fields: clientsField,
      title: 'Registro de clientes',
      text: 'Aquí podrás registrar tus nuevos clientes en la plataforma.',
    );
  }

  Widget showFormEmployees() {
    return BuildGenericForm(
      fields: employeesField,
      title: 'Registro de empleados',
      text: 'Aquí podrás registrar tus nuevos empleados en la plataforma.',
    );
  }

  Widget showFormInvoices() {
    return BuildGenericForm(
      fields: invoicesField,
      title: 'Registro de facturas',
      text: 'Aquí podrás registrar nuevas facturas en la plataforma.',
    );
  }

  Widget showFormProducts() {
    return BuildGenericForm(
      fields: productsField,
      title: 'Registro de productos',
      text: 'Aquí podrás registrar nuevos productos en la plataforma.',
    );
  }

  Widget showFormCategories() {
    return BuildGenericForm(
      fields: categoriesField,
      title: 'Registro de categorías',
      text: 'Aquí podrás registrar nuevas categorías para los productos.',
    );
  }

  Widget showFormRoles() {
    return BuildGenericForm(
      fields: rolesField,
      title: 'Registro de roles',
      text: 'Aquí podrás registrar nuevos roles para los empleados.',
    );
  }
}
