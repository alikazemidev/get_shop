import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/modules/home/controllers/home_controller.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            // floatingActionButton: Container(
            //   margin: EdgeInsets.only(bottom: 15),
            //   child: FloatingActionButton(

            //     backgroundColor: ,
            //     onPressed: (){},
            //     child: Icon(Iconsax.home),
            //   ),
            // ),
            // floatingActionButtonLocation:
            //  FloatingActionButtonLocation.centerFloat,
            body: SafeArea(
              child: Column(
                children: [
                  Spacer(),
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
                            padding: const EdgeInsets.symmetric(horizontal:12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(controller.menuItems.length,
                                  (index) {
                                return Padding(
                                  padding: EdgeInsets.only(left :index == 1 ? 60 : 0),
                                  child: Icon(controller.menuItems[index].icon),
                                );
                              }),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
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
                            ),
                            child: Icon(
                              Iconsax.home_2,
                              color: Colors.white,
                              size: 25,
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
