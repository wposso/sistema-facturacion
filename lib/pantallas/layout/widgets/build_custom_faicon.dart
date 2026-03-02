import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/mouse_region_menu.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildCustomFaicon extends StatelessWidget {
  final IconData icon;
  final int index;
  const BuildCustomFaicon({super.key, required this.icon, required this.index});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MouseRegionMenu>(context);
    return FaIcon(
      icon,
      size: 16,
      color: prov.hoveredIndex == index
          ? themeBackgroundColor
          : themeIconGreyColor,
    );
  }
}
