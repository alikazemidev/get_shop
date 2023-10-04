import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_shop/helpers/controllers/token_controller.dart';

class AddCommentController extends GetxController {
  TextEditingController commentInput = TextEditingController();
  int rate = 1;

  void onRating(double value) {
    rate = value.toInt();
    update();
  }

  @override
  void onInit() {
    print(Get.find<TokenController>().token);
    super.onInit();
  }
}
