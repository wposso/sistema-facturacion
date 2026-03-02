import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildGenericForm extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<FormFieldConfig> fields;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;

  const BuildGenericForm({
    super.key,
    required this.title,
    this.subtitle = '',
    required this.fields,
    this.onSave,
    this.onCancel,
  });

  @override
  State<BuildGenericForm> createState() => _BuildGenericFormState();
}

class _BuildGenericFormState extends State<BuildGenericForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeBackgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      decoration: BoxDecoration(
                        color: themeGreenColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: themeBlackColor,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ],
                ),
                if (widget.subtitle.isNotEmpty) ...[
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text(
                      widget.subtitle,
                      style: TextStyle(color: themeFontGreyColor, fontSize: 13),
                    ),
                  ),
                ],
              ],
            ),
          ),

          Flexible(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: widget.fields.map((field) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: _buildFormField(field),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.onCancel,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: themeIconGreyColor.withOpacity(0.3),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: themeFontGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.onSave,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: themeGreenColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Guardar',
                            style: TextStyle(
                              color: themeBackgroundColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 8),
                          FaIcon(
                            FontAwesomeIcons.check,
                            size: 14,
                            color: themeBackgroundColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          width: 4,
          height: 24,
          decoration: BoxDecoration(
            color: themeGreenColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 12),
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: themeBlackColor,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  Widget _buildSubtitle() {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Text(
        widget.subtitle,
        style: TextStyle(
          color: themeFontGreyColor,
          fontSize: 13,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildFormField(FormFieldConfig field) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (field.icon != null) ...[
              FaIcon(field.icon, size: 14, color: themeFontGreyColor),
              SizedBox(width: 8),
            ],
            Text(
              field.label,
              style: TextStyle(
                color: themeFontGreyColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            if (field.required)
              Text(
                ' *',
                style: TextStyle(
                  color: themeRedColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
        SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: themeDrawerColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: themeIconGreyColor.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: _buildInputByType(field),
        ),
        if (field.helperText != null) ...[
          SizedBox(height: 4),
          Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
              field.helperText!,
              style: TextStyle(
                color: themeFontGreyColor.withOpacity(0.7),
                fontSize: 11,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildInputByType(FormFieldConfig field) {
    switch (field.type) {
      case FormFieldType.text:
      case FormFieldType.email:
      case FormFieldType.password:
        return TextFormField(
          initialValue: field.initialValue,
          obscureText: field.type == FormFieldType.password,
          keyboardType: field.type == FormFieldType.email
              ? TextInputType.emailAddress
              : TextInputType.text,
          style: TextStyle(color: themeBlackColor, fontSize: 14),
          decoration: InputDecoration(
            hintText: field.hintText,
            hintStyle: TextStyle(color: themeIconGreyColor, fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: InputBorder.none,
            suffixIcon: field.suffixIcon != null
                ? FaIcon(field.suffixIcon, size: 16, color: themeFontGreyColor)
                : null,
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'Este campo es requerido';
            }
            if (field.type == FormFieldType.email &&
                value != null &&
                value.isNotEmpty) {
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Ingrese un email válido';
              }
            }
            return null;
          },
          onSaved: (value) => field.onSaved?.call(value),
        );

      case FormFieldType.number:
        return TextFormField(
          initialValue: field.initialValue,
          keyboardType: TextInputType.number,
          style: TextStyle(color: themeBlackColor, fontSize: 14),
          decoration: InputDecoration(
            hintText: field.hintText,
            hintStyle: TextStyle(color: themeIconGreyColor, fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: InputBorder.none,
            prefixText: field.prefix,
            prefixStyle: TextStyle(color: themeFontGreyColor, fontSize: 14),
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'Este campo es requerido';
            }
            return null;
          },
          onSaved: (value) => field.onSaved?.call(value),
        );

      case FormFieldType.currency:
        return TextFormField(
          initialValue: field.initialValue,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: themeGreenColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: field.hintText,
            hintStyle: TextStyle(color: themeIconGreyColor, fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: InputBorder.none,
            prefixText: '\$ ',
            prefixStyle: TextStyle(
              color: themeGreenColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'Este campo es requerido';
            }
            return null;
          },
          onSaved: (value) => field.onSaved?.call(value),
        );

      case FormFieldType.textarea:
        return TextFormField(
          initialValue: field.initialValue,
          maxLines: 3,
          style: TextStyle(color: themeBlackColor, fontSize: 14),
          decoration: InputDecoration(
            hintText: field.hintText,
            hintStyle: TextStyle(color: themeIconGreyColor, fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            border: InputBorder.none,
          ),
          validator: (value) {
            if (field.required && (value == null || value.isEmpty)) {
              return 'Este campo es requerido';
            }
            return null;
          },
          onSaved: (value) => field.onSaved?.call(value),
        );

      case FormFieldType.select:
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                field.initialValue ?? field.hintText ?? 'Seleccionar...',
                style: TextStyle(
                  color: field.initialValue != null
                      ? themeBlackColor
                      : themeIconGreyColor,
                  fontSize: 14,
                ),
              ),
              Icon(Icons.arrow_drop_down, color: themeFontGreyColor, size: 20),
            ],
          ),
        );

      default:
        return SizedBox();
    }
  }

  Widget _buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: themeIconGreyColor.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Text(
              'Cancelar',
              style: TextStyle(
                color: themeFontGreyColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: themeGreenColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Text(
                  'Guardar',
                  style: TextStyle(
                    color: themeBackgroundColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 8),
                FaIcon(
                  FontAwesomeIcons.check,
                  size: 14,
                  color: themeBackgroundColor,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum FormFieldType { text, email, password, number, currency, textarea, select }

class FormFieldConfig {
  final String label;
  final FormFieldType type;
  final String? hintText;
  final String? helperText;
  final String? initialValue;
  final IconData? icon;
  final IconData? suffixIcon;
  final bool required;
  final String? prefix;
  final Function(String?)? onSaved;

  FormFieldConfig({
    required this.label,
    required this.type,
    this.hintText,
    this.helperText,
    this.initialValue,
    this.icon,
    this.suffixIcon,
    this.required = false,
    this.prefix,
    this.onSaved,
  });
}
