import 'package:get/get.dart';
import 'package:get_shop/backend/models/product.dart';
import 'package:get_shop/backend/repositories/product_repository.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';
import 'package:get_shop/modules/products/controllers/cart_controller.dart';
import 'package:get_shop/modules/profile/controllers/bookmarks_controller.dart';

class ProductDetailsController extends GetxController {
  final int id;
  ProductRepository productRepository = ProductRepository();
  ProfileRepository profileRepository = ProfileRepository();
  Product? product;

  ProductDetailsController({required this.id});

  Future<void> getProductDetails() async {
    product = await productRepository.getProductDetails(id);
    update();
  }

  Future<void> bookmark() async {
    var res = await profileRepository.bookmarked(id: id);
    if (res) {
      product!.bookmarked = !product!.bookmarked!;
      if (Get.isRegistered<BookmarksController>()) {
        Get.find<BookmarksController>().getBookmarks();
      }
      if (product!.bookmarked == true) {
        successMessage('موفق', 'به علاقه‌مندی ها اضافه شد');
      } else {
        errorMessage('موفق', 'از علاقه‌مندی ها حذف شد');
      }
      update();
    }
  }

  Future<void> addToCart({required bool increment}) async {
    var res = await productRepository.addToCart(
      productId: id,
      increment: increment,
    );
    product!.cartCount = res;
    Get.find<CartController>().getCart();
    update();
  }

  @override
  void onInit() {
    getProductDetails();
    super.onInit();
  }
}
