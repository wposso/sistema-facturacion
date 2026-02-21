import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sistema_facturacion/modelos/menu_items_model.dart';
import 'package:sistema_facturacion/pantallas/dashboard/providers/mouse_region_menu.dart';
import 'package:sistema_facturacion/pantallas/dashboard/widgets/build_custom_faicon.dart';

class BuildDrawerMenu extends StatelessWidget {
  const BuildDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 6),
      width: MediaQuery.of(context).size.width * 0.1 + 50,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.06)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: Text('Menú', style: TextStyle(fontSize: 20))),
          SizedBox(height: 30),
          Expanded(
            child: DrawerItems().itemList.isEmpty
                ? _buildContentLoad()
                : ListView.separated(
                    itemBuilder: (context, index) {
                      final item = DrawerItems().itemList[index];
                      return _buildItemContainer(
                        context,
                        item.itemTitle,
                        item.icon,
                        index,
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(height: 25),
                    itemCount: DrawerItems().itemList.length,
                  ),
          ),
          Divider(height: 1, color: Colors.grey),
          SizedBox(height: 30),
          _buildItemContainer(
            context,
            'Salir',
            FontAwesomeIcons.arrowRightFromBracket,
            9,
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => msm.onEnter(index),
      onExit: (event) => msm.onExit(),
      child: Container(
        padding: msm.hoveredIndex == index
            ? EdgeInsets.symmetric(vertical: 8, horizontal: 12)
            : EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        decoration: BoxDecoration(
          color: msm.hoveredIndex == index
              ? Colors.amberAccent.withOpacity(0.50)
              : Colors.transparent,
          borderRadius: msm.hoveredIndex == index
              ? BorderRadius.circular(10)
              : BorderRadius.circular(0),
        ),
        child: Row(
          children: [
            BuildCustomFaicon(icon: icon),
            SizedBox(width: 15),
            Text(label),
          ],
        ),
      ),
    );
  }

  Widget _buildContentLoad() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Contenido cargando.'),
          SizedBox(height: 10),
          CircularProgressIndicator(color: Colors.black87.withOpacity(0.40)),
        ],
      ),
    );
  }
}
