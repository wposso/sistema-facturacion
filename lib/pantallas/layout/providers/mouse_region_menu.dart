import 'package:flutter/material.dart';

class MouseRegionMenu extends ChangeNotifier {
  int hoveredIndex = -1;

  void onEnter(int index) {
    hoveredIndex = index;
    notifyListeners();
  }

  void onExit() {
    hoveredIndex = -1;
    notifyListeners();
  }
}
