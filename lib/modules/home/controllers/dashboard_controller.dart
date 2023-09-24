import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/response/dashboard_response.dart';

class DashboardController extends GetxController {
  ProductRepository productRepository = ProductRepository();

  DashboardResponse? dashboardResponse;

  Future<void> getDashboard() async {
    dashboardResponse = await productRepository.getDashboard();
    update();
  }

  @override
  void onInit() {
    getDashboard();
    super.onInit();
  }
}
