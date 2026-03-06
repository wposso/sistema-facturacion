import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/modelos/menu_items_model.dart';
import 'package:sistema_facturacion/pantallas/layout/layout_content.dart';
import 'package:sistema_facturacion/pantallas/layout/providers/mouse_region_menu.dart';
import 'package:sistema_facturacion/pantallas/layout/widgets/build_custom_faicon.dart';
import 'package:sistema_facturacion/theme/theme_colors.dart';

class BuildDrawerMenu extends StatelessWidget {
  const BuildDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215,
      decoration: BoxDecoration(
        color: themeDrawerColor,
        border: Border(
          right: BorderSide(
            color: themeIconGreyColor.withOpacity(0.15),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: themeIconGreyColor.withOpacity(0.15),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: themeGreenColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: FaIcon(
                      FontAwesomeIcons.accusoft,
                      color: themeGreenColor,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Text(
                  'Facturación',
                  style: TextStyle(
                    fontSize: 16,
                    color: themeBlackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: DrawerItems().itemList.isEmpty
                ? _buildContentLoad()
                : ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    itemBuilder: (context, index) {
                      final item = DrawerItems().itemList[index];
                      return _buildItemContainer(
                        context,
                        item.itemTitle,
                        item.icon,
                        index,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 15),
                    itemCount: DrawerItems().itemList.length,
                  ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: themeIconGreyColor.withOpacity(0.15),
                  width: 1,
                ),
              ),
            ),
            child: _buildItemContainer(
              context,
              'Salir',
              FontAwesomeIcons.arrowRightFromBracket,
              9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemContainer(
    BuildContext context,
    String label,
    IconData icon,
    int index,
  ) {
    final msm = Provider.of<MouseRegionMenu>(context);
    final isHovered = msm.hoveredIndex == index;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => msm.onEnter(index),
      onExit: (event) => msm.onExit(),
      child: GestureDetector(
        onTap: () {
          if (label != 'Salir') {
            Provider.of<ScreenProvider>(context, listen: false).currentScreen =
                label;
          } else {
            Navigator.pushNamed(context, 'InicioSesion');
          }
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: isHovered ? themeGreenColor : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              BuildCustomFaicon(icon: icon, index: index),
              SizedBox(width: 12),
              Text(
                label,
                style: TextStyle(
                  color: isHovered ? themeBackgroundColor : themeFontGreyColor,
                  fontSize: 14,
                  fontWeight: isHovered ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
              if (isHovered) ...[
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: themeBackgroundColor,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContentLoad() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(themeGreenColor),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Cargando menú...',
            style: TextStyle(color: themeFontGreyColor, fontSize: 13),
          ),
        ],
      ),
    );
  }
}
