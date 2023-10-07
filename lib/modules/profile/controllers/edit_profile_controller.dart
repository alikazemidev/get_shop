import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/profile/controllers/profile_controller.dart';

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
      var res = await profileRepository.editProfile(
        name: nameController.text,
        oldPass: oldPassController.text,
        newPass: newPassController.text,
      );
      if (res) {
        Get.find<ProfileController>().getUserProfile();
        Get.back();
        successMessage('موفق', 'ثبت نام با موفقیت انجام شد');
      }
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
