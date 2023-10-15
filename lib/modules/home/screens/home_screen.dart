import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/modules/home/controllers/home_controller.dart';
import 'package:get_shop/modules/home/screens/catrgories_screen.dart';
import 'package:get_shop/modules/home/screens/dashboard_screen.dart';
import 'package:get_shop/modules/products/screens/products_list_screen.dart';
import 'package:get_shop/modules/profile/screens/bookmarks_screen.dart';
import 'package:get_shop/modules/profile/screens/profile_screen.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  //  appbar
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 2,
                              color: MyColors.dividreColor,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Iconsax.bag_2,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          'assets/images/logo_h.png',
                          height: 38,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () => Get.to(ProductsListScreen()),
                          child: Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                width: 2,
                                color: MyColors.dividreColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Iconsax.search_normal,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  pageviews
                  Expanded(
                    child: PageView(
                      physics: NeverScrollableScrollPhysics(),
                      // onPageChanged: (value) {
                      //   controller.changePage(indexPage: value);
                      // },
                      controller: controller.pageController,
                      children: [
                        DashboardScreen(),
                        CategoriesScreen(),
                        Container(color: Colors.blue),
                        BookMarksScreen(),
                        ProfileScreen(),
                      ],
                    ),
                  ),
                  //  bottom navbar
                  Container(
                    height: 110,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(.09),
                                blurRadius: 6,
                                offset: Offset(0, -5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                controller.menuItems.length,
                                (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 1 ? 60 : 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.changePage(
                                            indexPage: index + 1);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                              controller.menuItems[index].icon),
                                          controller.currentIndex == index + 1
                                              ? Container(
                                                  margin:
                                                      EdgeInsets.only(top: 5),
                                                  width: 20,
                                                  height: 3,
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                )
                                              : SizedBox(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          child: GestureDetector(
                            onTap: () {
                              controller.changePage(indexPage: 0);
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xff387be3),
                                    MyColors.primaryColor,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                boxShadow: [
                                  controller.currentIndex == 0
                                      ? BoxShadow(
                                          color: MyColors.primaryColor,
                                          offset: Offset(0, 3),
                                          blurRadius: 15,
                                        )
                                      : BoxShadow(),
                                ],
                              ),
                              child: Icon(
                                Iconsax.home_2,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
