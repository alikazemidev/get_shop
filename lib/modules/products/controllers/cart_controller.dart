import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/response/cart_response.dart';

class CartController extends GetxController {
  bool isLoading = false;
  ProductRepository productRepository = ProductRepository();
  CartResponse? cartResponse;

  Future<void> getCart() async {
    cartResponse = await productRepository.getCart();
    update();
  }

  Future<void> addToCart({
    required bool increment,
    required int id,
    bool delete = false,
  }) async {
    isLoading = true;
    update();
    await productRepository.addToCart(
      productId: id,
      increment: increment,
      delete: delete,
    );
    isLoading = false;
    getCart();
    update();
  }

  @override
  void onInit() {
    getCart();
    super.onInit();
  }
}
