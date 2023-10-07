import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/helpers/widgets/appbar_custom_widget.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/helpers/widgets/text_field_widget.dart';
import 'package:get_shop/modules/profile/controllers/edit_profile_controller.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  final User user;
  const EditProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
        init: EditProfileController(user: user),
        builder: (controller) {
          return Scaffold(
            appBar: getAppbar(title: 'ویرایش پروفایل'),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFieldWidget(
                    hintText: 'نام و نام خانوادگی',
                    icon: Iconsax.user,
                    inputController: controller.nameController,
                  ),
                  SizedBox(height: 15),
                  TextFieldWidget(
                      inputController: controller.mobileController,
                      hintText: '09101010100',
                      icon: Iconsax.mobile,
                      readOnly: true),
                  SizedBox(height: 15),
                  TextFieldWidget(
                      inputController: controller.oldPassController,
                      hintText: 'رمز عبور قلبی',
                      type: TextInputType.visiblePassword),
                  SizedBox(height: 15),
                  TextFieldWidget(
                      inputController: controller.newPassController,
                      hintText: 'رمز عبور جدید',
                      type: TextInputType.visiblePassword),
                  SizedBox(height: 30),
                  ButtonPrimary(text: 'ویرایش', onPressed: () {})
                ],
              ),
            ),
          );
        });
  }
}
