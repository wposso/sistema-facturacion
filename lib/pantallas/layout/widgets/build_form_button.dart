import 'package:flutter/material.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildFormButton extends StatelessWidget {
  final bool isUnderline;
  final String text;
  const BuildFormButton({
    super.key,
    required this.isUnderline,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: isUnderline ? themeBackgroundColor : themeGreenColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            width: 1,
            color: isUnderline ? themeIconGreyColor : Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isUnderline ? themeFontGreyColor : themeBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}
