import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuildCustomFaicon extends StatelessWidget {
  final IconData icon;
  const BuildCustomFaicon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FaIcon(icon, size: 20);
  }
}
