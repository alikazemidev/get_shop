import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/helpers/widgets/text_field_widget.dart';
import 'package:get_shop/modules/auth/controller/register_controller.dart';
import 'package:get_shop/modules/auth/screens/login_screen.dart';
import 'package:iconsax/iconsax.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (controller) {
            return SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Image.asset(
                            'assets/images/logo_h.png',
                            height: 40,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'به فروشگاه آنلاین خودتون خوش اومدید',
                            style: TextStyle(
                              fontSize: 16,
                              color: MyColors.darkGreyColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 30),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                            validator: controller.nameValidator,
                            inputController: controller.nameController,
                            hintText: 'نام و نام خانوداگی',
                            icon: Iconsax.user,
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                            validator: controller.numberValidator,
                            inputController: controller.numberController,
                            type: TextInputType.number,
                            hintText: 'شماره موبایل',
                            icon: Iconsax.mobile,
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                             validator: controller.passValidator,
                            inputController: controller.passController,
                            hintText: 'رمز عبور',
                            type: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                             validator: controller.repeatPassValidator,
                            inputController: controller.repeatPassController,
                            hintText: 'تکرار رمز عبور',
                            type: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 35),
                          ButtonPrimary(
                            isLoading: controller.isLoading,
                            text: 'ثبت نام',
                            onPressed: () {
                              controller.register();
                            },
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'حساب کاربری دارید؟',
                                style: TextStyle(
                                  color: MyColors.darkGreyColor,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.off(LoginScreen());
                                },
                                child: Text(
                                  'وارد شوید',
                                  style: TextStyle(
                                    color: MyColors.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
