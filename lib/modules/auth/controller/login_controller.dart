import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/auth_repostiry.dart';
import 'package:get_shop/modules/home/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  AuthRepository authRepository = AuthRepository();
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  SharedPreferences? prefs;

  Future<void> initShared() async {
    prefs = await SharedPreferences.getInstance();
  }

  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا شماره موبایل خود را وارد کنید';
    } else if (value.length < 11) {
      return 'شماره موبایل باید ۱۱ رقم باشد';
    }
    return null;
  }

  String? passValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا یک رمز عبور وارد کنید';
    } else if (value.length < 8) {
      return 'رمز عبور باید بیشتر از ۸ کلمه باشد';
    }
    return null;
  }

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      isLoading = true;
      update();
      var res = await authRepository.login(
          number: numberController.text, password: passController.text);
      if (res != null) {
        prefs!.setString('token', res.token!);
        Get.to(HomeScreen());
      }

      isLoading = false;
      update();
    } else {
      print('not validate');
    }
  }

  @override
  void onInit() {
    initShared();
    super.onInit();
  }
}
