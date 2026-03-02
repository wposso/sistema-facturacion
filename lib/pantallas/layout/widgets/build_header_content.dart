import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildHeaderContent extends StatelessWidget {
  final String title;
  const BuildHeaderContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: themeIconGreyColor.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: themeBlackColor,
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              decoration: BoxDecoration(
                color: themeDrawerColor,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: themeIconGreyColor.withOpacity(0.15),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleQuestion,
                    size: 14,
                    color: themeFontGreyColor,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Cómo gestionar tus $title',
                    style: TextStyle(
                      color: themeFontGreyColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.chevron_right,
                    size: 16,
                    color: themeFontGreyColor.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
