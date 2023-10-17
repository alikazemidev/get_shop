import 'package:get/get.dart';
import 'package:get_shop/backend/repositories/profile_repository.dart';
import 'package:get_shop/backend/response/address_response.dart';
import 'package:get_shop/helpers/widgets/snack_widget.dart';

class OrderController extends GetxController {
  ProfileRepository profileRepository = ProfileRepository();
  AddressResponse? addressResponse;

  Future<void> getAddress() async {
    addressResponse = await profileRepository.getAddress();
    update();
  }

  Future<void> deleteAddress(int id) async {
    var res = await profileRepository.deleteAddress(id: id);
    if (res) {
      addressResponse!.addressData!.removeWhere(
        (element) => element.id == id,
      );
      update();
      successMessage('موفق', 'آدرس مورد نظر حذف شد');
    } else {
      errorMessage('نا موفق', 'خطایی رخ داده است');
    }
  }

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }
}
