import 'package:get/get.dart';
import 'package:get_shop/backend/models/product.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';

class ProductDetailsController extends GetxController {
  final int id;
  ProductRepository productRepository = ProductRepository();
  Product? product;

  ProductDetailsController({required this.id});

  Future<void> getProductDetails() async {
    product = await productRepository.getProductDetails(id);
    update();
  }

  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }
}
