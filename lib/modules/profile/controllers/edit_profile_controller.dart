import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';

class EditProfileController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  final User user;

  EditProfileController({required this.user});

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'لطفا نام خود را وارد کنید';
    }
    return null;
  }

  String? oldPassValidator(String? value) {
    if (newPassController.text.isNotEmpty && value!.isEmpty) {
      return 'لطفا رمز قبلی خود را وارد کنید.';
    }
    return null;
  }

  String? newPassValidator(String? value) {
    if (oldPassController.text.isNotEmpty && newPassController.text.isEmpty) {
      return 'لطفا رمز عبور جدید را وارد کنید';
    }
    return null;
  }

  Future<void> editProfile() async {
    if (formKey.currentState!.validate()) {
      await profileRepository.editProfile(
        name: nameController.text,
        oldPass: oldPassController.text,
        newPass: newPassController.text,
      );
    } else {
      print('not valid');
    }
  }

  @override
  void onInit() {
    nameController.text = user.name ?? '';
    mobileController.text = user.mobile ?? '';
    super.onInit();
  }
}
