import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/helpers/widgets/button_primary.dart';
import 'package:get_shop/modules/auth/screens/login_screen.dart';
import 'package:get_shop/modules/auth/screens/register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff3f9ff),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
              Spacer(),
              Container(
                // height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.08),
                      blurRadius: 10,
                      offset: Offset(0, -6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Text(
                      'به فروشگاه ما خوش آمدید',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'لطفا برای ادامه یکی از گزینه اهی زیر را انتخاب کنید',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 35),
                      child: Row(
                        children: [
                          Expanded(
                            child: ButtonPrimary(
                              text: 'ثبت نام',
                              onPressed: () {
                                Get.to(RegisterScreen());
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: ButtonPrimary(
                              text: 'ورود',
                              onPressed: () {
                                Get.to(LoginScreen());
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
