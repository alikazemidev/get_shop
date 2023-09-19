import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeController extends GetxController {
  List<MenuItem> menuItems = [
    MenuItem(icon: Iconsax.element_3),
    MenuItem(icon: Iconsax.shopping_cart),
    MenuItem(icon: Iconsax.heart),
    MenuItem(icon: Iconsax.user),
  ];
}

class MenuItem {
  final IconData icon;
  bool isSelected;

  MenuItem({required this.icon, this.isSelected = false});
}
