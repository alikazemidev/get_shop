import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/products_response.dart';

class BookmarksController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  ProductsResponse? productsResponse;

  Future<void> getBookmarks() async {
    productsResponse = await profileRepository.getBookmarks();
    update();
  }

  Future<void> deleteBookmark(int id) async {
    var res = await profileRepository.bookmarked(id: id);
    if (res) {
      productsResponse!.productsData!
          .removeWhere((element) => element.id == id);
      update();
    }
  }

  @override
  void onInit() {
    getBookmarks();
    super.onInit();
  }
}
