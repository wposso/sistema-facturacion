import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_form_button.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildGenericForm extends StatelessWidget {
  final List<FormFieldConfig> fields;
  final String title;
  final String text;

  const BuildGenericForm({
    super.key,
    required this.fields,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Column(
        children: [
          _buildFormHeader(title, text),
          SizedBox(height: 30),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                child: Column(
                  children: fields.map(_buildFormFieldInput).toList(),
                ),
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BuildFormButton(isUnderline: true, text: 'Cancelar'),
              SizedBox(width: 10),
              BuildFormButton(isUnderline: false, text: 'Guardar'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormFieldInput(FormFieldConfig field) {
    switch (field.type) {
      case FieldType.text:
        return _buildField(field.text, TextInputType.text, field.label);

      case FieldType.number:
        return _buildField(field.text, TextInputType.number, field.label);

      case FieldType.dropdown:
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: field.label,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
            ),
            items: (field.options ?? [])
                .map(
                  (option) => DropdownMenuItem<String>(
                    value: option,
                    child: Text(
                      option,
                      style: TextStyle(fontSize: 13, color: themeFontGreyColor),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {},
          ),
        );

      case FieldType.date:
        return TextFormField(
          readOnly: true,
          decoration: InputDecoration(labelText: field.label),
        );
    }
  }

  Widget _buildField(String text, TextInputType tipo, String label) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 13, color: themeFontGreyColor),
          ),
          SizedBox(height: 5),
          TextFormField(
            keyboardType: tipo,
            decoration: InputDecoration(
              hintText: text,
              hintStyle: TextStyle(fontSize: 14, color: themeFontGreyColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              focusColor: themeIconGreyColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1, color: themeIconGreyColor),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormHeader(String title, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 5,
              height: 20,
              decoration: BoxDecoration(
                color: themeGreenColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, color: themeFontGreyColor),
            ),
          ],
        ),
        SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            text,
            style: TextStyle(fontSize: 13, color: themeFontGreyColor),
          ),
        ),
      ],
    );
  }
}

enum FieldType { text, number, dropdown, date }

class FormFieldConfig {
  final String label;
  final String text;
  final FieldType type;
  final bool required;
  final List<String>? options;

  FormFieldConfig({
    required this.required,
    required this.label,
    required this.text,
    required this.type,
    this.options,
  });
}
