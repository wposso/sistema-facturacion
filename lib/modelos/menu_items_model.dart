import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuItems {
  final String itemTitle;
  final IconData icon;

  MenuItems({required this.itemTitle, required this.icon});
}

class DrawerItems {
  final List<MenuItems> itemList = [
    MenuItems(itemTitle: 'Inicio', icon: FontAwesomeIcons.solidHouse),
    MenuItems(itemTitle: 'Productos', icon: FontAwesomeIcons.cartFlatbed),
    MenuItems(itemTitle: 'Categorías', icon: FontAwesomeIcons.layerGroup),
    MenuItems(itemTitle: 'Clientes', icon: FontAwesomeIcons.users),
    MenuItems(itemTitle: 'Facturación', icon: FontAwesomeIcons.receipt),
    MenuItems(itemTitle: 'Empleados', icon: FontAwesomeIcons.solidAddressBook),
    MenuItems(itemTitle: 'Roles', icon: FontAwesomeIcons.key),
    MenuItems(itemTitle: 'Ayúda', icon: FontAwesomeIcons.solidCircleQuestion),
    MenuItems(itemTitle: 'Información', icon: FontAwesomeIcons.circleInfo),
  ];
}
