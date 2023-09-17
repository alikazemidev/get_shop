import 'package:flutter/material.dart';
import 'package:get/get.dart';

void successMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    margin: EdgeInsets.all(20),
  );
}


void errorMessage(String title, String message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    margin: EdgeInsets.all(20),
  );
}

