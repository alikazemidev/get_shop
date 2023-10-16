import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/response/cart_response.dart';

class CartController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  CartResponse? cartResponse;

  Future<void> getCart() async {
    cartResponse = await productRepository.getCart();
    update();
  }

  @override
  void onInit() {
    getCart();
    super.onInit();
  }
}
