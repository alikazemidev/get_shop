import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/constants/color.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/helpers/widgets/text_field_widget.dart';
import 'package:get_shop/modules/auth/controller/login_controller.dart';
import 'package:get_shop/modules/auth/screens/register_screen.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: GetBuilder<LoginController>(
          init: LoginController(),
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
                              'ورود',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                            inputController: controller.numberController,
                            validator: controller.numberValidator,
                            type: TextInputType.number,
                            hintText: 'شماره موبایل',
                            icon: Iconsax.mobile,
                          ),
                          SizedBox(height: 15),
                          TextFieldWidget(
                            inputController: controller.passController,
                            validator: controller.passValidator,
                            hintText: 'رمز عبور',
                            type: TextInputType.visiblePassword,
                          ),
                          SizedBox(height: 15),
                          ButtonPrimary(
                            isLoading: controller.isLoading,
                            text: 'ورود',
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.off(RegisterScreen());
                                },
                                child: Text(
                                  'ثبت نام کنید',
                                  style: TextStyle(
                                    color: MyColors.primaryColor,
                                  ),
                                ),
                              ),
                              Text(
                                'حساب کاربری ندارید؟',
                                style: TextStyle(
                                  color: MyColors.darkGreyColor,
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
