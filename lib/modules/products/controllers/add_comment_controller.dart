import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/helpers/controllers/token_controller.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/products/controllers/comment_controller.dart';

class AddCommentController extends GetxController {
  final int id;
  bool isLodaing = false;
  ProductRepository productRepository = ProductRepository();
  TextEditingController commentInput = TextEditingController();
  int rate = 1;

  AddCommentController({required this.id});

  void onRating(double value) {
    rate = value.toInt();
    update();
  }

  Future<void> addComment({required int id}) async {
    isLodaing = true;
    update();
    var res = await productRepository.addReview(
      productId: id,
      rate: rate,
      comment: commentInput.text,
    );
    isLodaing = false;
    update();

    if (res) {
      Get.find<CommentController>().getReviews();
      Get.back();
      successMessage('موفق', 'نظر شما با موفق ثبت شد');
    } else {
      Get.back();
      errorMessage('ناموفق', 'خطایی رخ داده است');
    }
  }

  @override
  void onInit() {
    print(Get.find<TokenController>().token);
    super.onInit();
  }
}
