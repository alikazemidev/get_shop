import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';

import 'package:get_shop/modules/profile/controllers/profile_controller.dart';
import 'package:get_shop/modules/profile/screens/edit_profile_screen.dart';
import 'package:get_shop/modules/profile/widgets/icon_button_widget.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return controller.user == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff14489e).withOpacity(.15),
                              blurRadius: 3,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: MyColors.lightBlueColor,
                                borderRadius: BorderRadius.circular(1000),
                              ),
                              child: Icon(
                                Iconsax.user,
                                size: 36,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              controller.user!.name ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              controller.user!.mobile ?? '',
                              style: TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () => Get.to(EditProfileScreen(
                                user: controller.user!,
                              )),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.edit,
                                    color: MyColors.primaryColor,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    'ویرایش',
                                    style: TextStyle(
                                      color: MyColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      IconButtonWidget(
                        icon: Iconsax.map,
                        title: 'آدرس ها',
                      ),
                      SizedBox(height: 10),
                      IconButtonWidget(
                        icon: Iconsax.graph,
                        title: 'سفارشات',
                      ),
                      SizedBox(height: 10),
                      IconButtonWidget(
                        icon: Iconsax.user_cirlce_add,
                        title: 'دعوت از دوستان',
                      ),
                      SizedBox(height: 10),
                      IconButtonWidget(
                        icon: Iconsax.logout,
                        title: 'خروج از حساب',
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                );
        });
  }
}
