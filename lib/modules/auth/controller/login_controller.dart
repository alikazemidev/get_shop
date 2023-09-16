import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();

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

  void login() {
    if (formKey.currentState!.validate()) {
      print('validate');
    } else {
      print('not validate');
    }
  }
}
