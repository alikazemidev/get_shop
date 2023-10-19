import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/response/order_response.dart';

class OrdersListController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  OrderResponse? orderResponse;

  Future<void> getOrder() async {
    orderResponse = await productRepository.getOrder();
    update();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
