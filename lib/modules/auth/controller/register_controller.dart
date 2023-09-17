import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/auth_repostiry.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  AuthRepository authRepository = AuthRepository();

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController repeatPassController = TextEditingController();

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا نام خود را وارد کنید';
    }
    return null;
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

  String? repeatPassValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا رمز عبور خود را مجدد وارد کنید';
    } else if (value != passController.text) {
      return 'لطفا تکرار رمز عبور را صحیح وارد کنید';
    }
    return null;
  }

  void register() {
    if (formKey.currentState!.validate()) {
      authRepository.register(
        name: nameController.text,
        mobile: numberController.text,
        password: passController.text,
        repeatPassword: repeatPassController.text,
      );
    }
  }
}
