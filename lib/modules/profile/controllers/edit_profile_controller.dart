import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/models/user.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';

class EditProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();

  final User user;

  EditProfileController({required this.user});

  @override
  void onInit() {
    nameController.text = user.name ?? '';
    mobileController.text = user.mobile ?? '';  
    super.onInit();
  }
}
