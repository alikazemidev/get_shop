import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/response/categories_response.dart';

class CategoriesController extends GetxController {
  ProductRepository productRepository = ProductRepository();
  CategoriesResponse? categoriesResponse;

  Future<void> getCategoreis() async {
    categoriesResponse = await productRepository.getCategories();
    update();
  }

  @override
  void onInit() {
    getCategoreis();
    super.onInit();
  }
}
