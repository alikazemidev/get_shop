import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/response/review_response.dart';

class CommentController extends GetxController {
  int id;
  CommentController({required this.id});

  ProductRepository productRepository = ProductRepository();
  ReviewResponse? reviewResponse;

  Future<void> getReviews() async {
    reviewResponse = await productRepository.getReviews(id);
    update();
  }

  @override
  void onInit() {
    getReviews();
    super.onInit();
  }
}
