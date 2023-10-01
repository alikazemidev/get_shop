import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeController extends GetxController {
  int currentIndex = 0;
  PageController pageController = PageController();

  List<MenuItem> menuItems = [
    MenuItem(icon: Iconsax.element_3),
    MenuItem(icon: Iconsax.shopping_cart),
    MenuItem(icon: Iconsax.heart),
    MenuItem(icon: Iconsax.user),
  ];

  void changePage({required int indexPage}) {
    pageController.animateToPage(
      indexPage,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    currentIndex = indexPage;
    update();
  }
}

class MenuItem {
  final IconData icon;
  bool isSelected;

  MenuItem({required this.icon, this.isSelected = false});
}
